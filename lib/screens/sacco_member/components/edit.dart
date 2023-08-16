import 'package:flutter/material.dart';
import 'package:sacco/constants.dart';
import 'package:sacco/screens/sign_in/sign_in_screen.dart';
import 'package:sacco/services/api_service.dart';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:sacco/models/sacco_member.dart';
import 'package:sacco/database/sacco_member_registration.dart';
import 'package:sacco/components/custom_text_fields.dart';
import 'package:sacco/screens/sacco_member/components/form_field_data.dart';

class Body extends StatefulWidget {
  final Map<String, dynamic>? userData;

  const Body({Key? key, this.userData}) : super(key: key);

  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  bool _isLoading = false;
  final _formKey = GlobalKey<FormState>();
  final _apiService = ApiService('/sacco_members');

  Map<String, dynamic> fieldValues = {};

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
  void initState() {
    super.initState();

    if (widget.userData != null) {
      print(widget.userData);
      fieldValues = Map.from(widget.userData!);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Edit Application"),
        backgroundColor: kPrimaryColor,
      ),
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
                                  initialValue: field.initialValue,
                                  onSaved: (value) {
                                    
                                    setState(() {
                                      fieldValues[field.identifier] = value;
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
                                    _isLoading ? 'Processing...' : 'Edit',
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
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  String getFieldPropertyName(String identifier) {
    switch (identifier) {
      case '_saccoId':
        return 'sacco_id';
      case '_userId':
        return 'user_id';
      case '_fullName':
        return 'full_name';
      case '_dateOfBirth':
        return 'date_of_birth';
      case '_gender':
        return 'gender';
      case '_image':
        return 'image';
      default:
        return '';
    }
  }

  Future<void> _registerMember() async {
    setState(() {
      _isLoading = true;
    });

    final data = {
      'sacco_id': fieldValues['sacco_id'],
      'user_id': fieldValues['user_id'],
      'full_name': fieldValues['full_name'],
      'date_of_birth': fieldValues['date_of_birth'],
      'gender': fieldValues['gender'],
      'image': fieldValues['image'],
      'nationality': fieldValues['nationality'],
      'identification_number': fieldValues['identification_number'],
      'physical_address': fieldValues['physical_address'],
      'postal_address': fieldValues['postal_address'],
      'email': fieldValues['email'],
      'phone_number': fieldValues['phone_number'],
      'employment_status': fieldValues['employment_status'],
      'employer_name': fieldValues['employer_name'],
      'monthly_income': fieldValues['monthly_income'],
      'bank_account_number': fieldValues['bank_account_number'],
      'bank_name': fieldValues['bank_name'],
      'membership_type': fieldValues['membership_type'],
      'membership_id': fieldValues['membership_id'],
      'date_of_joining': fieldValues['date_of_joining'],
      'next_of_kin_name': fieldValues['next_of_kin_name'],
      'next_of_kin_contact': fieldValues['next_of_kin_contact'],
      'beneficiary_name': fieldValues['beneficiary_name'],
      'beneficiary_relationship': fieldValues['beneficiary_relationship'],
      'status': fieldValues['status'],
    };

    try {
      await _apiService.createUser(data);

      // Store user in SQLite
      final saccoMember = SaccoMember(
        id: DateTime.now().millisecondsSinceEpoch,
        saccoId: fieldValues['sacco_id'],
        userId: fieldValues['user_id'],
        fullName: fieldValues['full_name'],
        dateOfBirth: fieldValues['date_of_birth'],
        gender: fieldValues['gender'],
        image: fieldValues['image'],
        nationality: fieldValues['nationality'],
        identificationNumber: int.parse(fieldValues['identification_number']),
        physicalAddress: fieldValues['physical_address'],
        postalAddress: fieldValues['postal_address'],
        email: fieldValues['email'],
        phoneNumber: int.parse(fieldValues['phone_number']),
        employmentStatus: fieldValues['employment_status'],
        employerName: fieldValues['employer_name'],
        monthlyIncome: int.parse(fieldValues['monthly_income']),
        bankAccountNumber: int.parse(fieldValues['bank_account_number']),
        bankName: fieldValues['bank_name'],
        membershipType: fieldValues['membership_type'],
        membershipId: fieldValues['membership_id'],
        dateOfJoining: fieldValues['date_of_joining'],
        nextOfKinName: fieldValues['next_of_kin_name'],
        nextOfKinContact: int.parse(fieldValues['next_of_kin_contact']),
        beneficiaryName: fieldValues['beneficiary_name'],
        beneficiaryRelationship: fieldValues['beneficiary_relationship'],
        status: fieldValues['status'],
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
