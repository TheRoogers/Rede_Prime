import 'package:flutter/material.dart';
import 'package:rede_prime/screens/login/login_form.dart';
import 'package:rede_prime/shared/themes/app_images.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            SizedBox(height: size.height * 0.04),
            Image.asset(
              AppImages.logoWhite,
              height: size.height * 0.20, // tamanho da imagem
            ),
            LoginForm(),
          ],
        ),
      ),
    );
  }
}
