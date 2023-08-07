// ignore_for_file: avoid_print

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:sacco/constants.dart';
import 'package:sacco/network_utils/api.dart';
import 'package:sacco/screens/home/home_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sacco/screens/sign_in/sign_in_screen.dart';

class Body extends StatefulWidget {
  const Body({super.key});

  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  bool _isLoading = false;
  final _formKey = GlobalKey<FormState>();
  var saccoId;
  var userId;
  var fullName;
  var dateOfBirth;
  var gender;
  var image;
  var nationality;
  var identificationNumber;
  var physicalAddress;
  var postalAddress;
  var email;
  var phoneNumber;
  var employmentStatus;
  var employerName;
  var monthlyIncome;
  var bankAccountNumber;
  var bankName;
  var membershipType;
  var membershipId;
  var dateOfJoining;
  var nextOfKinName;
  var nextOfKinContact;
  var beneficiaryName;
  var beneficiaryRelationship;
  var status;
  var password;

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        color: kPrimaryLightColor,
        child: SingleChildScrollView(
          child: Stack(
            children: <Widget>[
              Padding(
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
                                keyboardType: TextInputType.number,
                                decoration: const InputDecoration(
                                  prefixIcon: Icon(
                                    Icons.work,
                                    color: Colors.grey,
                                  ),
                                  hintText: "Sacco",
                                  hintStyle: TextStyle(
                                      color: Color(0xFF9b9b9b),
                                      fontSize: 15,
                                      fontWeight: FontWeight.normal),
                                ),
                                onChanged: (value) {
                                  setState(() {
                                    saccoId = value;
                                  });
                                },
                                validator: (saccoValue) {
                                  if (saccoValue?.isEmpty ?? true) {
                                    return 'Please enter sacco';
                                  }
                                  saccoId = saccoValue;
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
                                    Icons.emoji_people,
                                    color: Colors.grey,
                                  ),
                                  hintText: "Full Name",
                                  hintStyle: TextStyle(
                                      color: Color(0xFF9b9b9b),
                                      fontSize: 15,
                                      fontWeight: FontWeight.normal),
                                ),
                                onChanged: (value) {
                                  setState(() {
                                    fullName = value;
                                  });
                                },
                                validator: (nameValue) {
                                  if (nameValue?.isEmpty ?? true) {
                                    return 'Please enter email';
                                  }
                                  fullName = nameValue;
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
                                keyboardType: TextInputType.number,
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
                                    userId = value;
                                  });
                                },
                                validator: (userIdValue) {
                                  if (userIdValue?.isEmpty ?? true) {
                                    return 'Please enter user ID';
                                  }
                                  userId = userIdValue;
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
                                    Icons.calendar_today,
                                    color: Colors.grey,
                                  ),
                                  hintText: "Date of Birth",
                                  hintStyle: TextStyle(
                                      color: Color(0xFF9b9b9b),
                                      fontSize: 15,
                                      fontWeight: FontWeight.normal),
                                ),
                                onChanged: (value) {
                                  setState(() {
                                    dateOfBirth = value;
                                  });
                                },
                                validator: (dateOfBirthValue) {
                                  if (dateOfBirthValue?.isEmpty ?? true) {
                                    return 'Please enter date of birth';
                                  }
                                  dateOfBirth = dateOfBirthValue;
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
                                    Icons.wc,
                                    color: Colors.grey,
                                  ),
                                  hintText: "Gender",
                                  hintStyle: TextStyle(
                                      color: Color(0xFF9b9b9b),
                                      fontSize: 15,
                                      fontWeight: FontWeight.normal),
                                ),
                                onChanged: (value) {
                                  setState(() {
                                    gender = value;
                                  });
                                },
                                validator: (genderValue) {
                                  if (genderValue?.isEmpty ?? true) {
                                    return 'Please enter gender';
                                  }
                                  gender = genderValue;
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
                                    Icons.image,
                                    color: Colors.grey,
                                  ),
                                  hintText: "Image URL",
                                  hintStyle: TextStyle(
                                      color: Color(0xFF9b9b9b),
                                      fontSize: 15,
                                      fontWeight: FontWeight.normal),
                                ),
                                onChanged: (value) {
                                  setState(() {
                                    image = value;
                                  });
                                },
                                validator: (imageValue) {
                                  if (imageValue?.isEmpty ?? true) {
                                    return 'Please enter image URL';
                                  }
                                  image = imageValue;
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
                                    Icons.flag,
                                    color: Colors.grey,
                                  ),
                                  hintText: "Nationality",
                                  hintStyle: TextStyle(
                                      color: Color(0xFF9b9b9b),
                                      fontSize: 15,
                                      fontWeight: FontWeight.normal),
                                ),
                                onChanged: (value) {
                                  setState(() {
                                    nationality = value;
                                  });
                                },
                                validator: (nationalityValue) {
                                  if (nationalityValue?.isEmpty ?? true) {
                                    return 'Please enter nationality';
                                  }
                                  nationality = nationalityValue;
                                  return null;
                                },
                              ),
                              TextFormField(
                                style:
                                    const TextStyle(color: Color(0xFF000000)),
                                cursorColor: const Color(0xFF9b9b9b),
                                keyboardType: TextInputType.number,
                                decoration: const InputDecoration(
                                  prefixIcon: Icon(
                                    Icons.format_list_numbered,
                                    color: Colors.grey,
                                  ),
                                  hintText: "Identification Number",
                                  hintStyle: TextStyle(
                                      color: Color(0xFF9b9b9b),
                                      fontSize: 15,
                                      fontWeight: FontWeight.normal),
                                ),
                                onChanged: (value) {
                                  setState(() {
                                    identificationNumber = value;
                                  });
                                },
                                validator: (idValue) {
                                  if (idValue?.isEmpty ?? true) {
                                    return 'Please enter identification number';
                                  }
                                  identificationNumber = idValue;
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
                                    Icons.location_on,
                                    color: Colors.grey,
                                  ),
                                  hintText: "Physical Address",
                                  hintStyle: TextStyle(
                                      color: Color(0xFF9b9b9b),
                                      fontSize: 15,
                                      fontWeight: FontWeight.normal),
                                ),
                                onChanged: (value) {
                                  setState(() {
                                    physicalAddress = value;
                                  });
                                },
                                validator: (addressValue) {
                                  if (addressValue?.isEmpty ?? true) {
                                    return 'Please enter physical address';
                                  }
                                  physicalAddress = addressValue;
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
                                    Icons.local_post_office,
                                    color: Colors.grey,
                                  ),
                                  hintText: "Postal Address",
                                  hintStyle: TextStyle(
                                      color: Color(0xFF9b9b9b),
                                      fontSize: 15,
                                      fontWeight: FontWeight.normal),
                                ),
                                onChanged: (value) {
                                  setState(() {
                                    postalAddress = value;
                                  });
                                },
                                validator: (postalValue) {
                                  if (postalValue?.isEmpty ?? true) {
                                    return 'Please enter postal address';
                                  }
                                  postalAddress = postalValue;
                                  return null;
                                },
                              ),
                              TextFormField(
                                style:
                                    const TextStyle(color: Color(0xFF000000)),
                                cursorColor: const Color(0xFF9b9b9b),
                                keyboardType: TextInputType.phone,
                                decoration: const InputDecoration(
                                  prefixIcon: Icon(
                                    Icons.phone,
                                    color: Colors.grey,
                                  ),
                                  hintText: "Phone Number",
                                  hintStyle: TextStyle(
                                      color: Color(0xFF9b9b9b),
                                      fontSize: 15,
                                      fontWeight: FontWeight.normal),
                                ),
                                onChanged: (value) {
                                  setState(() {
                                    phoneNumber = value;
                                  });
                                },
                                validator: (phoneValue) {
                                  if (phoneValue?.isEmpty ?? true) {
                                    return 'Please enter phone number';
                                  }
                                  phoneNumber = phoneValue;
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
                                    Icons.work,
                                    color: Colors.grey,
                                  ),
                                  hintText: "Employment Status",
                                  hintStyle: TextStyle(
                                      color: Color(0xFF9b9b9b),
                                      fontSize: 15,
                                      fontWeight: FontWeight.normal),
                                ),
                                onChanged: (value) {
                                  setState(() {
                                    employmentStatus = value;
                                  });
                                },
                                validator: (employmentValue) {
                                  if (employmentValue?.isEmpty ?? true) {
                                    return 'Please enter employment status';
                                  }
                                  employmentStatus = employmentValue;
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
                                    Icons.business,
                                    color: Colors.grey,
                                  ),
                                  hintText: "Employer Name",
                                  hintStyle: TextStyle(
                                      color: Color(0xFF9b9b9b),
                                      fontSize: 15,
                                      fontWeight: FontWeight.normal),
                                ),
                                onChanged: (value) {
                                  setState(() {
                                    employerName = value;
                                  });
                                },
                                validator: (employerValue) {
                                  if (employerValue?.isEmpty ?? true) {
                                    return 'Please enter employer name';
                                  }
                                  employerName = employerValue;
                                  return null;
                                },
                              ),
                              TextFormField(
                                style:
                                    const TextStyle(color: Color(0xFF000000)),
                                cursorColor: const Color(0xFF9b9b9b),
                                keyboardType: TextInputType.number,
                                decoration: const InputDecoration(
                                  prefixIcon: Icon(
                                    Icons.attach_money,
                                    color: Colors.grey,
                                  ),
                                  hintText: "Monthly Income",
                                  hintStyle: TextStyle(
                                      color: Color(0xFF9b9b9b),
                                      fontSize: 15,
                                      fontWeight: FontWeight.normal),
                                ),
                                onChanged: (value) {
                                  setState(() {
                                    monthlyIncome = value;
                                  });
                                },
                                validator: (incomeValue) {
                                  if (incomeValue?.isEmpty ?? true) {
                                    return 'Please enter monthly income';
                                  }
                                  monthlyIncome = incomeValue;
                                  return null;
                                },
                              ),
                              TextFormField(
                                style:
                                    const TextStyle(color: Color(0xFF000000)),
                                cursorColor: const Color(0xFF9b9b9b),
                                keyboardType: TextInputType.number,
                                decoration: const InputDecoration(
                                  prefixIcon: Icon(
                                    Icons.account_balance,
                                    color: Colors.grey,
                                  ),
                                  hintText: "Bank Account Number",
                                  hintStyle: TextStyle(
                                      color: Color(0xFF9b9b9b),
                                      fontSize: 15,
                                      fontWeight: FontWeight.normal),
                                ),
                                onChanged: (value) {
                                  setState(() {
                                    bankAccountNumber = value;
                                  });
                                },
                                validator: (accountNumberValue) {
                                  if (accountNumberValue?.isEmpty ?? true) {
                                    return 'Please enter bank account number';
                                  }
                                  bankAccountNumber = accountNumberValue;
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
                                    Icons.account_balance,
                                    color: Colors.grey,
                                  ),
                                  hintText: "Bank Name",
                                  hintStyle: TextStyle(
                                      color: Color(0xFF9b9b9b),
                                      fontSize: 15,
                                      fontWeight: FontWeight.normal),
                                ),
                                onChanged: (value) {
                                  setState(() {
                                    bankName = value;
                                  });
                                },
                                validator: (bankNameValue) {
                                  if (bankNameValue?.isEmpty ?? true) {
                                    return 'Please enter bank name';
                                  }
                                  bankName = bankNameValue;
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
                                    Icons.badge,
                                    color: Colors.grey,
                                  ),
                                  hintText: "Membership Type",
                                  hintStyle: TextStyle(
                                      color: Color(0xFF9b9b9b),
                                      fontSize: 15,
                                      fontWeight: FontWeight.normal),
                                ),
                                onChanged: (value) {
                                  setState(() {
                                    membershipType = value;
                                  });
                                },
                                validator: (typeValue) {
                                  if (typeValue?.isEmpty ?? true) {
                                    return 'Please enter membership type';
                                  }
                                  membershipType = typeValue;
                                  return null;
                                },
                              ),
                              TextFormField(
                                style:
                                    const TextStyle(color: Color(0xFF000000)),
                                cursorColor: const Color(0xFF9b9b9b),
                                keyboardType: TextInputType.number,
                                decoration: const InputDecoration(
                                  prefixIcon: Icon(
                                    Icons.badge,
                                    color: Colors.grey,
                                  ),
                                  hintText: "Membership ID",
                                  hintStyle: TextStyle(
                                      color: Color(0xFF9b9b9b),
                                      fontSize: 15,
                                      fontWeight: FontWeight.normal),
                                ),
                                onChanged: (value) {
                                  setState(() {
                                    membershipId = value;
                                  });
                                },
                                validator: (idValue) {
                                  if (idValue?.isEmpty ?? true) {
                                    return 'Please enter membership ID';
                                  }
                                  membershipId = idValue;
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
                                    Icons.calendar_today,
                                    color: Colors.grey,
                                  ),
                                  hintText: "Date of Joining",
                                  hintStyle: TextStyle(
                                      color: Color(0xFF9b9b9b),
                                      fontSize: 15,
                                      fontWeight: FontWeight.normal),
                                ),
                                onChanged: (value) {
                                  setState(() {
                                    dateOfJoining = value;
                                  });
                                },
                                validator: (dateValue) {
                                  if (dateValue?.isEmpty ?? true) {
                                    return 'Please enter date of joining';
                                  }
                                  dateOfJoining = dateValue;
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
                                    Icons.person_pin,
                                    color: Colors.grey,
                                  ),
                                  hintText: "Next of Kin Name",
                                  hintStyle: TextStyle(
                                      color: Color(0xFF9b9b9b),
                                      fontSize: 15,
                                      fontWeight: FontWeight.normal),
                                ),
                                onChanged: (value) {
                                  setState(() {
                                    nextOfKinName = value;
                                  });
                                },
                                validator: (nextOfKinValue) {
                                  if (nextOfKinValue?.isEmpty ?? true) {
                                    return 'Please enter next of kin name';
                                  }
                                  nextOfKinName = nextOfKinValue;
                                  return null;
                                },
                              ),
                              TextFormField(
                                style:
                                    const TextStyle(color: Color(0xFF000000)),
                                cursorColor: const Color(0xFF9b9b9b),
                                keyboardType: TextInputType.phone,
                                decoration: const InputDecoration(
                                  prefixIcon: Icon(
                                    Icons.phone,
                                    color: Colors.grey,
                                  ),
                                  hintText: "Next of Kin Contact",
                                  hintStyle: TextStyle(
                                      color: Color(0xFF9b9b9b),
                                      fontSize: 15,
                                      fontWeight: FontWeight.normal),
                                ),
                                onChanged: (value) {
                                  setState(() {
                                    nextOfKinContact = value;
                                  });
                                },
                                validator: (nextOfKinContactValue) {
                                  if (nextOfKinContactValue?.isEmpty ?? true) {
                                    return 'Please enter next of kin contact';
                                  }
                                  nextOfKinContact = nextOfKinContactValue;
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
                                    Icons.person,
                                    color: Colors.grey,
                                  ),
                                  hintText: "Beneficiary Name",
                                  hintStyle: TextStyle(
                                      color: Color(0xFF9b9b9b),
                                      fontSize: 15,
                                      fontWeight: FontWeight.normal),
                                ),
                                onChanged: (value) {
                                  setState(() {
                                    beneficiaryName = value;
                                  });
                                },
                                validator: (beneficiaryValue) {
                                  if (beneficiaryValue?.isEmpty ?? true) {
                                    return 'Please enter beneficiary name';
                                  }
                                  beneficiaryName = beneficiaryValue;
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
                                    Icons.people,
                                    color: Colors.grey,
                                  ),
                                  hintText: "Beneficiary Relationship",
                                  hintStyle: TextStyle(
                                      color: Color(0xFF9b9b9b),
                                      fontSize: 15,
                                      fontWeight: FontWeight.normal),
                                ),
                                onChanged: (value) {
                                  setState(() {
                                    beneficiaryRelationship = value;
                                  });
                                },
                                validator: (beneficiaryRelationValue) {
                                  if (beneficiaryRelationValue?.isEmpty ??
                                      true) {
                                    return 'Please enter beneficiary relationship';
                                  }
                                  beneficiaryRelationship =
                                      beneficiaryRelationValue;
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
                                    Icons.check,
                                    color: Colors.grey,
                                  ),
                                  hintText: "Status",
                                  hintStyle: TextStyle(
                                      color: Color(0xFF9b9b9b),
                                      fontSize: 15,
                                      fontWeight: FontWeight.normal),
                                ),
                                onChanged: (value) {
                                  setState(() {
                                    status = value;
                                  });
                                },
                                validator: (statusValue) {
                                  if (statusValue?.isEmpty ?? true) {
                                    return 'Please enter status';
                                  }
                                  status = statusValue;
                                  return null;
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
                              builder: (context) => const SignInScreen(),
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
              )
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

    var data = {
      'sacco_id': saccoId,
      'user_id': userId,
      'full_name': fullName,
      'date_of_birth': dateOfBirth,
      'gender': gender,
      'image': image,
      'nationality': nationality,
      'identification_number': identificationNumber,
      'physical_address': physicalAddress,
      'postal_address': postalAddress,
      'email': email,
      'phone_number': phoneNumber,
      'employment_status': employmentStatus,
      'employer_name': employerName,
      'monthly_income': monthlyIncome,
      'bank_account_number': bankAccountNumber,
      'bank_name': bankName,
      'membership_type': membershipType,
      'membership_id': membershipId,
      'date_of_joining': dateOfJoining,
      'next_of_kin_name': nextOfKinName,
      'next_of_kin_contact': nextOfKinContact,
      'beneficiary_name': beneficiaryName,
      'beneficiary_relationship': beneficiaryRelationship,
      'status': status,
    };

    final res = await Network().authData(data, '/sacco_members');

    final body = json.decode(res.body);
    if (body['code'] == 1) {

      var userData = body['data'];

      SharedPreferences localStorage = await SharedPreferences.getInstance();
      localStorage.setString('sacco_member', json.encode(userData));

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
