import 'package:flutter/material.dart';
import 'package:rede_prime/screens/signup/signup_form.dart';
import 'package:rede_prime/shared/themes/app_images.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({ Key? key }) : super(key: key);

  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
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
            SignupForm(),
          ],
        ),
      ),
      
    );
  }
}