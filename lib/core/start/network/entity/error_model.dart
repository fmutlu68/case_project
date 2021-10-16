import 'package:flutter_case_project/core/base/model/base_error_model.dart';

class ErrorModel implements BaseErrorModel {
  final String message;

  ErrorModel(this.message);
}
