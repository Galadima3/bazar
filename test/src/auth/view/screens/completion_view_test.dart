import 'package:bazar/features/auth/presentation/view/completion_view.dart';
import 'package:bazar/features/auth/presentation/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  Widget createTestWidget() => const MaterialApp(home: CompletionView(isPasswordReset: false,));

  group('CompletionView Widget Tests', () {
    testWidgets('displays all expected UI elements', (tester) async {
      await tester.pumpWidget(createTestWidget());

      expect(find.byType(Column), findsOneWidget);
      expect(find.byType(Image), findsOneWidget);
      expect(find.byType(SizedBox), findsWidgets);
      expect(find.text('Congratulations!'), findsOneWidget);
      expect(
        find.text('Your account is complete, please enjoy the best menu from us.'),
        findsOneWidget,
      );
      expect(find.byType(CustomButton), findsOneWidget);
      expect(find.text('Get Started'), findsOneWidget);
    });
  });

  group('CustomButton Tests', () {
    testWidgets('tapping Get Started button triggers callback', (tester) async {
      bool tapped = false;

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: CustomButton(
              buttonText: 'Get Started',
              onTap: () {
                tapped = true;
              },
            ),
          ),
        ),
      );

      expect(tapped, isFalse);

      await tester.tap(find.text('Get Started'));
      await tester.pump();

      expect(tapped, isTrue);
    });
  });
}
