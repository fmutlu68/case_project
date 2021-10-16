enum NetworkActionType { GET, POST }

extension NetworkActionExtension on NetworkActionType {
  String get rawValue {
    switch (this) {
      case NetworkActionType.GET:
        return "GET";
      case NetworkActionType.POST:
        return "POST";
      default:
        return "ERROR";
    }
  }
}
