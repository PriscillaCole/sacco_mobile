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

  
  final Map<String, String> identifierToKey = {
    // Map field.identifier to the corresponding keys in fieldValues
    '_saccoId': 'sacco_id',
    '_userId': 'user_id',
    '_fullName': 'full_name',
    '_dateOfBirth': 'date_of_birth',
    '_gender':'gender',
    '_image':'image',
    '_nationality':'nationality',
    '_identificationNumber':'identification_number',
    '_physicalAddress':'physical_address',
    '_postalAddress':'postal_address',
    '_email':'email',
    '_phoneNumber':'phone_number',
    '_employmentStatus':'employment_status',
    '_employerName':'employer_name',
    '_monthlyIncome':'monthly_income',
    '_bankAccountNumber':'bank_account_number',
    '_bankName':'bank_name',
    '_membershipType':'membership_type',
    '_membershipId':'membership_id',
    '_dateOfJoining':'date_of_joining',
    '_nextOfKinName':'next_of_kin_name',
    '_nextOfKinContact':'next_of_kin_contact',
    '_beneficiaryName':'beneficiary_name',
    '_beneficiaryRelationship':'beneficiary_relationship',
    '_status':'status',
    
  };

  @override
  void initState() {
    super.initState();

    if (widget.userData != null) {
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
        padding: const EdgeInsets.only(top: 20, bottom: 20),
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
                                  title: field.title,
                                  initialValue:
                                      _getFieldValue(field.identifier),
                                  prefixIcon: field.prefixIcon,
                                  hintText: field.hintText,
                                  keyboardType: field.keyboardType,
                                  validator: field.validator,
                                  onSaved: (value) {
                                    setState(() {
                                      fieldValues[identifierToKey[
                                          field.identifier]!] = value;
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

  String _getFieldValue(String identifier) {
    switch (identifier) {
      // Implement the logic to return the corresponding field value
      case '_saccoId':
        return fieldValues['sacco_id'].toString();
      case '_userId':
        return fieldValues['user_id'].toString();
      case '_fullName':
        return fieldValues['full_name'].toString();
      case '_dateOfBirth':
        return fieldValues['date_of_birth'].toString();
      case '_gender':
        return fieldValues['gender'].toString();
      case '_image':
        return fieldValues['image'].toString();
      case '_nationality':
        return fieldValues['nationality'].toString();
      case '_identificationNumber':
        return fieldValues['identification_number'].toString();
      case '_physicalAddress':
        return fieldValues['physical_address'].toString();
      case '_postalAddress':
        return fieldValues['postal_address'].toString();
      case '_email':
        return fieldValues['email'].toString();
      case '_phoneNumber':
        return fieldValues['phone_number'].toString();
      case '_employmentStatus':
        return fieldValues['employment_status'].toString();
      case '_employerName':
        return fieldValues['employer_name'].toString();
      case '_monthlyIncome':
        return fieldValues['monthly_income'].toString();
      case '_bankAccountNumber':
        return fieldValues['bank_account_number'].toString();
      case '_bankName':
        return fieldValues['bank_name'].toString();
      case '_membershipType':
        return fieldValues['membership_type'].toString();
      case '_membershipId':
        return fieldValues['membership_id'].toString();
      case '_dateOfJoining':
        return fieldValues['date_of_joining'].toString();
      case '_nextOfKinName':
        return fieldValues['next_of_kin_name'].toString();
      case '_nextOfKinContact':
        return fieldValues['next_of_kin_contact'].toString();
      case '_beneficiaryName':
        return fieldValues['beneficiary_name'].toString();
      case '_beneficiaryRelationship':
        return fieldValues['beneficiary_relationship'].toString();
      case '_status':
        return fieldValues['status'].toString();
      case '_password':
        return fieldValues['password'].toString();

      default:
        return '';
    }
  }

  Future<void> _registerMember() async {
    setState(() {
      _isLoading = true;
    });

    final data = {
      'user_id': fieldValues['user_id'], 
      'sacco_id': fieldValues['sacco_id'],
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
      'employment_status': fieldValues['_employment_status'],
      'employer_name': fieldValues['_employer_name'],
      'monthly_income': fieldValues['_monthly_income'],
      'bank_account_number': fieldValues['_bank_account_number'],
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
      await _apiService.updateUser(fieldValues['user_id'], data);

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
      await databaseHelper.updateSaccoMember(saccoMember);

      // ignore: use_build_context_synchronously
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('User updated successfully')),
      );
      setState(() {
        _isLoading = false;
      });
    } catch (error) {
      //print('Error inserting into database: $error');
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Failed to update user')),
      );
      setState(() {
        _isLoading = false;
      });
    }
  }
}
