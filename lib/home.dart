import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/cardClass.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String change = "";

  List<Quote> quotes = [];
  SharedPreferences sharedPreferences;

  @override
  void initState() {
    initSharedPreferences();
    super.initState();
  }

  initSharedPreferences() async {
    sharedPreferences = await SharedPreferences.getInstance();
    loadData();
  }

  void saveData() {
    List<String> spList =
        quotes.map((item) => json.encode(item.toMap())).toList();
    sharedPreferences.setStringList('list', spList);
  }

  void loadData() {
    List<String> spList = sharedPreferences.getStringList('list');
    spList.map((item) => Quote.fromMap(json.decode(item))).toList() != null
        ? quotes =
            spList.map((item) => Quote.fromMap(json.decode(item))).toList()
        : quotes = [];
    setState(() {});
  }

  void addQuote() {
    quotes.add(Quote(text: change));
    saveData();
  }

  void showAlertDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: Color(0x988667C4),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        title: Text(
          "Add Task",
          textAlign: TextAlign.center,
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
                            : addQuote();
                        Navigator.pop(context);
                        change = "";
                      });
                    },
                    child: Text("ADD"),
                    color: Colors.green[800],
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
      backgroundColor: Color(0xD2713BDD),
      appBar: AppBar(
        backgroundColor: Color(0x989379C7),
        title: Text("To-Do List", style: TextStyle(color: Colors.grey[200])),
        centerTitle: true,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: showAlertDialog,
        backgroundColor: Color(0x989379C7),
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
