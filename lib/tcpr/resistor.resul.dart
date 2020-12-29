import 'dart:io';
import 'dart:math';

import 'package:cal_eletro/divisores/tensao.dart';
import 'package:flutter/material.dart';
import 'package:cal_eletro/tcpr/resistor.dart';

class resistorResul extends StatefulWidget {
  @override
  _resistorResulState createState() => _resistorResulState();
}

class _resistorResulState extends State<resistorResul> {
  GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  String _infoText = "";
  String _infoTextone = "";
  String _infoTexttwo = "";

  String _infoPotenciaone = "";
  String _infoPotenciatwo = "";
  String _infoPotenciathree = "";

  String _infoCorrenteone = "";
  String _infoCorrentetwo = "";
  String _infoCorrentethree = "";

  String _infoResistenciaone = "";
  String _infoResistenciatwo = "";
  String _infoResistenciathree = "";

  void resul() {
    setState(() {
      double tensao = double.tryParse(tensaoController.text);
      double corrente = double.tryParse(correnteController.text);
      double potencia = double.tryParse(potenciaController.text);
      double resistencia = double.tryParse(resistenciaController.text);

      if (tensao == null) {
        double vrx = (resistencia * corrente);
        double vpi = (potencia / corrente);
        double vrpr = (sqrt(potencia * resistencia));
        double ipr = (sqrt(potencia / resistencia));
                double pri = (resistencia * (corrente * corrente));
                        double rpi = (potencia / (corrente * corrente));



        _infoText = "V=RxI:        ${vrx.toStringAsPrecision(3)} v";
        _infoTextone = "V=P/I:        ${vpi.toStringAsPrecision(3)} v";
        _infoTexttwo = "V=Raiz PxR:        ${vrpr.toStringAsPrecision(3)} v";
        _infoCorrentethree =
            "I=Raiz P/R:        ${ipr.toStringAsPrecision(3)} A";
                    _infoPotenciatwo = "P=RxI²:        ${pri.toStringAsPrecision(3)} W";
                     _infoResistenciathree =
            "R=P/I² :        ${rpi.toStringAsPrecision(3)} ohms";


      } else if (corrente == null) {
        double ivr = (tensao / resistencia);
        double ipv = (potencia / tensao);
        double ipr = (sqrt(potencia / resistencia));
        double vrpr = (sqrt(potencia * resistencia));
         double pvr = ((tensao * tensao) / resistencia);
          double rvp = ((tensao * tensao) / potencia);
        _infoTexttwo = "V=Raiz PxR:        ${vrpr.toStringAsPrecision(3)} v";

        _infoPotenciathree = "P=V²/R:        ${pvr.toStringAsPrecision(3)} W";

 _infoCorrenteone = "I=V/R:        ${ivr.toStringAsPrecision(3)} A";
        _infoCorrentetwo = "I=P/V:        ${ipv.toStringAsPrecision(3)} A";
        _infoCorrentethree = "I=Raiz P/R:        ${ipr.toStringAsPrecision(3)} A";
                _infoResistenciatwo = "R=V²/P :        ${rvp.toStringAsPrecision(3)} ohms";




      } else if (potencia == null) {
        double pvi = (tensao * corrente);
        double pri = (resistencia * (corrente * corrente));
        double pvr = ((tensao * tensao) / resistencia);
                double vrx = (resistencia * corrente);
                 double ivr = (tensao / resistencia);
                 double rvi = (tensao / corrente);

        _infoText = "V=RxI:        ${vrx.toStringAsPrecision(3)} v";
 _infoPotenciaone = "P=VxI:        ${pvi.toStringAsPrecision(4)} W";
        _infoPotenciatwo = "P=RxI²:        ${pri.toStringAsPrecision(3)} W";
        _infoPotenciathree = "P=V²/R:        ${pvr.toStringAsPrecision(3)} W";
                _infoCorrenteone = "I=V/R:        ${ivr.toStringAsPrecision(3)} A";
        _infoResistenciaone = "R=V/I :        ${rvi.toStringAsPrecision(3)} ohms";


      } else if (resistencia == null) {
        double rvi = (tensao / corrente);
        double rvp = ((tensao * tensao) / potencia);
        double rpi = (potencia / (corrente * corrente));
        double vpi = (potencia / corrente);
         double pvi = (tensao * corrente);
          double ipv = (potencia / tensao);
         _infoTextone = "V=P/I:        ${vpi.toStringAsPrecision(3)} v";
        _infoPotenciaone = "P=VxI:        ${pvi.toStringAsPrecision(3)} W";
        _infoCorrentetwo = "I=P/V:        ${ipv.toStringAsPrecision(3)} A";
 _infoResistenciaone = "R=V/I :        ${rvi.toStringAsPrecision(3)} ohms";
        _infoResistenciatwo = "R=V²/P :        ${rvp.toStringAsPrecision(3)} ohms";
        _infoResistenciathree = "R=P/I² :        ${rpi.toStringAsPrecision(3)} ohms";
      }
    });
  }

  void initState() {
    super.initState();
    resul();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(
          title: new Text('Valores'),
        ),
        backgroundColor: Colors.white,
        body: new SingleChildScrollView(
            child: new Container(
                margin: new EdgeInsets.all(15.0),
                child: new Form(
                  key: _formkey,
                  child: Center(
                    child: Container(
                        margin: const EdgeInsets.all(15.0),
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.blue, width: 2.0)),
                        child: Column(children: <Widget>[
                          Text("Resultado",
                              style:
                                  TextStyle(color: Colors.black, fontSize: 40)),
                          SizedBox(height: 35),
                          _buildTextInfo(),
                          SizedBox(height: 20),
                          _buildCorrente(),
                          SizedBox(height: 20),
                          _buildPotencia(),
                          SizedBox(height: 20),
                          _buildresistencia()
                        ])),
                  ),
                ))));
  }

  Widget _buildTextInfo() {
    return Container(
        color: Colors.lightBlue[100],
        child: Column(children: <Widget>[
          Text(
            "Tensão",
            style: TextStyle(fontSize: 20),
          ),
          Text(_infoText,
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold)),
          new Text(_infoTextone,
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: Colors.red,
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold)),
          new Text(_infoTexttwo,
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold)),
        ]));
  }

  Container _buildCorrente() {
    return Container(
        color: Colors.lightBlue[100],
        child: Column(children: <Widget>[
          Text(
            "Corrente",
            style: TextStyle(fontSize: 20),
          ),
          Text(_infoCorrenteone,
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold)),
          Text(_infoCorrentetwo,
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: Colors.red,
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold)),
          Text(_infoCorrentethree,
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold)),
        ]));
  }

  _buildPotencia() {
    return Container(
        color: Colors.lightBlue[100],
        child: Column(children: <Widget>[
          Text(
            "Potência",
            style: TextStyle(fontSize: 20),
          ),
          Text(_infoPotenciaone,
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: Colors.red,
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold)),
          Text(_infoPotenciatwo,
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold)),
          Text(_infoPotenciathree,
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold)),
        ]));
  }

  _buildresistencia() {
    return Container(
        color: Colors.lightBlue[100],
        child: Column(children: <Widget>[
          Text(
            "Resistência",
            style: TextStyle(fontSize: 20),
          ),
          Text(_infoResistenciaone,
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold)),
          Text(_infoResistenciatwo,
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold)),
          Text(_infoResistenciathree,
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold)),
        ]));
  }
}
