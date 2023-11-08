import 'package:apk_materi_11/soal-prioritas-2.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('Test Submit Button', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(MyApp());

    // Find and tap the submit button.
    await tester.tap(find.text('Submit'));

    // Wait for the widget to rebuild.
    await tester.pump();

    // Expect that the UI has changed as expected.
    expect(find.text('List Contact'), findsOneWidget);
  });
}
