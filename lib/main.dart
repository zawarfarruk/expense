import 'package:flutter/material.dart';
import 'package:flutter_application_2/transaction.dart';
import 'package:intl/intl.dart';

void main(List<String> args) {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key key}) : super(key: key);
  final List<Transaction> transaction = [
    Transaction(
      id: "t1",
      title: "Buy Show",
      amount: 785,
      date: DateTime.now(),
    ),
    Transaction(
      id: "t2",
      title: "Clothes Show",
      amount: 75.0,
      date: DateTime.now(),
    )
  ];
  //String titleInput;
  //String amountInput;
  final titleCountroller = TextEditingController();
  final amountCountroller = TextEditingController();
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
            const SizedBox(
              // color: Colors.green,
              width: double.infinity,
              child: Card(
                child: Text("Chart"),
                color: Colors.blue,
                elevation: 5,
              ),
            ),
            Card(
              elevation: 5,
              child: Container(
                margin: const EdgeInsets.all(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    TextField(
                      decoration: const InputDecoration(labelText: "Title"),
                     // onChanged: (val)=>titleInput,
                      controller: titleCountroller,
                    ),
                    TextField(
                      decoration: const InputDecoration(labelText: "Amount"),
                      //onChanged: (val)=>amountInput
                      controller: amountCountroller,
                    ),
                     TextButton(
                        onPressed: (){
                         // print(titleInput);
                         // print(amountInput);
                              print(titleCountroller.text);
                              print(amountCountroller.text);
                        },
                        child: const Text(
                          "Add Transaction",
                          style: TextStyle(
                            color: Colors.purple,
                          ),
                        ))
                  ],
                ),
              ),
            ),
            Column(
              children: transaction.map((tx) {
                return Card(
                    child: Row(
                  children: [
                    Container(
                      margin: const EdgeInsets.symmetric(
                          vertical: 10, horizontal: 10),
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          border: Border.all(
                        color: Colors.purple,
                        width: 2,
                      )),
                      child: Text(
                        "\$${tx.amount}".toString(),
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.purple,
                        ),
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          tx.title.toString(),
                          style: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: Colors.blueGrey,
                          ),
                        ),
                        Text(DateFormat.yMMMd().format(tx.date))
                        //tx.date.toString())
                      ],
                    )
                  ],
                ));
              }).toList(),
            )
            // const Card(
            //   color: Colors.red,
            //   child: Text("Expense"),
            // )
          ],
        ),
      ),
    );
  }
}
