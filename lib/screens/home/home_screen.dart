import 'package:flutter/material.dart';
import 'package:sacco/components/custom_bottom_nav_bar.dart';
import 'package:sacco/enums.dart';
import 'components/body.dart';
import 'package:sacco/constants.dart';

class HomeScreen extends StatelessWidget {
  static String routeName = "/home";

  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const Body(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: kPrimaryColor,
        child: const Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar:
          const CustomBottomNavBar(selectedMenu: MenuState.home),
    );
  }
}
