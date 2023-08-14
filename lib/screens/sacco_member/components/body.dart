import 'package:flutter/material.dart';
import 'package:sacco/constants.dart';
import 'package:sacco/screens/sign_in/sign_in_screen.dart';
import 'package:sacco/services/api_service.dart';
import 'package:sacco/models/sacco_member.dart';
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
  final _apiService = ApiService('register');

  final Map<String, String> fieldValues = {};

  final String _saccoId = '';
  final String _userId = '';
  final String _fullName = '';
  final String _dateOfBirth = '';
  final String _gender = '';
  final String _image = '';
  final String _nationality = '';
  final int _identificationNumber = 0;
  final String _physicalAddress = '';
  final String _postalAddress = '';
  final String _email = '';
  final int _phoneNumber = 0;
  final String _employmentStatus = '';
  final String _employerName = '';
  final int _monthlyIncome = 0;
  final int _bankAccountNumber = 0;
  final String _bankName = '';
  final String _membershipType = '';
  final String _membershipId = '';
  final String _dateOfJoining = '';
  final String _nextOfKinName = '';
  final int _nextOfKinContact = 0;
  final String _beneficiaryName = '';
  final String _beneficiaryRelationship = '';
  final String _status = '';
  final String _password = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
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
                                    field.identifier = value;
                                  });
                                },
                              ),
                            Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: ElevatedButton(
                                onPressed: () async {
                                  // if (_formKey.currentState!.validate()) {
                                  await _registerMember();
                                  // }
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
                            Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: ElevatedButton(
                                onPressed: () async {
                                  // if (_formKey.currentState!.validate()) {
                                  await _registerMember();
                                  // }
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
                            Padding(
                              padding: const EdgeInsets.only(top: 20),
                              child: InkWell(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          const SignInScreen(),
                                    ),
                                  );
                                },
                                child: const Text(
                                  'Already a Member?',
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
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _registerMember() async {
    setState(() {
      _isLoading = true;
    });

    final data = {
      'sacco_id': _saccoId,
      'user_id': _userId,
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
      'membership_id': _membershipId,
      'date_of_joining': _dateOfJoining,
      'next_of_kin_name': _nextOfKinName,
      'next_of_kin_contact': _nextOfKinContact,
      'beneficiary_name': _beneficiaryName,
      'beneficiary_relationship': _beneficiaryRelationship,
      'status': _status,
    };

    try {
      await _apiService.createUser(data);

      // Store user in SQLite
      final saccoMember = SaccoMember(
        id: DateTime.now().millisecondsSinceEpoch,
        saccoId: _saccoId,
        userId: _userId,
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
        status: _status,
      );

      // Create an instance of DatabaseHelper
      final DatabaseHelper databaseHelper = DatabaseHelper();
      await databaseHelper.insertSaccoMember(saccoMember);

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('User registered successfully')),
      );
      setState(() {
        _isLoading = false;
      });
    } catch (error) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Failed to register user')),
      );
    }
  }
}
