import 'dart:ffi';
import 'dart:convert';

import 'package:flutter/material.dart';

class diametro extends StatefulWidget {
  @override
  _diametroState createState() => _diametroState();
}

class _diametroState extends State<diametro> {
  TextEditingController tensaoController = new TextEditingController();
  TextEditingController wattsController = new TextEditingController();
  TextEditingController distanciaController = new TextEditingController();

  double dV,
      raiz = 1.7,
      cos = 0.85,
      kva,
      total,
      correnteValue,
      resistenciaValue,
      dVporc;
  double i;

  double fp = 1.25;
//double r1=0.33, r2=0.53,r3=0.84,r4=1.34,r5=2.13,r6=3.39,r7=5.38,r8=8.57;
  String _infoText = '', x;
  GlobalKey<FormState> _formkey = GlobalKey<FormState>();

  calcula() {
    setState(() {
      double tensaoValue = double.tryParse(tensaoController.text);

      double wattsValue = double.tryParse(wattsController.text);
      double distanciaValue = double.tryParse(distanciaController.text);

      kva = wattsValue * fp;

      correnteValue = ((raiz * tensaoValue * cos) / kva);
print("corrente $correnteValue");
Map< double, dynamic> lista= Map();

      
      lista[0] = 8.57;
      lista[1] = 5.38;
      lista[2] = 3.39;
      lista[3] = 2.13;
      lista[4] = 1.34;
      lista[5] = 0.84;
      lista[6] = 0.53;
      lista[7] = 0.33;
      lista[8] = 0.26;
      print("lista, $lista");

      do {
         
        if (correnteValue <= 30) {
          lista[i] = lista[0];
         
        } else if (correnteValue > 30 && correnteValue <= 40) {
          lista[i] = lista[1];
         
        } else if (correnteValue > 40 && correnteValue <= 55) {
          lista[i] = lista[2];
        } else if (correnteValue > 55 && correnteValue <= 70) {
          lista[i] = lista[3];
        } else if (correnteValue > 70 && correnteValue <= 100) {
          lista[i] = lista[4];
        } else if (correnteValue > 100 && correnteValue <= 130) {
          lista[i] = lista[5];
        } else if (correnteValue > 130 && correnteValue <= 175) {
          lista[i] = lista[6];
        } else if (correnteValue > 175 && correnteValue <= 275) {
          lista[i] = lista[7];
        } else if (correnteValue > 275) {
          lista[i] = lista[8];
        }
print("lista$lista[i]");
        dV = raiz * lista[i] * distanciaValue * correnteValue * cos;
print("dV $dV");
        dVporc = ((dV / tensaoValue) * 100);
       }while (lista[i] > 5 && lista[i]++);

      dV = raiz * lista[i] * distanciaValue * correnteValue * cos;
      print(dV);
    
    });}
  

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
        controller: tensaoController,
        decoration: new InputDecoration(
          hintText: 'Tensão',
        ),
      ),
      SizedBox(height: 20),
      new TextFormField(
        keyboardType: TextInputType.number,
        controller: wattsController,
        decoration: new InputDecoration(hintText: 'Potência'),
      ),
      SizedBox(height: 20),
      new TextFormField(
        keyboardType: TextInputType.number,
        controller: distanciaController,
        decoration: new InputDecoration(hintText: 'Distância em Metros'),
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
