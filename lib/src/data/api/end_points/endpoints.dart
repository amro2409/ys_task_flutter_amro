
class Endpoints{
  //------------- AUTH MODULE-----------------
  static const String login = '/login';
//------------- STOCK MODULE-----------------
  static const String fetchTopStockData = '/tickers?access_key=fe999907b556243b584c87671db653b9';
  static const String historicalStockPricesLastFiveDays = '/eod?access_key=fe999907b556243b584c87671db653b9&symbols=AAPL&limit=5';

}