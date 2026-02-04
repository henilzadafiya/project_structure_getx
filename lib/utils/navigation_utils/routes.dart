
import 'package:get/get.dart';
import 'package:project_structure/modules/authentication/forgot_password/view/forgot_password.dart';
import 'package:project_structure/modules/authentication/forgot_password/view/reset_password.dart';
import 'package:project_structure/modules/authentication/get_verified/presentation/get_verified_screen.dart';
import 'package:project_structure/modules/authentication/view/sign_in_screen.dart';
import 'package:project_structure/modules/authentication/view/sign_up_screen.dart';
import 'package:project_structure/modules/dashboard/view/dashboard_screen.dart';
import 'package:project_structure/modules/onboarding_screen/presentation/onboarding_screen.dart';
import 'package:project_structure/modules/onboarding_screen/presentation/welcome_screen.dart';
import 'package:project_structure/modules/theme_screen/view/theme_screen.dart';
import 'package:project_structure/splash_screen.dart';

mixin Routes {
  static const defaultTransition = Transition.rightToLeft;

  // get started
  static const String splash = '/splash';
  static const String onboardingScreen = '/OnboardingScreen';
  static const String dashBoardScreen = '/DashBoardScreen';
  static const String welcomeScreen = '/WelcomeScreen';
  static const String signUp = '/signUp';
  static const String signIn = '/signIn';
  static const String forgotPasswordScreen = '/ForgotPasswordScreen';
  static const String resetPasswordScreen = '/ResetPasswordScreen';
  static const String getVerifiedScreen = '/GetVerifiedScreen';
  static const String themeScreen = '/ThemeScreen';


  static List<GetPage<dynamic>> pages = [
    GetPage<dynamic>(
      name: splash,
      page: () => const SplashScreen(),
      transition: defaultTransition,
    ),
    GetPage<dynamic>(
      name: onboardingScreen,
      page: () => OnboardingScreen(),
      transition: defaultTransition,
    ),
    GetPage<dynamic>(
      name: welcomeScreen,
      page: () => WelcomeScreen(),
      transition: defaultTransition,
    ),
    GetPage<dynamic>(
      name: signIn,
      page: () => const SignInScreen(),
      transition: defaultTransition,
    ),
    GetPage<dynamic>(
      name: signUp,
      page: () => const SignUpScreen(),
      transition: defaultTransition,
    ),
    GetPage<dynamic>(
      name: forgotPasswordScreen,
      page: () => ForgotPasswordScreen(),
      transition: defaultTransition,
    ),
    GetPage<dynamic>(
      name: resetPasswordScreen,
      page: () => ResetPasswordScreen(),
      transition: defaultTransition,
    ),
    GetPage<dynamic>(
      name: getVerifiedScreen,
      page: () => GetVerifiedScreen(),
      transition: defaultTransition,
    ),
    GetPage<dynamic>(
      name: dashBoardScreen,
      page: () => const DashboardScreen(),
      transition: defaultTransition,
    ),
    GetPage<dynamic>(
      name: themeScreen,
      page: () => const ThemeScreen(),
      transition: defaultTransition,
    ),
  ];
}
