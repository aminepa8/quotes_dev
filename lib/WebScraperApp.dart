import 'package:web_scraper/web_scraper.dart';
import 'quote.dart';
class WebScraperApp  {

  // initialize WebScraper by passing base url of website
  final webScraper = WebScraper('http://quotes.toscrape.com');

  // Response of getElement is always List<Map<String, dynamic>>
  List<Map<String, dynamic>> quotesList;
  List<Map<String, dynamic>> authorList;
  List<Quote> quotes = List();

 Future<List<Quote>> fetchQuotes() async {
    // Loads web page and downloads into local state of library
    if (await webScraper
        .loadWebPage('/tag/books/')) {

        // getElement takes the address of html tag/element and attributes you want to scrap from website
        // it will return the attributes in the same order passed
      quotesList = webScraper.getElement('div.quote > span.text', ['span.text']);
      authorList = webScraper.getElement('div.quote span > small.author', ['span.text']);
      //
      //authorList.toList();
        //print(authorList);
      var lst_authors =  List();
      var lst_quotes = List();
      for (Map author in authorList){
        lst_authors.add(author.values.elementAt(0));
        //print(author.values.elementAt(0));
      }
      for (Map quote in quotesList){
        lst_quotes.add(quote.values.elementAt(0));
        //print(author.values.elementAt(0));
      }

      for(int i = 0; i<lst_authors.length;i++){
        Quote qt = Quote(author: lst_authors[i],text: lst_quotes[i] );
        quotes.add(qt);
        //print(qt.author);
      }
    }
    return quotes;
  }


}
