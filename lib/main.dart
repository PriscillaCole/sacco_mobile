import 'package:flutter/material.dart';
import 'package:sacco/constants.dart';
import 'package:sacco/screens/home/home_screen.dart';
import 'package:sacco/screens/splash/splash_screen.dart';
import 'package:sacco/routes.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, // Remove the debug banner
      title: 'sacco',
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
        fontFamily: "Muli",
        textTheme: const TextTheme(
          bodyLarge: TextStyle(color: kTextColor),
        ),
        primarySwatch: Colors.blue,
      ),

     home: const CheckAuth(),
    
      routes: routes,
      
    );
  }
}

class CheckAuth extends StatefulWidget {
  const CheckAuth({super.key});

  @override
  _CheckAuthState createState() => _CheckAuthState();
}

class _CheckAuthState extends State<CheckAuth> {
  bool isAuth = false;
  @override
  void initState() {
    _checkIfLoggedIn();
    super.initState();
  }

  void _checkIfLoggedIn() async{
    SharedPreferences localStorage = await SharedPreferences.getInstance();
    var token = localStorage.getString('token');
    if(token != null){
      setState(() {
        isAuth = true;
      });
    }
  }
  @override
Widget build(BuildContext context) {
  Widget child;
  if (isAuth) {
    child = const HomeScreen();
  } else {
    child = const SplashScreen();
  }
  return child;
}

}
