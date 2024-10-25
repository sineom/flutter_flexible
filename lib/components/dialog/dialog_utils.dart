import 'dart:async';

import 'package:flutter/widgets.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';

class DialogUtils {
  ///取消dialog
  static Future<void> dismiss<T>({
    SmartStatus status = SmartStatus.smart,
    String? tag,
    T? result,
    bool force = false,
  }) async {
    await SmartDialog.dismiss(
        status: status, tag: tag, result: result, force: force);
  }

//   自定义弹窗

// [builder]：自定义 dialog

// [controller]：可使用该控制器来刷新自定义的dialog的布局

// [alignment]：控制弹窗的位置, 详细请参照[SmartConfigCustom]中alignment参数说明

// [clickMaskDismiss]：true（点击遮罩后，将关闭dialog），false（不关闭）

// [animationType]：设置动画类型, 具体可参照[SmartAnimationType]注释

// [nonAnimationTypes]：对于不同的场景, 可动态关闭弹窗动画, 具体请参照[SmartNonAnimationType]

// [animationBuilder]：支持高度自定义动画, 具体可参照[AnimationBuilder]说明

// [usePenetrate]：true（点击事件将穿透遮罩），false（不穿透）

// [useAnimation]：true（使用动画），false（不使用）

// [animationTime]：动画持续时间

// [maskColor]：遮罩颜色，如果给[maskWidget]设置了值，该参数将会失效

// [maskWidget]：可高度定制遮罩

// [onMask]：点击遮罩时，该回调将会被触发

// [debounce]：防抖功能

// [onDismiss]：在dialog被关闭的时候，该回调将会被触发

// [displayTime]：控制弹窗在屏幕上显示时间; 默认为null, 为null则代表该参数不会控制弹窗关闭; 注: 使用[displayTime]参数, 将禁止使用[tag]参数

// [tag]：如果你给dialog设置了tag, 你可以针对性的关闭它

// [backDismiss]：true（返回事件将关闭dialog，但是不会关闭页面）， false（返回事件不会关闭loading，也不会关闭页面），你仍然可以使用dismiss方法来关闭dialog

// [keepSingle]：默认（false），true（多次调用[show]并不会生成多个dialog，仅仅保持一个dialog）， false（多次调用[show]会生成多个dialog）

// [permanent]：默认（false），true（将该dialog设置为永久化dialog）,false(不设置); 框架内部各种兜底操作(返回事件,路由)无法关闭永久化dialog, 需要关闭此类dialog可使用: dismiss(force: true)

// [useSystem]：默认（false），true（使用系统dialog，[usePenetrate]功能失效; [tag], [keepSingle]和[permanent]禁止使用）， false（使用SmartDialog），使用该参数可使SmartDialog, 与路由页面以及flutter自带dialog合理交互

// [bindPage]：将该dialog与当前页面绑定，绑定页面不在路由栈顶，dialog自动隐藏，绑定页面置于路由栈顶，dialog自动显示; 绑定页面被关闭,被绑定在该页面上的dialog也将被移除

// [bindWidget]：将dialog与某个Widget绑定, 当该widget不可见时, dialog自动隐藏, 该widget可见时, dialog自动显示; 适用于PageView, TabView之类, 绑定其子页面, 切换页面时, dialog也能合理交互 注意: [bindWidget]处理逻辑高于[bindPage], 当[bindWidget]不为null, [bindPage]将自动被设置为false

// [ignoreArea]：dialog占位忽略区域, 支持上下左右区域, 设置的区域, dialog将不会在此区域占位; 例: ignoreArea: Rect.fromLTRB(0, 0, 0, 30), 底部会有30空隙, dialog和mask都不会占位该区域; 适用于: 不想dialog覆盖BottomNavigationBar, NavigationRail之类的导航栏区域

// [backType]：对于返回事件不同的处理类型, 具体可参照[SmartBackType]说明

// [onBack]：返回事件监听，返回true，代表拦截此次返回事件；返回false，代表不拦截，正常执行关闭弹窗等操作
  static Future<void> showDialog<T>({
    required WidgetBuilder builder,
    SmartDialogController? controller,
    Alignment? alignment,
    bool clickMaskDismiss = true,
    bool usePenetrate = false,
    bool useAnimation = true,
    SmartAnimationType? animationType,
    List<SmartNonAnimationType>? nonAnimationTypes,
    Widget Function(AnimationController, Widget, AnimationParam)?
        animationBuilder,
    Duration? animationTime,
    Color? maskColor,
    Widget? maskWidget,
    bool debounce = false,
    VoidCallback? onDismiss,
    VoidCallback? onMask,
    Duration? displayTime,
    String? tag,
    bool keepSingle = true,
    bool permanent = false,
    bool useSystem = false,
    bool bindPage = true,
    BuildContext? bindWidget,
    Rect? ignoreArea,
    SmartBackType backType = SmartBackType.normal,
    FutureOr<bool> Function()? onBack,
  }) async {
    await SmartDialog.show(
      builder: builder,
      controller: controller,
      alignment: alignment,
      clickMaskDismiss: clickMaskDismiss,
      usePenetrate: usePenetrate,
      useAnimation: useAnimation,
      animationType: animationType,
      nonAnimationTypes: nonAnimationTypes,
      animationBuilder: animationBuilder,
      animationTime: animationTime,
      maskColor: maskColor,
      maskWidget: maskWidget,
      debounce: debounce,
      onDismiss: onDismiss,
      onMask: onMask,
      displayTime: displayTime,
      tag: tag,
      keepSingle: keepSingle,
      permanent: permanent,
      useSystem: useSystem,
      bindPage: bindPage,
      bindWidget: bindWidget,
      ignoreArea: ignoreArea,
      backType: backType,
      onBack: onBack,
    );
  }

