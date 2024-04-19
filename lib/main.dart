import 'package:demo/Transaction.dart';
import 'package:demo/newTransaction.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

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

  void addNewTransaction(String titleTx, double amountTx) {
    var title = titleTx;
    titleTx = '';
    var amount = amountTx;
    amountTx = 0;
    var newTx = Transaction(
        id: DateTime.now().toString(),
        title: title,
        date: DateTime.now(),
        amount: amount);
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
          NewTransaction(addNewTransaction),
          Column(
            children: transactions.map((tx) {
              return Card(
                child: Row(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        border: Border.all(width: 2, color: Colors.purple),
                      ),
                      padding: EdgeInsets.all(10),
                      margin: EdgeInsets.all(5),
                      child: Text(
                       ' \$${tx.amount}',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          tx.title,
                          style: TextStyle(fontSize: 18),
                        ),
                        Text(DateFormat.yMMMd().format(tx.date))
                      ],
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
