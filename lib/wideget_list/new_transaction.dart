// ignore_for_file: prefer_const_constructors_in_immutables

import 'package:flutter/material.dart';

class NewTransaction extends StatefulWidget {
  NewTransaction(this.tx, {Key? key}) : super(key: key);
  final Function tx;

  @override
  State<NewTransaction> createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final titleCountroller = TextEditingController();

  final amountCountroller = TextEditingController();

  void submitData() {
    final inputTitle = titleCountroller.text;
    final inputAmount = double.parse(amountCountroller.text);
    if (inputTitle.isEmpty || inputAmount <= 0) {
      return;
    }

    widget.tx(
      inputTitle,
      inputAmount,
    );
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
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
               onSubmitted: (_) => submitData(),
            ),
            TextField(
              decoration: const InputDecoration(labelText: "Amount"),
              //onChanged: (val)=>amountInput
              controller: amountCountroller,
              //  keyboardType: TextInputType.number,
               onSubmitted: (_) => submitData(),
            ),
            TextButton(
                // ignore: duplicate_ignore
                onPressed: submitData,
                // {
                //   tx(titleCountroller.text,
                //       double.parse(amountCountroller.text));
                //   // ignore: avoid_print
                // },
                child:Text(
                  "Add Transaction",
                  style: TextStyle(
                    color:Theme.of(context).primaryColor,
                  ),
                ))
          ],
        ),
      ),
    );
  }
}
