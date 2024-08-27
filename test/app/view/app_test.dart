import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('App', () {
    testWidgets('renders Scaffold', (tester) async {
      // await tester.pumpWidget(const App(apiRepository: null,));
      expect(find.byType(Scaffold), findsOneWidget);
    });
  });
}
