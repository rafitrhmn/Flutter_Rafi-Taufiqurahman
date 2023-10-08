import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'dart:async';
import 'package:flutter/foundation.dart';

class Data {
  String? nama;
  String? nohp;
  DateTime selectedDate = DateTime.now();
  Color selectedColor = Colors.blue;
  String? selectedFilePath;

  Data({
    required this.nama,
    required this.nohp,
    required this.selectedDate,
    required this.selectedColor,
    required this.selectedFilePath,
  });
}

class DataBloc with ChangeNotifier {
  final List<Map<dynamic, dynamic>> _data = [
    {
      'Nama': 'tika',
      'Nomor': '0896 5467 4563',
      'Tanggal': '12-02-2023',
      'Warna': 'Merah',
      'PathFile': 'bing',
    },
    {
      'Nama': 'jadu',
      'Nomor': '0865 5364 53643',
      'Tanggal': '05-03-2022',
      'Warna': 'Biru',
      'PathFile': 'bang',
    },
  ];

  final _selectedDate = DateTime.now();
  Color _selectedColor = Colors.blue;
  String? _selectedFilePath;
  String? _nama;
  String? _nohp;

  final _dataController =
      StreamController<List<Map<dynamic, dynamic>>>.broadcast();
  final _selectedDateController = StreamController<DateTime>.broadcast();
  final _selectedColorController = StreamController<Color>.broadcast();
  final _selectedFilePathController = StreamController<String?>.broadcast();
  final _namaController = StreamController<String?>.broadcast();
  final _nohpController = StreamController<String?>.broadcast();

  Stream<List<Map<dynamic, dynamic>>> get dataStream => _dataController.stream;
  Stream<DateTime> get selectedDateStream => _selectedDateController.stream;
  Stream<Color> get selectedColorStream => _selectedColorController.stream;
  Stream<String?> get selectedFilePathStream =>
      _selectedFilePathController.stream;
  Stream<String?> get namaStream => _namaController.stream;
  Stream<String?> get nohpStream => _nohpController.stream;

  Color get selectedColor => _selectedColor;

  Data get data => Data(
        nama: _nama,
        nohp: _nohp,
        selectedDate: _selectedDate,
        selectedColor: _selectedColor,
        selectedFilePath: _selectedFilePath,
      );

  void dispose() {
    _dataController.close();
    _selectedDateController.close();
    _selectedColorController.close();
    _selectedFilePathController.close();
    _namaController.close();
    _nohpController.close();
  }

  void name(String nama) {
    _nama = nama;
    _namaController.sink.add(_nama);
  }

  void NoHp(String nohp) {
    _nohp = nohp;
    _nohpController.sink.add(_nohp);
  }

  void updateSelectedFilePath(String? filePath) {
    _selectedFilePath = filePath;
    _selectedFilePathController.sink.add(_selectedFilePath);
  }

  void updateSelectedColor(Color newColor) {
    _selectedColor = newColor;
    _selectedColorController.sink.add(_selectedColor);
  }

  void updateSelectedDate(DateTime newDate) {
    _selectedDateController.sink.add(newDate);
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
    _dataController.sink.add(_data);
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
    _dataController.sink.add(_data);
  }

  void deleteData(int index) {
    _data.removeAt(index);
    _dataController.sink.add(_data);
  }
}
