import 'package:flutter/material.dart';
import 'package:rede_prime/shared/themes/app_colors.dart';
import 'package:rede_prime/shared/themes/app_images.dart';

class SinistrePage extends StatefulWidget {
  const SinistrePage({Key? key}) : super(key: key);

  @override
  _SinistrePageState createState() => _SinistrePageState();
}

class _SinistrePageState extends State<SinistrePage> {
  @override
  Widget build(BuildContext context) {    
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.secundary,
        title: Text('Cadastrar Sinistro'),
      ),
      body: GridView.count(
        crossAxisCount: 1,
        padding: EdgeInsets.all(16.0),
        childAspectRatio: 2,
        crossAxisSpacing: 10.0, // fornece espaço vertical entre as linhas
        mainAxisSpacing: 10.0, //espaço horizontal entre as linhas
        children: <Widget>[
          GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, "/roubopage");
            },
            child: Card(
              color: Colors.yellow.withOpacity(0.4),
              clipBehavior: Clip.antiAlias,
              elevation: 5.0,
              shape: RoundedRectangleBorder(
                side: BorderSide(width: 0.1),
                borderRadius: BorderRadius.circular(24),
              ),
              child: Stack(
                children: <Widget>[
                  Opacity(
                    opacity: 0.3,
                    child: Image.asset(
                      AppImages.peugeot,
                      fit: BoxFit.cover,
                      height: double.infinity,
                      width: double.infinity,
                      alignment: Alignment.center,
                    ),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Container(
                        child: Center(
                          child: Stack(
                            children: <Widget>[
                              Text(
                                'Roubo',
                                style: TextStyle(
                                  fontSize: 40,
                                  foreground: Paint()
                                    ..style = PaintingStyle.stroke
                                    ..strokeWidth = 3
                                    ..color = Colors.black,
                                ),
                              ),
                              Text(
                                'Roubo',
                                style: TextStyle(
                                  fontSize: 40,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(width: 10.0),
                    ],
                  ),
                ],
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, "/acidentepage");
              //Navigator.pushNamed(context, "/accidentphotopage");
              
            },
            child: Card(
              color: Colors.yellow.withOpacity(0.5),
              clipBehavior: Clip.antiAlias,
              elevation: 5.0,
              shape: RoundedRectangleBorder(
                side: BorderSide(width: 0.1),
                borderRadius: BorderRadius.circular(24),
              ),
              child: Stack(
                children: <Widget>[
                  Opacity(
                    opacity: 0.3,
                    child: Image.asset(
                      AppImages.audi2,
                      fit: BoxFit.cover,
                      height: double.infinity,
                      width: double.infinity,
                      alignment: Alignment.center,
                    ),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Container(
                        child: Center(
                          child: Stack(
                            children: <Widget>[
                              Text(
                                'Acidente',
                                style: TextStyle(
                                  fontSize: 40,
                                  foreground: Paint()
                                    ..style = PaintingStyle.stroke
                                    ..strokeWidth = 3
                                    ..color = Colors.black,
                                ),
                              ),
                              Text(
                                'Acidente',
                                style: TextStyle(
                                  fontSize: 40,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(width: 10.0),
                    ],
                  ),
                ],
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, "/panepage");
            },
            child: Card(
              color: Colors.yellow.withOpacity(0.5),
              clipBehavior: Clip.antiAlias,
              elevation: 5.0,
              shape: RoundedRectangleBorder(
                side: BorderSide(width: 0.1),
                borderRadius: BorderRadius.circular(24),
              ),
              child: Stack(
                children: <Widget>[
                  Opacity(
                    opacity: 0.3,
                    child: Image.asset(
                      AppImages.camaro,
                      fit: BoxFit.cover,
                      height: double.infinity,
                      width: double.infinity,
                      alignment: Alignment.center,
                    ),
                  ),
                  Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      child: Center(
                        child: Stack(
                          children: <Widget>[
                            Text(
                              'Pane',
                              style: TextStyle(
                                fontSize: 40,
                                foreground: Paint()
                                  ..style = PaintingStyle.stroke
                                  ..strokeWidth = 3
                                  ..color = Colors.black,
                              ),
                            ),
                            Text(
                              'Pane',
                              style: TextStyle(
                                fontSize: 40,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(width: 10.0),
                  ],
                ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
