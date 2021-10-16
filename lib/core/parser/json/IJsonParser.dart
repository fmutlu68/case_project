import 'package:flutter_case_project/core/base/model/base_model.dart';
import 'package:flutter_case_project/core/parser/IParser.dart';

abstract class IJsonParser extends IParser {
  TReturnType? parseJSON<TReturnType, RParserType extends BaseModel>(
    RParserType parserModel,
    dynamic source,
  );
}
