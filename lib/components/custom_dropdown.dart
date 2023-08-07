import 'package:flutter/material.dart';

class CustomDropdownButton extends StatefulWidget {
  final List<String> items;
  final String selectedItem;
  final Function(String?) onChanged;
  final String hintText;
  final Color borderColor;
  final Color hintTextColor;
  final Color dropdownColor;

  CustomDropdownButton({
    required this.items,
    required this.selectedItem,
    required this.onChanged,
    this.hintText = 'Select Option',
    this.borderColor = const Color(0xffC5C5C5),
    this.hintTextColor = Colors.grey,
    this.dropdownColor = Colors.white,
  });

  @override
  _CustomDropdownButtonState createState() => _CustomDropdownButtonState();
}

class _CustomDropdownButtonState extends State<CustomDropdownButton> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        width: 300,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            width: 2,
            color: widget.borderColor,
          ),
        ),
        child: DropdownButton<String>(
          value: widget.selectedItem,
          onChanged: widget.onChanged,
          items: widget.items
              .map((e) => DropdownMenuItem(
                    value: e,
                    child: Container(
                      alignment: Alignment.center,
                      child: Row(
                        children: [
                          Text(
                            e,
                            style: const TextStyle(fontSize: 18),
                          ),
                        ],
                      ),
                    ),
                  ))
              .toList(),
          selectedItemBuilder: (BuildContext context) => widget.items
              .map((e) => Row(
                    children: [Text(e)],
                  ))
              .toList(),
          hint: Padding(
            padding: const EdgeInsets.only(top: 12),
            child: Text(
              widget.hintText,
              style: TextStyle(color: widget.hintTextColor),
            ),
          ),
          dropdownColor: widget.dropdownColor,
          isExpanded: true,
          underline: Container(),
        ),
      ),
    );
  }
}
