import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sacco/screens/home/home_screen.dart';
import 'package:sacco/screens/profile/profile_screen.dart';
import 'package:sacco/screens/sacco_member/sacco_member.dart';
import 'package:sacco/screens/sign_in/sign_in_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';
import 'package:sacco/network_utils/api.dart';


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
              icon: SvgPicture.asset("assets/icons/Heart Icon.svg",
              color: MenuState.member == selectedMenu
                    ? kPrimaryColor
                    : inActiveIconColor,
              ),
              onPressed: () =>
                  Navigator.pushNamed(context, SaccoMember.routeName),
          
            ),
            
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
              icon: SvgPicture.asset("assets/icons/Log out.svg",
                color: MenuState.logout == selectedMenu
                    ? kPrimaryColor
                    : inActiveIconColor,),
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

  print (body);
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
