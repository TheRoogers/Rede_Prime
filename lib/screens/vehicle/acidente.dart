import 'package:flutter/material.dart';
import 'package:rede_prime/screens/vehicle/accidentphoto_page.dart';
import 'package:rede_prime/shared/themes/app_colors.dart';
import 'package:rede_prime/shared/themes/app_text_styles.dart';

class AcidentePage extends StatefulWidget {
  const AcidentePage({Key? key}) : super(key: key);

  @override
  _AcidentePageState createState() => _AcidentePageState();
}

class _AcidentePageState extends State<AcidentePage> {
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.secundary,
        title: Text('Acidente'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            SizedBox(height: size.height * 0.02), //espaco entre o appbar
            Align(
              alignment: Alignment(-0.8, 0.1), //distancia do texto
              child: Text(
                "Descreva o que ocorreu:",
                style: TextStyles.titleLogin,
              ),
            ),
            SizedBox(height: size.height * 0.02),
            Form(
                child: Container(
              width: size.width * 0.90,
              child: Column(
                children: <Widget>[
                  Material(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    elevation: 15,
                    shadowColor: AppColors.secundary,
                    child: TextField(
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
                        hintText: '',
                        filled: true,
                        fillColor: Colors.grey[200],
                      ),
                      maxLines: 8,
                      minLines: 8,
                    ),
                  ),
                  SizedBox(height: size.height * 0.02),
                  Align(
                    alignment: Alignment(-0.8, 0.1), //distancia do texto
                    child: Text(
                      "Informe a placa do veiculo:",
                      style: TextStyles.titleLogin,
                    ),
                  ),
                  SizedBox(height: size.height * 0.01),
                  Material(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    elevation: 15,
                    shadowColor: AppColors.secundary,
                    child: TextField(
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
                        hintText: '',
                        filled: true,
                        fillColor: Colors.grey[200],
                      ),
                    ),
                  ),
                  SizedBox(height: size.height * 0.02),
                  Align(
                    alignment: Alignment(-0.8, 0.1), //distancia do texto
                    child: Text(
                      "Informe a placa do Terceiro:",
                      style: TextStyles.titleLogin,
                    ),
                  ),
                  SizedBox(height: size.height * 0.01),
                  Material(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    elevation: 15,
                    shadowColor: AppColors.secundary,
                    child: TextField(
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
                        hintText: '',
                        filled: true,
                        fillColor: Colors.grey[200],
                      ),
                    ),
                  ),
                  SizedBox(height: size.height * 0.02),

                  //IMAGENS

                  Row(
                    children: [
                      ElevatedButton(
                        child: Text('Cadastrar fotos'),
                        onPressed: () {
                          Navigator.pushNamed(context, "/accidentphotopage");
                        },
                        style: ElevatedButton.styleFrom(
                            padding: const EdgeInsets.symmetric(
                              // tamanho do botao
                              horizontal: 50,
                              vertical: 20,
                            ),
                            primary: AppColors.secundary,
                            elevation: 15,
                            onPrimary: AppColors.titlesplash,
                            textStyle: TextStyles.bottomLogin),
                      ),
                    ],
                  ),

                  SizedBox(height: size.height * 0.05),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      ElevatedButton(
                        child: isLoading
                            ? CircularProgressIndicator(
                                color: AppColors.titlesplash,
                              )
                            : const Text('Salvar'),
                        style: ElevatedButton.styleFrom(
                            padding: const EdgeInsets.symmetric(
                              // tamanho do botao
                              horizontal: 50,
                              vertical: 20,
                            ),
                            primary: AppColors.secundary,
                            elevation: 15,
                            onPrimary: AppColors.titlesplash,
                            textStyle: TextStyles.bottomLogin),
                        onPressed: () {
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              // retorna um objeto do tipo Dialog
                              return AlertDialog(
                                title: new Text("Acidente"),
                                content: new Text(
                                    "Acidente registrado com sucesso!"),
                                actions: <Widget>[
                                  // define os botões na base do dialogo
                                  new ElevatedButton(
                                    child: Text("OK"),
                                    style: ButtonStyle(
                                      backgroundColor:
                                          MaterialStateProperty.all(
                                              AppColors.secundary),
                                    ),
                                    onPressed: () {
                                      Navigator.pushNamed(context, "/homepage");
                                    },
                                  ),
                                ],
                              );
                            },
                          );
                        },
                      ),
                      Center(
                        child: ElevatedButton(
                          child: isLoading
                              ? CircularProgressIndicator(
                                  color: AppColors.titlesplash,
                                )
                              : const Text('Cancelar'),
                          style: ElevatedButton.styleFrom(
                              padding: const EdgeInsets.symmetric(
                                // tamanho do botao
                                horizontal: 50,
                                vertical: 20,
                              ),
                              primary: AppColors.secundary,
                              elevation: 15,
                              onPrimary: AppColors.titlesplash,
                              textStyle: TextStyles.bottomLogin),
                          onPressed: () {
                            showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                // retorna um objeto do tipo Dialog
                                return AlertDialog(
                                  title: new Text("Aviso"),
                                  content: new Text(
                                      "Se você cancelar todas as informações serão perdidas"),
                                  actions: <Widget>[
                                    // define os botões na base do dialogo
                                    new ElevatedButton(
                                      child: Text("OK"),
                                      style: ButtonStyle(
                                        backgroundColor:
                                            MaterialStateProperty.all(
                                                AppColors.secundary),
                                      ),
                                      onPressed: () {
                                        Navigator.pushNamed(
                                            context, "/homepage");
                                      },
                                    ),
                                    new ElevatedButton(
                                      child: Text("Cancelar"),
                                      style: ButtonStyle(
                                        backgroundColor:
                                            MaterialStateProperty.all(
                                                AppColors.secundary),
                                      ),
                                      onPressed: () {
                                        Navigator.pop(context);
                                      },
                                    ),
                                  ],
                                );
                              },
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ))
          ],
        ),
      ),
    );
  }
}
