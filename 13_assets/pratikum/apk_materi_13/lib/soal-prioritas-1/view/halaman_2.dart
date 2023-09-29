import 'package:flutter/material.dart';

class NewPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Halaman Baru'),
      ),
      body: const Center(
        child: Text('Ini adalah halaman baru!'),
      ),
    );
  }
}
