import 'package:flutter/material.dart';

class DropdownSuhu extends StatelessWidget {

  const DropdownSuhu({
    Key? key,
    // required this.yangDiklik,
    required this.newValue,
    required this.listSatuanSuhu,
    required this.onDropdownChanged,
  }) : super(key: key);
  final Function onDropdownChanged;
  // final String yangDiklik;
  final String newValue;
  final List<String> listSatuanSuhu;

  @override
  Widget build(BuildContext context) {
    return DropdownButton(
      isExpanded: true,
      value: newValue,
      items: listSatuanSuhu.map((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
      onChanged: (value) {
        onDropdownChanged(value);
      },
    );
  }
}