import 'package:apk_materi_16/viewmodel/main-soal-prioritas-2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('Testing UI elements', (WidgetTester tester) async {
    await tester.pumpWidget(MyApp());

    final draweOpeningIcon = find.byTooltip('Open navigation menu');
    expect(draweOpeningIcon, findsOneWidget);
    await tester.tap(draweOpeningIcon);
    await tester.pumpAndSettle();

    expect(find.text('Soal Prioritas 2'), findsOneWidget); // Cek judul AppBar
    expect(find.text('Drawer'), findsOneWidget); // Cek teks Drawer
    expect(find.text('Home'), findsOneWidget); // Cek teks 'Home' di drawer
    expect(
        find.text('Settings'), findsOneWidget); // Cek teks 'Settings' di drawer
    expect(find.text('Hai'), findsOneWidget); // Cek teks di tengah layar

    // Lakukan simulasi tap pada menu drawer
    await tester.tap(find.text('Settings'));
    await tester.pump();

    // Pastikan bahwa aksi yang diharapkan dari item drawer dilakukan dengan benar
    // Misalnya, cek perpindahan halaman atau perubahan state
  });
}
