import 'package:flutter/material.dart';
import 'package:sacco/screens/sacco_registration/components/body.dart';

class SaccoRegistration extends StatelessWidget {
  static String routeName = "/sacco-registration";
  const SaccoRegistration({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Color.fromARGB(255, 228, 224, 224),
      body: Body(),
    );
  }
}
