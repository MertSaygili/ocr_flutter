import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:ocr_flutter/utils/image_picker_class.dart';
import 'package:ocr_flutter/views/recognize_screen.dart';
import '../utils/image_cropper_view.dart';
import '../widgets/show_modal.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final String _appbarTitle = 'OCR Flutter';
  final String _scanPhoto = 'Scan Photo';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(_appbarTitle), centerTitle: false),
      floatingActionButton: _floatinActionButton(),
    );
  }

  FloatingActionButton _floatinActionButton() {
    return FloatingActionButton.extended(
      onPressed: () => imagePickerModal(context, onTapCamera: _onTapCamera, onTapGalery: _onTapGalery),
      label: Text(_scanPhoto),
    );
  }

  void _onTapCamera() {
    log('camera');
    pickImage(ImageSource.camera).then((value) {
      if (value != '') {
        imageCropper(context, value).then((value) {
          value != '' ? Navigator.of(context).push(MaterialPageRoute(builder: (context) => RecognizeScreen(path: value))) : null;
        });
      }
    });
  }

  void _onTapGalery() {
    log('galery');
    pickImage(ImageSource.gallery).then((value) {
      if (value != '') {
        imageCropper(context, value).then((value) {
          value != '' ? Navigator.of(context).push(MaterialPageRoute(builder: (context) => RecognizeScreen(path: value))) : null;
        });
      }
    });
  }
}
