// ignore_for_file: use_key_in_widget_constructors, avoid_print

import 'package:flutter/material.dart';
import 'package:flutter_application_2/wideget_list/chart_bar.dart';
import 'package:intl/intl.dart';
import 'package:flutter_application_2/models/transaction.dart';


class Chart extends StatelessWidget {
  //const Chart({ Key? key }) : super(key: key);
  final List<Transaction> recentTransactions;
  const Chart(this.recentTransactions);
  List<Map<String, Object>> get groupTransactionValues { 
    return List.generate(7, (index) {
      final weekDay = DateTime.now().subtract(
        Duration(days: index),
      );
      double totalSum = 0.0;
      for (var i = 0; i < recentTransactions.length; i++) {
        if (recentTransactions[i].date?.day == weekDay.day &&
            recentTransactions[i].date?.month == weekDay.month &&
            recentTransactions[i].date?.year == weekDay.year) {
          totalSum += recentTransactions[i].amount!;
        }
      }
       print(DateFormat.E().format(weekDay));
      print(totalSum);

      return {
        "day": DateFormat.E().format(weekDay).substring(0,1),
      "amount": totalSum
      };
      
    }).reversed.toList();
    
  }
  double get spendingMax{
    return groupTransactionValues.fold(0.0, (sum,item){
      return sum + (item['amount'] as double);
    
    });
  }

  @override
  Widget build(BuildContext context) {
    print(groupTransactionValues);
    return  Card(
      elevation: 6,
      margin: const EdgeInsets.all(20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: groupTransactionValues.map((data){
          return Flexible(
            fit: FlexFit.tight,
            flex: 1,
            child: ChartBar(
              (data["day"].toString()),
            (data["amount"] as double),
            spendingMax == 0.0 ? 0.0: 
            (data["amount"] as double) / spendingMax),
          );
        }).toList(),
      ),
    );
  }
  }