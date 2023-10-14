import 'package:apk_materi_16/view/color_ui.dart';
import 'package:apk_materi_16/view/date_ui.dart';
import 'package:apk_materi_16/view/file_ui.dart';
import 'package:apk_materi_16/view/list-ui.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';
import 'package:apk_materi_16/viewmodel/main.dart';

void main() {
  testWidgets('Test UI Widgets', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(MyApp());

    // Memastikan widget sudah dimuat sebelum diuji
    await tester.pumpAndSettle();

    // Menutup Drawer dengan mengetuk di luar Drawer
    final draweOpeningIcon = find.byTooltip('Open navigation menu');
    expect(draweOpeningIcon, findsOneWidget);
    await tester.tap(draweOpeningIcon);
    await tester.pumpAndSettle();

    // Mengecek apakah AppBar ada
    expect(find.byType(AppBar), findsOneWidget);

    // Mengecek apakah ListTile dengan teks "Contacts" ada
    expect(find.widgetWithText(ListTile, 'Contacts'), findsOneWidget);

    // Mengecek apakah ListTile dengan teks "Grid Image" ada
    expect(find.widgetWithText(ListTile, 'Grid Image'), findsOneWidget);

    // Mengecek apakah widget "Soal Prioritas 2" ada
    expect(find.text('Soal Prioritas 2'), findsOneWidget);

    // Mengecek apakah widget "Color Picker" ada
    expect(find.text('Color Picker'), findsOneWidget);

    // Mengecek apakah widget "File Picker" ada
    expect(find.text('File Picker'), findsOneWidget);

    // Mengecek apakah widget "List Contact" ada
    expect(find.text('List Contact'), findsOneWidget);

    // Mengecek apakah widget "Submit" ada
    expect(find.text('Submit'), findsOneWidget);

    // Mengecek apakah widget "Date Picker" ada
    expect(find.byType(MyDatePickerWidget), findsOneWidget);

    // Mengecek apakah widget "Color Picker" ada
    expect(find.byType(MyColorPickerWidget), findsOneWidget);

    // Mengecek apakah widget "File Picker" ada
    expect(find.byType(MyFilePickerWidget), findsOneWidget);

    // Mengecek apakah widget "List Contact" ada
    expect(find.byType(ListContact), findsOneWidget);
  });
}
