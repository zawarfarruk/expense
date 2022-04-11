import 'package:flutter/material.dart';
 void main(List<String> args) {
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text("Flutter App"),),
        body:Column(
          // ignore: prefer_const_literals_to_create_immutables
          children: [
            Container(
              color: Colors.green,
              width: double.infinity,
              child: const Card(
                child: Text("Chart"),
                color: Colors.blue,
                elevation: 5,
              ),
            ),
            Card(
              child: Text("Expense"),
            )
          ],
        ) ,
        ),
    );
  }
}