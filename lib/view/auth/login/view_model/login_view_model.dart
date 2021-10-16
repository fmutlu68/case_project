import 'package:flutter/material.dart';
import 'package:flutter_case_project/core/base/model/base_view_model.dart';
import 'package:mobx/mobx.dart';
part 'login_view_model.g.dart';

class LoginViewModel = _LoginViewModelBase with _$LoginViewModel;

abstract class _LoginViewModelBase with Store, BaseViewModel {
  void setContext(BuildContext ctx) => this.context = ctx;

  void init() {}
  void onDispose() {}
}
