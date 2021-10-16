import 'package:flutter_case_project/core/base/model/base_error_model.dart';
import 'package:flutter_case_project/core/base/model/base_response_model.dart';

class ResponseModel<T> implements BaseResponseModel<T> {
  @override
  T? data;

  @override
  BaseErrorModel? error;

  ResponseModel({
    this.data,
    this.error,
  });
}
