import 'package:bazar/core/routing/route_paths.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class IntroScreen extends StatelessWidget {
  final String text;
  final String subtext;
  final String imagePath;

  const IntroScreen({
    super.key,
    required this.text,
    required this.subtext,
    required this.imagePath,
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          children: [
            const SizedBox(height: 90),

            Image.asset(imagePath, height: 280, fit: BoxFit.contain),

            const SizedBox(height: 14),
            Text(
              text,
              style: textTheme.headlineMedium?.copyWith(fontSize: 20),
              textAlign: TextAlign.center,
            ),

            const SizedBox(height: 12),

            Text(
              subtext,
              style: textTheme.bodyLarge?.copyWith(
                fontSize: 15,
                color: Colors.grey,
              ),
              textAlign: TextAlign.center,
            ),

            const SizedBox(height: 68),
            // Continue Button
            SizedBox(
              width: 327,
              height: 56,
              child: ElevatedButton(
                onPressed: () {},
                child: Text(
                  "Get Started",
                  style: textTheme.headlineSmall?.copyWith(color: Colors.white),
                ),
              ),
            ),

            const SizedBox(height: 12),

            // Sign In Button
            SizedBox(
              width: 327,
              height: 56,
              child: OutlinedButton(
                onPressed: () => context.push(RoutePaths.login),
                style: OutlinedButton.styleFrom(
                  side: const BorderSide(color: Color(0xff564290)),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: Text(
                  "Sign in",
                  style: textTheme.headlineSmall?.copyWith(
                    color: Color(0xff564290),
                  ),
                ),
              ),
            ),

            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }
}


/* 
@override
Widget build(BuildContext context) {
  return SafeArea(
    child: LayoutBuilder(
      builder: (context, constraints) {
        return SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: ConstrainedBox(
            constraints: BoxConstraints(minHeight: constraints.maxHeight),
            child: IntrinsicHeight(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      const SizedBox(height: 90),
                      Image.asset(imagePath, height: 280, fit: BoxFit.contain),
                      const SizedBox(height: 40),
                      Text(
                        text,
                        style: Theme.of(context).textTheme.headlineMedium,
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 12),
                      Text(
                        subtext,
                        style: Theme.of(context)
                            .textTheme
                            .bodyLarge
                            ?.copyWith(fontSize: 15, color: Colors.grey),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      SizedBox(
                        width: 327,
                        height: 56,
                        child: ElevatedButton(
                          onPressed: () {},
                          child: Text(
                            "Get Started",
                            style: Theme.of(context)
                                .textTheme
                                .bodyLarge
                                ?.copyWith(color: Colors.white, fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                      const SizedBox(height: 12),
                      SizedBox(
                        width: 327,
                        height: 56,
                        child: OutlinedButton(
                          onPressed: () => Navigator.of(context).push(
                            MaterialPageRoute(builder: (context) => const LoginView()),
                          ),
                          style: OutlinedButton.styleFrom(
                            side: const BorderSide(color: Color(0xff564290)),
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                          ),
                          child: Text(
                            "Sign in",
                            style: Theme.of(context)
                                .textTheme
                                .bodyLarge
                                ?.copyWith(color: const Color(0xff564290)),
                          ),
                        ),
                      ),
                      const SizedBox(height: 40),
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      },
    ),
  );
}


*/