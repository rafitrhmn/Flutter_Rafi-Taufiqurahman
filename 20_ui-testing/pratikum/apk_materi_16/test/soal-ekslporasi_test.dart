import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:apk_materi_16/viewmodel/main-soal-eksplorasi.dart';

void main() {
  testWidgets('Testing UI Elements', (WidgetTester tester) async {
    await tester.pumpWidget(MyApp());

    await tester.enterText(find.byKey(Key('nameField')), 'John Doe');
    expect(find.text('John Doe'), findsOneWidget);

    await tester.enterText(find.byKey(Key('phoneField')), '1234567890');
    expect(find.text('1234567890'), findsOneWidget);

    await tester.tap(find.byType(ElevatedButton));
    await tester.pumpAndSettle();
  });
}
