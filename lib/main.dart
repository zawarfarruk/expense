// ignore_for_file: avoid_print, duplicate_ignore

import 'package:flutter/material.dart';
import './wideget_list/user_Transaction.dart';

void main(List<String> args) {
  // ignore: prefer_const_constructors
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  //String titleInput;
  //String amountInput;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SafeArea(
        child: Scaffold(
          appBar: AppBar(title: const Text("Flutter App"), 
          actions: [
            IconButton(
              icon: const Icon(Icons.add),
              onPressed: () {},
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
                const UserTransaction(),
                // const Card(
                //   color: Colors.red,
                //   child: Text("Expense"),
                // )
              ],
            ),
          ),
          floatingActionButton: FloatingActionButton(
            child:const Icon(Icons.add),
            onPressed: () {},
          ),
        ),
      ),
    );
  }
}
