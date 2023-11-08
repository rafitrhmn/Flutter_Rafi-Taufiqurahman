import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:dio/dio.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late String imageUrl;

  @override
  void initState() {
    super.initState();
    fetchImage();
  }

  Future<void> fetchImage() async {
    try {
      Response response =
          await Dio().get('https://api.dicebear.com/7.x/pixel-art/svg');
      setState(() {
        imageUrl = response.realUri.toString();
      });
    } catch (e) {
      print('Terjadi kesalahan: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Gambar DiceBear'),
        ),
        body: Center(
          child: imageUrl.isNotEmpty
              ? SvgPicture.network(
                  imageUrl,
                  height: 200,
                  width: 200, // Menentukan lebar gambar
                  placeholderBuilder: (BuildContext context) =>
                      const CircularProgressIndicator(),
                )
              : const CircularProgressIndicator(),
        ),
      ),
    );
  }
}
