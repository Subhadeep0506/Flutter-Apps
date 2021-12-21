// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers, sized_box_for_whitespace, prefer_const_literals_to_create_immutables, avoid_print, prefer_typing_uninitialized_variables, deprecated_member_use

// import 'package:flutter/services.dart';
import 'package:flutter/material.dart';
import 'package:flutter_expense_planner/widgets/chart.dart';
import 'package:flutter_expense_planner/widgets/new_transaction.dart';
import 'package:flutter_expense_planner/widgets/transaction_list.dart';
import 'models/transaction.dart';

void main() {
  // WidgetsFlutterBinding.ensureInitialized;
  // SystemChrome.setPreferredOrientations([
  //   DeviceOrientation.portraitUp,
  //   DeviceOrientation.portraitDown,
  // ]);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Expenses Planner',
      home: MyHomePage(),
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.amber).copyWith(secondary: Colors.greenAccent),
        // this is similar to the following...
        // primarySwatch: Colors.green,
        // accentColor: Colors.greenAccent,
        fontFamily: 'Quicksand',
        appBarTheme: AppBarTheme(
          textTheme: ThemeData.light().textTheme.copyWith(headline6: TextStyle(fontFamily: 'OpenSans')),
        ),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool _showChart = true;
  final List<Transaction> _userTransactions = [
    Transaction(
      amount: 23.12,
      date: DateTime.now(),
      id: 't0',
      title: 'New Watch',
    ),
    Transaction(
      amount: 33.12,
      date: DateTime.now(),
      id: 't1',
      title: 'New Shoes',
    ),
  ];

  List<Transaction> get _recentTransactions {
    return _userTransactions.where((tx) {
      return tx.date.isAfter(
        DateTime.now().subtract(
          Duration(days: 7),
        ),
      );
    }).toList();
  }

  void _addNewTransaction(String txTitle, double txAmount, DateTime chosenDate) {
    final newTx = Transaction(
      title: txTitle,
      amount: txAmount,
      date: chosenDate,
      id: DateTime.now().toString(),
    );

    setState(() {
      _userTransactions.add(newTx);
    });
  }

  void _deleteTransaction(String id) {
    setState(() {
      _userTransactions.removeWhere((tx) => tx.id == id);
    });
  }

  void _startAddNewTransaction(BuildContext ctx) {
    showModalBottomSheet(
      backgroundColor: Colors.teal,
      context: ctx,
      builder: (bCtx) {
        return GestureDetector(
          onTap: () {},
          child: NewTransaction(_addNewTransaction),
          behavior: HitTestBehavior.opaque,
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final _isLandscape = (MediaQuery.of(context).orientation == Orientation.landscape);

    final appBar = AppBar(
      elevation: 10,
      title: const Text(
        'Expense Planner',
      ),
      actions: <Widget>[
        IconButton(
          onPressed: () => _startAddNewTransaction(context),
          icon: Icon(Icons.add),
        ),
      ],
    );

    final txListWidget = Container(
      height: (MediaQuery.of(context).size.height - appBar.preferredSize.height - MediaQuery.of(context).padding.top) * 0.7,
      child: TransactionList(_userTransactions, _deleteTransaction),
    );

    return Scaffold(
      backgroundColor: Colors.teal,
      appBar: appBar,
      body: SingleChildScrollView(
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.start,
          // crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            if (_isLandscape)
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'Show Chart: ',
                    style: TextStyle(color: Colors.white),
                  ),
                  Switch(
                    activeColor: Colors.amberAccent,
                    value: _showChart,
                    onChanged: (isSwitched) {
                      setState(() {
                        _showChart = isSwitched;
                      });
                    },
                  ),
                ],
              ),
            if (!_isLandscape) // if not in landscape mode show the chart
              Container(
                height: (MediaQuery.of(context).size.height - appBar.preferredSize.height - MediaQuery.of(context).padding.top) * 0.3,
                child: Chart(_recentTransactions),
              ),
            if (!_isLandscape) txListWidget, // also show the tx list if not in landscape mode
            if (_isLandscape)
              _showChart
                  ? Container(
                      height: (MediaQuery.of(context).size.height - appBar.preferredSize.height - MediaQuery.of(context).padding.top) * 0.7,
                      child: Chart(_recentTransactions),
                    )
                  : txListWidget
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        elevation: 10,
        onPressed: () => _startAddNewTransaction(context),
      ),
    );
  }
}
