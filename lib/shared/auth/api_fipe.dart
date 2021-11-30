import 'dart:convert';
import 'package:date_field/date_field.dart';
import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart' as intl;
import 'package:rede_prime/shared/themes/app_colors.dart';
import 'package:rede_prime/shared/themes/app_text_styles.dart';

class ApiFipePage extends StatefulWidget {
  const ApiFipePage({Key? key}) : super(key: key);

  @override
  _ApiFipePageState createState() => _ApiFipePageState();
}

class _ApiFipePageState extends State<ApiFipePage> {
  final _formKey = GlobalKey<FormState>();
  String? tipoveiculoselecionado;
  String? modeloselecionado;
  String? proprietarioselecionado;
  String? habilitacaoselecionado;
  String? veiculoseguradoselecionado;
  String? seguradoraselecionada;
  String? anofabricacaoselecionado;
  String? valorfipeselecionado;
  bool isLoading = false;

  var modelo = [];
  var anofabricacao = [];
  var valorfipe = [];
  var tipoveiculos = ['Carro', 'Moto', 'Caminhão'];
  var proprietario = ['Particular', 'Seguradora'];
  var habilitacao = ['ACC', 'A', 'B', 'C', 'D', 'E'];
  var veiculosegurado = ['Sim', 'Não'];
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

  String? sid;
  List data = [];
  var carros = "https://parallelum.com.br/fipe/api/v1/carros/marcas";
  var motos = "https://parallelum.com.br/fipe/api/v1/motos/marcas";
  var caminhoes = "https://parallelum.com.br/fipe/api/v1/caminhoes/marcas";

  Future tipocarro() async {
    var result = await http.get(Uri.parse(carros), headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
    });
    var jsonData = json.decode(result.body);

