summary rest api

Rest API
ialah Representional state transfer application programming interface. yaiutu arsetekrtural yang memisahkan tampilan dengan proses bisnis. 

HTTP
ialah protokol yang digunakan untuk berkirim data pada internet biasanya data tersebut berbentuk media web.
user (client) komunikasi dengan server disebut request. dan server membalas komunikasi itu disebut response.

Dio
ialah sebagai http clien dan dimanfaatkan untuk melakukan rest api.
cara melakukan dio:
1. tambahkan depencies dio ke pubsyaml
2. Impor Dio dalam file Dart yang sesuai:
import 'package:dio/dio.dart';
3.Buat instance Dio: 
Dio dio = Dio();
4. Buat dan kirim permintaan HTTP menggunakan Dio. Berikut adalah contoh sederhana untuk mengirim permintaan GET:
try {
  Response response = await dio.get('https://example.com/api/data');
  if (response.statusCode == 200) {
    // Sukses: Respons berhasil diterima
    print(response.data);
  } else {
    // Gagal: Tangani kesalahan
    print('Kesalahan ${response.statusCode}: ${response.statusMessage}');
  }
} catch (e) {
  // Tangani kesalahan jaringan atau lainnya
  print('Terjadi kesalahan: $e');
}


JSON
ialah cara penulisan data yang digunakan rest api. bertipe javascript object notation.
dua cara json dikelola:
1. dari data bertipe map/list lalu diserialisasikan ke json. contoh kode :
import 'dart:convert';

// Membuat objek Dart
Map<String, dynamic> user = {'name': 'Alice', 'age': 25};

// Mengonversi objek Dart menjadi JSON
String jsonString = json.encode(user);

// Mengirim JSON ke server atau menggunakan sesuai kebutuhan
print(jsonString);

2.dari json lalu diserialisasi ke data bertipe map/list.contoh kode :
import 'dart:convert';

// String JSON yang akan diurai
String jsonString = '{"name": "John", "age": 30}';

// Mengurai JSON menjadi objek Dart
Map<String, dynamic> user = json.decode(jsonString);

// Mengakses data dalam objek Dart
String name = user['name'];
int age = user['age'];


