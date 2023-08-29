import 'package:flutter/material.dart';

class CustomTextFormField extends StatefulWidget {
  final IconData prefixIcon;
  final String? hintText;
  final String? title;
  final TextInputType keyboardType;
  final void Function(String)? onSaved;
  final String? Function(String?)? validator;
  final String? initialValue;
    final List<String>? dropdownItems; // Add this field
  final String? dropdownValue; 


  const CustomTextFormField({Key? key,
    required this.prefixIcon,
    this.title,
    this.hintText,
    required this.keyboardType,
    required this.onSaved,
    required this.validator, 
     this.initialValue = '', 
  this.dropdownItems,   
    this.dropdownValue,   
  }) : super(key: key); 

  @override
  // ignore: library_private_types_in_public_api
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
        if (widget.keyboardType != TextInputType.datetime)
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
                  hintStyle: const TextStyle(
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
              )
        else if (widget.keyboardType == TextInputType.datetime) 
            Container(
                decoration: const BoxDecoration(
                  border: Border(
                    bottom: BorderSide(color: Colors.grey), // Add underline
                  ),
                ),
                child: Row(
                  children: [
                     const SizedBox(width: 12), 
                    Icon(
                      widget.prefixIcon,
                      color: Colors.grey,
                    ),
                    const SizedBox(width: 8), // Add spacing between icon and text
                    Expanded(
                      child: TextButton(
                        onPressed: () async {
                          final selectedDate = await showDatePicker(
                            context: context,
                            initialDate: DateTime.now(),
                            firstDate: DateTime(1900),
                            lastDate: DateTime(2101),
                          );
                          if (selectedDate != null) {
                            setState(() {
                              fieldValue = selectedDate.toString();
                            });
                            if (widget.onSaved != null) {
                              widget.onSaved!(selectedDate.toString());
                            }
                          }
                        },
                        style: ButtonStyle(
                          alignment: Alignment.centerLeft,
                          overlayColor: MaterialStateProperty.all(Colors.transparent),
                          padding: MaterialStateProperty.all(
                            const EdgeInsets.only(left: 8), // Adjust the left padding
                          ),
                        
                        ),
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            fieldValue.isNotEmpty ? fieldValue : widget.hintText!,
                            style: TextStyle(
                              color: fieldValue.isEmpty ? const Color(0xFF9b9b9b) : const Color(0xFF000000),
                              fontSize: 15,
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              )
            else if (widget.dropdownItems != null) 
              Container(
            decoration: BoxDecoration(
              border: Border(bottom: BorderSide(color: Colors.grey)),
            ),
            child: Row(
              children: [
                SizedBox(width: 12),
                Icon(
                  widget.prefixIcon,
                  color: Colors.grey,
                ),
                SizedBox(width: 8),
                Expanded(
                  child: DropdownButtonFormField<String>(
                    decoration: InputDecoration(
                      hintText: widget.hintText,
                      hintStyle: TextStyle(
                        color: Color(0xFF9b9b9b),
                        fontSize: 15,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                    items: widget.dropdownItems!
                        .map((String item) => DropdownMenuItem<String>(
                              value: item,
                              child: Text(item),
                            ))
                        .toList(),
                    value: widget.dropdownValue,
                    onChanged: (value) {
                      setState(() {
                        fieldValue = value!;
                      });
                      if (widget.onSaved != null) {
                        widget.onSaved!(value!);
                      }
                    },
                    validator: (value) {
                      if (widget.validator != null) {
                        return widget.validator!(value);
                      }
                      return null;
                    },
                  ),
                ),
              ],
            ),
          ),
      ],
    );
  }
}
