import 'package:flutter/material.dart';
import 'package:dio/dio.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final Dio dio = Dio();
  String imageUrl = '';

  @override
  void initState() {
    super.initState();
    fetchImage();
  }

  Future<void> fetchImage() async {
    try {
      Response response = await dio.get(
          'https://api.dicebear.com/7.x/pixel-art/svg?seed=Jane&hair=long01,long02,long03,long04,long05'); // Gantilah dengan URL API yang sesuai

      if (response.statusCode == 200) {
        setState(() {
          imageUrl = response.data[
              'https://api.dicebear.com/7.x/pixel-art/svg?seed=Jane&hair=long01,long02,long03,long04,long05']; // Gantilah dengan kunci yang sesuai untuk URL gambar
        });
      } else {
        throw Exception('Gagal mengambil gambar dari API');
      }
    } catch (e) {
      throw Exception('Terjadi kesalahan: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Mengambil dan Menampilkan Gambar dari API'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              imageUrl.isEmpty
                  ? CircularProgressIndicator()
                  : Image.network(imageUrl),
              ElevatedButton(
                onPressed: () {
                  fetchImage();
                },
                child: Text('Muat Ulang Gambar'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
