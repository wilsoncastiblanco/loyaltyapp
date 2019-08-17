import 'dart:math';
import 'package:flutter/material.dart';

class BmiForm extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new BmiFormState();
  }
}

class _BmiData {
  String age = "";
  String heightInCm = "";
  String weightInKg = "";
}

class BmiFormState extends State<BmiForm> {
  final _formKey = GlobalKey<FormState>();

  String _bmiResult = "";
  String _bmiValue = "";

  _BmiData _bmiData = new _BmiData();

  void _calculateBmi() {
    int weightInKgs = int.parse(_bmiData.weightInKg);
    int heightInCm = int.parse(_bmiData.heightInCm);
    setState(() {
      _bmiValue = ((weightInKgs / pow(heightInCm, 2)) * 10000).toString();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          ListTile(
            leading: const Icon(Icons.person),
            title: TextFormField(
              decoration: InputDecoration(labelText: "Age"),
              validator: (value) {
                if (value.isEmpty) {
                  return "Invalid data";
                } else {
                  _bmiData.age = value;
                }
              },
            ),
          ),
          ListTile(
            leading: const Icon(Icons.insert_chart),
            title: TextFormField(
              decoration: InputDecoration(labelText: "Height in cm"),
              validator: (value) {
                if (value.isEmpty) {
                  return "Invalid data";
                } else {
                  _bmiData.heightInCm = value;
                  print("+++++++ ${_bmiData.heightInCm} [[[[[ $value");
                }
              },
            ),
          ),
          ListTile(
            leading: const Icon(Icons.line_style),
            title: TextFormField(
              decoration: InputDecoration(labelText: "Weight in Kg"),
              validator: (value) {
                if (value.isEmpty) {
                  return "Invalid data";
                } else {
                  _bmiData.weightInKg = value;
                }
              },
            ),
          ),
          Center(
            child: RaisedButton(
              onPressed: () {
                if(_formKey.currentState.validate()) {
                  setState(() {
                    _bmiData.weightInKg = _bmiData.weightInKg;
                    _bmiData.heightInCm = _bmiData.heightInCm;
                  });
                  _calculateBmi();
                }

              },
              color: Colors.pinkAccent,
              textColor: Colors.white,
              child: Text("Calculate"),
            ),
          ),
          Center(
            child: Text(
              "Your BMI is: $_bmiValue",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.blueAccent,
                  fontSize: 19.0),
            ),
          ),
          Center(
            child: Text(
              _bmiResult,
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.red,
                  fontSize: 21.0),
            ),
          )
        ],
      ),
    );
  }
}
