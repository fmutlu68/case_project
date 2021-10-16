import 'package:flutter_case_project/core/parser/json/IJsonParser.dart';
import 'package:flutter_case_project/core/parser/json/json_parser.dart';
import 'package:flutter_case_project/core/start/network/dio/IDioCore.dart';
import 'package:flutter_case_project/core/start/network/dio/dio_service.dart';
import 'package:get_it/get_it.dart';

final _container = GetIt.instance;
get container => _container;

void setupContainer() {
  _container.registerSingleton<IJsonParser>(JsonParser());
  _container.registerSingleton<IDioCore>(DioService());
}
