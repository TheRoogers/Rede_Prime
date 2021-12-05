import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:rede_prime/shared/themes/app_colors.dart';

class AccidentPhoto extends StatefulWidget {
  const AccidentPhoto({Key? key}) : super(key: key);

  @override
  _AccidentPhotoState createState() => _AccidentPhotoState();
}

class _AccidentPhotoState extends State<AccidentPhoto> {
  final ImagePicker _picker = ImagePicker();
  List<XFile> _imageList = [];

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.secundary,
        title: Text('Fotos'),
      ),
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(height: size.height * 0.02),
            OutlinedButton(
              onPressed: () {
                imageSelect();
              },
              child: Text("Selecione as imagens: "),
            ),
            Expanded(
              child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3),
                  itemCount: _imageList.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Padding(
                      padding: const EdgeInsets.all(2.0),
                      child: Stack(
                        fit: StackFit.expand,
                        children: [
                          Image.file(
                            File(_imageList[index].path),
                            fit: BoxFit.cover,
                          ),
                          Positioned(
                            right: -4,
                            top: -4,
                            child: Container(
                              color: Color.fromRGBO(255, 255, 244, 0.7),
                              child: IconButton(
                                onPressed: () {
                                  _imageList.removeAt(index);
                                  setState(() {});
                                },
                                icon: Icon(Icons.delete),
                                color: Colors.red[500],
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  }),
            )
          ],
        ),
      ),
    );
  }

  void imageSelect() async {
    final XFile? selectedImage =
        await _picker.pickImage(source: ImageSource.gallery);
    if (selectedImage!.path.isNotEmpty) {
      _imageList.add(selectedImage);
    }
    setState(() {});
  }
}
