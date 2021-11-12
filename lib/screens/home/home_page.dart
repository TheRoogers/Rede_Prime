import 'package:flutter/material.dart';
import 'package:rede_prime/screens/login/login_page.dart';
import 'package:rede_prime/shared/auth/authentication.dart';
import 'package:rede_prime/shared/themes/app_colors.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.secundary,
        title: Text('Drawer teste'),
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.exit_to_app,
              color: AppColors.titlesplash,
            ),
            onPressed: () {
              AuthenticationHelper().signOut().then(
                    (_) => Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (contex) => LoginPage(),
                      ),
                    ),
                  );
            },
          ),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            UserAccountsDrawerHeader(
              decoration: BoxDecoration(
                color: AppColors.secundary,
              ),
              accountEmail: Text('@User'),
              accountName: Text(''),
            )
          ],
        ),
      ),
      body: Center(
        child: const Text('corpo'),
      ),
    );
  }
}
