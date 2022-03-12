import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class InputanSuhu extends StatelessWidget {
  const InputanSuhu({
    Key? key,
    required this.inputController,
  }) : super(key: key);

  final TextEditingController inputController;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: TextInputType.number,
      inputFormatters: <TextInputFormatter>[
        FilteringTextInputFormatter.digitsOnly
      ],
      decoration: const InputDecoration(
        labelText: 'Celcius',
        hintText: 'Enter the temperature in celcius',
      ),
      controller: inputController,
    );
  }
}