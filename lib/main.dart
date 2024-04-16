import 'package:demo/Transaction.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: MyHomepage());
  }
}

class MyHomepage extends StatefulWidget {
  @override
  State<MyHomepage> createState() => _MyHomepageState();
}

class _MyHomepageState extends State<MyHomepage> {
  var titleController = TextEditingController();
  var amountController = TextEditingController();

  List<Transaction> transactions = [
    Transaction(
        id: DateTime.now().toString(),
        title: 'shoe',
        date: DateTime.now(),
        amount: 22.2),
    Transaction(
        id: DateTime.now().toString(),
        title: 'Groceries',
        date: DateTime.now(),
        amount: 24.2),
    Transaction(
        id: DateTime.now().toString(),
        title: 'shorts',
        date: DateTime.now(),
        amount: 83.2),
  ];

  void addNewTransaction() {
    var title = titleController.text;
    titleController.text = '';
    var amount = amountController.text;
    amountController.text = '';
    var newTx = Transaction(
        id: DateTime.now().toString(),
        title: title,
        date: DateTime.now(),
        amount: double.parse(amount));
    setState(() {
      transactions.add(newTx);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('no video app'),
      ),
      body: Column(
        children: [
          Card(
            child: Text('charts'),
          ),
          Card(
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
                    addNewTransaction();
                  },
                ),
                TextButton(
                    onPressed: () {
                      addNewTransaction();
                    },
                    child: Text('add Transactiion'))
              ],
            ),
          ),
          Column(
            children: transactions.map((tx) {
              return Card(
                child: Row(
                  children: [
                    Text(tx.amount.toString()),
                    Column(
                      children: [Text(tx.title), Text(tx.date.toString())],
                    )
                  ],
                ),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}
