// import 'package:flutter/material.dart';
// import 'package:intl/intl.dart';
// import 'package:flutter_colorpicker/flutter_colorpicker.dart';
// import 'package:file_picker/file_picker.dart';

// class MyFilePickerWidget extends StatefulWidget {
//   final void Function(String?) onFilePicked;

//   MyFilePickerWidget({required this.onFilePicked});

//   @override
//   _MyFilePickerWidgetState createState() => _MyFilePickerWidgetState();
// }

// class _MyFilePickerWidgetState extends State<MyFilePickerWidget> {
//   String? selectedFilePath;

//   //method pickfile
//   Future<void> pickFile() async {
//     try {
//       final result = await FilePicker.platform.pickFiles(
//         type: FileType.custom, // Tipe file yang diizinkan (bisa disesuaikan)
//         allowedExtensions: [
//           'pdf',
//           'jpg',
//           'png',
//           'doc'
//         ], // Ekstensi file yang diizinkan
//       );

//       if (result != null) {
//         setState(() {
//           selectedFilePath = result.files.single.path;
//         });
//         widget.onFilePicked(
//             selectedFilePath); // Memanggil callback dengan path file yang dipilih
//       }
//     } catch (e) {
//       // ignore: avoid_print
//       print(
//           'Error picking file: $e'); //jika file tidak sesuai format maka akan muncul pesan ini
//     }
//     var C = _MyTextWidgetState();
//     C.submitForm();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Center(
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: <Widget>[
//           Container(
//             width: 102.0, // Lebar tombol
//             height: 40.0, // Tinggi tombol
//             child: ElevatedButton(
//               child: const Text('Pilih File'),
//               onPressed: () {
//                 // Panggil fungsi untuk memilih file saat tombol ditekan
//                 pickFile();
//               },
//             ),
//           ),
//           // const SizedBox(height: 15),
//           // if (selectedFilePath != null)
//           //   Text(
//           //       'File yang Dipilih: $selectedFilePath'), //memprint path file yang dipilih
//         ],
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
// import 'package:intl/intl.dart';
// import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:file_picker/file_picker.dart';
import '../model/data_provider.dart';

//
class MyFilePickerWidget extends StatefulWidget {
  final void Function(String?) onFilePicked;

  MyFilePickerWidget({required this.onFilePicked});

  @override
  _MyFilePickerWidgetState createState() => _MyFilePickerWidgetState();
}

class _MyFilePickerWidgetState extends State<MyFilePickerWidget> {
  String? selectedFilePath;

  // Metode pickfile
  Future<void> pickFile(DataProvider dataProvider) async {
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

        // Memperbarui DataProvider dengan informasi path file yang dipilih
        dataProvider.updateSelectedFilePath(selectedFilePath);
      }
    } catch (e) {
      // ignore: avoid_print
      print(
          'Error picking file: $e'); // Jika file tidak sesuai format maka akan muncul pesan ini
    }
  }

  @override
  Widget build(BuildContext context) {
    final dataProvider =
        Provider.of<DataProvider>(context); // Konsumsi DataProvider

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
                pickFile(dataProvider);
              },
            ),
          ),
          // const SizedBox(height: 15),
          // if (selectedFilePath != null)
          //   Text(
          //       'File yang Dipilih: $selectedFilePath'), // Memprint path file yang dipilih
        ],
      ),
    );
  }
}
