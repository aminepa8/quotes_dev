import 'package:flutter/material.dart';
import 'quote.dart';
import 'quote_card.dart';
import 'WebScraperApp.dart';
void main() async{
  WebScraperApp wb  = WebScraperApp();
  List<Quote> quotesA =  await wb.fetchQuotes() ;

  runApp(MaterialApp(
  home:QuoteList(quotes: quotesA),
));
}

class QuoteList extends StatefulWidget {
  List<Quote> quotes;
  QuoteList({this.quotes});
  @override
  _QuoteListState createState() => _QuoteListState(quotes: quotes);
}

class _QuoteListState extends State<QuoteList> {

  List<Quote> quotes ;
  _QuoteListState({this.quotes});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        title: Text('Scrapped Quotes'),
        centerTitle: true,
        backgroundColor: Colors.purple[400],
      ),
    body:ListView.builder(
          itemCount: quotes.length,
          itemBuilder: (BuildContext context, int index) {
            return QuoteCard(
            quote:quotes[index],
              delete:(){
                setState(() {
                  quotes.remove(quotes[index]);
                  });
              }
            );}
            )
    );
  }



}






