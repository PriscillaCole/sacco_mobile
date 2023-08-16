import 'package:flutter/material.dart';
import 'package:sacco/constants.dart';
import 'package:sacco/screens/sacco_member/components/edit.dart';
import 'package:sacco/components/custom_bottom_nav_bar.dart';
import 'package:sacco/enums.dart';



class EditSaccoMember extends StatelessWidget {
  static String routeName = "/edit_sacco_member";
  const EditSaccoMember({super.key});

  @override
  Widget build(BuildContext context) {
       return Scaffold(
      appBar: AppBar(
        title: const Text("Edit Application"),
        //change the appbar background color
        backgroundColor: kPrimaryColor,
      ),
      body: const Body(),
      bottomNavigationBar:
          const CustomBottomNavBar(selectedMenu: MenuState.member),
    );
    
  }
}