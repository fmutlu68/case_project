import 'package:flutter/material.dart';

abstract class BaseViewModel {
  BuildContext? context;
  setContext(BuildContext newContext);

  init();
  onDispose();
}
