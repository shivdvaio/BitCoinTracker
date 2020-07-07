import 'package:flutter/material.dart';
import 'package:bitcoin_ticker_by_shiv/coin_data.dart';
import 'package:flutter/cupertino.dart';
import 'coin_data.dart';
import 'dart:io' show Platform;

class PriceScreen extends StatefulWidget {
  @override
  _PriceScreenState createState() => _PriceScreenState();
}

class _PriceScreenState extends State<PriceScreen> {
  String bitCoinvalue;
  String count;
  double rate;
  String data;

  CoinData coinData = CoinData();

    void updateui() async {
    try {
      rate = await coinData.getCoindata(count);
      setState(() {
        bitCoinvalue = rate.toStringAsFixed(0);

      });
    } catch (e) {
      print(e);
    }
  }

  DropdownButton androidlist() {
    List<DropdownMenuItem<String>> dropdownitems = [];
    for (String currency in currenciesList) {
      var newitem = DropdownMenuItem(
        child: Text(currency),
        value: currency,
      );
      dropdownitems.add(newitem);
    }

    return DropdownButton(
        value: data,
        onChanged: (value) {
          data = value;
        },
        items: dropdownitems);
  }

  CupertinoPicker iositems() {
    List<Text> listdata = [];
    for (String currency in currenciesList) {
      listdata.add(Text(currency));
    }

    return CupertinoPicker(

        onSelectedItemChanged: (selectedIndex) {
          setState(() {
            count = currenciesList[selectedIndex];
            updateui();
          });
        },
        backgroundColor: Colors.white10.withOpacity(0.3),
        itemExtent: 40,
        children: listdata);
  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey.withOpacity(0.6),
      appBar: AppBar(
        title: Text('🤑 Coin Ticker'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
           Expanded(
             child: Column(
               crossAxisAlignment: CrossAxisAlignment.stretch,
               children: [
              Padding(
                padding: EdgeInsets.fromLTRB(18.0, 18.0, 18.0, 0),
                child: Card(
                  color: Colors.white10.withOpacity(0.7),
                  elevation: 5.0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 28.0),
                    child: Text(
                      '1 BTC = ? $bitCoinvalue',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 20.0,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(18.0, 18.0, 18.0, 0),
                child: Card(
                  color: Colors.white10.withOpacity(0.7),
                  elevation: 5.0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 28.0),
                    child: Text(
                      '1 BTC = ? $bitCoinvalue',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 20.0,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(18.0, 18.0, 18.0, 0),
                child: Card(
                  color: Colors.white10.withOpacity(0.7),
                  elevation: 5.0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 28.0),
                    child: Text(
                      '1 BTC = ? $bitCoinvalue',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 20.0,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
              ),
             ],),
           ),
          Container(
            height: 150.0,
            alignment: Alignment.center,
            color: Colors.black26,
            padding: EdgeInsets.only(bottom: 30.0),
            child: CupertinoTheme(

              data: CupertinoThemeData(

                  textTheme: CupertinoTextThemeData(
                      pickerTextStyle: TextStyle(color: Colors.white,fontSize: 20))),
              child: Platform.isIOS ? iositems() : androidlist(),
            ),
          ),
        ],
      ),
    );
  }
}
