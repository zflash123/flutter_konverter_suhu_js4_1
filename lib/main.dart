import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(const KonvertSuhu());
}

class KonvertSuhu extends StatefulWidget {
  const KonvertSuhu({Key? key}) : super(key: key);

  @override
  State<KonvertSuhu> createState() => _KonvertSuhuState();
}

class _KonvertSuhuState extends State<KonvertSuhu> {
  TextEditingController inputController = TextEditingController();

  double _inputUser = 0;
  double _kelvin = 0;
  double _reamur = 0;

  void convert() {
    setState(() {
      _inputUser = double.parse(inputController.text);
      _kelvin = _inputUser + 273.15;
      _reamur = (_inputUser * 4) / 5;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Konverter Suhu"),
        ),
        body: Container(
          margin: const EdgeInsets.all(8),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Input(inputController: inputController),
              Output(kelvin: _kelvin, reamur: _reamur),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size.fromHeight(50),
                ),
                onPressed: () {
                  convert();
                },
                child: const Text('Konversi Suhu'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class Input extends StatelessWidget {
  const Input({
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
        hintText: 'Masukkan Suhu Dalam Celcius'
      ),
      controller: inputController,
    );
  }
}

class Output extends StatelessWidget {
  const Output({
    Key? key,
    required double kelvin,
    required double reamur,
  })  : _kelvin = kelvin,
        _reamur = reamur,
        super(key: key);

  final double _kelvin;
  final double _reamur;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Column(
          children: [
            const Text('Suhu dalam Kelvin\n'),
            Text(
              '$_kelvin',
              style: const TextStyle(
                fontSize: 30,
              ),
            ),
          ],
        ),
        Column(
          children: [
            const Text('Suhu dalam Reamur\n'),
            Text(
              '$_reamur',
              style: const TextStyle(
                fontSize: 30,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
