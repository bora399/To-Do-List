import 'package:flutter/material.dart';

class Quote {
  String text;

  Quote({
    String text,
  }) {
    this.text = text;
  }

  Quote.fromMap(Map map) : this.text = map["text"];

  Map toMap() {
    return {
      'text': this.text,
    };
  }
}

class QuoteWidget extends StatefulWidget {
  final Quote quote;
  final Function delete;
  final Function add;

  QuoteWidget({this.quote, this.delete, this.add});

  @override
  _QuoteWidgetState createState() => _QuoteWidgetState();
}

class _QuoteWidgetState extends State<QuoteWidget> {
  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.grey[300],
      margin: EdgeInsets.fromLTRB(20.0, 20.0, 16.0, 0.0),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              widget.quote.text,
              style: TextStyle(
                fontSize: 18.0,
                color: Colors.grey[600],
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 8.0),
            FlatButton.icon(
                onPressed: widget.delete,
                label: Text("Delete Task",
                    style: TextStyle(color: Colors.red[500])),
                icon: Icon(
                  Icons.delete,
                  color: Colors.red[500],
                ),
                splashColor: Colors.red[900],
                textColor: Colors.red[900]),
          ],
        ),
      ),
    );
  }
}
