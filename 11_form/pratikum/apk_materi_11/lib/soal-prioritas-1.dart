import 'package:flutter/material.dart';

void main() {
  runApp(MyApp()); //jalankan aplikasi
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyTextWidget(),
    );
  }
}

class MyTextWidget extends StatefulWidget {
  @override
  _MyTextWidgetState createState() => _MyTextWidgetState();
}

class _MyTextWidgetState extends State<MyTextWidget> {
  //variabel class inputtext1, inputtext2 dan list data yang menampung data nama dan nomor
  String inputText1 = '';
  String inputText2 = '';
  List data = [
    {'Nama': 'tika', 'Nomor': '0896 5467 4563'},
    {'Nama': 'jadu', 'Nomor': '0865 5364 53643'}
  ];

  //method  submit
  void submitForm() {
    // Mengekstrak nilai dari input field
    String nama = inputText1;
    String nomor = inputText2;

    // Membuat map baru dengan data input
    Map<String, dynamic> newData = {
      'Nama': nama,
      'Nomor': nomor,
    };

    // Menambahkan map baru ke dalam list data
    setState(() {
      data.add(newData);
    });

    // Mengosongkan input field setelah tombol "Submit" ditekan
    setState(() {
      inputText1 = '';
      inputText2 = '';
    });

    //data tampil ke debug conssole
    tampil();
  }

  void tampil() {
    print(data);
  }

  //build halaman
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.only(top: 10, right: 20),
          child: Center(
            child: Column(
              children: <Widget>[
                const SizedBox(height: 30.0),
                const Icon(
                  Icons.mobile_friendly,
                  size: 30.0,
                  color: Color.fromARGB(255, 68, 60, 60),
                ),
                const SizedBox(height: 16.0),
                const Text(
                  'Create New Contacts',
                  style: TextStyle(
                    fontSize: 24.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 20.0),
                const SizedBox(
                  width: double.infinity, // Mengisi lebar secara penuh
                  child: Padding(
                    padding: EdgeInsets.only(
                        left: 50.0,
                        right: 50), // Spasi rata kiri dan spasi rata kanan
                    child: Text(
                      'A dialog is a type of modal window that appears in front of app content to provide critical information, or prompt for a decision to be made.',
                      style: TextStyle(
                        fontSize: 16.0,
                        color: Colors.grey,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 20),
                //conteiner form nama
                Container(
                  width: 430,
                  color: Color(0xFFE7E0EC), // Warna latar belakang
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      const Padding(
                        padding: EdgeInsets.symmetric(
                            vertical: 3.0, horizontal: 16.0),
                        child: Text(
                          'Name',
                          style: TextStyle(
                            fontSize: 18.0,
                            // fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      TextField(
                        onChanged: (nama) {
                          setState(() {
                            inputText1 =
                                nama; //menyimpan inputan ke variabel input text
                          });
                        },
                        decoration: const InputDecoration(
                          hintText: '    Insert Your Name',
                          border:
                              UnderlineInputBorder(), // Border hanya bagian bawah
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 16.0),
                //form nomor
                Container(
                  width: 430,
                  color: Color(0xFFE7E0EC), // Warna latar belakang
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      const Padding(
                        padding: EdgeInsets.symmetric(
                            vertical: 3.0, horizontal: 16.0),
                        child: Text(
                          'Nomor',
                          style: TextStyle(
                            fontSize: 16.0,
                          ),
                        ),
                      ),
                      TextField(
                        onChanged: (nomor) {
                          setState(() {
                            inputText2 = nomor;
                          });
                        },
                        decoration: const InputDecoration(
                          hintText: '    +62...',
                          border:
                              UnderlineInputBorder(), // Border hanya bagian bawah
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 16.0),
                //memanggil kelas button submit
                Button(
                  onPressed:
                      submitForm, // Panggil submitForm saat tombol ditekan
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class Button extends StatelessWidget {
  final VoidCallback
      onPressed; // Fungsi yang akan dipanggil saat tombol ditekan

  Button({required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topRight,
      child: Container(
        width: 94,
        height: 30,
        clipBehavior: Clip.antiAlias,
        decoration: ShapeDecoration(
          color: const Color(0xFF6750A4),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
        ),
        child: InkWell(
          // Gunakan InkWell untuk memberikan efek ketika tombol ditekan
          onTap: onPressed, // Panggil fungsi onPressed saat tombol ditekan
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 3),
            child: const Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'Submit',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                    fontFamily: 'Roboto',
                    fontWeight: FontWeight.w500,
                    height: 0.10,
                    letterSpacing: 0.10,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
