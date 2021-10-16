abstract class ICacheService {
  void setString(String key, String value);
  void setBool(String key, bool value);
  T getObject<T>(String key);
}
