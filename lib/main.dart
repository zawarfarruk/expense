// ignore_for_file: avoid_print, duplicate_ignore, deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_application_2/wideget_list/new_transaction.dart';
import './wideget_list/transaction_list.dart';
import './models/transaction.dart';

void main(List<String> args) {
  // ignore: prefer_const_constructors
  runApp(MaterialApp(
    home: const MyApp(),
    theme: ThemeData(
      primarySwatch: Colors.purple,
      accentColor: Colors.amber,
      fontFamily: "OpenSans"
    ),
    debugShowCheckedModeBanner: false,
  ));
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final List<Transaction> _userTx = [
    // Transaction(
    //   id: "t1",
    //   title: "Buy Show",
    //   amount: 785,
    //   date: DateTime.now(),
    // ),
    // Transaction(
    //   id: "t2",
    //   title: "Clothes Show",
    //   amount: 75.0,
    //   date: DateTime.now(),
    // )
  ];
  void _addNewTransaction(String txTitle, double txAmount) {
    final newTx = Transaction(
        id: DateTime.now().toString(),
        title: txTitle,
        amount: txAmount,
        date: DateTime.now());

    setState(() {
      _userTx.add(newTx);
    });
  }

  void _startAddNewTransaction(BuildContext context) {
    showModalBottomSheet(
        context: context,
        builder: (_) {
          return 
          // NewTransaction(_addNewTransaction);
           GestureDetector(
             onTap: () {},
            child:NewTransaction(_addNewTransaction),
             behavior: HitTestBehavior.opaque,
           );
        });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(title: const Text("Flutter App"), actions: [
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () => _startAddNewTransaction(context),
          ),
        ]),
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            // ignore: prefer_const_literals_to_create_immutables
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
              TransactionList(_userTx),
              // const Card(
              //   color: Colors.red,
              //   child: Text("Expense"),
              // )
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.add),
          onPressed: () => _startAddNewTransaction(context),
        ),
      ),
    );
  }
}
