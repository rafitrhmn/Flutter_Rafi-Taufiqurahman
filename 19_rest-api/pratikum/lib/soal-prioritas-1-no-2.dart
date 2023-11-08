import 'package:flutter/material.dart';
import 'package:dio/dio.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class User {
  final int? id;
  final String? name;
  final String? phone;

  User({required this.id, required this.name, required this.phone});

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      name: json['name'],
      phone: json['phone'],
    );
  }
}

class MyApp extends StatelessWidget {
  Future<User> fetchData() async {
    try {
      Dio dio = Dio();
      Response response = await dio.get(
          'https://my-json-server.typicode.com/hadihammurabi/flutter-webservice/contacts/2'); // Gantilah dengan URL API yang sesuai

      if (response.statusCode == 200) {
        // Jika respons berhasil, deserialisasi JSON ke objek User
        return User.fromJson(response.data);
      } else {
        throw Exception('Gagal mengambil data dari API');
      }
    } catch (e) {
      throw Exception('Terjadi kesalahan: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: FutureBuilder<User>(
        future: fetchData(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Scaffold(
              appBar: AppBar(
                title: Text('soal prioritas 1 nomor 2'),
              ),
              body: Center(
                child: CircularProgressIndicator(),
              ),
            );
          } else if (snapshot.hasError) {
            return Scaffold(
              appBar: AppBar(
                title: Text('Error'),
              ),
              body: Center(
                child: Text('Error: ${snapshot.error}'),
              ),
            );
          } else {
            return Scaffold(
              appBar: AppBar(
                title: Text('Data Pengguna'),
              ),
              body: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text('ID: ${snapshot.data?.id}'),
                    Text('Nama: ${snapshot.data?.name}'),
                    Text('phone: ${snapshot.data?.phone}'),
                  ],
                ),
              ),
            );
          }
        },
      ),
    );
  }
}
