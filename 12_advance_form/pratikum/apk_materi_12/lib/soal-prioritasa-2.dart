import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:file_picker/file_picker.dart';

void main() {
  runApp(MyApp());
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
  //variabel class _mytextwidgetstate
  String inputText1 = '';
  String inputText2 = '';
  //list menyimpan data
  List<Map<dynamic, dynamic>> data = [
    {
      'Nama': 'tika',
      'Nomor': '0896 5467 4563',
      'Tanggal': '12-02-2023',
      'Warna': 'Red',
      'PathFile': 'bing'
    },
    {
      'Nama': 'jadu',
      'Nomor': '0865 5364 53643',
      'Tanggal': '05-03-2022',
      'Warna': 'Blue',
      'PathFile': 'bang'
    },
  ];

  String? selectedFilePath; //variabel file picker
  DateTime selectedDate = DateTime.now(); //variable date picker
  Color selectedColor = Colors.blue; //variabel color picker

  void submitForm() {
    // Membuat objek DataEntry baru dari input form
    DataEntry newData = DataEntry(
        inputText1, inputText2, selectedDate, selectedColor, selectedFilePath);

    // Menambahkan objek newData ke dalam list data
    setState(() {
      data.add(newData
          .toMap()); // Menggunakan metode toMap() untuk mengonversi objek DataEntry ke Map
      inputText1 = '';
      inputText2 = '';
      selectedDate = DateTime.now();
      selectedColor = Colors.blue;
      selectedFilePath = null;
    });
    // Tampilkan data ke debug console
    tampil();
  }

  void tampil() {
    for (var i = 0; i < data.length; i++) {
      final contact = data[i];
      final nama = contact['Nama'];
      final nomor = contact['Nomor'];
      final tanggal = contact['Tanggal'];
      final warna = contact['Warna'];
      final File = contact['PathFile'];

      print('Data ke-${i + 1}:');
      print('Nama: $nama');
      print('Nomor: $nomor');
      print('Tanggal: $tanggal');
      print('Warna: $warna');
      print('File: $File');
      print('---'); // Garis pembatas antara setiap data
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.only(top: 18, right: 20, left: 20),
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
                  width: double.infinity,
                  child: Padding(
                    padding: EdgeInsets.only(left: 30.0, right: 20),
                    child: Text(
                      'A dialog is a type of modal window that appears in front of app content to provide critical information, or prompt for a decision to be made.',
                      style: TextStyle(
                        fontSize: 16.0,
                        color: Colors.grey,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                Container(
                  width: 430,
                  color: const Color(0xFFE7E0EC),
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
                          ),
                        ),
                      ),
                      TextField(
                        onChanged: (nama) {
                          setState(() {
                            inputText1 = nama;
                          });
                        },
                        decoration: const InputDecoration(
                          hintText: '    Insert Your Name',
                          border: UnderlineInputBorder(),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 16.0),
                Container(
                  width: 430,
                  color: const Color(0xFFE7E0EC),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      const Padding(
                        padding: EdgeInsets.symmetric(
                            vertical: 3.0, horizontal: 16.0),
                        child: Text(
                          'Number HandPhone',
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
                          border: UnderlineInputBorder(),
                        ),
                      ),
                    ],
                  ),
                ),
                // Button(
                //   onPressed: submitForm,
                // ),
                const SizedBox(height: 28),
                MyDatePickerWidget(), //memanngil class date picker
                const SizedBox(
                  height: 10,
                ),
                const Text(
                  'Color Picker',
                  style: TextStyle(fontSize: 18),
                ),
                const SizedBox(height: 16),
                MyColorPickerWidget(), //memanggil class color picker
                const SizedBox(height: 10),
                const Text(
                  'File Picker',
                  style: TextStyle(fontSize: 18),
                ),
                const SizedBox(height: 16),
                MyFilePickerWidget(
                  //memanggil class file picker
                  onFilePicked: (filePath) {
                    setState(() {
                      selectedFilePath = filePath;
                    });
                  },
                ),
                const SizedBox(
                  height: 28,
                ),
                Button(
                  onPressed: submitForm,
                ),
                const SizedBox(
                  height: 40,
                ),
                const Padding(
                  padding: EdgeInsets.all(5),
                  child: Text(
                    'List Contact',
                    style: TextStyle(fontSize: 20),
                  ),
                ),
                const SizedBox(height: 13),
                //list data contact
                ListView.builder(
                  shrinkWrap: true,
                  controller: ScrollController(),
                  itemCount: data.length,
                  padding: EdgeInsets.zero,
                  itemBuilder: (context, index) {
                    return ListTile(
                      leading: CircleAvatar(
                        backgroundColor: const Color(
                            0xFFEADDFF), // Warna latar belakang bulat
                        child: Text(
                          getFirstLetter(
                              '${data[index]['Nama']}'), // Mengambil huruf pertama dari nama
                          style: const TextStyle(color: Colors.black),
                        ),
                      ),
                      title: Text('${data[index]['Nama']}'),
                      subtitle: Text('${data[index]['Nomor']}'),
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          //membuat icon dan proses edit data
                          //
                          IconButton(
                            icon: const Icon(Icons.edit),
                            onPressed: () {
                              showDialog(
                                context: context,
                                builder: (context) {
                                  String editedName = data[index]['Nama'];
                                  String editedNumber = data[index]['Nomor'];

                                  return AlertDialog(
                                    title: const Text('Edit Contacts'),
                                    content: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        TextField(
                                          decoration: const InputDecoration(
                                            labelText: 'Name',
                                          ),
                                          onChanged: (value) {
                                            editedName = value;
                                          },
                                          controller: TextEditingController(
                                              text: editedName),
                                        ),
                                        TextField(
                                          decoration: const InputDecoration(
                                            labelText: 'Number Handphone',
                                          ),
                                          onChanged: (value) {
                                            editedNumber = value;
                                          },
                                          controller: TextEditingController(
                                              text: editedNumber),
                                        ),
                                      ],
                                    ),
                                    actions: [
                                      TextButton(
                                        onPressed: () {
                                          Navigator.of(context).pop();
                                        },
                                        child: const Text('Cancel'),
                                      ),
                                      TextButton(
                                        onPressed: () {
                                          // Simpan perubahan ke data
                                          setState(() {
                                            data[index]['Nama'] = editedName;
                                            data[index]['Nomor'] = editedNumber;
                                          });
                                          Navigator.of(context).pop();
                                        },
                                        child: const Text('Save'),
                                      ),
                                    ],
                                  );
                                },
                              );
                            },
                          ),
                          //membuat icon delete dan proses delete
                          //
                          IconButton(
                            icon: const Icon(Icons.delete),
                            onPressed: () {
                              showDialog(
                                context: context,
                                builder: (context) {
                                  return AlertDialog(
                                    title: const Text('Delele Contacts'),
                                    content: const Text(
                                        'Are you sure you want to delete this contact??'),
                                    actions: [
                                      TextButton(
                                        onPressed: () {
                                          setState(() {
                                            data.removeAt(index);
                                          });
                                          Navigator.of(context).pop();
                                        },
                                        child: const Text('Yes'),
                                      ),
                                      TextButton(
                                        onPressed: () {
                                          Navigator.of(context).pop();
                                        },
                                        child: const Text('No'),
                                      ),
                                    ],
                                  );
                                },
                              );
                            },
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

//class button submit
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

///class datepicker, color picker dan file picker
class MyDatePickerWidget extends StatefulWidget {
  @override
  _MyDatePickerWidgetState createState() => _MyDatePickerWidgetState();
}

class _MyDatePickerWidgetState extends State<MyDatePickerWidget> {
  DateTime selectedDate = DateTime.now(); // Inisialisasi tanggal saat ini
  String? selectedFilePath; // Path file yang dipilih

  //method _selecttdate
  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );

    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
      });

      var C = _MyTextWidgetState();
      C.submitForm();
    }
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                const Text(
                  'Date',
                  style: TextStyle(fontSize: 18),
                ),
                TextButton(
                  onPressed: () => _selectDate(context),
                  child: const Text(
                    'Select date',
                    style: TextStyle(fontSize: 15),
                  ),
                )
              ],
            ),
            Text(
              'Tanggal yang Dipilih: ${DateFormat('dd/MM/yyyy').format(selectedDate)}', //memprint di interface tanggal yang dipilih
              style: const TextStyle(fontSize: 13.5),
            ),
          ],
        ),
      ),
    );
  }
}

