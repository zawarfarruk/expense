import 'package:flutter/material.dart';

class Transaction {
 final String? id;
 final String? title;
  double? amount;
  DateTime? date;
  Transaction({
    @required this.id,
    @required this.title,
    @required this.amount,
    @required this.date,
  });
}
