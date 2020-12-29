import 'package:cal_eletro/divisores/tensao.dart';
import 'package:cal_eletro/tcpr/resistor.dart';
import 'package:flutter/material.dart';

class divisores extends StatefulWidget {
  @override
  _divisoresState createState() => _divisoresState();
}

class _divisoresState extends State<divisores> {
  GlobalKey<FormState> _formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(backgroundColor: Colors.blue,
        title: Text("Divisores"),),
        body: new SingleChildScrollView(
            child: new Container(
          margin: new EdgeInsets.all(15.0),
          child: new Form(
            key: _formkey,
            child: Column(children: <Widget>[
              SizedBox(height: 40),
              _builContainer(),
            ]),
          ),
        )));
  }

  

  Widget _builContainer() {
    return new Column(children: <Widget>[
     
      RaisedButton(
     
          shape: RoundedRectangleBorder(
            
              borderRadius: BorderRadius.circular(100),
              side: BorderSide(color: Colors.white)),
          color: Colors.blue,
          textColor: Colors.white,
          padding: EdgeInsets.only(
            
            top: 10.0,
            bottom: 10.0,
          ),
       
          child: Center(
            child: Text("Tensão",
                style: TextStyle(
                 
                  shadows: <Shadow>[
                   
                    Shadow(
                      offset: Offset(2.0,1.0),
                      blurRadius: 3.0,
                      color: Colors.grey[800],
                      
                    )
                  ],
                  
                  
                  
                  color: Colors.white, fontSize: 20)),
          ),
          onPressed: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => tensao()));
          }
          
          )
    ]);
  }
}
