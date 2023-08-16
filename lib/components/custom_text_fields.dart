import 'package:flutter/material.dart';

class CustomTextFormField extends StatefulWidget {
  final IconData prefixIcon;
  final String? hintText;
  final String? title;
  final TextInputType keyboardType;
  final void Function(String)? onSaved;
  final String? Function(String?)? validator;
  final String? initialValue;


  CustomTextFormField({
    required this.prefixIcon,
    this.title,
    this.hintText,
    required this.keyboardType,
    required this.onSaved,
    required this.validator, 
     this.initialValue = '', 
  });

  @override
  _CustomTextFormFieldState createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  late String fieldValue;

  @override
  void initState() {
    super.initState();
    fieldValue = widget.initialValue ?? '';
  }

  @override
  Widget build(BuildContext context) {
    return Column(
       crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(widget.title ?? '', style: const TextStyle(color: Colors.grey, fontSize: 12)), 
        TextFormField(
          style: const TextStyle(color: Color(0xFF000000)),
          cursorColor: const Color(0xFF9b9b9b),
          initialValue: widget.initialValue,
          keyboardType: widget.keyboardType,
          decoration: InputDecoration(
            prefixIcon: Icon(
              widget.prefixIcon,
              color: Colors.grey,
            ),
            hintText: widget.hintText,
            hintStyle: TextStyle(
              color: Color(0xFF9b9b9b),
              fontSize: 15,
              fontWeight: FontWeight.normal,
            ),
          ),
          onChanged: (value) {
            setState(() {
              fieldValue = value;
            });
            if (widget.onSaved != null) {
              widget.onSaved!(value);
            }
          },
          validator: (fieldValue) {
            if (widget.validator != null) {
              return widget.validator!(fieldValue);
            }
            return null;
          },
        ),
      ],
    );
  }
}
