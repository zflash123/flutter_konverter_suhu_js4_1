import 'package:flutter/material.dart';

class TombolKonversi extends StatelessWidget {
  
  const TombolKonversi( {
    Key? key, 
    required this.convert1,
    
  }) : super(key: key);
  final Function convert1;
  
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        minimumSize: const Size.fromHeight(50),
      ),
      onPressed: () {
        convert1();
      },
      child: const Text('Konversi Suhu'),
    );
  }
}