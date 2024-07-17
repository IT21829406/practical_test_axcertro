import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';
import 'package:test_axcertro/favorites_provider.dart';
import 'package:test_axcertro/home_screen.dart';

void main() {
  testWidgets('HomeScreen displays items and handles favorites', (WidgetTester tester) async {
    await tester.pumpWidget(
      ChangeNotifierProvider(
        create: (context) => FavoritesProvider(),
        child: MaterialApp(
          home: HomeScreen(),
        ),
      ),
    );

    await tester.pumpAndSettle();

    expect(find.byType(ListTile), findsWidgets);
    expect(find.byIcon(Icons.star_border), findsWidgets);

    await tester.tap(find.byIcon(Icons.star_border).first);
    await tester.pumpAndSettle();

    expect(find.byIcon(Icons.star), findsOneWidget);
  });
}
