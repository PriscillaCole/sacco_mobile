import 'package:flutter/material.dart';

class FormFieldData {
  final IconData prefixIcon;
  final String hintText;
  final TextInputType keyboardType;
  String identifier;
  final String? Function(String?)? validator;
  final String? initialValue;
  final String? title;
  final List<String>? dropdownItems;
  final String? dropdownValue;

  FormFieldData({
    required this.prefixIcon,
    required this.hintText,
    required this.keyboardType,
    required this.identifier,
    required this.validator,
    this.initialValue,
    this.title,
    this.dropdownItems,
    this.dropdownValue,
  });

  static List<FormFieldData> fieldList = [
    FormFieldData(
      prefixIcon: Icons.person,
      hintText: "Full Name",
      keyboardType: TextInputType.text,
      identifier: "_fullName",
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter Full Name';
        }
        return null;
      },
      initialValue: 'Test Initial Value',
      title: 'Full Name',
    ),
    FormFieldData(
      prefixIcon: Icons.calendar_today,
      hintText: "Date of Birth",
      keyboardType: TextInputType.datetime,
      identifier: "_dateOfBirth",
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter Date of Birth';
        }

        return null;
      },
      initialValue: 'Test Initial Value',
      title: 'Date of Birth',
    ),
    FormFieldData(
      prefixIcon: Icons.wc,
      hintText: "Gender",
      keyboardType: TextInputType.text,
      identifier: "_gender",
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please Select Gender';
        }
        return null;
      },
      title: 'Gender',
      dropdownItems: ['Male', 'Female'], // List of dropdown items
      dropdownValue: 'Male', // Select 'Male' or 'Female'
    ),
    FormFieldData(
      prefixIcon: Icons.image,
      hintText: "Image",
      keyboardType: TextInputType.text,
      identifier: "_image",
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please Select Image';
        }
        return null;
      },
      title: 'Image',
    ),
    FormFieldData(
        prefixIcon: Icons.flag,
        hintText: "Nationality",
        keyboardType: TextInputType.text,
        identifier: "_nationality",
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Please Select Nationality';
          }
          return null;
        },
        title: 'Nationality'),
    FormFieldData(
      prefixIcon: Icons.format_list_numbered,
      hintText: "Identification Number",
      keyboardType: TextInputType.number,
      identifier: "_identificationNumber",
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter Identification Number';
        }
        return null;
      },
      title: 'Identification Number',
    ),
    FormFieldData(
      prefixIcon: Icons.location_on,
      hintText: "Physical Address",
      keyboardType: TextInputType.text,
      identifier: "_physicalAddress",
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter Physical Address';
        }

        return null;
      },
      title: 'Physical Address',
    ),
    FormFieldData(
      prefixIcon: Icons.local_post_office,
      hintText: "Postal Address",
      keyboardType: TextInputType.text,
      identifier: "_postalAddress",
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter Postal Address';
        }
        return null;
      },
      title: 'Postal Address',
    ),
    FormFieldData(
      prefixIcon: Icons.email,
      hintText: "Email Address",
      keyboardType: TextInputType.text,
      identifier: "_email",
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter Email Address';
        }
        // Regular expression to match a valid email address
        final emailRegExp = RegExp(r'^[\w-]+(\.[\w-]+)*@[\w-]+(\.[\w-]+)+$');
        if (!emailRegExp.hasMatch(value)) {
          return 'Please enter a valid Email Address';
        }
        return null;
      },
      title: 'Email Address',
    ),
    FormFieldData(
      prefixIcon: Icons.phone,
      hintText: "Phone Number",
      keyboardType: TextInputType.number,
      identifier: "_phoneNumber",
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter Phone Number';
        }
        return null;
      },
      title: 'Phone Number',
    ),
    FormFieldData(
      prefixIcon: Icons.work,
      hintText: "Employment Status",
      keyboardType: TextInputType.text,
      identifier: "_employmentStatus",
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter Employment Status';
        }
        return null;
      },
      title: 'Employment Status',
    ),
    FormFieldData(
      prefixIcon: Icons.business,
      hintText: "Employer Name",
      keyboardType: TextInputType.text,
      identifier: "_employerName",
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter Employer Name';
        }
        return null;
      },
      title: 'Employer Name',
    ),
    FormFieldData(
      prefixIcon: Icons.attach_money,
      hintText: "Monthly Income",
      keyboardType: TextInputType.number,
      identifier: "_monthlyIncome",
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter Monthly Income';
        }
        return null;
      },
      title: 'Monthly Income',
    ),
    FormFieldData(
      prefixIcon: Icons.account_balance,
      hintText: "Bank Account Number",
      keyboardType: TextInputType.number,
      identifier: "_bankAccountNumber",
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter Bank Account Number';
        }
        return null;
      },
      title: 'Bank Account Number',
    ),
    FormFieldData(
      prefixIcon: Icons.account_balance,
      hintText: "Bank Name",
      keyboardType: TextInputType.text,
      identifier: "_bankName",
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter Bank Name';
        }
        return null;
      },
      title: 'Bank Name',
    ),
    FormFieldData(
      prefixIcon: Icons.group,
      hintText: "Membership Type",
      keyboardType: TextInputType.text,
      identifier: "_membershipType",
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter Membership Type';
        }
        return null;
      },
      title: 'Membership Type',
    ),
    FormFieldData(
      prefixIcon: Icons.person,
      hintText: "Next of Kin",
      keyboardType: TextInputType.text,
      identifier: "_nextOfKinName",
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter Next of Kin';
        }
        return null;
      },
      title: 'Next of Kin',
    ),
    FormFieldData(
      prefixIcon: Icons.phone,
      hintText: "Next of Kin Contact",
      identifier: "_nextOfKinContact",
      keyboardType: TextInputType.number,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter Next of Kin Contact';
        }
        return null;
      },
      title: 'Next of Kin Contact',
    ),
    FormFieldData(
      prefixIcon: Icons.person,
      hintText: "Beneficiary",
      keyboardType: TextInputType.text,
      identifier: "_beneficiaryName",
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter Beneficiary Name';
        }
        return null;
      },
      title: 'Beneficiary',
    ),
    FormFieldData(
      prefixIcon: Icons.family_restroom,
      hintText: "Beneficiary Relationship",
      keyboardType: TextInputType.text,
      identifier: "_beneficiaryRelationship",
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter Beneficiary Relationship';
        }
        return null;
      },
      title: 'Beneficiary Relationship',
    ),
  ];
}
