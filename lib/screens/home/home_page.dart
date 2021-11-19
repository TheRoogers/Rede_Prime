import 'package:flutter/material.dart';
import 'package:rede_prime/screens/login/login_page.dart';
import 'package:rede_prime/shared/auth/authentication.dart';
import 'package:rede_prime/shared/themes/app_colors.dart';
import 'package:rede_prime/shared/themes/app_images.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
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
              accountEmail: Text('email'),
              accountName: Text('name'),
            )
          ],
        ),
      ),
      body: GridView.count(
        crossAxisCount: 2,
        padding: EdgeInsets.all(16.0),
        childAspectRatio: 0.9,
        crossAxisSpacing: 10.0,
        mainAxisSpacing: 10.0, //comprimento
        children: <Widget>[
          Card(
            clipBehavior: Clip.antiAlias,
            elevation: 5.0,
            shape: RoundedRectangleBorder(
              side: BorderSide(width: 0.1),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Column(children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(10.0),
              ),
              Image.asset(
                AppImages.registercar,
                height: size.height * 0.15,
                color: AppColors.secundary,
              ),
              ListTile(
                title: const Text('Cadastrar Veiculo'),
              )
            ]),
          ),
          Card(
            clipBehavior: Clip.antiAlias,
            elevation: 5.0,
            shape: RoundedRectangleBorder(
              side: BorderSide(width: 0.1),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(10.0),
                ),
                Image.asset(
                  AppImages.searchcar,
                  height: size.height * 0.15,
                  color: AppColors.secundary,
                ),
                ListTile(
                  title: const Text('Consultar Veiculo'),
                )
              ],
            ),
          ),
          Card(
            clipBehavior: Clip.antiAlias,
            elevation: 5.0,
            shape: RoundedRectangleBorder(
              side: BorderSide(width: 0.1),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(10),
                ),
                Image.asset(
                  AppImages.accidentcar,
                  height: size.height * 0.15,
                  color: AppColors.secundary,
                ),
                ListTile(
                  title: const Text('Cadastrar Sinistro'),
                ),
              ],
            ),
          ),
          Card(
            clipBehavior: Clip.antiAlias,
            elevation: 5.0,
            shape: RoundedRectangleBorder(
              side: BorderSide(width: 0.1),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(10),
                ),
                Image.asset(
                  AppImages.servicecar,
                  height: size.height * 0.15,
                  color: AppColors.secundary,
                ),
                ListTile(
                  title: const Text('Consultar Sinistro'),
                ),
              ],
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, "/informationpage");
            },
            child: Card(
              clipBehavior: Clip.antiAlias,
              elevation: 5.0,
              shape: RoundedRectangleBorder(
                side: BorderSide(width: 0.1),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(10),
                  ),
                  Image.asset(
                    AppImages.question,
                    height: size.height * 0.15,
                    color: AppColors.secundary,
                  ),
                  ListTile(
                    title: Center(
                      child: const Text('Informações'),
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
