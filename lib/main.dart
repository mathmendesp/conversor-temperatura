import 'package:flutter/material.dart';

void main() => runApp(TemperatureConverterApp());

class TemperatureConverterApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Temperature Converter',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: TemperatureConverterPage(),
    );
  }
}

class TemperatureConverterPage extends StatefulWidget {
  @override
  _TemperatureConverterPageState createState() =>
      _TemperatureConverterPageState();
}

class _TemperatureConverterPageState extends State<TemperatureConverterPage> {
  double fahrenheit = 0;
  double celsius = 0;

  void convertTemperature() {
    setState(() {
      celsius = (fahrenheit - 32) * 5 / 9;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Temperature Converter'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              onChanged: (value) {
                setState(() {
                  fahrenheit = double.tryParse(value) ?? 0;
                });
              },
              decoration: InputDecoration(
                labelText: 'Fahrenheit',
              ),
              keyboardType: TextInputType.number,
            ),
            SizedBox(height: 16.0),
            RaisedButton(
              onPressed: convertTemperature,
              child: Text('Convert'),
            ),
            SizedBox(height: 16.0),
            Text(
              'Celsius: $celsius',
              style: TextStyle(fontSize: 20),
            ),
          ],
        ),
      ),
    );
  }
}
