import 'dart:io';
import 'package:intl/date_symbol_data_local.dart';
import 'package:date_field/date_field.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart' as intl;
import 'package:rede_prime/screens/home/home_page.dart';
import 'package:rede_prime/shared/auth/authentication.dart';
import 'package:rede_prime/shared/services/globalmethods.dart';
import 'package:rede_prime/shared/themes/app_colors.dart';
import 'package:rede_prime/shared/themes/app_text_styles.dart';

class SignupFormSegurado extends StatefulWidget {
  const SignupFormSegurado({Key? key}) : super(key: key);

  @override
  _SignupFormSeguradoState createState() => _SignupFormSeguradoState();
}

class _SignupFormSeguradoState extends State<SignupFormSegurado> {
  final _formKey = GlobalKey<FormState>();
  String? username;
  File? _pickedImage;
  String? seguradoraselecionada;
  String? email;
  String? password;
  DateTime? valitycnh;
  String? valityseguradora;
  String? url;
  var seguradora = [
    'Itau Seguros',
    'Porto Seguro',
    'Azul Seguros',
    'Generali',
    'Liberty Seguros',
    'Caixa Seguradora',
    'Bradesco Seguros',
    'SulAmerica',
    'Tokio Marine Seguradora',
    'Allianz',
    'Zurick'
  ];

  bool _showPassword = false;
  bool _showConfirmPassword = false;
  GlobalMethods _globalMethods = GlobalMethods();
  bool isLoading = false;

  final pass = new TextEditingController();

  void getImageCamera() async {
    final picker = ImagePicker();
    final pickedImage =
        await picker.pickImage(source: ImageSource.camera, imageQuality: 10);
    final pickedImageFile = File(pickedImage!.path);
    setState(() {
      _pickedImage = pickedImageFile;
    });
    Navigator.pop(context);
  }

  void getImageGallery() async {
    final picker = ImagePicker();
    final pickedImage = await picker.pickImage(source: ImageSource.gallery);
    final pickedImageFile = File(pickedImage!.path);
    setState(() {
      _pickedImage = pickedImageFile;
    });
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    initializeDateFormatting('pt_BR', null)
        .then((_) => _SignupFormSeguradoState());
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
                  //Nome
                  Material(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    elevation: 15,
                    shadowColor: AppColors.secundary,
                    child: TextFormField(
                      decoration: InputDecoration(
                        errorStyle: TextStyle(
                          fontSize: 16.0,
                        ),
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
                        hintText: 'Nome',
                        filled: true,
                        fillColor: Colors.grey[200],
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Coloque seu nome';
                        }
                        return null;
                      },
                      onSaved: (val) {
                        username = val!;
                      },
                    ),
                  ),
                  SizedBox(height: size.height * 0.03), //espaco entre os campos

