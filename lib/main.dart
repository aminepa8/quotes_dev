import 'package:flutter/material.dart';
import 'quote.dart';
import 'quote_card.dart';
void main() => runApp(MaterialApp(
  home:QuoteList(),
));

class QuoteList extends StatefulWidget {
  @override
  _QuoteListState createState() => _QuoteListState();
}

class _QuoteListState extends State<QuoteList> {
  List<Quote> quotes = [
    Quote(text: 'Talk is cheap. Show me the code',author: 'Linus Torvalds'),
    Quote(text: 'Programs must be written for people to read, and only incidentally for machines to execute.',author: 'Harold Abelson'),
    Quote(text: 'How you look at it is pretty much how you\'ll see it',author: 'Rasheed Ogunlaru '),

  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        title: Text('Developer Quotes'),
        centerTitle: true,
        backgroundColor: Colors.purple[400],
      ),
      body:Column(
        children: quotes.map((quote) => QuoteCard(
            quote:quote,
          delete:(){
              setState(() {
                quotes.remove(quote);
              });
          }

        )).toList(),
      ),
    );
  }
}




