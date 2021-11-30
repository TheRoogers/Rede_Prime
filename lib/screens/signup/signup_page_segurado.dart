import 'package:flutter/material.dart';
import 'package:rede_prime/screens/signup/signup_form_segurado.dart';
import 'package:rede_prime/shared/themes/app_images.dart';

class SignUpPageSegurado extends StatefulWidget {
  const SignUpPageSegurado({ Key? key }) : super(key: key);

  @override
  _SignUpPageSeguradoState createState() => _SignUpPageSeguradoState();
}

class _SignUpPageSeguradoState extends State<SignUpPageSegurado> {
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
              AppImages.logo,
              height: size.height * 0.10, // tamanho da imagem
            ),
            SignupFormSegurado(),
          ],
        ),
      ),
      
    );
  }
}