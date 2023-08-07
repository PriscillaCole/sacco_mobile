import 'package:flutter/material.dart';

class FormFieldData {
  String label;
  String hint;
  IconData prefixIcon;
  TextEditingController controller;
  Function(String)? validator;
  String? errorText;
  TextInputType keyboardType;

  FormFieldData({
    required this.label,
    required this.hint,
    required this.prefixIcon,
    required this.controller,
    this.validator,
    this.errorText,
    required this.keyboardType,
  });
}

List<FormFieldData> formFields = [
  FormFieldData(
    label: 'Sacco ID',
    hint: 'Enter Sacco ID',
    prefixIcon: Icons.check,
    controller: TextEditingController(),
    keyboardType: TextInputType.number, 
    errorText: 'Sacco ID is required',
  ),
  FormFieldData(
    label: 'User ID',
    hint: 'Enter User ID',
    prefixIcon: Icons.person,
    controller: TextEditingController(),
    keyboardType: TextInputType.number, 
    errorText: 'User ID is required',
  ),
    FormFieldData(
    label: 'Full Name',
    hint: 'Enter full name',
    prefixIcon: Icons.person,
    controller: TextEditingController(),
    keyboardType: TextInputType.text, 
    errorText: 'Full name is required',
  ),
    FormFieldData(
    label: 'Email',
    hint: 'Enter Email',
    prefixIcon: Icons.email,
    controller: TextEditingController(),
     keyboardType: TextInputType.text, 
      errorText: 'Email is required',
  ),
    FormFieldData(
    label: 'Username',
    hint: 'Enter Username',
    prefixIcon: Icons.person,
    controller: TextEditingController(),
     keyboardType: TextInputType.text, 
      errorText: 'Username is required',
  ),
    FormFieldData(
    label: 'Date of Birth',
    hint: 'Enter date of Birth',
    prefixIcon: Icons.calendar_today,
    controller: TextEditingController(),
    keyboardType: TextInputType.datetime,
    errorText: 'Date of Birth is required',
  ),
    FormFieldData(
    label: 'Gender',
    hint: 'Enter gender',
    prefixIcon: Icons.wc,
    controller: TextEditingController(),
    keyboardType: TextInputType.text,
  
  ),
    FormFieldData(
    label: 'Image',
    hint: 'Select Image',
    prefixIcon: Icons.image,
    controller: TextEditingController(),
    keyboardType: TextInputType.text,
    errorText: 'Image is required',
  ),
    FormFieldData(
    label: 'Nationality',
    hint: 'Select Nationality',
    prefixIcon: Icons.flag,
    controller: TextEditingController(),
    keyboardType: TextInputType.text,

  ),  
    FormFieldData(
    label: 'National ID',
    hint: 'Enter Identification Number',
    prefixIcon: Icons.format_list_numbered,
    controller: TextEditingController(),
    keyboardType: TextInputType.number,
    errorText: 'National ID is required',
  ),
   FormFieldData(
    label: 'Physical Address',
    hint: 'Enter Addresss',
    prefixIcon: Icons.location_on,
    controller: TextEditingController(),
    keyboardType: TextInputType.text,
    errorText: 'Physical Address is required',
  ),
   FormFieldData(
    label: 'Postal Address',
    hint: 'Enter postal address',
    prefixIcon: Icons.local_post_office,
    controller: TextEditingController(),
    keyboardType: TextInputType.text,
    errorText: 'Postal Address is required',
  ),
   FormFieldData(
    label: 'Phone Number',
    hint: 'Enter Phone Number',
    prefixIcon: Icons.phone,
    controller: TextEditingController(),
    keyboardType: TextInputType.number,
    errorText: 'Phone Number is required',
  ),

  

];
