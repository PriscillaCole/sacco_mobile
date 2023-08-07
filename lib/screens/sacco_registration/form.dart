import 'package:flutter/material.dart';
import 'package:sacco/components/custom_form_fields.dart';
import '../../components/date_time_picker.dart';
import '../../components/custom_dropdown.dart';

import '../../constants.dart';

class SaccoRegistration extends StatefulWidget {
  static String routeName = "/sacco-registration";

  @override
  _SaccoRegistrationState createState() => _SaccoRegistrationState();
}

class _SaccoRegistrationState extends State<SaccoRegistration> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Your App Title'),
      ),
      body: buildListView(),
    );
  }

  Widget buildListView() {
    return ListView.builder(
      itemCount: formFields.length,
      itemBuilder: (context, index) {
        final field = formFields[index];

        // Check if the field label matches 'Date of Birth' and add the DateTimePicker
        if (field.keyboardType == TextInputType.datetime) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                DateTimePicker(
                  initialDate: DateTime.now(),
                  firstDate: DateTime(1900),
                  lastDate: DateTime.now(),
                  labelText: 'Date of Birth',
                ),
                if (field.errorText != null)
                  Padding(
                    padding: const EdgeInsets.only(left: 15, top: 5),
                    child: Text(
                      field.errorText!,
                      style: TextStyle(color: Colors.red),
                    ),
                  ),
              ],
            ),
          );
        } else {
          // For other fields, add the regular TextField widget
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
               
                TextField(
                  style: const TextStyle(color: Color(0xFF000000)),
                  cursorColor: const Color(0xFF9b9b9b),
                  keyboardType: field.keyboardType,
                  controller: field.controller,
                  onChanged: (value) {
                    setState(() {
                      field.errorText = null; // Reset the error text
                    });

                    // Call the validator function if available
                    if (field.validator != null) {
                      final error = field.validator!(value);
                      setState(() {
                        field.errorText = error; // Set the error text
                      });
                    }
                  },
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.symmetric(
                        horizontal: 15, vertical: 15),
                    prefixIcon: Icon(
                      field.prefixIcon,
                      color: Colors.grey,
                    ),
                    hintText: field.hint,
                    hintStyle: TextStyle(
                      color: Color(0xFF9b9b9b),
                      fontSize: 15,
                      fontWeight: FontWeight.normal,
                    ),
                    labelText: field.label,
                    labelStyle:
                        TextStyle(fontSize: 17, color: Colors.grey.shade500),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide:
                          const BorderSide(width: 2, color: Color(0xffC5C5C5)),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide:
                          const BorderSide(width: 2, color: kPrimaryColor),
                    ),
                  ),
                ),
                if (field.errorText != null)
                  Padding(
                    padding: const EdgeInsets.only(left: 15, top: 5),
                    child: Text(
                      field.errorText!,
                      style: TextStyle(color: Colors.red),
                    ),
                  ),
              ],
            ),
          );
        }
      },
    );
  }
}
