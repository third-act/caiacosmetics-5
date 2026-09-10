import 'package:caiacosmetics_5/main.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('CAIA app launches splash', (WidgetTester tester) async {
    await tester.pumpWidget(const CaiaApp());
    expect(find.text('Din hud, dina produkter'), findsOneWidget);
    await tester.pump(const Duration(seconds: 2));
  });
}
