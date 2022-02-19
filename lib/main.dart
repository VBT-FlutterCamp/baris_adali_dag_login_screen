import 'package:flutter/material.dart';
import 'package:login_screen/core/init/design/color.dart';
import 'package:login_screen/feature/login/login_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primaryColor: kcLightGreyColor,
      ),
      home: const LoginView(),
    );
  }
}
