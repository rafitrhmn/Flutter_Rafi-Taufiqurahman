import 'package:apk_materi_16/view/button_ui.dart';
import 'package:apk_materi_16/view/list-ui.dart';
import 'package:apk_materi_16/view/form_ui.dart';
import 'package:apk_materi_16/view/date_ui.dart';
import 'package:apk_materi_16/view/color_ui.dart';
import 'package:apk_materi_16/view/file_ui.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:apk_materi_16/viewmodel/halaman2.dart';
import '../model/data_bloc.dart'; // Impor DataBloc

void main(List<String> args) {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<DataBloc>(
      create: (context) => DataBloc(), // Buat instance DataBloc
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
  // Membuat instance DataBloc
  final DataBloc dataBloc = DataBloc();

  @override
  void dispose() {
    // Jangan lupa untuk memanggil dispose pada DataBloc
    dataBloc.dispose();
    super.dispose();
  }

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
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: const Text('Grid Image'),
              onTap: () {
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
            // Memasukkan Body1 dan widget lainnya
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
              onFilePicked: (filePath) {
                // Memperbarui selectedFilePath pada DataBloc
                dataBloc.updateSelectedFilePath(filePath);
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

            // Menggunakan ListContact dengan DataBloc
            ListContact(),
          ],
        ),
      ),
    );
  }
}