  /// 定位弹窗

// [targetContext]：伴随位置widget的BuildContext

// [builder]：自定义 dialog

// [replaceBuilder]：已废弃, 请使用adjustBuilder

// [adjustBuilder]：[adjustBuilder]中返回widget会替换掉[builder]中返回的widget; [adjustBuilder]将回调目标widget的坐标,大小和dialog自身的坐标,大小,你可以根据这些参数,重新自定义一个合适的替换widget, 强烈建议[adjustBuilder]返回的自定义的widget宽高和[builder]中的保持一致, showAttach中定位信息都是根据[builder]中widget计算得来的

// [controller]：可使用该控制器来刷新自定义的dialog的布局

// [targetBuilder]：手动指定合适坐标点，当targetBuilder被使用时，targetContext参数将无法自动设置位置, targetBuilder回调的参数是根据targetContext计算得来的

// [alignment]：控制弹窗的位置, 详细请参照[SmartConfigAttach]中alignment参数说明

// [clickMaskDismiss]：true（点击遮罩后，将关闭dialog），false（不关闭）

// [animationType]：具体可参照[SmartAnimationType]注释

// [nonAnimationTypes]：对于不同的场景, 可动态关闭弹窗动画, 具体请参照[SmartNonAnimationType]

// [animationBuilder]：支持高度自定义动画, 具体可参照[AnimationBuilder]说明

// [scalePointBuilder]：缩放动画的缩放点, 默认点将自定义dialog控件的中心点作为缩放点; Offset(0, 0): 将控件左上点作为缩放点, Offset(控件宽度, 0): 将控件右上点作为缩放点 Offset(0, 控件高度): 将控件左下点作为缩放点, Offset(控件宽度, 控件高度): 将控件右下点作为缩放点

// [usePenetrate]：true（点击事件将穿透遮罩），false（不穿透）

// [useAnimation]：true（使用动画），false（不使用）

// [animationTime]：动画持续时间

// [maskColor]：遮罩颜色，如果给[maskWidget]设置了值，该参数将会失效

// [maskWidget]：可高度定制遮罩

// [maskIgnoreArea]：mask占位忽略区域, 支持上下左右区域, 设置的区域, mask将不会在此区域占位; 例: maskIgnoreArea: Rect.fromLTRB(0, 0, 0, 30), 底部会有30空隙, mask不会占位该区域; 适用于: 不想mask覆盖BottomNavigationBar, NavigationRail之类的导航栏区域

// [onMask]：点击遮罩时，该回调将会被触发

// [debounce]：防抖功能

// [highlightBuilder]：高亮功能，溶解特定区域的遮罩，可以快速获取目标widget信息（坐标和大小）

// [onDismiss]：在dialog被关闭的时候，该回调将会被触发

// [displayTime]：控制弹窗在屏幕上显示时间; 默认为null, 为null则代表该参数不会控制弹窗关闭; 注: 使用[displayTime]参数, 将禁止使用[tag]参数

// [tag]：如果你给dialog设置了tag, 你可以针对性的关闭它

// [backDismiss]：true（返回事件将关闭dialog，但是不会关闭页面）， false（返回事件不会关闭loading，也不会关闭页面），你仍然可以使用dismiss方法来关闭dialog

// [keepSingle]：默认（false），true（多次调用[showAttach]并不会生成多个dialog，仅仅保持一个dialog）， false（多次调用[showAttach]会生成多个dialog）

// [permanent]：默认（false），true（将该dialog设置为永久化dialog）,false(不设置); 框架内部各种兜底操作(返回事件,路由)无法关闭永久化dialog, 需要关闭此类dialog可使用: dismiss(force: true)

// [useSystem]：默认（false），true（使用系统dialog，[usePenetrate]功能失效; [tag], [keepSingle]和[permanent]禁止使用）， false（使用SmartDialog），使用该参数可使SmartDialog, 与路由页面以及flutter自带dialog合理交互

// [bindPage]：将该dialog与当前页面绑定，绑定页面不在路由栈顶，dialog自动隐藏，绑定页面置于路由栈顶，dialog自动显示; 绑定页面被关闭,被绑定在该页面上的dialog也将被移除

// [bindWidget]：将dialog与某个Widget绑定, 当该widget不可见时, dialog自动隐藏, 该widget可见时, dialog自动显示; 适用于PageView, TabView之类, 绑定其子页面, 切换页面时, dialog也能合理交互 注意: [bindWidget]处理路由逻辑高于[bindPage], 当[bindWidget]不为null, [bindPage]将自动被设置为false

// [backType]：对于返回事件不同的处理类型, 具体可参照[SmartBackType]说明

// [onBack]：返回事件监听，返回true，代表拦截此次返回事件；返回false，代表不拦截，正常执行关闭弹窗等操作

