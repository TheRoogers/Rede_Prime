import 'dart:convert';

import 'package:dropdown_plus/dropdown_plus.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ApiFipePage extends StatefulWidget {
  const ApiFipePage({Key? key}) : super(key: key);

  @override
  _ApiFipePageState createState() => _ApiFipePageState();
}

class _ApiFipePageState extends State<ApiFipePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<dynamic>(
        future: pegarUsuarios(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
                itemCount: snapshot.data!.length,
                itemBuilder: (context, index) {
                  var usuario = snapshot.data![index];
                  return TextDropdownFormField(
                    options: [usuario['nome']],
                    decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        suffixIcon: Icon(Icons.arrow_drop_down),
                        labelText: "Marca"),
                    dropdownHeight: 120,
                  );
                });
          } else if (snapshot.hasError) {
            return Center(
              child: Text('${snapshot.error}'),
            );
          }
          return Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }

  pegarUsuarios() async {
    var url = Uri.parse('https://parallelum.com.br/fipe/api/v1/carros/marcas');
    var resposta = await http.get(url);
    if (resposta.statusCode == 200) {
      return jsonDecode(resposta.body);
    } else {
      throw Exception('não foi possivel carregar os usuarios');
    }
  }
}
