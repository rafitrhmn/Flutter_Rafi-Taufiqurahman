import 'package:flutter/material.dart';
import 'package:dio/dio.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final Dio dio = Dio();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController NohpController = TextEditingController();
  String updatedData = ''; // Untuk menyimpan data yang sudah diperbarui

  Future<void> sendData() async {
    try {
      String name = nameController.text;
      int nohp = int.tryParse(NohpController.text) ??
          0; // Menangani input umur yang tidak valid

      String apiUrl =
          'https://my-json-server.typicode.com/hadihammurabi/flutter-webservice/contacts/3'; // Gantilah dengan URL API yang sesuai

      Map<String, dynamic> dataToUpdate = {
        'name': name,
        'phone': nohp,
      };

      Response response = await dio.put(apiUrl, data: dataToUpdate);

      if (response.statusCode == 200) {
        setState(() {
          updatedData = 'Data berhasil diperbarui:\nNama: $name\nUmur: $nohp';
        });
        print('Data berhasil diperbarui.');
      } else {
        print('Kesalahan ${response.statusCode}: ${response.statusMessage}');
      }
    } catch (e) {
      print('Terjadi kesalahan: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('soal prioritas 1 nomor 1'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: nameController,
              decoration: InputDecoration(labelText: 'Nama'),
            ),
            TextField(
              controller: NohpController,
              decoration: InputDecoration(labelText: 'Nomor HandPhone'),
              keyboardType: TextInputType.number,
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                sendData(); // Panggil fungsi sendData ketika tombol ditekan
              },
              child: Text('Kirim Permintaan PUT'),
            ),
            SizedBox(
              height: 20,
            ),
            Text('Data'),
            SizedBox(height: 4),
            Text(updatedData)
          ],
        ),
      ),
    );
  }
}
