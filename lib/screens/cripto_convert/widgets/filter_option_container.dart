// ignore_for_file: must_call_super

import 'package:flutter/material.dart';

class FilterOptionContainer extends StatefulWidget {
  final String title;
  final List<String> option;

  const FilterOptionContainer({
    Key? key,
    required this.title,
    required this.option,
  }) : super(key: key);

  @override
  State<FilterOptionContainer> createState() => _FilterOptionContainerState();
}

class _FilterOptionContainerState extends State<FilterOptionContainer> {
  String dropdownvalue = 'Moeda';

  var items = ['Moeda'];

  @override
  void initState() {
    super.initState();
    items.addAll(widget.option);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            border: Border.all(color: Colors.grey.shade300, width: 2),
          ),
          margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
          padding: const EdgeInsets.only(left: 5),
          child: DropdownButton(
            underline: const SizedBox(),
            iconEnabledColor: Colors.grey.shade300,
            isExpanded: true,
            value: dropdownvalue,
            icon: const Icon(Icons.keyboard_arrow_up),

            // Array list of items
            items: items.map((String items) {
              return DropdownMenuItem(
                value: items,
                child: Text(items),
              );
            }).toList(),
            // After selecting the desired option,it will
            // change button value to selected value
            onChanged: (String? newValue) {
              setState(() {
                dropdownvalue = newValue!;
              });
            },
          ),
        ),
      ],
    );
  }
}
