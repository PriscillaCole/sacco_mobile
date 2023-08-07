import 'package:flutter/material.dart';

class DateTimePicker extends StatefulWidget {
  final DateTime initialDate;
  final DateTime firstDate;
  final DateTime lastDate;
  final String labelText;

  const DateTimePicker({
    Key? key,
    required this.initialDate,
    required this.firstDate,
    required this.lastDate,
    required this.labelText,
  }) : super(key: key);

  @override
  _DateTimePickerState createState() => _DateTimePickerState();
}

class _DateTimePickerState extends State<DateTimePicker> {
  late DateTime selectedDate;

  @override
  void initState() {
    super.initState();
    selectedDate = widget.initialDate;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.bottomLeft,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(width: 2, color: const Color(0xffC5C5C5)),
      ),
      width: 300,
      child: TextButton(
        onPressed: () async {
          DateTime? newDate = await showDatePicker(
            context: context,
            initialDate: selectedDate,
            firstDate: widget.firstDate,
            lastDate: widget.lastDate,
          );
          if (newDate == null) return;
          setState(() {
            selectedDate = newDate;
          });
        },
        child: Text(
          '${widget.labelText} : ${selectedDate.year} / ${selectedDate.day} / ${selectedDate.month}',
          style: const TextStyle(
            fontSize: 15,
            color: Colors.black,
          ),
        ),
      ),
    );
  }
}
