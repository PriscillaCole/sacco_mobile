import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:sacco/constants.dart';
import 'package:sacco/network_utils/api.dart';
import 'package:sacco/screens/home/home_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sacco/screens/sign_in/sign_in_screen.dart';

class RegisterForm extends StatefulWidget {
  const RegisterForm({super.key});

  @override
  _RegisterFormState createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {
  bool _isLoading = false;
  final _formKey = GlobalKey<FormState>();
  var email;
  var password;
  var username;
  var name;

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
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
                      margin: const EdgeInsets.only(left: 20, right: 20),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15)),
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Form(
                          key: _formKey,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              TextFormField(
                                style:
                                    const TextStyle(color: Color(0xFF000000)),
                                cursorColor: const Color(0xFF9b9b9b),
                                keyboardType: TextInputType.text,
                                decoration: const InputDecoration(
                                  prefixIcon: Icon(
                                    Icons.email,
                                    color: Colors.grey,
                                  ),
                                  hintText: "Email",
                                  hintStyle: TextStyle(
                                      color: Color(0xFF9b9b9b),
                                      fontSize: 15,
                                      fontWeight: FontWeight.normal),
                                ),
                                onChanged: (value) {
                                  setState(() {
                                    email = value;
                                  });
                                },
                                validator: (emailValue) {
                                  if (emailValue?.isEmpty ?? true) {
                                    return 'Please enter email';
                                  }
                                  email = emailValue;
                                  return null;
                                },
                              ),
                              TextFormField(
                                style:
                                    const TextStyle(color: Color(0xFF000000)),
                                cursorColor: const Color(0xFF9b9b9b),
                                keyboardType: TextInputType.text,
                                decoration: const InputDecoration(
                                  prefixIcon: Icon(
                                    Icons.person_2,
                                    color: Colors.grey,
                                  ),
                                  hintText: "Name",
                                  hintStyle: TextStyle(
                                      color: Color(0xFF9b9b9b),
                                      fontSize: 15,
                                      fontWeight: FontWeight.normal),
                                ),
                                onChanged: (value) {
                                  setState(() {
                                    name = value;
                                  });
                                },
                                validator: (nameValue) {
                                  if (nameValue?.isEmpty ?? true) {
                                    return 'Please enter your name';
                                  }
                                  name = name;
                                  return null;
                                },
                              ),
                              TextFormField(
                                style:
                                    const TextStyle(color: Color(0xFF000000)),
                                cursorColor: const Color(0xFF9b9b9b),
                                keyboardType: TextInputType.text,
                                decoration: const InputDecoration(
                                  prefixIcon: Icon(
                                    Icons.insert_emoticon,
                                    color: Colors.grey,
                                  ),
                                  hintText: "Username",
                                  hintStyle: TextStyle(
                                      color: Color(0xFF9b9b9b),
                                      fontSize: 15,
                                      fontWeight: FontWeight.normal),
                                ),
                                onChanged: (value) {
                                  setState(() {
                                    username = value;
                                  });
                                },
                                validator: (usernameValue) {
                                  if (usernameValue?.isEmpty ?? true) {
                                    return 'Please enter username';
                                  }
                                  username = username;
                                  return null;
                                },
                              ),
                              TextFormField(
                                style:
                                    const TextStyle(color: Color(0xFF000000)),
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
                                      fontWeight: FontWeight.normal),
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
                                  onPressed: () {
                                    if (_formKey.currentState!.validate()) {
                                      _register();
                                    }
                                  },
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: kPrimaryColor,
                                    padding: const EdgeInsets.only(
                                        top: 8, bottom: 8, left: 10, right: 10),
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(20.0)),
                                  ),
                                  child: Text(
                                    _isLoading ? 'Processing...' : 'Register',
                                    textDirection: TextDirection.ltr,
                                    style: const TextStyle(
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
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 20),
                      child: InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const SignInScreen()));
                        },
                        child: const Text(
                          'Already Have an Account',
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

void _register() async {
  setState(() {
    _isLoading = true;
  });

  var data = {
    'email': email,
    'password': password,
    'username': username,
    'name': name,
  };

  var res = await Network().authData(data, '/register');
  var body = json.decode(res.body);

  if (body['code'] == 1) {
    var userData = body['data']; // Access the 'data' object containing user data.
    var name = userData['name'];
    var email = userData['email'];
    var username = userData['username'];
    var token = body['data']['token'];

    SharedPreferences localStorage = await SharedPreferences.getInstance();
    localStorage.setString('token', token);
    localStorage.setString('user', json.encode(userData));

    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const HomeScreen()),
    );
  }

  setState(() {
    _isLoading = false;
  });
}

}
