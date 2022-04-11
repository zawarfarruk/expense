import 'package:flutter/cupertino.dart';

class Transaction {
 final String id;
 final String title;
  double amount;
  DateTime date;
  Transaction({
    this.id,
   @required this.title,
    this.amount,
    this.date,
  });
}
