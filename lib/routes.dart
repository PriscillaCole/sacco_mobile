import 'package:flutter/widgets.dart';

import 'package:sacco/screens/complete_profile/complete_profile_screen.dart';

import 'package:sacco/screens/forgot_password/forgot_password_screen.dart';
import 'package:sacco/screens/home/home_screen.dart';
import 'package:sacco/screens/login_success/login_success_screen.dart';
import 'package:sacco/screens/otp/otp_screen.dart';
import 'package:sacco/screens/profile/profile_screen.dart';
import 'package:sacco/screens/sign_in/sign_in_screen.dart';
import 'package:sacco/screens/splash/splash_screen.dart';

import 'screens/register/register_screen.dart';

final Map<String, WidgetBuilder> routes = {
  SplashScreen.routeName: (context) => const SplashScreen(),
  SignInScreen.routeName: (context) => const SignInScreen(),
  ForgotPasswordScreen.routeName: (context) => const ForgotPasswordScreen(),
  LoginSuccessScreen.routeName: (context) => const LoginSuccessScreen(),
  RegisterScreen.routeName: (context) => const RegisterScreen(),
  CompleteProfileScreen.routeName: (context) => const CompleteProfileScreen(),
  OtpScreen.routeName: (context) => const OtpScreen(),
  HomeScreen.routeName: (context) => const HomeScreen(),
  ProfileScreen.routeName: (context) => const ProfileScreen(),
};
