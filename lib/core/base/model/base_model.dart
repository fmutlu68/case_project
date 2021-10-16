abstract class BaseModel<T> {
  Map<String, dynamic> get toJson;
  T fromJson(Map<String, dynamic> json);
}
