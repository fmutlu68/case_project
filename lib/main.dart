import 'package:flutter/material.dart';
import 'package:flutter_case_project/features/local_db/local_db_service.dart';
import 'package:flutter_case_project/view/auth/login/view/login_view.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await LocalDbService.instance.initService();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      debugShowCheckedModeBanner: false,
      home: LoginView(),
    );
  }
}