    setState(() {
      data = jsonData;
    });
    return jsonData;
  }

  @override
  void initState() {
    tipocarro();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    initializeDateFormatting('pt_BR', null).then((_) => _ApiFipePageState());
    Size size = MediaQuery.of(context).size;
    return Center(
      child: Form(
        key: _formKey,
        child: Container(
          width: size.width * 0.90,
          child: Column(
            children: [
              Material(
                //tipo veiculo
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
                    child: DropdownButton(
                      isDense: true,
                      isExpanded: true,
                      value: tipoveiculoselecionado,
                      onChanged: (newValue) {
                        setState(() {
                          tipoveiculoselecionado = newValue as String?;
                        });
                      },
                      hint: Text(
                        "Selecione o Tipo",
                        style: TextStyle(color: Colors.black),
                      ),
                      items: tipoveiculos.map((valueItem) {
                        return DropdownMenuItem(
                          value: valueItem,
                          child: Text(valueItem),
                        );
                      }).toList(),
                    ),
                  ),
                ),
              ),
              SizedBox(height: size.height * 0.02),
              Material(
                //marca veiculo
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
                    child: DropdownButton(
                      isDense: true,
                      isExpanded: true,
                      value: sid,
                      hint: Text(
                        "Selecione a Marca",
                        style: TextStyle(color: Colors.black),
                      ),
                      items: data.map((list) {
                        return DropdownMenuItem(
                          child: Text(list['nome']),
                          value: list['codigo'].toString(),
                        );
                      }).toList(),
                      onChanged: (value) {
                        setState(() {
                          sid = value as String?;
                        });
                      },
                    ),
                  ),
                ),
              ),
              SizedBox(height: size.height * 0.02),
              Material(
                // modelo veiculo
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
                    child: DropdownButton(
                      isDense: true,
                      isExpanded: true,
                      value: modeloselecionado,
                      onChanged: (newValue) {
                        setState(() {
                          modeloselecionado = newValue as String?;
                        });
                      },
                      hint: Text(
                        "Selecione o Modelo",
                        style: TextStyle(color: Colors.black),
                      ),
                      items: modelo.map((valueItem) {
                        return DropdownMenuItem(
                          value: valueItem,
                          child: Text(valueItem),
                        );
                      }).toList(),
                    ),
                  ),
                ),
              ),
              SizedBox(height: size.height * 0.02),
              Material(
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
                    child: DropdownButton(
                      isDense: true,
                      isExpanded: true,
                      value: anofabricacaoselecionado,
                      onChanged: (newValue) {
                        setState(() {
                          anofabricacaoselecionado = newValue as String?;
                        });
                      },
                      hint: Text(
                        "Ano de fabricação",
                        style: TextStyle(color: Colors.black),
                      ),
                      items: anofabricacao.map((valueItem) {
                        return DropdownMenuItem(
                          value: valueItem,
                          child: Text(valueItem),
                        );
                      }).toList(),
                    ),
                  ),
                ),
              ),
              SizedBox(height: size.height * 0.02),
              Material(
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
                    child: DropdownButton(
                      isDense: true,
                      isExpanded: true,
                      value: valorfipeselecionado,
                      onChanged: (newValue) {
                        setState(() {
                          valorfipeselecionado = newValue as String?;
                        });
                      },
                      hint: Text(
                        "Valor Fipe",
                        style: TextStyle(color: Colors.black),
                      ),
                      items: valorfipe.map((valueItem) {
                        return DropdownMenuItem(
                          value: valueItem,
                          child: Text(valueItem),
                        );
                      }).toList(),
                    ),
                  ),
                ),
              ),
              SizedBox(height: size.height * 0.02),
              Container(
                height: size.height * 0.09,
                child: Material(
                  child: InputDecorator(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.red),
                        borderRadius: BorderRadius.all(
                          Radius.circular(10),
                        ),
                      ),
                    ),
                    child: TextFormField(
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.all(0),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.transparent),
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: AppColors.secundary),
                        ),
                        hintText: 'Placa',
                        hintStyle: TextStyle(color: Colors.black),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: size.height * 0.02),
              Material(
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
                    child: DropdownButton(
                      isDense: true,
                      isExpanded: true,
                      value: proprietarioselecionado,
                      onChanged: (newValue) {
                        setState(() {
                          proprietarioselecionado = newValue as String?;
                        });
                      },
                      hint: Text(
                        "Proprietario",
                        style: TextStyle(color: Colors.black),
                      ),
                      items: proprietario.map((valueItem) {
                        return DropdownMenuItem(
                          value: valueItem,
                          child: Text(valueItem),
                        );
                      }).toList(),
                    ),
                  ),
                ),
              ),
              SizedBox(height: size.height * 0.02),
              Material(
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
                    child: DropdownButton(
                      isDense: true,
                      isExpanded: true,
                      value: habilitacaoselecionado,
                      onChanged: (newValue) {
                        setState(() {
                          habilitacaoselecionado = newValue as String?;
                        });
                      },
                      hint: Text(
                        "Habilitação",
                        style: TextStyle(color: Colors.black),
                      ),
                      items: habilitacao.map((valueItem) {
                        return DropdownMenuItem(
                          value: valueItem,
                          child: Text(valueItem),
                        );
                      }).toList(),
                    ),
                  ),
                ),
              ),
              SizedBox(height: size.height * 0.02),
              Material(
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
                    child: DropdownButton(
                      isDense: true,
                      isExpanded: true,
                      value: veiculoseguradoselecionado,
                      onChanged: (newValue) {
                        setState(() {
                          veiculoseguradoselecionado = newValue as String?;
                        });
                      },
                      hint: Text(
                        "Veiculo Segurado?",
                        style: TextStyle(color: Colors.black),
                      ),
                      items: veiculosegurado.map((valueItem) {
                        return DropdownMenuItem(
                          value: valueItem,
                          child: Text(valueItem),
                        );
                      }).toList(),
                    ),
                  ),
                ),
              ),
              SizedBox(height: size.height * 0.02),
              Material(
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
                    child: DropdownButton(
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
                    ),
                  ),
                ),
              ),
              SizedBox(height: size.height * 0.02),
              Material(
                child: DateTimeFormField(
                  dateFormat: intl.DateFormat.yMMMMd('pt_BR'),
                  mode: DateTimeFieldPickerMode.date,
                  decoration: InputDecoration(
                    errorStyle: TextStyle(
                      fontSize: 16.0,
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey),
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
                    hintText: 'Vencimento do seguro',
                    hintStyle: TextStyle(color: Colors.black),
                  ),
                ),
              ),
              SizedBox(height: size.height * 0.02),
              Container(
                height: size.height * 0.09,
                child: Material(
                  child: InputDecorator(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.red),
                        borderRadius: BorderRadius.all(
                          Radius.circular(10),
                        ),
                      ),
                    ),
                    child: TextFormField(
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.all(0),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.transparent),
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: AppColors.secundary),
                        ),
                        hintText: 'Franquia',
                        hintStyle: TextStyle(color: Colors.black),
                      ),
                      keyboardType: TextInputType.number,
                    ),
                  ),
                ),
              ),
              SizedBox(height: size.height * 0.02),
              Row(
                children: [
                  ElevatedButton(
                    child: isLoading
                        ? CircularProgressIndicator(
                            color: AppColors.titlesplash,
                          )
                        : const Text('Cadastrar'),
                    style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(
                          // tamanho do botao
                          horizontal: 135,
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
                            title: new Text("Cadastro"),
                            content: new Text("Veiculo Cadastrado com sucesso!"),
                            actions: <Widget>[
                              // define os botões na base do dialogo
                              new ElevatedButton(
                                child: Text("OK"),
                                style: ButtonStyle(backgroundColor:  MaterialStateProperty.all(AppColors.secundary),),
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
                ],
              ),
              SizedBox(height: size.height * 0.03),
            ],
          ),
        ),
      ),
    );
  }
}
