import 'package:flutter/material.dart';
import 'package:rede_prime/shared/themes/app_colors.dart';
import 'package:rede_prime/shared/themes/app_images.dart';
import 'dart:async';
import 'package:rede_prime/shared/themes/app_text_styles.dart';

class SplashPage extends StatefulWidget {
  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();

    Timer(Duration(seconds: 3), () {
      Navigator.pushNamed(context, '/loginpage');
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: AppColors.primary,
      body: Center(
        child: Column(
          mainAxisAlignment:
              MainAxisAlignment.center, // centraliza a logo ao meio
          children: <Widget>[
            Image.asset(
              AppImages.logoFull,
              height: size.height * 0.40, // diminui o seu tamanho
            ),
            Text(
              "Carregando...",
              style: TextStyles.titleHome
            ),
            SizedBox(height: size.height * 0.03),
            CircularProgressIndicator.adaptive(
              valueColor: AlwaysStoppedAnimation(AppColors.titlesplash),
            ),
          ],
        ),
      ),
    );
  }
}
