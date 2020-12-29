


import 'package:cal_eletro/tcpr/resistor.resul.dart';
import 'package:flutter/material.dart';

class resistor extends StatefulWidget {
  @override
  _resistorState createState() => _resistorState();
}

TextEditingController tensaoController = new TextEditingController();

TextEditingController correnteController = new TextEditingController();
TextEditingController resistenciaController = new TextEditingController();
TextEditingController potenciaController = new TextEditingController();


class _resistorState extends State<resistor> {
  GlobalKey<FormState> _formkey = GlobalKey<FormState>();

  

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
            child: Column(children: <Widget>[
              _formUI(),
              buildContainerButton(context),
              
              
            ]),
          ),
        )));
  }

  Widget _formUI() {
    return new Column(children: <Widget>[
      new TextFormField(
        keyboardType: TextInputType.number,
        controller: tensaoController,
        decoration: new InputDecoration(hintText: 'Tensão'),
      ),
      SizedBox(height: 20),
      new TextFormField(
        keyboardType: TextInputType.number,
        controller: correnteController,
        decoration: new InputDecoration(hintText: 'Corrente'),
      ),
      SizedBox(height: 20),
      new TextFormField(
        keyboardType: TextInputType.number,
        controller: resistenciaController,
        decoration: new InputDecoration(hintText: 'Resistencia'),
      ),
      SizedBox(height: 20),
      new TextFormField(
        keyboardType: TextInputType.number,
        controller: potenciaController,
        decoration: new InputDecoration(hintText: 'Potência'),
      ),
    ]);
  }

  

  Container buildContainerButton(BuildContext context) {
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
            Navigator.push(context,
                        MaterialPageRoute(builder: (context) => resistorResul()));
            if (_formkey.currentState.validate()) {
              
              FocusScope.of(context).requestFocus(new FocusNode());
            }
          },
          child: Text("Calcular",
              style: TextStyle(color: Colors.white, fontSize: 20.0)),
        )));
  }

  
}
