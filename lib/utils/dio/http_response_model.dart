import 'package:dio/dio.dart';

import 'http_parse/i_http_parse.dart';

// Represents the model for HTTP responses.
class HttpResponseModel {
    // The data returned in the HTTP response.
    dynamic data;
    
    // The status code of the HTTP response.
    int? code;
    
    // Any message associated with the HTTP response.
    String? msg;

    // Provides a JSON map representation of the data.
    Map<String, dynamic> get jsonMap => data ?? {};

    // Constructor for a successful HTTP response.
    HttpResponseModel.success(this.data) {
        code = 200; // Sets the status code to 200 for success.
    }

    // Constructor for a failed HTTP response with optional error message and code.
    HttpResponseModel.failure({String? errorMsg, int? errorCode}) {
        msg = errorMsg;
        code = errorCode;
    }

    // Constructor for a failed HTTP response using data to determine the error message.
    HttpResponseModel.failureFormResponse({DioException? error}) {
        msg = handleError(data);
    }

    // Checks if the response is successful.
    bool get success => code == 200;
}
