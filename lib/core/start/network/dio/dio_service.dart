import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter_case_project/core/base/model/base_model.dart';
import 'package:flutter_case_project/core/constants/network_type.dart';
import 'package:flutter_case_project/core/base/model/base_response_model.dart';
import 'package:flutter_case_project/core/parser/json/IJsonParser.dart';
import 'package:flutter_case_project/core/start/dependency_injection/injection_container.dart';
import 'package:flutter_case_project/core/start/network/dio/IDioCore.dart';
import 'package:flutter_case_project/core/start/network/entity/error_model.dart';
import 'package:flutter_case_project/core/start/network/entity/response_model.dart';

class DioService with DioMixin implements Dio, IDioCore {
  IJsonParser? _jsonParser;
  IJsonParser get parser => _jsonParser!;
  DioService() {
    _jsonParser = container<IJsonParser>();
  }

  @override
  Future<BaseResponseModel<T>> fetchRequest<T, R extends BaseModel>({
    required String path,
    required R parser,
    required NetworkActionType type,
    data,
  }) async {
    final response = await request(
      path,
      data: data,
      options: Options(
        method: type.rawValue,
      ),
    );
    switch (response.statusCode) {
      case HttpStatus.ok:
      case HttpStatus.accepted:
        T? data = _jsonParser!.parseJSON<T, R>(parser, response.data);
        return ResponseModel(data: data);
      default:
        return ResponseModel(
            error: ErrorModel("ERROR: ${response.statusMessage}"));
    }
  }
}
