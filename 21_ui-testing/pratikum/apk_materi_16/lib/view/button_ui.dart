// // import 'package:flutter/material.dart';

// // class Buttonbar extends StatelessWidget {
// //   final VoidCallback
// //       onPressed; // Fungsi yang akan dipanggil saat tombol ditekan

// //   Buttonbar({required this.onPressed});

// //   @override
// //   Widget build(BuildContext context) {
// //     return Align(
// //       alignment: Alignment.topRight,
// //       child: Container(
// //         width: 94,
// //         height: 30,
// //         clipBehavior: Clip.antiAlias,
// //         decoration: ShapeDecoration(
// //           color: const Color(0xFF6750A4),
// //           shape: RoundedRectangleBorder(
// //             borderRadius: BorderRadius.circular(30),
// //           ),
// //         ),
// //         child: InkWell(
// //           // Gunakan InkWell untuk memberikan efek ketika tombol ditekan
// //           onTap: onPressed, // Panggil fungsi onPressed saat tombol ditekan
// //           child: Container(
// //             padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 3),
// //             child: const Row(
// //               mainAxisSize: MainAxisSize.min,
// //               mainAxisAlignment: MainAxisAlignment.center,
// //               crossAxisAlignment: CrossAxisAlignment.center,
// //               children: [
// //                 Text(
// //                   'Submit',
// //                   textAlign: TextAlign.center,
// //                   style: TextStyle(
// //                     color: Colors.white,
// //                     fontSize: 14,
// //                     fontFamily: 'Roboto',
// //                     fontWeight: FontWeight.w500,
// //                     height: 0.10,
// //                     letterSpacing: 0.10,
// //                   ),
// //                 ),
// //               ],
// //             ),
// //           ),
// //         ),
// //       ),
// //     );
// //   }
// // }

// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import '../model/data.dart'; // Gantilah dengan import yang sesuai

// class Buttonbar extends StatelessWidget {
//   final VoidCallback
//       onPressed; // Fungsi yang akan dipanggil saat tombol ditekan

//   Buttonbar({required this.onPressed});

//   @override
//   Widget build(BuildContext context) {
//     final dataProvider =
//         Provider.of<DataProvider>(context); // Konsumsi DataProvider

//     return Align(
//       alignment: Alignment.topRight,
//       child: Container(
//         width: 94,
//         height: 30,
//         clipBehavior: Clip.antiAlias,
//         decoration: ShapeDecoration(
//           color: const Color(0xFF6750A4),
//           shape: RoundedRectangleBorder(
//             borderRadius: BorderRadius.circular(30),
//           ),
//         ),
//         child: InkWell(
//           // Gunakan InkWell untuk memberikan efek ketika tombol ditekan
//           onTap: () {
//             // Panggil fungsi onPressed saat tombol ditekan
//             onPressed();

//           },
//           child: Container(
//             padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 3),
//             child: const Row(
//               mainAxisSize: MainAxisSize.min,
//               mainAxisAlignment: MainAxisAlignment.center,
//               crossAxisAlignment: CrossAxisAlignment.center,
//               children: [
//                 Text(
//                   'Submit',
//                   textAlign: TextAlign.center,
//                   style: TextStyle(
//                     color: Colors.white,
//                     fontSize: 14,
//                     fontFamily: 'Roboto',
//                     fontWeight: FontWeight.w500,
//                     height: 0.10,
//                     letterSpacing: 0.10,
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../model/data_provider.dart';

class SubmitButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // final dataProvider = Provider.of<DataProvider>(context);

    void onPressed() {
      final dataProvider = Provider.of<DataProvider>(context, listen: false);

      // Mengambil data dari view 1
      String? Nama = dataProvider
          .nama; // Sesuaikan dengan cara Anda mengakses input dari view 1

      // Mengambil data dari view 2
      String? NoHp = dataProvider
          .nohp; // Sesuaikan dengan cara Anda mengakses input dari view 2

      // Mengambil data dari view 3
      DateTime selectedDate = dataProvider
          .selectedDate; // Sesuaikan dengan cara Anda mengakses tanggal dari view 3

      // Mengambil data dari view 4
      Color selectedColor = dataProvider
          .selectedColor; // Sesuaikan dengan cara Anda mengakses warna dari view 4
      String? selectedFilePath = dataProvider
          .selectedFilePath; // Sesuaikan dengan cara Anda mengakses path file dari view 4

      Data newData = Data(
        nama: Nama,
        nohp: NoHp,
        selectedDate: selectedDate,
        selectedColor: selectedColor,
        selectedFilePath: selectedFilePath,
      );

      // Menambahkan data baru ke dalam list data yang dikelola oleh DataProvider
      dataProvider.addData(newData);
    }

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
          onTap: onPressed,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 3),
            child: const Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  child: Text(
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
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
