import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
// import 'package:provider/provider.dart';
import '../model/data_bloc.dart';

class MyDatePickerWidget extends StatefulWidget {
  @override
  _MyDatePickerWidgetState createState() => _MyDatePickerWidgetState();
}

class _MyDatePickerWidgetState extends State<MyDatePickerWidget> {
  DateTime selectedDate = DateTime.now();
  String? selectedFilePath;

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

      // Akses dataBloc menggunakan Provider
      final dataBloc = DataBloc(); // Menggunakan DataBloc

      // Kirim data yang dipilih ke dataBloc
      dataBloc.updateSelectedDate(selectedDate);

      // Selanjutnya, Anda dapat melakukan apa yang diperlukan dengan data yang dipilih
      // misalnya, memperbarui tampilan sesuai dengan tanggal yang dipilih
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
              'Tanggal yang Dipilih: ${DateFormat('dd/MM/yyyy').format(selectedDate)}',
              style: const TextStyle(fontSize: 13.5),
            ),
          ],
        ),
      ),
    );
  }
}
