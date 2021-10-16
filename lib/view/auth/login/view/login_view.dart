import 'package:flutter/material.dart';
import 'package:flutter_case_project/core/base/view/base_view.dart';
import 'package:flutter_case_project/view/auth/login/view_model/login_view_model.dart';

class LoginView extends StatefulWidget {
  LoginView({Key? key}) : super(key: key);

  @override
  _LoginViewState createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  late LoginViewModel viewModel;

  @override
  Widget build(BuildContext context) {
    return BaseView<LoginViewModel>(
      viewModel: LoginViewModel(),
      onModelReady: (model) {
        viewModel = model;
        viewModel.setContext(context);
        viewModel.init();
      },
      onPageBuilder: (context, model) => Scaffold(
        appBar: appBar,
        body: Text("Deneme"),
      ),
      onDispose: () {},
    );
  }

  get appBar => AppBar(
        backgroundColor: Colors.transparent,
        elevation: 200,
        centerTitle: true,
      );
}
