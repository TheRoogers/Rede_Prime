import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:rede_prime/shared/themes/app_colors.dart';
import 'package:rede_prime/shared/themes/app_text_styles.dart';
import 'package:url_launcher/url_launcher.dart';

class RouboPage extends StatefulWidget {
  const RouboPage({Key? key}) : super(key: key);

  @override
  _RouboPageState createState() => _RouboPageState();
}

class _RouboPageState extends State<RouboPage> {
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.secundary,
        title: Text('Roubo'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            SizedBox(height: size.height * 0.03), //espaco entre a logo
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
                        maxLines: 15,
                        minLines: 15,
                      ),
                    ),
                    SizedBox(height: size.height * 0.03),
                    Align(
                      alignment: Alignment(-0.8, 0.1), //distancia do texto
                      child: Text(
                        "Informe a placa do veiculo:",
                        style: TextStyles.titleLogin,
                      ),
                    ),
                    SizedBox(height: size.height * 0.02),
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
                    SizedBox(height: size.height * 0.03),
                    Column(
                      children: [
                        RichText(
                          text: TextSpan(
                            style: TextStyles.titleLogin,
                            children: <TextSpan>[
                              TextSpan(
                                text: "Faça o boletim de ocorrencia ",
                              ),
                              TextSpan(
                                text: " clicando aqui",
                                style: TextStyles.link2,
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () async {
                                    if (await canLaunch(
                                            "https://www.gov.br/pt-br/servicos/registrar-ocorrencia-policial-online") ==
                                        true) {
                                      launch(
                                          "https://www.gov.br/pt-br/servicos/registrar-ocorrencia-policial-online");
                                    } else {
                                      print("Can't launch URL");
                                    }
                                  },
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: size.height * 0.03),
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
                                  title: new Text("Sinistro"),
                                  content: new Text(
                                      "Sinistro de roubo registrado com sucesso!"),
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
                                        "se você cancelar todas as informações serão perdidas"),
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
              ),
            ),
          ],
        ),
      ),
    );
  }
}
