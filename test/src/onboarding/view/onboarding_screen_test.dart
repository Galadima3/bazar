import 'package:bazar/main.dart';
import 'package:bazar/features/onboarding/view/intro_screen.dart';
import 'package:bazar/features/onboarding/view/onboarding_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

void main() {
  Widget createTestWidget() => const MaterialApp(home: OnboardingScreen());

  // Optional constants for test reuse
  const introTitle = 'Now reading will be easier';
  const introSubtitle =
      'Discover new worlds, join a vibrant reading community. Start your reading adventure effortlessly with us.';
  const lastTitle = 'Start your adventure';

  group('MyApp startup tests', () {
    testWidgets('should render OnboardingScreen when hasSeenOnboarding is true', (WidgetTester tester) async {
      await tester.pumpWidget(const MyApp());

      expect(find.byType(OnboardingScreen), findsOneWidget);
    });
  });

  group('OnboardingScreen UI & interaction tests', () {
    testWidgets('should render intro content and skip button on first page', (WidgetTester tester) async {
      await tester.pumpWidget(createTestWidget());

      // Verify PageView exists
      expect(find.byType(PageView), findsOneWidget);

      // First IntroScreen should be active
      expect(find.byType(IntroScreen), findsOneWidget);

      // Texts
      expect(find.text(introTitle), findsOneWidget);
      expect(find.text(introSubtitle), findsOneWidget);

      // Asset image should exist (not testing asset path due to test environment)
      expect(find.byType(Image), findsWidgets); // Use findsWidgets for flexibility

      // Skip button
      expect(find.text('Skip'), findsOneWidget);

      // Smooth page indicator exists
      expect(find.byType(SmoothPageIndicator), findsOneWidget);
    });

    testWidgets('pressing Skip button jumps to final onboarding page', (WidgetTester tester) async {
      await tester.pumpWidget(createTestWidget());

      expect(find.text('Skip'), findsOneWidget);

      // Tap Skip
      await tester.tap(find.text('Skip'));
      await tester.pumpAndSettle(const Duration(seconds: 1));

      // Final screen appears
      expect(find.text(lastTitle), findsOneWidget);

      // Skip button gone
      expect(find.text('Skip'), findsNothing);
    });

    testWidgets('swiping to last page hides Skip button', (WidgetTester tester) async {
      await tester.pumpWidget(createTestWidget());

      final pageView = find.byType(PageView);

      // Swipe twice to last page
      await tester.fling(pageView, const Offset(-400, 0), 1000);
      await tester.pumpAndSettle();
      await tester.fling(pageView, const Offset(-400, 0), 1000);
      await tester.pumpAndSettle();

      // Verify last page content
      expect(find.text(lastTitle), findsOneWidget);

      // Skip button no longer shown
      expect(find.text('Skip'), findsNothing);
    });
  });
}