//class color picker
class MyColorPickerWidget extends StatefulWidget {
  @override
  _MyColorPickerWidgetState createState() => _MyColorPickerWidgetState();
}

class _MyColorPickerWidgetState extends State<MyColorPickerWidget> {
  Color selectedColor = Colors.blue; // Warna awal yang dipilih

  //method ubah color
  void changeColor(Color color) {
    setState(() {
      selectedColor = color;
    });
    var C = _MyTextWidgetState();
    C.submitForm();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Container(
            width: 500.0,
            height: 100.0,
            color: selectedColor,
          ),
          const SizedBox(
            height: 9.0,
          ),
          //tombol ubah warna
          ElevatedButton(
            child: const Text('Pilih Warna'),
            onPressed: () {
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: const Text('Pilih Warna'),
                    content: SingleChildScrollView(
                      child: ColorPicker(
                        pickerColor: selectedColor,
                        onColorChanged:
                            changeColor, //memanngil method ubah color
                        colorPickerWidth: 300.0,
                        pickerAreaHeightPercent: 0.7,
                        enableAlpha: true,
                      ),
                    ),
                    actions: <Widget>[
                      TextButton(
                        child: const Text('OK'),
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                      ),
                    ],
                  );
                },
              );
            },
          ),
        ],
      ),
    );
  }
}

