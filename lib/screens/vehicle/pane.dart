import 'package:flutter/material.dart';
import 'package:rede_prime/shared/themes/app_colors.dart';
import 'package:rede_prime/shared/themes/app_text_styles.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

class PanePage extends StatefulWidget {
  const PanePage({Key? key}) : super(key: key);

  @override
  _PanePageState createState() => _PanePageState();
}

class _PanePageState extends State<PanePage> {
  bool isLoading = false;

  fazerLigacao() async {
    const url = "tel:136";
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  abrirWhatsApp() async {
    var whatsappUrl = "whatsapp://send?phone=+556199380031&text=Olá,tudo bem ?";

    if (await canLaunch(whatsappUrl)) {
      await launch(whatsappUrl);
    } else {
      throw 'Could not launch $whatsappUrl';
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.secundary,
        title: Text("Pane"),
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
                        maxLines: 12,
                        minLines: 12,
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
                    Row(
                      children: [
                        ElevatedButton.icon(
                          icon: Icon(
                            FontAwesomeIcons.truckPickup,
                            color: Colors.white,
                            size: 24.0,
                          ),
                          label: Text(' Solicitar Guincho'),
                          style: ElevatedButton.styleFrom(
                              padding: const EdgeInsets.symmetric(
                                // tamanho do botao
                                horizontal: 88,
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
                                  title: new Text("Guincho"),
                                  content: new Text(
                                      "Voce pode solicitar o guicho por telefone ou whatsapp"),
                                  actions: <Widget>[
                                    // define os botões na base do dialogo
                                    new ElevatedButton.icon(
                                      icon: Icon(
                                        FontAwesomeIcons.phoneAlt,
                                        color: Colors.white,
                                        //size: 24.0,
                                      ),
                                      label: Text('Ligar'),
                                      style: ButtonStyle(
                                        backgroundColor:
                                            MaterialStateProperty.all(
                                                AppColors.secundary),
                                      ),
                                      onPressed: () {
                                        fazerLigacao();
                                      },
                                    ),
                                    new ElevatedButton.icon(
                                      icon: Icon(
                                        FontAwesomeIcons.whatsapp,
                                        color: Colors.white,
                                        size: 24.0,
                                      ),
                                      label: Text('WhatsApp'),
                                      style: ButtonStyle(
                                        backgroundColor:
                                            MaterialStateProperty.all(
                                                AppColors.secundary),
                                      ),
                                      onPressed: () {
                                        abrirWhatsApp();
                                      },
                                    ),
                                  ],
                                );
                              },
                            );
                          },
                        ),
                      ],
                    ),
                    SizedBox(height: size.height * 0.04),
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
                                horizontal: 55,
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
                                      "Sinistro de pane registrado com sucesso!"),
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
                        ElevatedButton(
                          child: isLoading
                              ? CircularProgressIndicator(
                                  color: AppColors.titlesplash,
                                )
                              : const Text('Cancelar'),
                          style: ElevatedButton.styleFrom(
                              padding: const EdgeInsets.symmetric(
                                // tamanho do botao
                                horizontal: 55,
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
