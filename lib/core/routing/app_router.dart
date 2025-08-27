import 'package:bazar/core/routing/route_paths.dart';
import 'package:bazar/core/routing/scaffold_with_navbar.dart';
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
import 'package:bazar/features/auth/service/auth_service.dart';
import 'package:bazar/features/cart/presentation/view/cart_view.dart';
import 'package:bazar/features/cart/presentation/view/confirm_order_view.dart';
import 'package:bazar/features/category/presentation/views/category_view.dart';
import 'package:bazar/features/home/models/book.dart';
import 'package:bazar/features/home/presentation/view/authors_view.dart';
import 'package:bazar/features/home/presentation/view/home_view.dart';
import 'package:bazar/features/home/presentation/view/notification_detail_view.dart';
import 'package:bazar/features/home/presentation/view/notifications_view.dart';
import 'package:bazar/features/home/presentation/view/vendor_view.dart';
import 'package:bazar/features/onboarding/service/onboarding_service.dart';
import 'package:bazar/features/onboarding/view/onboarding_screen.dart';
import 'package:bazar/features/profile/presentation/views/favorite_view.dart';
import 'package:bazar/features/profile/presentation/views/help_center_view.dart';
import 'package:bazar/features/profile/presentation/views/location_view.dart';
import 'package:bazar/features/profile/presentation/views/my_account_view.dart';
import 'package:bazar/features/profile/presentation/views/offers_promo_view.dart';
import 'package:bazar/features/profile/presentation/views/order_history_view.dart';
import 'package:bazar/features/profile/presentation/views/profile_view.dart';
import 'package:go_router/go_router.dart';

class AppRouter {
  static Future<GoRouter> create() async {
    final seen = await OnboardingService.hasSeenOnboarding();

    return GoRouter(
      initialLocation: seen ? RoutePaths.home : RoutePaths.onboarding,
      redirect: (context, state) async {
        final isLoggedIn = await AuthService.checkUserAuthStatus();
        final currentPath = state.matchedLocation;

        // If onboarding hasn't been seen, redirect to onboarding
        if (!seen && currentPath != RoutePaths.onboarding) {
          return RoutePaths.onboarding;
        }

        // Define paths that require authentication (main app routes)
        final protectedPaths = [
          RoutePaths.home,
          RoutePaths.category,
          RoutePaths.cart,
          RoutePaths.profile,
        ];

        // Only redirect to login if onboarding has been seen AND user is not logged in
        if (seen && !isLoggedIn && protectedPaths.contains(currentPath)) {
          return RoutePaths.login;
        }

        // If user is logged in and on login page, redirect to home
        if (isLoggedIn && currentPath == RoutePaths.login) {
          return RoutePaths.home;
        }

        return null; // No redirect needed
      },
      routes: [
        /// ====== Main App Shell (with BottomNav) ======
        StatefulShellRoute.indexedStack(
          builder: (context, state, navigationShell) {
            return ScaffoldWithNavBar(navigationShell: navigationShell);
          },
          branches: [
            // Home Branch
            StatefulShellBranch(
              routes: [
                GoRoute(
                  path: RoutePaths.home,
                  pageBuilder: (context, state) =>
                      const NoTransitionPage(child: HomeScreen()),
                ),
              ],
            ),
            // Category Branch
            StatefulShellBranch(
              routes: [
                GoRoute(
                  path: RoutePaths.category,
                  pageBuilder: (context, state) =>
                      const NoTransitionPage(child: CategoryView()),
                ),
              ],
            ),
            // Cart Branch
            StatefulShellBranch(
              routes: [
                GoRoute(
                  path: RoutePaths.cart,
                  pageBuilder: (context, state) =>
                      const NoTransitionPage(child: CartView()),
                ),
              ],
            ),
            // Profile Branch
            StatefulShellBranch(
              routes: [
                GoRoute(
                  path: RoutePaths.profile,
                  pageBuilder: (context, state) =>
                      const NoTransitionPage(child: ProfileView()),
                ),
              ],
            ),
          ],
        ),

        /// ====== Authentication Routes (Outside Shell) ======
        GoRoute(
          path: RoutePaths.onboarding,
          builder: (context, state) => const OnboardingScreen(),
        ),
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

        /// ====== Password Recovery Routes ======
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

        /// ====== Completion View ======
        GoRoute(
          path: RoutePaths.completionView,
          builder: (context, state) {
            final isPasswordReset = state.extra as bool;
            return CompletionView(isPasswordReset: isPasswordReset);
          },
        ),

        // ======= Home Views ========
        GoRoute(
          path: RoutePaths.vendors,
          builder: (context, state) => const VendorView(),
        ),
        GoRoute(
          path: RoutePaths.authors,
          builder: (context, state) => const AuthorsView(),
        ),
         GoRoute(
          path: RoutePaths.notifications,
          builder: (context, state) => const NotificationsView(),
        ),
        GoRoute(
          path: RoutePaths.notificationDetail,
          builder: (context, state) => const NotificationDetailView(),
        ),

        /// ====== Cart Views ======
        GoRoute(
          path: RoutePaths.confirmOrder,
          builder: (context, state) {
            final orderedBooks = state.extra as List<Book>;
            return ConfirmOrderView(orders: orderedBooks,);
          },
        ),

        // ======= Profile Views ========
        GoRoute(
          path: RoutePaths.myAccount,
          builder: (context, state) => const MyAccountView(),
        ),
        GoRoute(
          path: RoutePaths.address,
          builder: (context, state) => const LocationView(),
        ),
        GoRoute(
          path: RoutePaths.offersPromo,
          builder: (context, state) => const OffersPromoView(),
        ),
        GoRoute(
          path: RoutePaths.favourites,
          builder: (context, state) => const FavoriteView(),
        ),
        GoRoute(
          path: RoutePaths.orderHistory,
          builder: (context, state) => const OrderHistoryView(),
        ),
        GoRoute(
          path: RoutePaths.helpCenter,
          builder: (context, state) => const HelpCenterView(),
        ),
      ],
    );
  }
}
