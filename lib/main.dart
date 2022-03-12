import 'package:flutter/material.dart';
import '/widgets/InputanSuhu.dart';
import '/widgets/TombolKonversi.dart';

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
  List<String> listHasil = [];
  double _inputUser = 0;
  double _kelvin = 0;
  double _reamur = 0;
  double _fahrenheit = 0;
  String _newValue = "Kelvin";
  double _result = 0;

  void convert() {
    return setState(() {
      _inputUser = double.parse(inputController.text);
      _kelvin = _inputUser + 273.15;
      _reamur = (_inputUser * 4) / 5;
      _fahrenheit = (9/5 * _inputUser) + 32;
      
      if (_newValue=="Fahrenheit") {
        _result = _fahrenheit;
      } else if(_newValue=="Kelvin") {
        _result = _kelvin;
      }
      else if(_newValue=="Reamur") {
        _result = _reamur;
      }
      listHasil.add(
        "Konversi dari " + inputController.text + " Celcius ke " + _newValue + " Dengan Hasil : " + _result.toString()
      );
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
              InputanSuhu(inputController: inputController),
              const SizedBox(height: 8),
              DropdownButton(
                isExpanded: true,
                value: _newValue,
                items: listSatuanSuhu.map((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
                onChanged: (yangDiklik) {
                  setState(() {
                    if (yangDiklik=="Fahrenheit") {
                      _newValue = 'Fahrenheit';
                    } else if(yangDiklik=="Kelvin") {
                      _newValue = 'Kelvin';
                    }
                    else if(yangDiklik=="Reamur") {
                      _newValue = 'Reamur';
                    }
                  });
                },
              ),
              const Text(
                'Hasil',
                style: TextStyle(fontSize: 20),
              ),
              Text(
                '$_result',
                style: TextStyle(fontSize: 32),
              ),
              const SizedBox(height: 10),
              TombolKonversi(
                convert1: convert,
              ),
              const SizedBox(height: 10,),
              const Text(
                'Riwayat Konversi',
                style: TextStyle(fontSize: 20),
              ),
              Expanded(
                child: ListView.builder(
                    itemCount: listHasil.length,
                    itemBuilder: (context, index) {
                      return Text(listHasil[index]);
                    }),
              )
            ],
          ),
        ),
      ),
    );
  }
}

