import 'package:flutter/material.dart';
import 'package:flutter_application_2/transaction.dart';

void main(List<String> args) {
  runApp( MyApp());
}

class MyApp extends StatelessWidget {
   MyApp({Key? key}) : super(key: key);
final List<Transaction> transaction=[
  Transaction(
    id: "t1",
    title: "Buy Show",
    amount: 785,
    date: DateTime.now(),
  ),
  Transaction(
      id: "t2",
      title: "Clothes Show",
      amount: 785,
      date: DateTime.now(),
    )

];
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Flutter App"),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              // color: Colors.green,
              width: double.infinity,
              child: const Card(
                child: Text("Chart"),
                color: Colors.blue,
                elevation: 5,
              ),
            ),
            const Card(
              color: Colors.red,
              child: Text("Expense"),
            )
          ],
        ),
      ),
    );
  }
}
