import 'package:flutter/material.dart';

class NewTransaction extends StatelessWidget {
  // NewTransaction({Key? key}) : super(key: key);
  final Function tx;
  final titleCountroller = TextEditingController();
  final amountCountroller = TextEditingController();
  NewTransaction(this.tx);
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
            ),
            TextField(
              decoration: const InputDecoration(labelText: "Amount"),
              //onChanged: (val)=>amountInput
              controller: amountCountroller,
            ),
            TextButton(
                // ignore: duplicate_ignore
                onPressed: () {
                  tx(titleCountroller.text,
                      double.parse(amountCountroller.text));
                  // ignore: avoid_print
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
    );
  }
}
