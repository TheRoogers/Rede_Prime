import 'package:flutter/material.dart';
import 'package:rede_prime/screens/home/home_page.dart';
import 'package:rede_prime/shared/auth/authentication.dart';
import 'package:rede_prime/shared/themes/app_colors.dart';
import 'package:rede_prime/shared/themes/app_images.dart';
import 'package:rede_prime/shared/themes/app_text_styles.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({Key? key}) : super(key: key);

  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final _formKey = GlobalKey<FormState>();

  String? email;
  String? password;
  bool _showPassword = false;
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Form(
      key: _formKey,
      child: Column(
        children: <Widget>[
          SizedBox(height: size.height * 0.03), //espaco entre a logo
          Align(
            alignment: Alignment(-0.8, 0.1), //distancia do texto
            child: Text(
              "Entre com sua conta:",
              style: TextStyles.titleLogin,
            ),
          ),
          SizedBox(height: size.height * 0.02),
          Center(
            child: Container(
              width: size.width * 0.90,
              child: Column(
                children: [
                  Material(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    elevation: 15,
                    shadowColor: AppColors.secundary,
                    child: TextFormField(
                      decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.transparent),
                          borderRadius: BorderRadius.all(
                            Radius.circular(10),
                          ),
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: AppColors.secundary),
                        ),
                        prefixIcon: Icon(
                          Icons.person,
                          color: AppColors.secundary,
                        ),
                        hintText: 'Email',
                        filled: true,
                        fillColor: Colors.grey[200],
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Coloque um Email';
                        } else if (!value.contains('@')) {
                          return 'Por favor coloque um email valido';
                        } else if (!value.contains('.com')) {
                          return 'Por favor coloque um email valido';
                        }
                        return null;
                      },
                      onSaved: (val) {
                        email = val!;
                      },
                    ),
                  ),
                  SizedBox(height: size.height * 0.03), //espaco entre os campos
                  Material(
                    borderRadius: BorderRadius.all(
                      Radius.circular(10),
                    ),
                    elevation: 15,
                    shadowColor: AppColors.secundary,
                    child: TextFormField(
                      decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.transparent),
                          borderRadius: BorderRadius.all(
                            Radius.circular(10),
                          ),
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: AppColors.secundary),
                        ),
                        prefixIcon: Icon(
                          Icons.lock,
                          color: AppColors.secundary,
                        ),
                        suffixIcon: GestureDetector(
                          onTap: () {
                            setState(() {
                              _showPassword = !_showPassword;
                            });
                          },
                          child: Icon(
                            _showPassword
                                ? Icons.visibility
                                : Icons.visibility_off,
                            color: AppColors.secundary,
                          ),
                        ),
                        hintText: 'Senha',
                        filled: true,
                        fillColor: Colors.grey[200],
                      ),
                      obscureText: _showPassword == false ? true : false,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Digite a senha';
                        } else if (value.length < 6) {
                          return 'sua senha tem mais de 6 caracteres';
                        }
                        return null;
                      },
                      onSaved: (val) {
                        password = val!;
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: size.height * 0.01),
          Align(
            alignment: Alignment(0.8, 0.1), //distancia do texto
            child: Text(
              "Esqueceu a senha?",
              style: TextStyles.forgotpassword,
            ),
          ),
          SizedBox(height: size.height * 0.02),
          ElevatedButton(
            child: isLoading
                ? CircularProgressIndicator(
                    color: AppColors.titlesplash,
                  )
                : const Text('Entrar'),
            style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(
                  // tamanho do botao
                  horizontal: 165,
                  vertical: 20,
                ),
                primary: AppColors.secundary,
                elevation: 15,
                onPrimary: AppColors.titlesplash,
                textStyle: TextStyles.bottomLogin),
            onPressed: () {
              if (_formKey.currentState!.validate()) {
                setState(() {
                  isLoading = true;
                });
                _formKey.currentState!.save();

                AuthenticationHelper()
                    .signIn(email: email!, password: password!)
                    .then((result) {
                  if (result == null) {
                    Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (context) => HomePage()));
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(
                          'Conta não existe ou está errada',
                          style: TextStyle(fontSize: 16),
                        ),
                      ),
                    );
                  }
                });
              }
            },
          ),
          SizedBox(height: size.height * 0.03),
          Row(
            children: <Widget>[
              Expanded(
                child: Divider(
                  indent: 10,
                  endIndent: 10,
                  color: AppColors.primary,
                  height: 2.0,
                ),
              ),
              Text("Ou entre com: "), //arrumar linha entre os espaços
              Expanded(
                child: Divider(
                  indent: 10,
                  endIndent: 10,
                  color: AppColors.primary,
                  height: 25.0,
                ),
              ),
            ],
          ),
          SizedBox(height: size.height * 0.03),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Container(
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Colors.grey[150],
                  border: Border.all(
                    width: 2,
                    color: AppColors.secundary,
                  ),
                  shape: BoxShape.circle,
                ),
                child: Image.asset(
                  AppImages.iconGoogle,
                  height: 30,
                  width: 30,
                ),
              ),
              Container(
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Colors.grey[150],
                  border: Border.all(
                    width: 2,
                    color: AppColors.secundary,
                  ),
                  shape: BoxShape.circle,
                ),
                child: Image.asset(
                  AppImages.iconFace,
                  height: 30,
                  width: 30,
                ),
              ),
              Container(
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Colors.grey[150],
                  border: Border.all(
                    width: 2,
                    color: AppColors.secundary,
                  ),
                  shape: BoxShape.circle,
                ),
                child: Image.asset(
                  AppImages.iconTwitter,
                  height: 30,
                  width: 30,
                ),
              ),
            ],
          ),
          SizedBox(height: size.height * 0.08),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                "Ainda nao tem uma conta? ",
                style: TextStyles.forgotpassword,
              ),
              GestureDetector(
                onTap: () {
                  showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: Text(
                            'Se cadastrar como?',
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                              color: AppColors.primary,
                            ),
                          ),
                          content: SingleChildScrollView(
                            child: ListBody(
                              children: [
                                InkWell(
                                  onTap: () {
                                    Navigator.pushNamed(context, "/signupage");
                                  },
                                  splashColor: Colors.purpleAccent,
                                  child: Row(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Icon(
                                          Icons.account_circle,
                                          color: AppColors.secundary,
                                        ),
                                      ),
                                      Text(
                                        'Cliente',
                                        style: TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.w500,
                                            color: AppColors.primary),
                                      )
                                    ],
                                  ),
                                ),
                                InkWell(
                                  onTap: () {},
                                  splashColor: AppColors.secundary,
                                  child: Row(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Icon(
                                          Icons.shield,
                                          color: AppColors.secundary,
                                        ),
                                      ),
                                      Text(
                                        'Segurado',
                                        style: TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.w500,
                                            color: AppColors.primary),
                                      )
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      });
                },
                child: Text(
                  "Cadastre-se",
                  style: TextStyles.signup,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
