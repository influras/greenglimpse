import 'package:intl/intl.dart';

class ProductController  {

  NumberFormat currencyFormat = NumberFormat.currency(locale: "de_DE");

  String toCurrencyFormat(double value) {
    return currencyFormat.format(value);
  }

}