import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import '../model/data_bloc.dart'; // Pastikan Anda mengimpor DataBloc yang sesuai

class MyColorPickerWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final dataBloc = DataBloc(); // Menggunakan DataBloc

    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Container(
            width: 500.0,
            height: 100.0,
            color:
                dataBloc.selectedColor, // Gunakan selectedColor dari DataBloc
          ),
          const SizedBox(
            height: 9.0,
          ),
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
                        pickerColor: dataBloc
                            .selectedColor, // Gunakan selectedColor dari DataBloc
                        onColorChanged: (color) {
                          // Memanggil metode DataBloc untuk mengubah warna
                          dataBloc.updateSelectedColor(color);
                        },
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
