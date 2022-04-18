// ignore_for_file: prefer_const_constructors_in_immutables, prefer_const_constructors, sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class NewTransaction extends StatefulWidget {
  NewTransaction(this.tx, {Key? key}) : super(key: key);
  final Function tx;

  @override
  State<NewTransaction> createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final titleCountroller = TextEditingController();
  final amountCountroller = TextEditingController();
  DateTime? _selectedDate;
  void submitData() {
     if(amountCountroller.text.isEmpty){
       return ;
     }
    final inputTitle = titleCountroller.text;
    final inputAmount = double.parse(amountCountroller.text);
    if (inputTitle.isEmpty || inputAmount <= 0 || _selectedDate == null) {
      return;
    }

    widget.tx(
      inputTitle,
      inputAmount,
      _selectedDate,
    );
    Navigator.of(context).pop();
  }

  void _presentDatePicker() {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2019),
      lastDate: DateTime.now(),
    ).then((pickedDate) {
      if (pickedDate == null) {
        return;
      }
      setState(() {
        _selectedDate = pickedDate;
      });
    });
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
            Container(
              height: 60,
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(_selectedDate == null
                        ? "Not Date Chosen!"
                        : "Picked Date: ${DateFormat.yMEd().format(_selectedDate!)}"),
                    TextButton(
                        onPressed: _presentDatePicker,
                        child: Text(
                          "Chose Date!",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ))
                  ]),
            ),
            SizedBox(
              height: 40,
            ),
            ElevatedButton(
                // ignore: duplicate_ignore
                onPressed: submitData,
                // {
                //   tx(titleCountroller.text,
                //       double.parse(amountCountroller.text));
                //   // ignore: avoid_print
                // },
                child: Text(
                  "Add Transaction",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ))
          ],
        ),
      ),
    );
  }
}
