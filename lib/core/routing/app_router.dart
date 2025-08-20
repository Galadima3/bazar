import 'package:bazar/core/routing/route_paths.dart';
import 'package:bazar/features/auth/model/reset_method.dart';
import 'package:bazar/features/auth/presentation/view/auth/login_view.dart';
import 'package:bazar/features/auth/presentation/view/auth/sign_up_view.dart';
import 'package:bazar/features/auth/presentation/view/completion_view.dart';
import 'package:bazar/features/auth/presentation/view/password/new_password_view.dart';
import 'package:bazar/features/auth/presentation/view/password/password_recovery.dart';
import 'package:bazar/features/auth/presentation/view/password/password_reset_view.dart';
import 'package:bazar/features/auth/presentation/view/password/password_verification_view.dart';
import 'package:bazar/features/auth/presentation/view/verification/email_verification_view.dart';
import 'package:bazar/features/auth/presentation/view/verification/phone_input_view.dart';
import 'package:bazar/features/auth/presentation/view/verification/phone_verification_view.dart';
import 'package:bazar/features/auth/service/auth_controller.dart';
import 'package:bazar/features/home/presentation/home_screen.dart';
import 'package:bazar/features/onboarding/service/onboarding_service.dart';
import 'package:bazar/features/onboarding/view/onboarding_screen.dart';
import 'package:go_router/go_router.dart';

class AppRouter {
  static Future<GoRouter> create() async {
    final seen = await OnboardingService.hasSeenOnboarding();

    return GoRouter(
      initialLocation: seen ? RoutePaths.authController : RoutePaths.onboarding,
      routes: [
        // Home
        GoRoute(
          path: RoutePaths.home,
          builder: (context, state) => const HomeScreen(),
        ),

        // Onboarding
        GoRoute(
          path: RoutePaths.onboarding,
          builder: (context, state) => const OnboardingScreen(),
        ),

        // Auth
        GoRoute(
          path: RoutePaths.authController,
          builder: (context, state) => const AuthController(),
        ),
        GoRoute(
          path: RoutePaths.signup,
          builder: (context, state) => const SignUpView(),
        ),
        GoRoute(
          path: RoutePaths.login,
          builder: (context, state) => const LoginView(),
        ),
        GoRoute(
          path: RoutePaths.emailVerificationView,
          builder: (context, state) => const EmailVerificationView(),
        ),
        GoRoute(
          path: RoutePaths.phoneInputView,
          builder: (context, state) => const PhoneInputView(),
        ),
        GoRoute(
          path: RoutePaths.phoneVerificationView,
          builder: (context, state) => const PhoneVerificationView(),
        ),

        // Password flows
        GoRoute(
          path: RoutePaths.passwordRecoveryView,
          builder: (context, state) => const PasswordRecoveryView(),
        ),
        GoRoute(
          path: RoutePaths.newPassWordView,
          builder: (context, state) => const NewPasswordView(),
        ),
        GoRoute(
          path: "${RoutePaths.passwordResetViewBase}/:value",
          builder: (context, state) {
            final value = state.pathParameters["value"];
            return PasswordResetView(value: int.parse(value!));
          },
        ),
        GoRoute(
          path: RoutePaths.passwordVerificationView,
          builder: (context, state) {
            final userDetails = state.extra as ResetMethod;
            return PasswordVerificationView(userDetails: userDetails);
          },
        ),

        // Completion View
        GoRoute(
          path: RoutePaths.completionView,
          builder: (context, state) {
            final isPasswordReset = state.extra as bool;
            return CompletionView(isPasswordReset: isPasswordReset);
          },
        ),
      ],
    );
  }
}
