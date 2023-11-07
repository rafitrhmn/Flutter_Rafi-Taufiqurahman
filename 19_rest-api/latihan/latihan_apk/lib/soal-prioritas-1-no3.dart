import 'package:flutter/material.dart';
import 'package:dio/dio.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class User {
  final int userId;
  final int id;
  final String title;
  final String body;

  User(
      {required this.userId,
      required this.id,
      required this.title,
      required this.body});

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      userId: json['userId'],
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
        setState(() {
          userData = User(
            userId: userData!.userId,
            id: userData!.id,
            title: newTitle,
            body: newBody,
          );
        });
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
          title: Text('Soal Prioritas 1 Nomor 3'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('UserId: ${userData?.userId ?? "Tidak Ada Data"}'),
              Text('Id: ${userData?.id ?? "Tidak Ada Data"}'),
              Text('Title: ${userData?.title ?? "Tidak Ada Data"}'),
              Text('Body: ${userData?.body ?? "Tidak Ada Data"}'),
              SizedBox(
                height: 7,
              ),
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
