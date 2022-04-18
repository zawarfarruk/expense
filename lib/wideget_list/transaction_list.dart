// ignore_for_file: use_key_in_widget_constructors, sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../models/transaction.dart';

class TransactionList extends StatelessWidget {
  // TransactionList({Key key}) : super(key: key);
  final List<Transaction> transaction;
  final Function deleteTx;
  const TransactionList(this.transaction,this.deleteTx);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 500,
      child: transaction.isEmpty
          ? Column(
              children: [
                const Text("Not Transaction Yet"),
                const SizedBox(
                  height: 20,
                ),
                Container(
                    height: 200,
                    child: Image.asset(
                      "assets/images/waiting.png",
                      fit: BoxFit.cover,
                    ))
              ],
            )
          : ListView.builder(
              itemCount: transaction.length,
              itemBuilder: (ctx, index) {
                return Card(
                  margin: const EdgeInsets.symmetric(vertical: 8,horizontal: 6),
                  elevation: 6,
                  child: ListTile(
                    leading: CircleAvatar(
                      radius: 30,
                      child: Padding(
                        padding: const EdgeInsets.all(10),
                        child: FittedBox(
                          child: Text("\$${transaction[index].amount}"),
                        ),
                      ),
                    ),
                    title: Text((transaction[index].title).toString(),
                        style: Theme.of(context).textTheme.titleLarge),
                    subtitle:Text(DateFormat.yMMMd().format(transaction[index].date!)
                    ) ,
                    trailing: IconButton(onPressed:()=>deleteTx(transaction[index].id),

                     icon: Icon(Icons.delete),
                     color: Theme.of(context).errorColor,),
                  ),
                );
              },
            ),
    );
  }
}
// Card(
//               child: Row(
//             children: [
//               Container(
//                 margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
//                 padding: const EdgeInsets.all(10),
//                 decoration: BoxDecoration(
//                     border: Border.all(
//                   color: Theme.of(context).primaryColor,
//                   width: 2,
//                 )),
//                 child: Text(
//                   "\$${transaction[index].amount}".toString(),
//                   style:TextStyle(
//                     fontSize: 20,
//                     fontWeight: FontWeight.bold,
//                     color: Theme.of(context).primaryColor,
//                   ),
//                 ),
//               ),
//               Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Text(
//                   transaction[index].title.toString(),
//                     style: TextStyle(
//                       fontSize: 14,
//                       fontWeight: FontWeight.bold,
//                       color:Theme.of(context).primaryColor,
//                     ),
//                   ),
//                   Text(DateFormat.yMMMd().format(DateTime.now()))
//                   //tx.date.toString())
//                 ],
//               )
//             ],
//          ));