import 'package:flutter/material.dart';
import 'package:sawari/src/assets/routes.dart';
import 'package:sawari/src/pages/getting_started/getting_started.dart';
import 'package:sawari/src/pages/home_page/home_page.dart';
import 'package:sawari/src/pages/login/login.dart';
import 'package:sawari/src/pages/sign_up/sign_up.dart';

void main() => runApp(SawariApp());

class SawariApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Sawari',
      debugShowCheckedModeBanner: false,
      initialRoute: AppRoutes.GETTING_STARTED,
      routes: {
        '/': (context) => GettingStarted(),
        AppRoutes.GETTING_STARTED: (context) => GettingStarted(),
        AppRoutes.LOGIN: (context) => Login(),
        AppRoutes.SIGN_UP: (context) => SignUp(),
        AppRoutes.HOME_PAGE: (context) => HomePage(),
      },
    );
  }
}