///clasas filepicker
class MyFilePickerWidget extends StatefulWidget {
  final void Function(String?) onFilePicked;

  MyFilePickerWidget({required this.onFilePicked});

  @override
  _MyFilePickerWidgetState createState() => _MyFilePickerWidgetState();
}

class _MyFilePickerWidgetState extends State<MyFilePickerWidget> {
  String? selectedFilePath;

  //method pickfile
  Future<void> pickFile() async {
    try {
      final result = await FilePicker.platform.pickFiles(
        type: FileType.custom, // Tipe file yang diizinkan (bisa disesuaikan)
        allowedExtensions: [
          'pdf',
          'jpg',
          'png',
          'doc'
        ], // Ekstensi file yang diizinkan
      );

      if (result != null) {
        setState(() {
          selectedFilePath = result.files.single.path;
        });
        widget.onFilePicked(
            selectedFilePath); // Memanggil callback dengan path file yang dipilih
      }
    } catch (e) {
      // ignore: avoid_print
      print(
          'Error picking file: $e'); //jika file tidak sesuai format maka akan muncul pesan ini
    }
    var C = _MyTextWidgetState();
    C.submitForm();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
            width: 102.0, // Lebar tombol
            height: 40.0, // Tinggi tombol
            child: ElevatedButton(
              child: const Text('Pilih File'),
              onPressed: () {
                // Panggil fungsi untuk memilih file saat tombol ditekan
                pickFile();
              },
            ),
          ),
          // const SizedBox(height: 15),
          // if (selectedFilePath != null)
          //   Text(
          //       'File yang Dipilih: $selectedFilePath'), //memprint path file yang dipilih
        ],
      ),
    );
  }
}

//function mendaptkan huruf pertama untuk didalaam lingkaran
String getFirstLetter(String text) {
  return text.isNotEmpty ? text.substring(0, 1) : '';
}

//class dataentry
class DataEntry {
  String nama;
  String nomor;
  DateTime tanggal;
  Color warna;
  String? pathFile;

  DataEntry(this.nama, this.nomor, this.tanggal, this.warna, this.pathFile);

  Map<String, dynamic> toMap() {
    return {
      'Nama': nama,
      'Nomor': nomor,
      'Tanggal': tanggal.toString(),
      'Warna': warna.value,
      'PathFile': pathFile,
    };
  }
}
