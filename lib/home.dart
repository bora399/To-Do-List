import 'package:flutter/material.dart';
import 'package:flutter_application_1/cardClass.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String change = "";

  List<Quote> quotes = [];

  void showAlertDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        title: Text(
          "Add Task",
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
                autofocus: true,
                onChanged: (String e) {
                  setState(() {
                    change = e;
                  });
                }),
            Padding(
              padding: EdgeInsets.only(top: 10.0),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () {},
                  child: RaisedButton(
                    onPressed: () {
                      setState(() {
                        change.isEmpty
                            ? print("Please write something")
                            : quotes.add(Quote(text: change));
                        Navigator.pop(context);
                        change = "";
                      });
                    },
                    child: Text("ADD"),
                    color: Colors.grey[600],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      appBar: AppBar(
        backgroundColor: Colors.grey[600],
        title: Text("To-Do List", style: TextStyle(color: Colors.grey[200])),
        centerTitle: true,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: showAlertDialog,
        backgroundColor: Colors.grey[600],
        child: Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: quotes
              .map((quote) => QuoteWidget(
                  quote: quote,
                  delete: () {
                    setState(() {
                      quotes.remove(quote);
                    });
                  }))
              .toList(),
        ),
      ),
    );
  }
}
