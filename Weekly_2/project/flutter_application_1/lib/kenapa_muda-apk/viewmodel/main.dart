import 'package:flutter/material.dart';
import 'package:flutter_application_1/kenapa_muda-apk/view/box-view.dart';
// import 'package:flutter_application_1/kenapa_muda-apk/viewmodel/main2.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Aplikasi Dogan',
      theme: ThemeData(
        primarySwatch: Colors.green, // Atur warna utama ke hijau
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.green, // Atur latar belakang AppBar ke hijau
        ),
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Image.asset(
              'assets/image/es-kenapa-muda.png', // Ganti dengan path ke gambar Anda
              height: 40, // Atur tinggi gambar sesuai kebutuhan
              width: 40, // Atur lebar gambar sesuai kebutuhan
            ),
            const SizedBox(width: 8), // Jarak antara gambar dan teks
            const Text(
              'ES kenapa muda',
              style: TextStyle(fontFamily: 'Poppins', fontSize: 20),
            ),
          ],
        ),
      ),
      drawer: Drawer(
        child: Container(
          color: Colors.green,
          child: ListView(
            children: <Widget>[
              ListTile(
                leading: const Icon(
                  Icons.info,
                  color: Colors.white,
                ),
                title: const Text(
                  'About Us',
                  style: TextStyle(color: Colors.white),
                ),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              ListTile(
                leading: const Icon(
                  Icons.email,
                  color: Colors.white,
                ),
                title: const Text(
                  'Contact Us',
                  style: TextStyle(color: Colors.white),
                ),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              ListTile(
                leading: const Icon(
                  Icons.login,
                  color: Colors.white,
                ),
                title: const Text(
                  'Login',
                  style: TextStyle(color: Colors.white),
                ),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const BoxView(),
            ContactUsBar(),
            const SizedBox(height: 75),
            const Divider(
              thickness: 2,
            ),
            const SizedBox(
              height: 7,
            ),
            const Text(
              'About Us',
              style: TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20),
            CardGrid(),
          ],
        ),
      ),
    );
  }
}

class CardGrid extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 2, // 2 kolom
      childAspectRatio: 0.60, // Mengatur rasio lebar ke tinggi
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      children: <Widget>[
        CustomCard(
          image:
              'https://asset.kompas.com/crops/Qj4Lh5heb6bYtECYkSdYLtXbO3w=/0x32:640x459/750x500/data/photo/2021/09/10/613b5607e02b8.jpg',
          title: 'Kelapa Dogan Murni',
          description: 'Kelapa dogan murni makan ditempat. Hanya 6k !!',
        ),
        CustomCard(
          image:
              'https://asset-2.tstatic.net/palembang/foto/bank/images/dogan_20170807_205535.jpg',
          title: 'Kelapa Dogan Murni Home',
          description:
              'Kelapa dogan yang kami antar langsung di rumah mu. Hanya 15k',
        ),
        CustomCard(
          image:
              'https://asset-2.tstatic.net/makassar/foto/bank/images/manfaat-minum-air-kelapa_20181018_201644.jpg',
          title: 'Kelapa Dogan Tinggal Minum',
          description: 'Anda cukup minum dari gelas. Hanya 8k',
        ),
        CustomCard(
          image:
              'https://cloud.jpnn.com/photo/galeri/normal/2021/09/04/minuman-air-kelapa-yang-telah-disajikan-tajur-halang-kabupat-imkk.jpg',
          title: 'Kelapa Dogan VVIP',
          description: 'Kelapa Dogan Terbaik kami. Hanya 10 K',
        ),
      ],
    );
  }
}

class CustomCard extends StatelessWidget {
  final String image;
  final String title;
  final String description;

  CustomCard(
      {required this.image, required this.title, required this.description});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.green,
      shadowColor: Colors.red,
      elevation: 2,
      margin: const EdgeInsets.only(left: 15, right: 15, bottom: 14),
      child: Container(
        width: 2.0, // Sesuaikan ukuran lebar sesuai kebutuhan
        height: 4.0, // Sesuaikan ukuran tinggi sesuai kebutuhan
        child: Column(
          children: <Widget>[
            Image.network(image,
                height: 150, width: 150), // Sesuaikan ukuran gambar
            ListTile(
              title: Text(
                title,
                style: const TextStyle(
                    color: Colors.white, fontWeight: FontWeight.bold),
              ),
              subtitle: Text(
                description,
                style:
                    const TextStyle(color: Colors.white, fontFamily: 'Poppins'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
