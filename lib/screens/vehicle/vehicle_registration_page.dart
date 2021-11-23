import 'package:flutter/material.dart';
import 'package:rede_prime/shared/auth/api_fipe.dart';
import 'package:rede_prime/shared/themes/app_colors.dart';

class VehicleRegistrationPage extends StatefulWidget {
  const VehicleRegistrationPage({Key? key}) : super(key: key);

  @override
  _VehicleRegistrationPageState createState() =>
      _VehicleRegistrationPageState();
}

class _VehicleRegistrationPageState extends State<VehicleRegistrationPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.secundary,
        title: Text(
          "Cadastrar Veiculo",
        ),
      ),
      body: ApiFipePage()
    );
  }
}
