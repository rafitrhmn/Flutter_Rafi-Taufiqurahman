import 'package:flutter/material.dart';
import 'package:flutter_application_1/kenapa_muda-apk/body.dart';

void main(List<String> args) {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        appBarTheme: const AppBarTheme(
          color: Colors.green, // Mengubah warna AppBar menjadi hijau
          iconTheme: IconThemeData(
            color: Colors.white, // Mengubah warna ikon di AppBar menjadi putih
          ),
        ),
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text(
            'ES kenapa muda',
            style: TextStyle(fontFamily: 'Poppins', fontSize: 20),
          ),
          leading: Image.asset(
            'assets/image/es-kenapa-muda.png', // Sesuaikan dengan path logo Anda
            height: 5.0, // Sesuaikan dengan ukuran yang Anda inginkan
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              BoxView(),
              ContactUsBar(),
            ],
          ), //panggil kelas BoxView untuk menampilkan box dengan gamabr
        ),
      ),
    );
  }
}
