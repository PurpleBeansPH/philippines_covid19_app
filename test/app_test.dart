import 'package:flutter_test/flutter_test.dart';
import 'package:philippinescovid19app/main.dart';

void main() {
  testWidgets('app should work', (tester) async {
    await tester.pumpWidget(new MyApp());
    expect(find.text('Philippines nCov App'), findsOneWidget);
  });
}