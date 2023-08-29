// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sacco/screens/home/home_screen.dart';
import 'package:sacco/screens/profile/profile_screen.dart';
import 'package:sacco/screens/sacco_member/create_sacco_member.dart';
import 'package:sacco/screens/sacco_member/view_sacco_application.dart';
import 'package:sacco/screens/sign_in/sign_in_screen.dart';

import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';
import 'package:sacco/network_utils/api.dart';
import 'package:sacco/database/sacco_member_registration.dart';

import '../constants.dart';
import '../enums.dart';

class CustomBottomNavBar extends StatelessWidget {
  const CustomBottomNavBar({
    Key? key,
    required this.selectedMenu,
  }) : super(key: key);

  final MenuState selectedMenu;

  @override
  Widget build(BuildContext context) {
    const Color inActiveIconColor = Color(0xFFB6B6B6);
    return BottomAppBar(
      shape: const CircularNotchedRectangle(),
      child: Padding(
        padding: const EdgeInsets.only(top: 7.5, bottom: 7.5),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(
              icon: SvgPicture.asset(
                "assets/icons/Shop Icon.svg",
                color: MenuState.home == selectedMenu
                    ? kPrimaryColor
                    : inActiveIconColor,
              ),
              onPressed: () =>
                  Navigator.pushNamed(context, HomeScreen.routeName),
            ),
            IconButton(
                icon: SvgPicture.asset(
                  "assets/icons/Heart Icon.svg",
                  color: MenuState.member == selectedMenu
                      ? kPrimaryColor
                      : inActiveIconColor,
                ),
                onPressed: () async {
                  SharedPreferences localStorage =
                      await SharedPreferences.getInstance();
                  var user = localStorage.getString('user');

                  final DatabaseHelper databaseHelper = DatabaseHelper();

                  // // Ensure the database is initialized
                  await databaseHelper.initialize();
                 // await databaseHelper.getAllSaccoMembers();
                  //Check if the user exists in the database

                  if (user != null) {
                    var userId = jsonDecode(user)['id'];

                    bool userExists =
                        await databaseHelper.checkUserExists(userId);
                    if (userExists) {
                      // User exists, navigate to a different page
                      // ignore: use_build_context_synchronously
                      Navigator.pushNamed(context, UsersListScreen.routeName);
                    } else {
                      // User doesn't exist, send them to the registration page
                      // ignore: use_build_context_synchronously
                      Navigator.pushNamed(
                          context, SaccoMemberRegistration.routeName);
                    }
                  }
                }),
            IconButton(
              icon: SvgPicture.asset(
                "assets/icons/User Icon.svg",
                color: MenuState.profile == selectedMenu
                    ? kPrimaryColor
                    : inActiveIconColor,
              ),
              onPressed: () =>
                  Navigator.pushNamed(context, ProfileScreen.routeName),
            ),
            IconButton(
              icon: SvgPicture.asset(
                "assets/icons/Log out.svg",
                color: MenuState.logout == selectedMenu
                    ? kPrimaryColor
                    : inActiveIconColor,
              ),
              onPressed: () {
                logout(context);
              },
            ),
          ],
        ),
      ),
    );
  }

  void logout(BuildContext context) async {
    var res = await Network().getData('/logout');
    var body = json.decode(res.body);

    print(body);
    if (body['code'] == 1) {
      SharedPreferences localStorage = await SharedPreferences.getInstance();
      localStorage.remove('user');
      localStorage.remove('token');
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const SignInScreen()),
      );
    }
  }
}
