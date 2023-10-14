import 'package:apk_materi_16/view/button_ui.dart';
import 'package:apk_materi_16/view/list-ui.dart';
import 'package:apk_materi_16/view/form_ui.dart';
import 'package:apk_materi_16/view/date_ui.dart';
import 'package:apk_materi_16/view/color_ui.dart';
import 'package:apk_materi_16/view/file_ui.dart';
import 'package:apk_materi_16/viewmodel/halaman2.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../model/data_provider.dart';

void main(List<String> args) {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => DataProvider(), // Buat DataProvider
      child: MaterialApp(
        home: HomePage(),
      ),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePage createState() => _HomePage();
}

class _HomePage extends State<HomePage> {
  // //variabel class _mytextwidgetstate
  // String inputText1 = '';
  // String inputText2 = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Soal Prioritas 2'),
      ),
      drawer: Drawer(
        child: ListView(
          children: <Widget>[
            ListTile(
              title: const Text('Contacts'),
              onTap: () {
                // Aksi yang akan diambil ketika Menu 1 diklik
                // Misalnya, pindah ke halaman lain
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: const Text('Grid Image'),
              onTap: () {
                // Aksi yang akan diambil ketika Menu 2 diklik
                // Misalnya, pindah ke halaman lain
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (BuildContext context) => MyApp2(),
                  ),
                );
              },
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            const Body1(),
            const SizedBox(height: 28.0),
            MyDatePickerWidget(),
            const SizedBox(height: 10),
            const Text(
              'Color Picker',
              style: TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 16),
            MyColorPickerWidget(),
            const SizedBox(height: 10),
            const Text(
              'File Picker',
              style: TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 16),
            MyFilePickerWidget(
              // Memanggil class file picker
              onFilePicked: (filePath) {
                final dataProvider =
                    Provider.of<DataProvider>(context, listen: false);
                dataProvider.updateSelectedFilePath(filePath);
              },
            ),
            const SizedBox(
              height: 28,
            ),
            SubmitButton(),
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
            ListContact(),
          ],
        ),
      ),
    );
  }
}
