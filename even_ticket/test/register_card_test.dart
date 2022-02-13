import 'package:even_ticket/widgets/auth_widgets/register_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('Pass data from input boxes to DB', (WidgetTester tester) async {
    await tester.pumpWidget(const RegisterCard());

    await tester.enterText(find.byType(TextField), 'John');
  });
}
