import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:rede_prime/screens/home/home_page.dart';
import 'package:rede_prime/screens/home/information_page.dart';
import 'package:rede_prime/screens/login/login_page.dart';
import 'package:rede_prime/screens/signup/signup_page.dart';
import 'package:rede_prime/screens/signup/signup_page_segurado.dart';
import 'package:rede_prime/screens/splash/splash_page.dart';
import 'package:rede_prime/screens/vehicle/acidente.dart';
import 'package:rede_prime/screens/vehicle/pane.dart';
import 'package:rede_prime/screens/vehicle/roubo.dart';
import 'package:rede_prime/screens/vehicle/sinistre_registration_page.dart';
import 'package:rede_prime/screens/vehicle/vehicle_registration_page.dart';

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
        '/informationpage': (BuildContext context) => new InformationPage(),
        '/VehicleRegistrationPage': (BuildContext context) => new VehicleRegistrationPage(),
        '/homepage': (BuildContext context) => new HomePage(),
        '/signuppagesegurado': (BuildContext context) => new SignUpPageSegurado(),
        '/SinistrePage': (BuildContext context) => new SinistrePage(),
        '/acidentepage': (BuildContext context) => new AcidentePage(),
        '/roubopage': (BuildContext context) => new RouboPage(),
        '/panepage': (BuildContext context) => new PanePage(),
      },
    );
  }
}
