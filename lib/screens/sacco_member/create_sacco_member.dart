import 'package:flutter/material.dart';
import 'package:sacco/constants.dart';
import 'package:sacco/screens/sacco_member/components/create.dart';
import 'package:sacco/components/custom_bottom_nav_bar.dart';
import 'package:sacco/enums.dart';



class SaccoMemberRegistration extends StatelessWidget {
  static String routeName = "/sacco_member";
  const SaccoMemberRegistration({super.key});

  @override
  Widget build(BuildContext context) {
       return Scaffold(
      appBar: AppBar(
        title: const Text("Sacco Member Registration"),
        //change the appbar background color
        backgroundColor: kPrimaryColor,
      ),
      body: const Body(),
      bottomNavigationBar:
          const CustomBottomNavBar(selectedMenu: MenuState.member),
    );
    
  }
}