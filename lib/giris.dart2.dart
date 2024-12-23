import 'package:flutter/material.dart';
// import 'package:flutter_';
import 'package:untitled1/odev4.dart';

void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget{
  Widget build(BuildContext context){
    return MaterialApp(
      //banner
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Erenin APP'I "),
        ),
        body: Column(
          children: [
            Container(
              margin: EdgeInsets.all(10),
              color: Colors.teal,width: 80,height: 80,child: Text("ilkbox"),),
            Container(
              color: Colors.red,width: 150,height: 150,child: Text("ikincibox"),),
            Container(
              margin: EdgeInsets.all(10),
              color: Colors.purpleAccent,width: 100,height: 100,child: Text("ucuncubox"),),
          ],
        ),
      ),
    );
  }

}