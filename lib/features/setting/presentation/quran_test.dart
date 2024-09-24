// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:pdfx/pdfx.dart';

void main() => runApp(const MyApp());

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  static const int _initialPage = 100;
  late PdfController _pdfController;

  @override
  void initState() {
    _pdfController = PdfController(
      document: PdfDocument.openAsset('assets/quran.pdf'),
      viewportFraction: 10,
      initialPage: _initialPage,
    );
    super.initState();
  }

  @override
  void dispose() {
    _pdfController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        backgroundColor: Colors.white,
        body: PdfView(
          controller: _pdfController,
          scrollDirection: Axis.vertical,
          pageSnapping: false,
        ),
      );
}
