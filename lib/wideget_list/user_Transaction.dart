// ignore: file_names
import 'package:flutter/material.dart';
import './new_transaction.dart';
import './transaction_list.dart';
import '../models/transaction.dart';

class UserTransaction extends StatefulWidget {
  
  
  UserTransaction({Key? key}) : super(key: key);
  

  

  @override
  State<UserTransaction> createState() => _UserTransactionState();
}

class _UserTransactionState extends State<UserTransaction> {
  final List<Transaction> _userTx = [
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
  void _addNewTransaction(String txTitle, double txAmount) {
    final newTx = Transaction(
        id: DateTime.now().toString(),
        title: txTitle,
        amount: txAmount,
        date: DateTime.now());
        setState((){
          _userTx.add(newTx);
        });
  }
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        NewTransaction(_addNewTransaction),
        TransactionList(_userTx),
      ],
    );
  }
}