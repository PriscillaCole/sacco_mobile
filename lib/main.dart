import 'package:flutter/material.dart';
import 'package:sacco/constants.dart';
import 'package:sacco/screens/splash/splash_screen.dart';
import 'package:sacco/screens/home/home_screen.dart';
import 'package:sacco/routes.dart';

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
      title: 'Flutter Demo',
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
        fontFamily: "Muli",
        textTheme: const TextTheme(
          bodyLarge: TextStyle(color: kTextColor),
        ),
        primarySwatch: Colors.blue,
      ),
      //home: const SplashScreen()); // We use routeName so that we dont need to remember the name
      initialRoute: HomeScreen.routeName,
      routes: routes,
    );
  }
}
