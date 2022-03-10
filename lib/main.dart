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
  List<String> listSatuanSuhu = ['Kelvin', 'Reamur', 'Fahrenheit'];
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
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              TextFormField(
                keyboardType: TextInputType.number,
                inputFormatters: <TextInputFormatter>[
                  FilteringTextInputFormatter.digitsOnly
                ],
                decoration: const InputDecoration(
                  labelText: 'Celcius',
                  hintText: 'Enter the temperature in celcius',
                ),
                controller: inputController,
              ),
              const SizedBox(height: 8),
              DropdownButton(
                isExpanded: true,
                value: 'Fahrenheit',
                items: listSatuanSuhu.map((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
                onChanged: (value) {},
              ),
              const Text(
                'Hasil',
                style: TextStyle(fontSize: 20),
              ),
              Text(
                '365',
                style: TextStyle(fontSize: 32),
              ),
              SizedBox(height: 10),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size.fromHeight(50),
                ),
                onPressed: () {
                  convert();
                },
                child: const Text('Konversi Suhu'),
              ),
              SizedBox(
                height: 10,
              ),
              const Text(
                'Riwayat Konversi',
                style: TextStyle(fontSize: 20),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
