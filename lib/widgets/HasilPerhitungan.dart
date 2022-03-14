import 'package:flutter/material.dart';

class HasilPerhitungan extends StatelessWidget {
  const HasilPerhitungan({
    Key? key,
    required double result,
  })  : _result = result,
        super(key: key);

  final double _result;

  @override
  Widget build(BuildContext context) {
    return Text(
      '$_result',
      style: TextStyle(fontSize: 32),
    );
  }
}