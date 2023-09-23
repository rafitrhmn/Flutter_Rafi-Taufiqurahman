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
      home: MyDatePickerWidget(),
    );
  }
}

//class date picker
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
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Soal Prioritas 1'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
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
              //memanggil class file picker
              MyFilePickerWidget(
                onFilePicked: (filePath) {
                  setState(() {
                    selectedFilePath = filePath;
                  });
                },
              ),
            ],
          ),
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
          const SizedBox(height: 15),
          if (selectedFilePath != null)
            Text(
                'File yang Dipilih: $selectedFilePath'), //memprint path file yang dipilih
        ],
      ),
    );
  }
}
