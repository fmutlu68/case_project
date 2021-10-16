import 'package:flutter_case_project/core/base/model/base_error_model.dart';

abstract class BaseResponseModel<T> {
  T? data;
  BaseErrorModel? error;
}
