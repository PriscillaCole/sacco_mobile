import 'package:flutter/material.dart';
import 'package:sacco/screens/register/components/register_form.dart';

class RegisterScreen extends StatelessWidget {
  static String routeName = "/sign_up";

  const RegisterScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return const RegisterForm();
  }
}
