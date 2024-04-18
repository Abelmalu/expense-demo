import 'package:flutter/material.dart';

class NewTransaction extends StatelessWidget {
  final Function addNewTransaction;
  final titleController = TextEditingController();
  final amountController = TextEditingController();
  NewTransaction(this.addNewTransaction);
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          TextField(
            decoration: InputDecoration(labelText: 'title'),
            controller: titleController,
            onSubmitted: (_) {
              addNewTransaction();
            },
          ),
          TextField(
            decoration: InputDecoration(labelText: 'amount'),
            controller: amountController,
            onSubmitted: (_) {
              addNewTransaction(
                  titleController.text,double.parse(amountController.text));
            },
          ),
          TextButton(
              onPressed: () {
                addNewTransaction();
              },
              child: Text('add Transactiion'))
        ],
      ),
    );
  }
}
