import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:sacco/constants.dart';
import 'package:sacco/services/api_service.dart';
import 'package:sacco/models/sacco_member.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sacco/database/sacco_member_registration.dart';
import 'package:sacco/components/custom_text_fields.dart';
import 'package:sacco/screens/sacco_member/components/form_field_data.dart';

class Body extends StatefulWidget {
  const Body({Key? key}) : super(key: key);

  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  bool _isLoading = false;
  final _formKey = GlobalKey<FormState>();
  final _apiService = ApiService('/sacco_members');

  final Map<String, String> fieldValues = {};

  String _fullName = '';
  String _dateOfBirth = '';
  String _gender = '';
  String _image = '';
  String _nationality = '';
  int _identificationNumber = 0;
  String _physicalAddress = '';
  String _postalAddress = '';
  String _email = '';
  int _phoneNumber = 0;
  String _employmentStatus = '';
  String _employerName = '';
  int _monthlyIncome = 0;
  int _bankAccountNumber = 0;
  String _bankName = '';
  String _membershipType = '';
  String _membershipId = '';
  String _dateOfJoining = '';
  String _nextOfKinName = '';
  int _nextOfKinContact = 0;
  String _beneficiaryName = '';
  String _beneficiaryRelationship = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 20),
        child: Center(
          child: ListView(
            children: [
              // Wrap your stack with a SingleChildScrollView
              SingleChildScrollView(
                child: Stack(
                  children: <Widget>[
                    Card(
                      elevation: 4.0,
                      color: Colors.white,
                      margin: const EdgeInsets.only(left: 20, right: 20),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15)),
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        // Use the Form widget to manage the form state
                        child: Form(
                          key: _formKey,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              // Loop through form fields and create CustomTextFormField widgets
                              for (var field in FormFieldData.fieldList)
                                CustomTextFormField(
                                  prefixIcon: field.prefixIcon,
                                  hintText: field.hintText,
                                  keyboardType: field.keyboardType,
                                  validator: field.validator,
                                  onSaved: (value) {
                                    setState(() {
                                      // Update the respective variable based on the field identifier
                                      if (field.identifier == "_fullName") {
                                        _fullName = value;
                                      } else if (field.identifier ==
                                          "_dateOfBirth") {
                                        _dateOfBirth = value;
                                      } else if (field.identifier ==
                                          "_gender") {
                                        _gender = value;
                                      } else if (field.identifier == "_image") {
                                        _image = value;
                                      } else if (field.identifier ==
                                          "_nationality") {
                                        _nationality = value;
                                      } else if (field.identifier ==
                                          "_identificationNumber") {
                                        _identificationNumber =
                                            int.parse(value);
                                      } else if (field.identifier ==
                                          "_physicalAddress") {
                                        _physicalAddress = value;
                                      } else if (field.identifier ==
                                          "_postalAddress") {
                                        _postalAddress = value;
                                      } else if (field.identifier == "_email") {
                                        _email = value;
                                      } else if (field.identifier ==
                                          "_phoneNumber") {
                                        _phoneNumber = int.parse(value);
                                      } else if (field.identifier ==
                                          "_employmentStatus") {
                                        _employmentStatus = value;
                                      } else if (field.identifier ==
                                          "_employerName") {
                                        _employerName = value;
                                      } else if (field.identifier ==
                                          "_monthlyIncome") {
                                        _monthlyIncome = int.parse(value);
                                      } else if (field.identifier ==
                                          "_bankAccountNumber") {
                                        _bankAccountNumber = int.parse(value);
                                      } else if (field.identifier ==
                                          "_bankName") {
                                        _bankName = value;
                                      } else if (field.identifier ==
                                          "_membershipType") {
                                        _membershipType = value;
                                      } else if (field.identifier ==
                                          "_dateOfJoining") {
                                        _dateOfJoining = value;
                                      } else if (field.identifier ==
                                          "_nextOfKinName") {
                                        _nextOfKinName = value;
                                      } else if (field.identifier ==
                                          "_nextOfKinContact") {
                                        _nextOfKinContact = int.parse(value);
                                      } else if (field.identifier ==
                                          "_beneficiaryName") {
                                        _beneficiaryName = value;
                                      } else if (field.identifier ==
                                          "_beneficiaryRelationship") {
                                        _beneficiaryRelationship = value;
                                      }
                                    });
                                  },
                                ),
                              Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: ElevatedButton(
                                  onPressed: () async {
                                    if (_formKey.currentState!.validate()) {
                                      await _registerMember();
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
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      _isLoading
                                          ? const CircularProgressIndicator(
                                              valueColor: AlwaysStoppedAnimation<
                                                      Color>(
                                                  Colors
                                                      .white), // Set the color to white
                                            ) // Show the loading spinner
                                          : const SizedBox(), // Hide the spinner when not loading
                                      const SizedBox(
                                          width:
                                              8.0), // Adding some space between the spinner and the text
                                      Text(
                                        _isLoading
                                            ? 'Processing...'
                                            : 'Register',
                                        textDirection: TextDirection.ltr,
                                        style: const TextStyle(
                                          color: Colors.white,
                                          fontSize: 15.0,
                                          decoration: TextDecoration.none,
                                          fontWeight: FontWeight.normal,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _registerMember() async {
    setState(() {
      _isLoading = true;
    });

    SharedPreferences localStorage = await SharedPreferences.getInstance();
    var user = localStorage.getString('user');
    int userId = 0;
    if (user != null) {
      userId = jsonDecode(user)['id'];
    }
    //print(userId);
    final data = {
      'sacco_id': 15,
      'user_id': userId,
      'full_name': _fullName,
      'date_of_birth': _dateOfBirth,
      'gender': _gender,
      'image': _image,
      'nationality': _nationality,
      'identification_number': _identificationNumber,
      'physical_address': _physicalAddress,
      'postal_address': _postalAddress,
      'email': _email,
      'phone_number': _phoneNumber,
      'employment_status': _employmentStatus,
      'employer_name': _employerName,
      'monthly_income': _monthlyIncome,
      'bank_account_number': _bankAccountNumber,
      'bank_name': _bankName,
      'membership_type': _membershipType,
      'date_of_joining': _dateOfJoining,
      'next_of_kin_name': _nextOfKinName,
      'next_of_kin_contact': _nextOfKinContact,
      'beneficiary_name': _beneficiaryName,
      'beneficiary_relationship': _beneficiaryRelationship,
      'status': 'pending',
    };
    print(data);
    try {
      var userResponse = await _apiService.createUser(data);

      // Store user in SQLite
      final saccoMember = SaccoMember(
        id: DateTime.now().millisecondsSinceEpoch,
        saccoId: '15',
        userId: userId.toString(),
        fullName: _fullName,
        dateOfBirth: _dateOfBirth,
        gender: _gender,
        image: _image,
        nationality: _nationality,
        identificationNumber: _identificationNumber,
        physicalAddress: _physicalAddress,
        postalAddress: _postalAddress,
        email: _email,
        phoneNumber: _phoneNumber,
        employmentStatus: _employmentStatus,
        employerName: _employerName,
        monthlyIncome: _monthlyIncome,
        bankAccountNumber: _bankAccountNumber,
        bankName: _bankName,
        membershipType: _membershipType,
        membershipId: _membershipId,
        dateOfJoining: _dateOfJoining,
        nextOfKinName: _nextOfKinName,
        nextOfKinContact: _nextOfKinContact,
        beneficiaryName: _beneficiaryName,
        beneficiaryRelationship: _beneficiaryRelationship,
      );

      // Create an instance of DatabaseHelper
      final DatabaseHelper databaseHelper = DatabaseHelper();

      //initialize the database
      await databaseHelper.initialize();
      await databaseHelper.insertSaccoMember(saccoMember);

      // ignore: use_build_context_synchronously
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('User registered successfully')),
      );
      setState(() {
        _isLoading = false;
      });
    } catch (error) {
      //print('Error inserting into database: $error');
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Failed to register user')),
      );
      setState(() {
        _isLoading = false;
      });
    }
  }
}
