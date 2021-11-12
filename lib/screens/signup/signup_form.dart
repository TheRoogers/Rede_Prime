import 'package:flutter/material.dart';
import 'package:rede_prime/screens/home/home_page.dart';
import 'package:rede_prime/shared/auth/authentication.dart';
import 'package:rede_prime/shared/themes/app_colors.dart';
import 'package:rede_prime/shared/themes/app_text_styles.dart';

class SignupForm extends StatefulWidget {
  const SignupForm({Key? key}) : super(key: key);

  @override
  _SignupFormState createState() => _SignupFormState();
}

class _SignupFormState extends State<SignupForm> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  String? email;
  String? password;
  bool _showPassword = false;
  bool _showConfirmPassword = false;
  bool isLoading = false;

  final pass = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Column(
      children: <Widget>[
        SizedBox(height: size.height * 0.03), //espaco entre a logo
        Align(
          alignment: Alignment(-0.8, 0.1), //distancia do texto
          child: Text(
            "Crie sua conta:",
            style: TextStyles.titleLogin,
          ),
        ),
        SizedBox(height: size.height * 0.02),
        Center(
          child: Form(
            key: _formKey,
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
                        }
                        return null;
                      },
                      onSaved: (val) {
                        email = val!;
                      },
                      keyboardType: TextInputType.emailAddress,
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
                      controller: pass,
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
                          return 'A senha precisa ter mais de 6 caracteres';
                        }
                        return null;
                      },
                      onSaved: (val) {
                        password = val;
                      },
                    ),
                  ),
                  SizedBox(height: size.height * 0.02),
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
                              _showConfirmPassword = !_showConfirmPassword;
                            });
                          },
                          child: Icon(
                            _showConfirmPassword
                                ? Icons.visibility
                                : Icons.visibility_off,
                            color: AppColors.secundary,
                          ),
                        ),
                        hintText: 'Confirme a Senha',
                        filled: true,
                        fillColor: Colors.grey[200],
                      ),
                      obscureText: _showConfirmPassword == false ? true : false,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'A senha não pode ficar em branco';
                        } else if (value.length < 6) {
                          return 'A senha nao é a mesma informada acima';
                        } else if (value != pass.text) {
                          return 'As senhas digitadas estão diferentes';
                        }
                        return null;
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        SizedBox(height: size.height * 0.02),
        ElevatedButton(
          child: isLoading
              ? CircularProgressIndicator(
                  color: AppColors.titlesplash,
                )
              : const Text('Criar'),
          style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.symmetric(
                // tamanho do botao
                horizontal: 165,
                vertical: 20,
              ),
              primary: AppColors.secundary,
              elevation: 15,
              onPrimary: Colors.white,
              textStyle: TextStyles.bottomLogin),
          onPressed: () {
            if (_formKey.currentState!.validate()) {
              setState(() {
                  isLoading = true;
                });
              _formKey.currentState!.save();

              AuthenticationHelper()
                  .signUp(email: email!, password: password!)
                  .then((result) {
                if (result == null) {
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) => HomePage()));
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(
                        'O endereço de e-mail já está sendo usado por outra conta',
                        style: TextStyle(fontSize: 16),
                      ),
                    ),
                  );
                }
              });
            }
          },
        ),
        GestureDetector(
          onTap: () {},
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                "Ja tem uma conta? ",
                style: TextStyles.forgotpassword,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, "/loginpage");
                },
                child: Text(
                  "Entrar",
                  style: TextStyles.signup,
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}