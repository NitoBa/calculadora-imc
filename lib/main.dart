import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Calculadora de IMC',
      theme: ThemeData(
        
        primarySwatch: Colors.green,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  final _peso = TextEditingController();
  final _altura = TextEditingController();
  double _imc;
  String _info = "Informe seus dados";

  calcImc(){
    setState(() {

      if(_peso.text.isEmpty || _altura.text.isEmpty) {
        return;
      }


      double altura = double.parse(_altura.text);
      double peso = double.parse(_peso.text);
      _imc = ( peso / (altura * altura) * 10000 );

      String res = _imc.toStringAsFixed(2);      

      if(_imc < 17){
        _info = "Seu imc é $res você está abaixo do peso";//muito abaixo do peso
      }else if(_imc >= 17 && _imc <= 18.49){
        _info = "Seu imc é $res você está abaixo do peso";//abaixo do peso
      }else if(_imc >= 18.5 && _imc <= 24.99){
        _info = "Seu imc é $res você está no peso normal";//peso normal
      }else if (_imc >= 25 && _imc <= 29.99){
        _info = "Seu imc é $res você está acima do peso";//acima do peso
      }else if (_imc > 30){
        _info = "Seu imc é $res você está obeso";//obeso
      }

    });
  }

  reset(){
    setState(() {
      _peso.text = "";
      _altura.text = "";
      _info = "Informe seus dados";    
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Calculadora de IMC"),
        centerTitle: true,
        actions: <Widget>[
            FlatButton(
            child: Icon(Icons.rotate_left, color: Colors.white),
            onPressed: reset,
            ),
        ],
      ),
      body: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Icon(Icons.person, color: Colors.green, size: 200,), 
            Padding(
              padding: const EdgeInsets.only(left: 15, right: 15),
              child: Column(
                children: <Widget>[
                TextField(                 
                  controller: _peso,
                  keyboardType: TextInputType.number,
                  style: TextStyle(color: Colors.green, fontSize: 20),
                  textAlign: TextAlign.center,  
                  decoration: InputDecoration(
                    labelText: "Peso(Kg)",
                    labelStyle: TextStyle(color: Colors.green,),
                    hintText: "campo obrigatório",
                    hintStyle: TextStyle(color: Colors.red, fontSize: 10)
                  ),
                ),
                TextField(
                  controller: _altura,
                  keyboardType: TextInputType.number,
                  style: TextStyle(color: Colors.green, fontSize: 20),
                  textAlign: TextAlign.center,
                  decoration: InputDecoration(
                    labelText: "Altura(cm)",
                    labelStyle: TextStyle(color: Colors.green),
                    hintText: "campo obrigatório",
                    hintStyle: TextStyle(color: Colors.red, fontSize: 10),
                    ),
                ),
                Container(
                  height: 60,
                  width: 400,
                  margin: EdgeInsets.only(top: 10),
                  child: RaisedButton(
                    color: Colors.green,
                    child: Text("Calcular",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        fontSize: 25,
                          ),
                        ),
                    onPressed: calcImc,
                  ),
                ),
                
                Padding(
                  padding: const EdgeInsets.only(top: 20.0),
                  child: Text(_info,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: Colors.green,
                    ),
                    textAlign: TextAlign.center,
                   ),
                  ),
                ],
              ),
            )
            
          ],
        ),
      ),
    );
  }
}
