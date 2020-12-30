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
      total = 0,
      correnteValue,
      resistenciaValue,
      dVporc;
  double i, y = 0;

  double fp = 1.25;

  String _infoText = '', x;
  GlobalKey<FormState> _formkey = GlobalKey<FormState>();

  calcula() {
    setState(() {
      double tensaoValue = double.tryParse(tensaoController.text);

      double wattsValue = double.tryParse(wattsController.text);
      double distanciaValue = double.tryParse(distanciaController.text);

      kva = wattsValue * fp;
      print("kva $kva");
      correnteValue = (kva / (raiz * tensaoValue * cos));
      print("corrente $correnteValue");
      Map<double, dynamic> lista = Map();

      lista[0] = 8.57;
      lista[1] = 5.38;
      lista[2] = 3.39;
      lista[3] = 2.13;
      lista[4] = 1.34;
      lista[5] = 0.84;
      lista[6] = 0.53;
      lista[7] = 0.33;
      lista[8] = 0.26;

      do {
        if (lista[y] > 0) {
          lista[y]= y++;
        } 
          if (correnteValue <= 30) {
            lista[y] = lista[0];
          } else if (correnteValue > 30 && correnteValue <= 40) {
            lista[y] = lista[1];
          } else if (correnteValue > 40 && correnteValue <= 55) {
            lista[y] = lista[2];
          } else if (correnteValue > 55 && correnteValue <= 70) {
            lista[y] = lista[3];
          } else if (correnteValue > 70 && correnteValue <= 100) {
            lista[y] = lista[4];
          } else if (correnteValue > 100 && correnteValue <= 130) {
            lista[y] = lista[5];
          } else if (correnteValue > 130 && correnteValue <= 175) {
            lista[y] = lista[6];
          } else if (correnteValue > 175 && correnteValue <= 275) {
            lista[y] = lista[7];
          } else if (correnteValue > 275) {
            lista[y] = lista[8];
          }
        
        print("lista $lista[y]");
        dV = raiz * lista[y] * distanciaValue * correnteValue * cos;
        print("dV $dV");
        dVporc = ((dV / tensaoValue) * 100);
        
        print("Porcentagem $dVporc");
      } while (dVporc > 5);

      dV = raiz * lista[y] * distanciaValue * correnteValue * cos;
      print("dV Valor final mostrado $dV");
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
