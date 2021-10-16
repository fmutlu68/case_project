import 'package:flutter_case_project/core/base/model/base_model.dart';

import 'IJsonParser.dart';

class JsonParser implements IJsonParser {
  @override
  TReturnType? parseJSON<TReturnType, RParserType extends BaseModel>(
      RParserType parserModel, source) {
    if (source is List) {
      return source.map((e) => parserModel.toJson).toList().cast<RParserType>()
          as TReturnType?;
    } else if (source is Map) {
      return parserModel.fromJson(source as Map<String, dynamic>)
          as TReturnType?;
    }
    return source as TReturnType?;
  }
}
