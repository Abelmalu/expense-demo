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

          
          Column(
            children: transactions.map((tx) {
              return Card(
                child: Row(children: [
                  Text(tx.amount.toString()),
                  Column(children: [
                    Text(tx.title),
                    Text(tx.date.toString())

                  ],)
                ],),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}
