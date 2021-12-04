import 'package:flutter/material.dart';
import 'package:rede_prime/shared/themes/app_colors.dart';

class AcidentePage extends StatefulWidget {
  const AcidentePage({ Key? key }) : super(key: key);

  @override
  _AcidentePageState createState() => _AcidentePageState();
}

class _AcidentePageState extends State<AcidentePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.secundary,
        title: Text('Acidente'),
      ),
      
    );
  }
}