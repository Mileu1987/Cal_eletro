import 'package:cal_eletro/divisores/divisores.dart';
import 'package:cal_eletro/tcpr/resistor.dart';

import 'package:flutter/material.dart';

import 'diametro.dart';

class Pageone extends StatefulWidget {
  @override
  _PageoneState createState() => _PageoneState();
}

class _PageoneState extends State<Pageone> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(title: Text("Home Automação")),
        body: Center(
            child: Container(
                child: Text("ToqTec",
                    style: TextStyle(
                        fontFamily: 'Imprima',
                        fontSize: 30,
                        fontWeight: FontWeight.w300)))),
        drawer: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: <Widget>[
              DrawerHeader(
                  decoration: BoxDecoration(
                    color: Colors.blue,
                  ),
                  child: Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.white,
                    ),
                  )),
              ListTile(
                  leading: Icon(Icons.near_me),
                  title: Text('Tensão/Corrente/Potência/Resistência'),
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => resistor()));
                  }),
              ListTile(
                leading: Icon(Icons.near_me),
                title: Text("Divisores: Tensão/ Corrente"),
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => divisores()));
                },
              ),
              ListTile(
                leading: Icon(Icons.near_me),
                title: Text("Diametro do Cabo"),
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => diametro()));
                },
              ),
            ],
          ),
        ));
  }
}
