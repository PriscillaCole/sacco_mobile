import 'package:sacco/services/api_service.dart';
import 'package:sacco/models/sacco_member.dart';
import 'package:sacco/database/sacco_member_registration.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

class SaccoMemberController {
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
  
void updateFormFieldValue(String identifier, dynamic value) {
  switch (identifier) {
    case "_fullName":
      _fullName = value;
      break;
    case "_dateOfBirth":
      _dateOfBirth = value;
      break;
    case "_gender":
      _gender = value;
      break;
    case "_image":
      _image = value;
      break;
    case "nationality":
      _nationality = value;
      break;
    case "identification_number":
      _identificationNumber = int.parse(value);
      break;
    case "physical_address":
      _physicalAddress = value;
      break;
    case "postal_address":
      _postalAddress = value;
      break;
    case "email":
      _email = value;
      break;
    case "phone_number":
      _phoneNumber = int.parse(value);
      break;
    case "employment_status":
      _employmentStatus = value;
      break;
    case "employer_name":
      _employerName = value;
      break;
    case "monthly_income":
      _monthlyIncome = int.parse(value);
      break;
    case "bank_account_number":
      _bankAccountNumber = int.parse(value);
      break;
    case "bank_name":
      _bankName = value;
      break;
    case "membership_type":
      _membershipType = value;
      break;
    case "membership_id":
      _membershipId = value;
      break;
    case "date_of_joining":
      _dateOfJoining = value;
      break;
    case "next_of_kin_name":
      _nextOfKinName = value;
      break;
    case "next_of_kin_contact":
      _nextOfKinContact = int.parse(value);
      break;
    case "beneficiary_name":
      _beneficiaryName = value;
      break;
    case "beneficiary_relationship":
      _beneficiaryRelationship = value;
      break;
    
  }
}

}
