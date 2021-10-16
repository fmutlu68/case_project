import 'package:flutter_case_project/core/base/model/base_model.dart';
import 'package:flutter_case_project/core/base/model/base_response_model.dart';
import 'package:flutter_case_project/core/constants/network_type.dart';

abstract class IDioCore {
  Future<BaseResponseModel<T>> fetchRequest<T, R extends BaseModel>({
    required String path,
    required R parser,
    required NetworkActionType type,
    dynamic data,
  });
}
