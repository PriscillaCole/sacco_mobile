import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:sacco/constants.dart';
import 'package:sacco/network_utils/api.dart';
import 'package:sacco/screens/home/home_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sacco/screens/register/register_screen.dart';

class SignForm extends StatefulWidget {
  const SignForm({super.key});

  @override
  _SignFormState createState() => _SignFormState();
}

class _SignFormState extends State<SignForm> {
  bool _isLoading = false;
  final _formKey = GlobalKey<FormState>();
  var username;
  var password;
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  void _showMsg(String msg) {
    final snackBar = SnackBar(
      content: Text(msg),
      action: SnackBarAction(
        label: 'Close',
        onPressed: () {
          // Code to undo the change!
          ScaffoldMessenger.of(context)
              .hideCurrentSnackBar(); // Hides the current snack bar.
        },
      ),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      body: Container(
        color: kPrimaryColor,
        child: Stack(
          children: <Widget>[
            Positioned(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Card(
                      elevation: 4.0,
                      color: Colors.white,
                      margin: const EdgeInsets.symmetric(horizontal: 20),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Form(
                          key: _formKey,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              TextFormField(
                                style: const TextStyle(color: Color(0xFF000000)),
                                cursorColor: const Color(0xFF9b9b9b),
                                keyboardType: TextInputType.text,
                                decoration: const InputDecoration(
                                  prefixIcon: Icon(
                                    Icons.verified_user,
                                    color: Colors.grey,
                                  ),
                                  hintText: "Username",
                                  hintStyle: TextStyle(
                                    color: Color(0xFF9b9b9b),
                                    fontSize: 15,
                                    fontWeight: FontWeight.normal,
                                  ),
                                ),
                                onChanged: (value) {
                                  setState(() {
                                    username = value;
                                  });
                                },
                                validator: (usernameValue) {
                                  if (usernameValue?.isEmpty ?? true) {
                                    // Use null-aware and null check to handle null and empty cases
                                    return 'Please enter username';
                                  }
                                  username = usernameValue;
                                  return null;
                                },
                              ),
                              TextFormField(
                                style: const TextStyle(color: Color(0xFF000000)),
                                cursorColor: const Color(0xFF9b9b9b),
                                keyboardType: TextInputType.text,
                                obscureText: true,
                                decoration: const InputDecoration(
                                  prefixIcon: Icon(
                                    Icons.vpn_key,
                                    color: Colors.grey,
                                  ),
                                  hintText: "Password",
                                  hintStyle: TextStyle(
                                    color: Color(0xFF9b9b9b),
                                    fontSize: 15,
                                    fontWeight: FontWeight.normal,
                                  ),
                                ),
                                onChanged: (value) {
                                  setState(() {
                                    password = value;
                                  });
                                },
                                validator: (passwordValue) {
                                  if (passwordValue?.isEmpty ?? true) {
                                    // Use null-aware and null check to handle null and empty cases
                                    return 'Please enter password';
                                  }
                                  password = passwordValue;
                                  return null;
                                },
                              ),
                              Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: ElevatedButton(
                                    style: ButtonStyle(
                                      backgroundColor: MaterialStateProperty.all<
                                              Color>(
                                          kPrimaryColor), // Change the color to your desired color.
                                    ),
                                    onPressed: _isLoading ? null : _login,
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                        vertical: 8,
                                        horizontal: 10,
                                      ),
                                      child: Text(
                                        _isLoading ? 'Processing...' : 'Login',
                                        textDirection: TextDirection.ltr,
                                        style: const TextStyle(
                                          color: Colors.white,
                                          fontSize: 15.0,
                                          decoration: TextDecoration.none,
                                          fontWeight: FontWeight.normal,
                                        ),
                                      ),
                                    ),
                                  )),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 20),
                      child: InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const RegisterScreen(),
                            ),
                          );
                        },
                        child: const Text(
                          'Create new Account',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 15.0,
                            decoration: TextDecoration.none,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  void _login() async {
    setState(() {
      _isLoading = true;
    });

    try {
      var data = {'password': password, 'username': username};

      var res = await Network().authData(data, '/login');
      var body = json.decode(res.body);
      print(body);

      if (body['code'] == 1) {
        SharedPreferences localStorage = await SharedPreferences.getInstance();
        localStorage.setString('token', json.encode(body['token']));
        localStorage.setString('user', json.encode(body['user']));

        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const HomeScreen(),
          ),
        );
      } else {
        _showMsg(body['message']);
      }
    } catch (e) {
      print("Error: $e");
      _showMsg('An error occurred. Please try again later.');
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }
}
