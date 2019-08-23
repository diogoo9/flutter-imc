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
             onPressed: (){},
           )
         ],
       ),
     );
   }
 }
