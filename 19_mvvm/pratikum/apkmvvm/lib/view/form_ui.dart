import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../model/data_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Body1 extends StatefulWidget {
  const Body1({super.key});

  @override
  State<Body1> createState() => _Body1State();
}

class _Body1State extends State<Body1> {
  var inputText1 = '';
  var inputText2 = '';

  @override
  Widget build(BuildContext context) {
    final dataProvider = Provider.of<DataProvider>(context);

    return Container(
      margin: const EdgeInsets.only(top: 18, right: 20, left: 20),
      child: Center(
        child: Column(
          children: <Widget>[
            const SizedBox(height: 30.0),
            UsernameDisplay(),
            const SizedBox(height: 15.0),
            const Icon(
              Icons.mobile_friendly,
              size: 30.0,
              color: Color.fromARGB(255, 68, 60, 60),
            ),
            const SizedBox(height: 16.0),
            const Text(
              'Create New Contacts',
              style: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20.0),
            const SizedBox(
              width: double.infinity,
              child: Padding(
                padding: EdgeInsets.only(left: 30.0, right: 20),
                child: Text(
                  'A dialog is a type of modal window that appears in front of app content to provide critical information, or prompt for a decision to be made.',
                  style: TextStyle(
                    fontSize: 16.0,
                    color: Colors.grey,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
            Container(
              width: 430,
              color: const Color(0xFFE7E0EC),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  const Padding(
                    padding:
                        EdgeInsets.symmetric(vertical: 3.0, horizontal: 16.0),
                    child: Text(
                      'Name',
                      style: TextStyle(
                        fontSize: 18.0,
                      ),
                    ),
                  ),
                  TextField(
                    onChanged: (nama) {
                      setState(() {
                        inputText1 = nama;
                        dataProvider.name(inputText1);
                      });
                    },
                    decoration: const InputDecoration(
                      hintText: '    Insert Your Name',
                      border: UnderlineInputBorder(),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16.0),
            Container(
              width: 430,
              color: const Color(0xFFE7E0EC),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  const Padding(
                    padding:
                        EdgeInsets.symmetric(vertical: 3.0, horizontal: 16.0),
                    child: Text(
                      'Number HandPhone',
                      style: TextStyle(
                        fontSize: 16.0,
                      ),
                    ),
                  ),
                  TextField(
                    onChanged: (nomor) {
                      setState(() {
                        inputText2 = nomor;
                        dataProvider.NoHp(inputText2);
                      });
                    },
                    decoration: const InputDecoration(
                      hintText: '    +62...',
                      border: UnderlineInputBorder(),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class UsernameDisplay extends StatelessWidget {
  Future<String> getUsernameFromSharedPreferences() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString('username') ?? ''; // Mengambil username (jika ada)
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<String>(
      // FutureBuilder digunakan untuk mengambil username dari SharedPreferences
      future:
          getUsernameFromSharedPreferences(), // Gantilah ini sesuai dengan fungsi Anda untuk mendapatkan username
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const CircularProgressIndicator(); // Menampilkan loading jika masih menunggu data
        } else if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}');
        } else {
          final username =
              snapshot.data ?? ''; // Mengambil data username (jika tersedia)
          return Text(
            'Username : $username', // Menampilkan username di sini
          );
        }
      },
    );
  }
}
