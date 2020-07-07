import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

const List<String> currenciesList = [
  'AUD',
  'BRL',
  'CAD',
  'CNY',
  'EUR',
  'GBP',
  'HKD',
  'IDR',
  'ILS',
  'INR',
  'JPY',
  'MXN',
  'NOK',
  'NZD',
  'PLN',
  'RON',
  'RUB',
  'SEK',
  'SGD',
  'USD',
  'ZAR'
];

const List<String> cryptoList = [
  'BTC',
  'ETH',
  'LTC',
];

class CoinData {
  double priceofcoin;

Future getCoindata(String countryname) async {

  String urlname = 'https://api.coingecko.com/api/v3/coins/markets?vs_currency=$countryname&ids=bitcoin';

  final http.Response response = await http.get(urlname);

  if(response.statusCode==200){

    String coinsbody = response.body;
    dynamic coinsdata = jsonDecode(coinsbody);
    priceofcoin = coinsdata[0]['current_price'];
    return priceofcoin;

  }
  else{
    print(response.statusCode);
    throw "wrong value";

  }

}



}
