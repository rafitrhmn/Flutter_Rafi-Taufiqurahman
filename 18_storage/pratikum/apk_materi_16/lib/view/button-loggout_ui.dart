import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import '../model/data_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoggoutButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // final dataProvider = Provider.of<DataProvider>(context);

    void _logout() async {
      // Hapus informasi login dari SharedPreferences
      SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.remove('isLoggedIn');
      prefs.remove('username'); // Hapus username jika perlu

      // Navigasi kembali ke halaman login
      // ignore: use_build_context_synchronously
      Navigator.pushReplacementNamed(
          context, '/'); // Ganti '/' dengan rute halaman login yang benar
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
          onTap: _logout,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 3),
            child: const Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'Loggout',
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}