                  //adicionar foto
                  Row(
                    textDirection: TextDirection.rtl,
                    children: [
                      FloatingActionButton(
                        onPressed: () {
                          showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  title: Text(
                                    'Escolha uma opção',
                                    style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      color: AppColors.primary,
                                    ),
                                  ),
                                  content: SingleChildScrollView(
                                    child: ListBody(
                                      children: [
                                        InkWell(
                                          onTap: getImageCamera,
                                          splashColor: Colors.purpleAccent,
                                          child: Row(
                                            children: [
                                              Padding(
                                                padding:
                                                    const EdgeInsets.all(8.0),
                                                child: Icon(
                                                  Icons.camera,
                                                  color: AppColors.secundary,
                                                ),
                                              ),
                                              Text(
                                                'Camera',
                                                style: TextStyle(
                                                    fontSize: 18,
                                                    fontWeight: FontWeight.w500,
                                                    color: AppColors.primary),
                                              )
                                            ],
                                          ),
                                        ),
                                        InkWell(
                                          onTap: getImageGallery,
                                          splashColor: AppColors.secundary,
                                          child: Row(
                                            children: [
                                              Padding(
                                                padding:
                                                    const EdgeInsets.all(8.0),
                                                child: Icon(
                                                  Icons.image,
                                                  color: AppColors.secundary,
                                                ),
                                              ),
                                              Text(
                                                'Galeria',
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
                        child: Icon(Icons.camera_alt),
                        backgroundColor: AppColors.secundary,
                      ),
                      Text(
                        'Adicione uma foto da sua CNH     ',
                        style: TextStyles.forgotpassword,
                      ),
                    ],
                  ),
                  SizedBox(height: size.height * 0.02),
                  //SEGURADORA
                  Material(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    elevation: 15,
                    shadowColor: AppColors.secundary,
                    child: InputDecorator(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.transparent),
                          borderRadius: BorderRadius.all(
                            Radius.circular(10),
                          ),
                        ),
                      ),
                      child: DropdownButtonHideUnderline(
                        child: DropdownButtonFormField(
                          isDense: true,
                          isExpanded: true,
                          value: seguradoraselecionada,
                          onChanged: (newValue) {
                            setState(() {
                              seguradoraselecionada = newValue as String?;
                            });
                          },
                          hint: Text(
                            "Seguradora",
                            style: TextStyle(color: Colors.black),
                          ),
                          items: seguradora.map((valueItem) {
                            return DropdownMenuItem(
                              value: valueItem,
                              child: Text(valueItem),
                            );
                          }).toList(),
                          validator: (value) {
                        if (value! == '') {
                          return 'escolha uma seguradora';
                        }
                        return null;
                      },
                      onSaved: (val) {
                        valityseguradora = val! as String?;
                      },
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: size.height * 0.03),
                  //validade cnh
                  Material(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    elevation: 15,
                    shadowColor: AppColors.secundary,
                    child: DateTimeFormField(
                      dateFormat: intl.DateFormat.yMMMMd('pt_BR'),
                      mode: DateTimeFieldPickerMode.date,
                      decoration: InputDecoration(
                        errorStyle: TextStyle(
                          fontSize: 16.0,
                        ),
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
                          Icons.date_range,
                          color: AppColors.secundary,
                        ),
                        hintText: 'Vencimento da CNH',
                        filled: true,
                        fillColor: Colors.grey[200],
                      ),
                      validator: (value) {
                        if (value == null) {
                          return 'Coloque a data de vencimento';
                        }
                        return null;
                      },
                      onSaved: (val) {
                        valitycnh = val!;
                      },
                    ),
                  ),
                  SizedBox(height: size.height * 0.03),

                  //email
                  Material(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    elevation: 15,
                    shadowColor: AppColors.secundary,
                    child: TextFormField(
                      decoration: InputDecoration(
                        errorStyle: TextStyle(
                          fontSize: 16.0,
                        ),
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
                          Icons.email,
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
                  //Senha
                  Material(
                    borderRadius: BorderRadius.all(
                      Radius.circular(10),
                    ),
                    elevation: 15,
                    shadowColor: AppColors.secundary,
                    child: TextFormField(
                      controller: pass,
                      decoration: InputDecoration(
                        errorStyle: TextStyle(
                          fontSize: 16.0,
                        ),
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
                  //Senha
                  Material(
                    borderRadius: BorderRadius.all(
                      Radius.circular(10),
                    ),
                    elevation: 15,
                    shadowColor: AppColors.secundary,
                    child: TextFormField(
                      decoration: InputDecoration(
                        errorStyle: TextStyle(
                          fontSize: 16.0,
                        ),
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
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            isLoading
                ? CircularProgressIndicator(
                    color: AppColors.titlesplash,
                  )
                : Center(
                    child: ElevatedButton(
                      child: Text(
                        'Criar',
                      ),
                      style: ElevatedButton.styleFrom(
                          padding: const EdgeInsets.symmetric(
                            // tamanho do botao
                            horizontal: 155,
                            vertical: 20,
                          ),
                          primary: AppColors.secundary,
                          elevation: 15,
                          onPrimary: Colors.white,
                          textStyle: TextStyles.bottomLogin),
                      onPressed: () async {
                        if (_formKey.currentState!.validate()) {
                          _formKey.currentState!.save();
                          try {
                            if (_pickedImage == null) {
                              _globalMethods.authErrorHandle(
                                  'Por favor selecione uma foto', context);
                            } else {
                              setState(() {
                                isLoading = false;
                              });
                              final ref = FirebaseStorage.instance
                                  .ref()
                                  .child('ClientSeguradosImagesCNH')
                                  .child(username! + '.jpg');
                              await ref.putFile(_pickedImage!);
                              url = await ref.getDownloadURL();
                              AuthenticationHelper()
                                  .signUpSegurado(
                                      email: email!,
                                      password: password!,
                                      username: username!,
                                      valityseguradora: valityseguradora!,
                                      valitycnh: valitycnh!,
                                      url: url!)
                                  .then(
                                (result) {
                                  if (result == null) {
                                    Navigator.pushReplacement(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => HomePage()));
                                  } else {
                                    setState(() {
                                      isLoading = false;
                                    });
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                        content: Text(
                                          'O endereço de e-mail está errado ou ja existe',
                                          style: TextStyle(fontSize: 16),
                                        ),
                                      ),
                                    );
                                  }
                                },
                              );
                            }
                          } catch (error) {
                            _globalMethods.authErrorHandle('deu erro', context);
                            print('um erro foi encontrado');
                          } finally {
                            setState(() {
                              isLoading = true;
                            });
                          }
                        }
                      },
                    ),
                  ),
          ],
        ),
        SizedBox(height: size.height * 0.02),
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
