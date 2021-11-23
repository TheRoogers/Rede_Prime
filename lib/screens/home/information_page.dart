import 'package:flutter/material.dart';
import 'package:rede_prime/shared/themes/app_colors.dart';

class InformationPage extends StatelessWidget {
  const InformationPage({Key? key}) : super(key: key);

  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.secundary,
        title: Text(
          "Informações",
        ),
      ),
      body: Column(
        children: [
          Center(
            child: Text('oi'),
          ),
        ],
      ),
    );
  }
}
