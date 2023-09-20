import 'package:flutter/material.dart';

void main(List<String> args) {
  runApp(const MyApp());
}

//class material app
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      home: HomePage(),
    );
  }
}

//class scaffold
class HomePage extends StatelessWidget {
  final List<String> daftarNama = [
    'Leanne Graham',
    'Ervin Howell',
    'Clementine Bauch',
    'Patricia Lebssack',
    'Chelsey Dietrich',
    'Mrs. Dennis Schulist',
    'Kurtis Weissnat',
  ];

  final List<String> daftarNomorTelepon = [
    '1-770-736-8031 x56442',
    '010-692-6593 x09125',
    '1-463-123-447',
    '493-170-9623 x156',
    '(254)954-1289',
    '1-477-935-8478 x6430',
    '210.067.6132',
  ];

  //fungsi mendaptkan huruf pertama dari daftar nama
  String getFirstLetter(String text) {
    return text.isNotEmpty ? text.substring(0, 1) : '';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Material App'),
      ),
      drawer: Drawer(
          child: ListView(
        children: const <Widget>[
          DrawerHeader(
            decoration: BoxDecoration(color: Color.fromARGB(47, 37, 37, 37)),
            child: Text('Home'),
          ),
          ListTile(
            title: Text('Settings'),
          )
        ],
      )),
      body:
          //data list
          ListView.builder(
        itemCount: daftarNama.length,
        itemBuilder: (BuildContext context, int index) {
          final nama = daftarNama[index];
          final nomorTelepon =
              daftarNomorTelepon[index]; // Ambil nomor telepon yang sesuai

          return ListTile(
            leading: CircleAvatar(
              backgroundColor: Colors.green, // Warna latar belakang bulat
              child: Text(
                getFirstLetter(nama), // Mengambil huruf pertama dari nama
                style: TextStyle(color: Colors.white),
              ),
            ),
            title: Text(nama), // Mengambil teks judul dari data list nama
            subtitle: Text(
                nomorTelepon), // Mengambil nomor telepon dari data list nomor telepon
            onTap: () {
              // Aksi yang akan diambil ketika item diklik
            },
          );
        },
      ),

      //battom navigation bar
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Search',
          ),
        ],
      ),
    );
  }
}

// const Center(child: Text('This is Material App')),
      