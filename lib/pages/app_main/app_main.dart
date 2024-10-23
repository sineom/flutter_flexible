///
/// @Author: sineom h.sineom@gmail.com
/// @Date: 2024-10-10 13:56:49
/// @LastEditors: sineom h.sineom@gmail.com
/// @LastEditTime: 2024-10-10 17:38:42
/// @FilePath: /flutter_flexible/lib/pages/app_main/app_main.dart
/// @Description: 这是默认设置,请设置`customMade`, 打开koroFileHeader查看配置 进行设置: https://github.com/OBKoro1/koro1FileHeader/wiki/%E9%85%8D%E7%BD%AE
///

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_flexible/components/extended_img.dart';
import 'package:flutter_flexible/generated/assets.dart';
import 'package:flutter_flexible/utils/tool/log_util.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';

import '../../components/exit_app_interceptor/exit_app_interceptor.dart';
import 'home/home.dart';
import 'msg/hot.dart';
import 'my/my_personal.dart';
import 'product_release/product_release.dart';
import 'trade/search.dart';
import 'package:moon_design/moon_design.dart';

@RoutePage()
class AppMainPage extends ConsumerStatefulWidget {
  final dynamic params;

  const AppMainPage({
    super.key,
    this.params,
  });

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _State();
}

class _State extends ConsumerState<AppMainPage>
    with AutomaticKeepAliveClientMixin {
  int currentIndex = 0; // 接收bar当前点击索引
  bool physicsFlag = true; // 是否禁止左右滑动跳转tab
  late PageController pageController;
  @override
  bool get wantKeepAlive => true;

  // app主页底部bar
  final List<Map<String, dynamic>> appBottomBar = [
    {
      'title': '首页',
      'icon': Assets.imagesIconHomeNormal,
      'selectedIcon': Assets.imagesIconHomeSelected,
      'body': const Home(),
    },
    {
      'title': '消息',
      'icon': Assets.imagesIconMsgNormal,
      'selectedIcon': Assets.imagesIconMsgSelected,
      'body': const Hot(),
    },
    {
      'title': '交易',
      'icon': Assets.imagesIconTradeNormal,
      'selectedIcon': Assets.imagesIconTradeSelected,
      'body': Search(),
    },
    {
      'title': '我的',
      'icon': Assets.imagesIconMyNormal,
      'selectedIcon': Assets.imagesIconMySelected,
      'body': MyPersonal(),
    },
  ];

  @override
  void initState() {
    super.initState();

    handleCurrentIndex();
    initTools();
  }

  @override
  void dispose() {
    pageController.dispose();
    FocusScope.of(context).requestFocus(FocusNode()); // 选择焦点，收起键盘效果
    super.dispose();
  }

  /// 处理tab默认显示索引
  handleCurrentIndex() {
    if (widget.params != null) {
      // 默认加载页面
      if ((widget.params["pageId"] ?? 0) as int >= appBottomBar.length) {
        currentIndex = (appBottomBar.length - 1);
      } else {
        currentIndex = widget.params['pageId'] as int;
      }
    }

    // 初始化tab控制器
    pageController = PageController(initialPage: currentIndex, keepPage: true);
  }

  /// 初始化第三方插件插件
  initTools() {}

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return _scaffoldBody();
  }

  /// 页面Scaffold层组件
  Widget _scaffoldBody() {
    return Scaffold(
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: <Widget>[
          PageView(
            controller: pageController,
            physics: physicsFlag ? const NeverScrollableScrollPhysics() : null,
            children: bodyWidget(), // tab页面主体
            // 监听滑动
            onPageChanged: (index) {
              setState(() {
                currentIndex = index;
              });
            },
          ),
          const Positioned(
            bottom: 30,
            child: ExitAppInterceptor(),
          ),
        ],
      ),
      floatingActionButton: GestureDetector(
        onTap: () {
          SmartDialog.show(builder: (ctx) => const ProductRelease(),alignment: Alignment.bottomCenter,);
        },
        child: ExtendedImg.asset(
          imageUrl: Assets.imagesIconAddNormal,
          width: 42.r,
          height: 42.r,
        ),
      ),
      // 设置 floatingActionButton 在底部导航栏中间
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,

      // 底部栏
      bottomNavigationBar: BottomAppBar(
        color: Colors.white,
        shape: const CircularNotchedRectangle(),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: _generateBottomBars(onTap: (index) {
             setState(() {
            currentIndex = index;
          });
          pageController.jumpToPage(index); // 跳转
          }),
        ),
      ),
    );
  }

  /// tab视图内容区域
  List<Widget> bodyWidget() {
    try {
      return appBottomBar
          .map((itemData) => itemData['body'] as Widget)
          .toList();
    } catch (e) {
      throw Exception('appBottomBar变量缺少body参数，errorMsg:$e');
    }
  }

  /// 生成底部菜单导航
  List<Widget> _generateBottomBars({required ValueChanged<int> onTap}) {
    // 使用 List.generate 确保正确获取索引
    final List<Widget> items = List.generate(appBottomBar.length, (index) {
      final item = appBottomBar[index];
      return InkWell(
        onTap: () => onTap(index), // 点击事件
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ExtendedImg(
              imageUrl: currentIndex == index ? item['selectedIcon'] : item['icon'], // 图标路径
              width: 24.r,
              height: 24.r,
              sourceType: ImageSourceType.asset,
            ),
            Text(item['title'],style: TextStyle(fontSize: 11.sp,color: currentIndex == index ? context.moonColors!.textSecondary : context.moonColors!.gohan),), // 标题文字
          ],
        ),
      );
    });

    // 在第三个位置插入一个空的 SizedBox 用于布局
    items.insert(2, const SizedBox());

    return items;
  }
}
