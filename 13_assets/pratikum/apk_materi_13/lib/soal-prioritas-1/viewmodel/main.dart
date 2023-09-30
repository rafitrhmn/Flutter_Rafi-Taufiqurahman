import 'package:flutter/material.dart';

import '../view/halaman_1.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
      routes: {
        '/newPage': (context) => NewPage(
              selectedImagePath: '',
            ), // Definisikan rute ke halaman baru
      },
    );
  }
}
