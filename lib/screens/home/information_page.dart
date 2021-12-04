import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:rede_prime/shared/themes/app_colors.dart';
import 'package:rede_prime/shared/themes/app_text_styles.dart';
import 'package:url_launcher/url_launcher.dart';

class InformationPage extends StatelessWidget {
  const InformationPage({Key? key}) : super(key: key);

  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.secundary,
        title: Text(
          "Informações",
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: size.height * 0.02),
            RichText(
              text: TextSpan(
                style: TextStyles.titulo,
                children: <TextSpan>[
                  TextSpan(text: "Precisa de ajuda?"),
                  TextSpan(
                    text:
                        "\nPode entrar em contato com a rede prime no Telefone (31) 3318-8360 ou entrar em contato com a sua seguradora",
                    style: TextStyles.campodeTexto,
                  ),
                  TextSpan(text: "\nQuais ações devo fazer?"),
                  TextSpan(
                    text:
                        "\nVocê pode resolver tudo dentro do aplicativo, mas caso tenha alguma dúvida temos a área de sinistro onde podem ser cadastrado seus sinistros e acompanhar os mesmos.",
                    style: TextStyles.campodeTexto,
                  ),
                  TextSpan(text: "\nQual oficina devo encaminhar?"),
                  TextSpan(
                    text:
                        "\nO proprio aplicativo mostra a oficina mais proxima, mas voce pode levar em uma das nossas filiais",
                    style: TextStyles.campodeTexto,
                  ),
                  TextSpan(text: "\nComo solicitar Guincho?"),
                  TextSpan(
                    text:
                        "\nPara solicitar o guincho deve- se entrar em contato com a sua seguradora e verifica se possui esse benefício no seu seguro.",
                    style: TextStyles.campodeTexto,
                  ),
                  TextSpan(text: "\nComo fazer um Boletim de ocorrência?"),
                  TextSpan(
                    text:
                        "\nVocê pode comparecer em uma delegacia ou fazer pela internet através do link: ",
                    style: TextStyles.campodeTexto,
                  ),
                  TextSpan(
                    text: "clicando aqui",
                    style: TextStyles.link,
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
                  TextSpan(text: "\nO que fazer com Terceiros?",),
                  TextSpan(
                    text:
                        "\nCadastre o sinistro com o máximo de informações possíveis do terceiro, como placa, modelo, veiculo, condutor",
                    style: TextStyles.campodeTexto,
                  ),
                  TextSpan(
                      text:
                          "\nComo acompanhar os serviços a serem feito no carro?"),
                  TextSpan(
                    text:
                        "\nOs serviços podem ser acompanhados no menu consultar sinistro e só serão feitos após a sua aprovação",
                    style: TextStyles.campodeTexto,
                  ),
                  TextSpan(text: "\nComo solicitar carro reserva?"),
                  TextSpan(
                    text:
                        "\nVerifique se o seu seguro possui esse benefício acessando a guia benefícios no menu inicial",
                    style: TextStyles.campodeTexto,
                  ),
                  TextSpan(text: "\nQual é minha Franquia?"),
                  TextSpan(
                    text:
                        "\nA franquia pode ser consulta na guia benefícios do menu inicial",
                    style: TextStyles.campodeTexto,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
