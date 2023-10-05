import 'package:flutter/material.dart';
import '../view/page2_ui.dart';

void main() {
  runApp(MyApp2());
}

class MyApp2 extends StatelessWidget {
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
