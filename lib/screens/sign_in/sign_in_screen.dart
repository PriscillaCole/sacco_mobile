import 'package:flutter/material.dart';
import 'package:sacco/screens/sign_in/components/sign_form.dart';


class SignInScreen extends StatelessWidget {
  static String routeName = "/sign_in";

  const SignInScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return const SignForm();
  }
}
