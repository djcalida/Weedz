// Wedzz Mobile App Widget Tests

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:wedzz_mobile/main.dart';

void main() {
  testWidgets('App loads successfully', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const WedzzApp());

    // Verify that the bottom navigation bar is present
    expect(find.byType(BottomNavigationBar), findsOneWidget);

    // Verify that home navigation item exists
    expect(find.text('Home'), findsOneWidget);
    expect(find.text('Shop'), findsOneWidget);
    expect(find.text('Cart'), findsOneWidget);
    expect(find.text('Profile'), findsOneWidget);
  });
}
