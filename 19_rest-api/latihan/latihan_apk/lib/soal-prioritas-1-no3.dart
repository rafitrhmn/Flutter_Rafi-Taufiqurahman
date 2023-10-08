import 'package:flutter/material.dart';
import 'package:dio/dio.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class User {
  final int id;
  final String title;
  final String body;

  User({required this.id, required this.title, required this.body});

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      title: json['title'],
      body: json['body'],
    );
  }
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final Dio dio = Dio();

  User? userData;

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  Future<void> fetchData() async {
    try {
      Response response =
          await dio.get('https://jsonplaceholder.typicode.com/posts/1');

      if (response.statusCode == 200) {
        setState(() {
          userData = User.fromJson(response.data);
        });
      } else {
        throw Exception('Gagal mengambil data dari API');
      }
    } catch (e) {
      throw Exception('Terjadi kesalahan: $e');
    }
  }

  Future<void> updateData() async {
    try {
      String newTitle = 'foo'; // Set new title
      String newBody = 'bar'; // Set new body

      String apiUrl = 'https://jsonplaceholder.typicode.com/posts/1';

      Map<String, dynamic> dataToUpdate = {
        'title': newTitle,
        'body': newBody,
      };

      Response response = await dio.put(apiUrl, data: dataToUpdate);

      if (response.statusCode == 200) {
        fetchData(); // Fetch updated data after the PUT request succeeds
        print('Data berhasil diperbarui.');
      } else {
        throw Exception(
            'Kesalahan ${response.statusCode}: ${response.statusMessage}');
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
          title: Text('soal prioritas 1 nomor 3'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('title: ${userData?.title ?? "Tidak Ada Data"}'),
              Text('body: ${userData?.body ?? "Tidak Ada Data"}'),
              ElevatedButton(
                onPressed: () {
                  updateData();
                },
                child: Text('Perbarui Data (PUT)'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
