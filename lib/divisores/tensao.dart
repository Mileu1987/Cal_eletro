import 'dart:ffi';

import 'package:flutter/material.dart';

class tensao extends StatefulWidget {
  @override
  _tensaoState createState() => _tensaoState();
}

class _tensaoState extends State<tensao> {
  String resistorone, resistortwo, vin, vout;
  TextEditingController vInController = new TextEditingController();
  TextEditingController resOneController = new TextEditingController();

  TextEditingController resTwoController = new TextEditingController();

  TextEditingController vOutController = new TextEditingController();
  String _infoText = "";
  double vinResul, resoneResul, restwoResul,voutResul;

  GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  void calcula() {
    setState(() {
      double vin = double.tryParse(vInController.text);

      double resistorone = double.tryParse(resOneController.text);
      double resistortwo = double.tryParse(resTwoController.text);
      double vout = double.tryParse(vOutController.text);

      if (vin == null) {
        vinResul = resistorone + resistortwo + vout;
        vInController.text =
            "${vinResul.toStringAsPrecision(3)} v";
        
      } else if (resistorone == null) {
        resoneResul = vin + resistortwo + vout;
        resOneController.text =
            "${resoneResul.toStringAsPrecision(3)} v";
        
      } else if (resistortwo == null) {
        restwoResul = vin + resistorone + vout;
        resTwoController.text =
            "${resoneResul.toStringAsPrecision(3)} v";
      } else if (vout == null) {



        voutResul = ((resistortwo /(resistorone+resistortwo))* vin );
        vOutController.text =
            "     ${voutResul.toStringAsPrecision(2)} v";
      }
      
      
      
      
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(
          title: new Text('Divisor de tensão'),
        ),
        backgroundColor: Colors.white,
        body: new SingleChildScrollView(
            child: new Container(
          margin: new EdgeInsets.all(15.0),
          child: new Form(
            key: _formkey,
            child: Column(children: <Widget>[
              _buildDivisor(),
              buildTextInfo(),
              buildbotton(context),
            ]),
          ),
        )));
  }

  Widget _buildDivisor() {
    return new Column(children: <Widget>[
      new TextFormField(
        keyboardType: TextInputType.number,
        controller: vInController,
        decoration: new InputDecoration(hintText: 'Tensão de Entrada',),
      ),
      SizedBox(height: 20),
      new TextFormField(
        keyboardType: TextInputType.number,
        controller: resOneController,
        decoration: new InputDecoration(hintText: 'Resistor Um'),
      ),
      SizedBox(height: 20),
      new TextFormField(
        keyboardType: TextInputType.number,
        controller: resTwoController,
        decoration: new InputDecoration(hintText: 'Resistor Dois'),
      ),
      SizedBox(height: 20),
      new TextFormField(
        keyboardType: TextInputType.number,
        controller: vOutController,
        validator: (value) {
          if (value.isEmpty) {
            return 'valor';
          }
          return null;
        },
        decoration: new InputDecoration(hintText: 'Tensão de Saida'),
      ),
      SizedBox(height: 20),
    ]);
  }

  Container buildbotton(BuildContext context) {
    return Container(
        padding: EdgeInsets.only(top: 10.0, bottom: 10.0),
        height: 60.0,
        child: Center(
            child: RaisedButton(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(18.0),
              side: BorderSide(color: Colors.white)),
          color: Colors.blue,
          textColor: Colors.white,
          onPressed: () {
            calcula();
            if (_formkey.currentState.validate()) {
              FocusScope.of(context).requestFocus(new FocusNode());
            }
          },
          child: Text("Calcular",
              style: TextStyle(color: Colors.white, fontSize: 20.0)),
        )));
  }

  Text buildTextInfo() {
    return Text(_infoText,
        textAlign: TextAlign.center,
        style: TextStyle(
            color: Colors.red, fontSize: 20.0, fontWeight: FontWeight.bold));
  }
}
