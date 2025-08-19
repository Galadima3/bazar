import 'package:bazar/features/onboarding/view/intro_screen.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController controller = PageController();
  static const int count = 3;
  bool onLastPage = false;

  void goToNextPage() {
    final currentPage = controller.page?.round() ?? 0;
    if (currentPage < count - 1) {
      controller.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeIn,
      );
    } else {
      Navigator.pushReplacementNamed(context, '/home');
    }
  }

  void skipToLastPage() {
    controller.animateToPage(
      count - 1,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeIn,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView(
            onPageChanged: (value) {
              setState(() {
                onLastPage = (value == count - 1);
              });
            },
            controller: controller,
            children: [
              IntroScreen(
                text: "Now reading will be easier",
                subtext:
                    "Discover new worlds, join a vibrant reading community. Start your reading adventure effortlessly with us.",
                imagePath: 'assets/images/onboarding_images/1.png',
              ),
              IntroScreen(
                text: "Your Bookish Soulmate awaits",
                subtext:
                    "Let us be your guide to the perfect read. Discover books tailored to your tastes for a truly rewarding experience",
                imagePath: 'assets/images/onboarding_images/2.png',
              ),
              IntroScreen(
                text: "Start your adventure",
                subtext:
                    "Ready to embark on a quest for inspiration and knowledge? Your adventure begins now. Let's Go!!",
                imagePath: 'assets/images/onboarding_images/3.png',
              ),
            ],
          ),
          Align(
            alignment: Alignment(0, 0.445),
            child: SmoothPageIndicator(
              controller: controller,
              count: count,
              effect: SlideEffect(
                radius: 5,
                dotWidth: 7.5,
                dotHeight: 7.5,
                spacing: 5,
              ),
            ),
          ),

          // Skip Button (Top Right)
          if (!onLastPage)
            Positioned(
              top: 48,
              left: 24,
              child: GestureDetector(
                onTap: skipToLastPage,
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 6,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(color: const Color(0xff564290)),
                  ),
                  child: Text(
                    'Skip',
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: Color(0xff564290),
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
