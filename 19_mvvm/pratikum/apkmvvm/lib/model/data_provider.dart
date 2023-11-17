import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Data {
  String? nama;
  String? nohp;
  DateTime selectedDate = DateTime.now();
  Color selectedColor = Colors.blue; // Warna awal yang dipilih
  String? selectedFilePath;

  Data(
      {required this.nama,
      required this.nohp,
      required this.selectedDate,
      required this.selectedColor,
      required this.selectedFilePath});
}

class DataProvider extends ChangeNotifier {
  final List<Map<dynamic, dynamic>> _data = [
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

  DateTime _selectedDate = DateTime.now();
  Color _selectedColor = Colors.blue; // Pindahkan selectedColor ke DataProvider
  String? _selectedFilePath;
  String? _nama;
  String? _nohp;

  //
  List<Map<dynamic, dynamic>> get datas => _data;
  DateTime get selectedDate => _selectedDate;
  Color get selectedColor => _selectedColor;
  String? get selectedFilePath => _selectedFilePath;
  String? get nama => _nama;
  String? get nohp => _nohp;

  //data mengambil inputan nama dan nomor telepon
  void name(String nama) {
    _nama = nama;
    notifyListeners();
  }

  void NoHp(String nohp) {
    _nohp = nohp;
    notifyListeners();
  }

  // Metode untuk memperbarui path file yang dipilih
  void updateSelectedFilePath(String? filePath) {
    _selectedFilePath = filePath;
    notifyListeners(); // Memberi tahu listener bahwa data telah berubah
  }

  // Metode untuk memperbarui warna yang dipilih
  void updateSelectedColor(Color newColor) {
    _selectedColor = newColor;
    notifyListeners(); // Memberi tahu listener bahwa data telah berubah
  }

  void updateSelectedDate(DateTime newDate) {
    _selectedDate = newDate;
    notifyListeners(); // Memberi tahu listener bahwa data telah berubah
  }

  void addData(Data newData) {
    final newEntry = {
      'Nama': newData.nama,
      'Nomor': newData.nohp,
      'Tanggal': DateFormat('dd-MM-yyyy').format(newData.selectedDate),
      'Warna': newData.selectedColor.toString(),
      'PathFile': newData.selectedFilePath,
    };

    _data.add(newEntry);
    notifyListeners();
  }

  void editData(int index, Data editedData) {
    final editedEntry = {
      'Nama': editedData.nama,
      'Nomor': editedData.nohp,
      'Tanggal': DateFormat('dd-MM-yyyy').format(editedData.selectedDate),
      'Warna': editedData.selectedColor.toString(),
      'PathFile': editedData.selectedFilePath,
    };

    _data[index] = editedEntry;
    notifyListeners();
  }

  void deleteData(int index) {
    _data.removeAt(index);
    notifyListeners();
  }
}





























//data

// List<Map<dynamic, dynamic>> data = [
//   {
//     'Nama': 'tika',
//     'Nomor': '0896 5467 4563',
//     'Tanggal': '12-02-2023',
//     'Warna': 'Red',
//     'PathFile': 'bing'
//   },
//   {
//     'Nama': 'jadu',
//     'Nomor': '0865 5364 53643',
//     'Tanggal': '05-03-2022',
//     'Warna': 'Blue',
//     'PathFile': 'bang'
//   },
// ];

// class Data {
//   String? selectedFilePath; //variabel file picker
//   DateTime selectedDate = DateTime.now(); //variable date picker
//   Color selectedColor = Colors.blue; //variabel color picker
// }

// extension funtion on HomePage {
//   void submitForm() {
//     // Membuat objek DataEntry baru dari input form
//     DataEntry newData = DataEntry(
//         inputText1, inputText2, selectedDate, selectedColor, selectedFilePath);

//     // Menambahkan objek newData ke dalam list data
//     setState(() {
//       data.add(newData
//           .toMap()); // Menggunakan metode toMap() untuk mengonversi objek DataEntry ke Map
//       inputText1 = '';
//       inputText2 = '';
//       selectedDate = DateTime.now();
//       selectedColor = Colors.blue;
//       selectedFilePath = null;
//     });
//     // Tampilkan data ke debug console
//     tampil();
//   }

//   void tampil() {
//     for (var i = 0; i < data.length; i++) {
//       final contact = data[i];
//       final nama = contact['Nama'];
//       final nomor = contact['Nomor'];
//       final tanggal = contact['Tanggal'];
//       final warna = contact['Warna'];
//       final File = contact['PathFile'];

//       print('Data ke-${i + 1}:');
//       print('Nama: $nama');
//       print('Nomor: $nomor');
//       print('Tanggal: $tanggal');
//       print('Warna: $warna');
//       print('File: $File');
//       print('---'); // Garis pembatas antara setiap data
//     }
//   }
// }

// class DataEntry {
//   String nama;
//   String nomor;
//   DateTime tanggal;
//   Color warna;
//   String? pathFile;

//   DataEntry(this.nama, this.nomor, this.tanggal, this.warna, this.pathFile);

//   Map<String, dynamic> toMap() {
//     return {
//       'Nama': nama,
//       'Nomor': nomor,
//       'Tanggal': tanggal.toString(),
//       'Warna': warna.value,
//       'PathFile': pathFile,
//     };
//   }
// }

// String getFirstLetter(String text) {
//   return text.isNotEmpty ? text.substring(0, 1) : '';
// }
