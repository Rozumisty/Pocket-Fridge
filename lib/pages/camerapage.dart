import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:pocket_fridge/headerfooter/headerfooter.dart';
import 'package:pocket_fridge/styles/textsStyle.dart';

class CameraPage extends StatefulWidget {
  const CameraPage({super.key});

  @override
  _CameraPageState createState() => _CameraPageState();
}

class _CameraPageState extends State<CameraPage> {
  final selectedIndex = 1;
  File? _image;

  Future _getImageFromGallery() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
      } else {
        print('No image selected.');
      }
    });
  }

  Future _getImageFromCamera() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.camera);

    setState(
      () {
        if (pickedFile != null) {
          _image = File(pickedFile.path);
        } else {
          print('No image selected.');
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PocketHeader(
        backgroundColor: Color.fromARGB(255, 200, 162, 200),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            _image == null
                ? const Text(
                    'Select an image from the gallery or open the camera',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Color.fromARGB(255, 49, 49, 49),
                      fontFamily: "Montserrat",
                      fontWeight: FontWeight.w700,
                      fontSize: 32,
                    ),
                  )
                : Image.file(_image!),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _getImageFromGallery,
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromARGB(255, 200, 162, 200),
                minimumSize: const Size(200, 50),
              ),
              child: const Text(
                'Choose Image from Gallery',
                style: textStyleInput,
              ),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: _getImageFromCamera,
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromARGB(255, 200, 162, 200),
                minimumSize: const Size(200, 50),
              ),
              child: const Text(
                'Open Camera',
                style: textStyleInput,
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: PocketFooter(selectedIndex: selectedIndex),
    );
  }
}
