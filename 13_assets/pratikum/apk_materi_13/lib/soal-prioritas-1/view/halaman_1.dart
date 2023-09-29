import 'package:flutter/material.dart';

class MyHomePage extends StatelessWidget {
  late String _selectedImagePath; // Menyimpan path gambar yang dipilih

  void _showImage(BuildContext context, String imagePath) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return SingleChildScrollView(
          child: Container(
            alignment: Alignment.topCenter,
            // padding: EdgeInsets.only(top: 10),
            child: Column(
              // mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Center(
                  child: Transform.scale(
                    scale: 0.5, // Atur faktor perbesaran sesuai keinginan
                    child: Image.asset(
                      imagePath, // Tampilkan gambar yang dipilih
                      fit: BoxFit.cover, // Sesuaikan tampilan gambar
                    ),
                  ),
                ),
                const SizedBox(height: 5.0),
                const Text('Ingin meilhat gambar secara full?'),
                const SizedBox(height: 5.0), // Jarak antara gambar dan tombol
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    ElevatedButton(
                      onPressed: () {
                        // Tindakan ketika tombol "Ya" ditekan
                        Navigator.of(context).pop(); // Tutup bottom sheet

                        // Navigasi ke halaman baru
                        Navigator.pushNamed(context, '/newPage');
                      },
                      child: const Text('Ya'),
                    ),
                    const SizedBox(width: 16.0), // Jarak antara tombol
                    ElevatedButton(
                      onPressed: () {
                        // Tindakan ketika tombol "Tidak" ditekan
                        Navigator.of(context).pop(); // Tutup bottom sheet
                      },
                      child: const Text('Tidak'),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Soal Prioritas 1'),
      ),
      body: Column(
        children: <Widget>[
          Container(
            alignment: Alignment.center,
            margin: const EdgeInsets.all(20.0),
            child: const Text(
              'Image',
              style: TextStyle(fontSize: 24.0),
            ),
          ),
          Expanded(
            child: GridView.count(
              crossAxisCount: 2,
              children: <Widget>[
                GestureDetector(
                  onTap: () {
                    // Setelah gambar ditekan, tetapkan path gambar yang dipilih
                    _selectedImagePath = 'assets/images/dogan.png';
                    // Tampilkan bottom sheet saat gambar ditekan
                    _showImage(context, _selectedImagePath);
                  },
                  child: Image.asset(
                    'assets/images/dogan.png', // Ganti dengan path gambar Anda
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    // Setelah gambar ditekan, tetapkan path gambar yang dipilih
                    _selectedImagePath = 'assets/images/depan-kampus.png';
                    // Tampilkan bottom sheet saat gambar ditekan
                    _showImage(context, _selectedImagePath);
                  },
                  child: Image.asset(
                    'assets/images/depan-kampus.png', // Ganti dengan path gambar Anda
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    // Setelah gambar ditekan, tetapkan path gambar yang dipilih
                    _selectedImagePath = 'assets/images/gambar_utk_hmp.jpg';
                    // Tampilkan bottom sheet saat gambar ditekan
                    _showImage(context, _selectedImagePath);
                  },
                  child: Image.asset(
                    'assets/images/gambar_utk_hmp.jpg', // Ganti dengan path gambar Anda
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    // Setelah gambar ditekan, tetapkan path gambar yang dipilih
                    _selectedImagePath = 'assets/images/profil.png';
                    // Tampilkan bottom sheet saat gambar ditekan
                    _showImage(context, _selectedImagePath);
                  },
                  child: Image.asset(
                    'assets/images/profil.png', // Ganti dengan path gambar Anda
                  ),
                ),
                // Tambahkan GestureDetector dan Image.asset lainnya di sini
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class NewPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Halaman Baru'),
      ),
      body: const Center(
        child: Text('Ini adalah halaman baru!'),
      ),
    );
  }
}
