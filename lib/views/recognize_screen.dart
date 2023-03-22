import 'package:flutter/material.dart';
import 'package:google_mlkit_text_recognition/google_mlkit_text_recognition.dart';

class RecognizeScreen extends StatefulWidget {
  final String path;
  const RecognizeScreen({super.key, required this.path});

  @override
  State<RecognizeScreen> createState() => _RecognizeScreenState();
}

class _RecognizeScreenState extends State<RecognizeScreen> {
  late final InputImage _inputImage;
  final String _title = 'Recognize image';
  String text = '';
  bool _isBusy = false;

  @override
  void initState() {
    super.initState();
    _inputImage = InputImage.fromFilePath(widget.path);
    _processImage(_inputImage);
  }

  void _processImage(InputImage image) async {
    setState(() => _isBusy = true);

    final TextRecognizer textRecognizer = TextRecognizer(script: TextRecognitionScript.latin);
    final RecognizedText recognizedText = await textRecognizer.processImage(_inputImage);
    for (TextBlock block in recognizedText.blocks) {
      final List<Offset> cornerPoints = block.cornerPoints.cast<Offset>();
      final String text = block.text;
      final List<String> languages = block.recognizedLanguages;

      for (TextLine line in block.lines) {
        for (TextElement element in line.elements) {
          print(element.text);
        }
      }
    }

    setState(() => text = recognizedText.text);
    textRecognizer.close();

    setState(() => _isBusy = false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(_title), centerTitle: false),
      body: _isBusy ? const Center(child: CircularProgressIndicator()) : Text(text),
    );
  }
}
