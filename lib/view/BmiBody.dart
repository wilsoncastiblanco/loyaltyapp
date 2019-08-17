import 'package:flutter/material.dart';
import 'BmiForm.dart';

class BmiBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Container(
      alignment: Alignment.topCenter,
      child: new ListView(
        padding: const EdgeInsets.all(2.5),
        children: <Widget>[
          new BmiLogo(),
          new BmiForm(),
        ],
      ),
    );
  }
}


class BmiLogo extends Widget {
  @override
  Element createElement() {
    return new Image.asset(
      'images/bmilogo.png',
      height: 133.0,
      width: 200.0,
    ).createElement();
  }
}
