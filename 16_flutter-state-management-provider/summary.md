summary flutter state management provider

Flutter state management provider
1.state 
ialah data yang dapat berubah rubah yang hanya terdapat di statefull widget.
berikut contoh kode menggunakan state sederhana. yakni membuat tombol yang jika ditekan
teks akan berubah :

class Body extends StatefulWidget {
  const Body({super.key});

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  //field teks pesan
  int pesanditekan = 0;
  String pesan = 'selamat datang';

  //field method state
  void tombolDiTekan() {
    setState(() {
      if (pesanditekan == 0) {
        pesan = 'hai';
        pesanditekan = 1;
      } else if (pesanditekan == 1) {
        pesan = 'selamat datang';
        pesanditekan = 0;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 30),
      alignment: Alignment.center,
      child: Column(children: [
        Text(pesan),
        ElevatedButton(
          onPressed: tombolDiTekan,
          child: const Text('Tekan saya'),
        ),
      ]),
    );
  }
}

2. global state
    yakni state yang dapat digunakan diseluruh widget dan saling terhubung satu sama lain.
        kali ini akan menggunakan state provider untuk melakukan global state.
contoh cara menggunakan global state provider yakni jika tombol ditekan maka teks angka yang semula angka 1. akan menjadi angka 2.

- tambahkan depencies di pubsyaml = provider:^6.0.2

- PERTAMA MASUKKAN KODE PERTAMA
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

- MASUKKAN KODE KEDUA
class CounterModel extends ChangeNotifier {
  int _count = 0;

  int get count => _count;

  void increment() {
    _count++;
    notifyListeners(); // Memperbarui semua pendengar saat state berubah
  }
}

- MASUKKAN KODE KETIGA
void main() {
  runApp(
    // Step 4: Bungkus Aplikasi dengan Provider
    ChangeNotifierProvider(
      create: (context) => CounterModel(), // Membuat instance model data
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
    );
  }
}

- MASUKKAN KODE KEEMPAT
class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Step 5: Gunakan StateProvider
    final counter = context.watch<CounterModel>();

    return Scaffold(
      appBar: AppBar(
        title: Text('StateProvider Example'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('Counter Value:'),
            Text(
              '${counter.count}',
              style: TextStyle(
                fontSize: 36,
                fontWeight: FontWeight.bold,
              ),
            ),
            ElevatedButton(
              onPressed: () {
                counter.increment(); // Memanggil method increment() pada model data
              },
              child: Text('Increment'),
            ),
          ],
        ),
      ),
    );
  }
}