  static Future<void> showAttach<T>(
   { required BuildContext targetContext,
    required WidgetBuilder builder,
    SmartDialogController? controller,
     Offset Function(
      Offset targetOffset,
      Size targetSize,
    )? targetBuilder,
    Alignment? alignment,
    bool? clickMaskDismiss,
    SmartAnimationType? animationType,
    List<SmartNonAnimationType>? nonAnimationTypes,
    Widget Function(AnimationController, Widget, AnimationParam)?
        animationBuilder,
    Offset Function(Size selfSize)? scalePointBuilder,
    bool? usePenetrate,
    bool? useAnimation,
    Duration? animationTime,
    Color? maskColor,
    Widget? maskWidget,
    Rect? maskIgnoreArea,
    VoidCallback? onMask,
    bool? debounce,
    Positioned Function(
      Offset targetOffset,
      Size targetSize,
    )? highlightBuilder,
    VoidCallback? onDismiss,
    Duration? displayTime,
    String? tag,
    @Deprecated("please use backType") bool? backDismiss,
    bool? keepSingle,
    bool? permanent,
    bool? useSystem,
    bool? bindPage,
    BuildContext? bindWidget,
    SmartBackType? backType,
    FutureOr<bool> Function()? onBack,
  }) async {
    await SmartDialog.showAttach(
      targetContext: targetContext,
      builder: builder,
      targetBuilder: targetBuilder,
      alignment: alignment,
      clickMaskDismiss: clickMaskDismiss,
      animationType: animationType,
      nonAnimationTypes: nonAnimationTypes,
      animationBuilder: animationBuilder,
      scalePointBuilder: scalePointBuilder,
      usePenetrate: usePenetrate,
      useAnimation: useAnimation,
      animationTime: animationTime,
      maskColor: maskColor,
      maskWidget: maskWidget,
      maskIgnoreArea: maskIgnoreArea,
      onMask: onMask,
      debounce: debounce,
      highlightBuilder: highlightBuilder,
      onDismiss: onDismiss,
      displayTime: displayTime,
      tag: tag,
      backDismiss: backDismiss,
      keepSingle: keepSingle,
      permanent: permanent,
      useSystem: useSystem,
      bindPage: bindPage,
      bindWidget: bindWidget,
      backType: backType,
      onBack: onBack,
    );
  }
}
