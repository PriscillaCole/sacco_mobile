import 'package:flutter/material.dart';
import 'package:sacco/constants.dart';

class Body extends StatefulWidget {
  static String routeName = "/body";
  const Body({super.key});

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  DateTime date = DateTime.now();
  final TextEditingController texts = TextEditingController();
  FocusNode ex = FocusNode();
  final TextEditingController amounts = TextEditingController();
  FocusNode amount = FocusNode();

  String? selectedItem;
  final List<String> _item = [
    "sacco 1",
    "sacco 2",
    "sacco 3",
  ];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    ex.addListener(() {
      setState(() {});
    });
    amount.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Stack(
        alignment: AlignmentDirectional.center,
        children: [
          backgroundContainer(context),
          Positioned(
            top: 120,
            child: mainContainer(),
          )
        ],
      ),
    );
  }

  Container mainContainer() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      height: 550,
      width: 340,
      child: Column(children: [
        const SizedBox(height: 50),
        name(),
        const SizedBox(height: 20),
        dataFields(),
        const SizedBox(height: 20),
        amountField(),
        const SizedBox(height: 20),
        date_time(),
      ]),
    );
  }

  Widget date_time() {
    return Container(
      alignment: Alignment.bottomLeft,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(width: 2, color: const Color(0xffC5C5C5))),
      width: 300,
      child: TextButton(
        onPressed: () async {
          DateTime? newDate = await showDatePicker(
              context: context,
              initialDate: date,
              firstDate: DateTime(2023 ),
              lastDate: DateTime(2100));
          if (newDate == Null) return;
          setState(() {
            date = newDate!;
          });
        },
        child: Text(
          'Date : ${date.year} / ${date.day} / ${date.month}',
          style: const TextStyle(
            fontSize: 15,
            color: Colors.black,
          ),
        ),
      ),
    );
  }

  Padding name() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        width: 300,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            width: 2,
            color: const Color(0xffC5C5C5),
          ),
        ),
        child: DropdownButton<String>(
          value: selectedItem,
          onChanged: ((value) {
            setState(() {
              selectedItem = value!;
            });
          }),
          items: _item
              .map((e) => DropdownMenuItem(
                    value: e,
                    child: Container(
                      alignment: Alignment.center,
                      child: Row(
                        children: [
                          Text(
                            e,
                            style: const TextStyle(fontSize: 18),
                          )
                        ],
                      ),
                    ),
                  ))
              .toList(),
          selectedItemBuilder: (BuildContext context) => _item
              .map((e) => Row(
                    children: [Text(e)],
                  ))
              .toList(),
          hint: const Padding(
            padding: EdgeInsets.only(top: 12),
            child: Text(
              'Select Sacco',
              style: TextStyle(color: Colors.grey),
            ),
          ),
          dropdownColor: Colors.white,
          isExpanded: true,
          underline: Container(),
        ),
      ),
    );
  }

  Padding dataFields() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: TextField(
        focusNode: ex,
        controller: texts,
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
          labelText: 'explain',
          labelStyle: TextStyle(fontSize: 17, color: Colors.grey.shade500),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(width: 2, color: Color(0xffC5C5C5))),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(width: 2, color: kPrimaryColor)),
        ),
      ),
    );
  }

  Padding amountField() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: TextField(
        keyboardType: TextInputType.number,
        focusNode: amount,
        controller: amounts,
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
          labelText: 'amount',
          labelStyle: TextStyle(fontSize: 17, color: Colors.grey.shade500),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(width: 2, color: Color(0xffC5C5C5))),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(width: 2, color: Color(0xff368983))),
        ),
      ),
    );
  }

  Column backgroundContainer(BuildContext context) {
    return Column(
      children: [
        Container(
          width: double.infinity,
          height: 240,
          decoration: const BoxDecoration(
            color: kPrimaryColor,
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(20),
              bottomRight: Radius.circular(20),
            ),
          ),
          child: Column(
            children: [
              const SizedBox(height: 40),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context).pop();
                      },
                      child: const Icon(
                        Icons.arrow_back,
                        color: Colors.white,
                      ),
                    ),
                    const Text(
                      "Sacco Registration",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                      ),
                    ),
                    const Icon(
                      Icons.attach_file_outlined,
                      color: Colors.white,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
