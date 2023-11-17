import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import '../model/data_provider.dart';

class MyColorPickerWidget extends StatefulWidget {
  @override
  _MyColorPickerWidgetState createState() => _MyColorPickerWidgetState();
}

class _MyColorPickerWidgetState extends State<MyColorPickerWidget> {
  @override
  Widget build(BuildContext context) {
    final dataProvider =
        Provider.of<DataProvider>(context); // Konsumsi DataProvider

    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Container(
            width: 500.0,
            height: 100.0,
            color: dataProvider
                .selectedColor, // Gunakan selectedColor dari DataProvider
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
                        pickerColor: dataProvider
                            .selectedColor, // Gunakan selectedColor dari DataProvider
                        onColorChanged: (color) {
                          // Memanggil metode DataProvider untuk mengubah warna
                          dataProvider.updateSelectedColor(color);
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
