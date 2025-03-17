import 'dart:convert';
import 'dart:developer';

import 'package:dio/dio.dart';
import '../../common/models/error_model.dart';
import '../../common/models/failure.dart';

class ApiInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    String headers = "";
    options.headers.forEach((key, value) {
      headers += "$key: $value | \n";
    });
    log(
      "┌------------------------------------------------------------------------------",
    );
    log('''| Request: ${options.method} ${options.uri}''');
    log(
      "├------------------------------------------------------------------------------",
    );
    log('''| Headers: $headers''');
    log(
      "├------------------------------------------------------------------------------",
    );
    log('''| Body: ${options.data}''');
    log(
      "├------------------------------------------------------------------------------",
    );
    handler.next(options);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    JsonEncoder encoder = const JsonEncoder.withIndent('        ');
    String prettyPrint = encoder.convert(response.data);
    log("| Status code: ${response.statusCode}");
    log(
      "├------------------------------------------------------------------------------",
    );
    log("| Response: $prettyPrint");
    log(
      "└------------------------------------------------------------------------------",
    );
    handler.next(response);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    log("| Error statusCode: ${err.response!.statusCode}");
    log("| Error response: ${err.response?.data.toString()}");
    log(
      "└------------------------------------------------------------------------------",
    );
    if (err.response != null && err.response!.data.toString().isNotEmpty) {
      ErrorModel errorModel = ErrorModel.fromJson({
        "code": err.response!.statusCode,
        "error": err.response!.data['error'] ?? err.response!.data['message'],
      });
      throw Failure(
        errorModel.message.toString(),
        code: err.response!.statusCode!,
      );
    } else {
      ErrorModel errorModel = ErrorModel.fromJson({
        "code": err.response!.statusCode ?? 0,
        "error": err.type.name,
      });
      throw Failure(
        errorModel.message.toString(),
        code: err.response!.statusCode ?? 0,
      );
    }
  }
}
