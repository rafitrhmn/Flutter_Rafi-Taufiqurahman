import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'rafi', // Ini akan mengatur judul aplikasi
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const homepage(),
    );
  }
}

class homepage extends StatelessWidget {
  const homepage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Halo Alteraa'),
      ),
      body: const Center(child: Text('Nama saya Rafi Taufiqurahman')),
    );
  }
}
