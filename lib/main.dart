import 'package:flutter/material.dart';


 void main(){
  runApp(MaterialApp(
    home: home(),
  ));
 }
 class home extends StatefulWidget {
   @override
   _homeState createState() => _homeState();
 }

 class _homeState extends State<home> {

   TextEditingController weightController = TextEditingController();
   TextEditingController heightController = TextEditingController();
   String _infoText = "Informa os dados";

   void _resetFields(){
     weightController.text = "";
     heightController.text = "";
    setState(() {
      _infoText = "Informa os dados";
    });

   }

   void _calculate(){
     setState(() {
       double weight = double.parse(weightController.text);
       double height = double.parse(heightController.text)/100;
       double imc = weight / (height * height);
       print(imc);
       if(imc < 18.6){
         _infoText = "Abaixo do peso (${imc.toStringAsPrecision(3)})";
       }else if(imc >= 18.6 && imc < 24.9){
         _infoText = "Peso ideal (${imc.toStringAsPrecision(3)})";
       }else if(imc >= 24.9 && imc < 29.9){
         _infoText = "Levemente acima do peso (${imc.toStringAsPrecision(3)})";
       }else if(imc >= 29.9 && imc < 34.9){
         _infoText = "Obesidade Grau I (${imc.toStringAsPrecision(3)})";
       }else if(imc >= 40){
         _infoText = "Obesidade Grau II (${imc.toStringAsPrecision(3)})";
       }
     });
   }

   @override
   Widget build(BuildContext context) {
     return Scaffold(
       appBar: AppBar(
         title: Text("Calculadora de IMC"),
         centerTitle: true,
         backgroundColor: Colors.green,
         actions: <Widget>[
           IconButton(
             icon: Icon(Icons.refresh),
             onPressed: _resetFields,
           )
         ],
       ),
       backgroundColor: Colors.white,
       body: SingleChildScrollView(
         padding: EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 0.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Icon(Icons.person_outline,
              size: 120.0,color:
              Colors.green,),
            TextField(keyboardType: TextInputType.number,
              decoration: InputDecoration(
                  labelText: "Peso em (km)",
                  labelStyle: TextStyle(color: Colors.green)
              ),
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.green, fontSize: 25.0),
              controller: weightController,
            ),
            TextField(
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                  labelText: "Altura em (cm)",
                  labelStyle: TextStyle(color: Colors.green)
              ),
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.green, fontSize: 25.0),
              controller: heightController,
            ),
            Padding(
              padding: EdgeInsets.only(top: 10.0, bottom: 10.0),
              child: Container(
                height: 50.0,
                child: RaisedButton(
                  color: Colors.green,
                  onPressed: _calculate,
                  child: Text("calcular",
                    style: TextStyle(color: Colors.white, fontSize: 30),
                  ),
                ),
              ),
            ),
            Text(
              _infoText,
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.green, fontSize: 25),
            )
         ],
        ),
       ),
     );
   }
 }
