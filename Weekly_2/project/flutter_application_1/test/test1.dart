import 'package:flutter/material.dart';
import 'package:flutter_application_1/kenapa_muda-apk/view/box-view.dart';
import 'package:flutter_application_1/kenapa_muda-apk/viewmodel/main.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('Test UI Widgets', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(MyApp());

    // Verify that the AppBar text is correctly rendered.
    expect(find.text('ES kenapa muda'), findsOneWidget);

    // Open the drawer.
    final drawerIcon = find.byTooltip('Open navigation menu');
    expect(drawerIcon, findsOneWidget);
    await tester.tap(drawerIcon);
    await tester.pumpAndSettle();

    // Verify that the drawer contains the expected items.
    expect(find.text('About Us'), findsOneWidget);
    expect(find.text('Contact Us'), findsOneWidget);
    expect(find.text('Login'), findsOneWidget);

    // Close the drawer.
    await tester.tapAt(Offset(0, 0));
    await tester.pumpAndSettle();

    // Verify that the content of BoxView and ContactUsBar are rendered.
    expect(find.byType(BoxView), findsOneWidget);
    expect(find.byKey(ValueKey('contactUsBar')), findsOneWidget);

    // Add more test cases as needed for other widgets in the app.
  });
}
