import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:rede_prime/screens/login/login_page.dart';
import 'package:rede_prime/screens/signup/signup_page.dart';
import 'package:rede_prime/screens/splash/splash_page.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashPage(),
      routes: <String, WidgetBuilder>{
        '/splashpage': (BuildContext context) => new SplashPage(),
        '/loginpage': (BuildContext context) => new LoginPage(),
        '/signupage': (BuildContext context) => new SignUpPage(),
      },
    );
  }
}
