import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
// import 'dart:io' show Platform; // there is also hide
import 'rate_card.dart';
import 'coin_data.dart' as coindata;

coindata.Network net = coindata.Network();

class PriceScreen extends StatefulWidget {
  const PriceScreen({Key? key}) : super(key: key);

  @override
  _PriceScreenState createState() => _PriceScreenState();
}

class _PriceScreenState extends State<PriceScreen> {
  String selectedUnit = coindata.currenciesList[0];
  List<String> currencyRates = List.filled(coindata.cryptoList.length, '?');

  DropdownButton getAndroidDropdown() {
    List<DropdownMenuItem<String>> dropdownMenu = [];
    for (String currency in coindata.currenciesList) {
      dropdownMenu.add(DropdownMenuItem(
        child: Text(currency),
        value: currency,
      ));
    }

    return DropdownButton<String>(
        value: selectedUnit,
        items: dropdownMenu,
        onChanged: (value) {
          setState(() {
            selectedUnit = value ?? '';
          });
          fetchData();
        });
  }

  CupertinoPicker getiOSDropdown() {
    List<Text> textList = [];
    for (String currency in coindata.currenciesList) {
      textList.add(Text(currency));
    }

    return CupertinoPicker(
      children: textList,
      itemExtent: 35.0,
      onSelectedItemChanged: (selectedIndex) => setState(() {
        selectedUnit = coindata.currenciesList[selectedIndex];
      }),
    );
  }

  List<Widget> getCards() {
    List<Widget> columnChildren = [];

    for (int i = 0; i < coindata.cryptoList.length; i++) {
      String crypto = coindata.cryptoList[i];
      String rate = currencyRates[i].toString();

      columnChildren.add(RateCard(
        crypto: crypto,
        rate: rate,
        unit: selectedUnit,
      ));
    }

    columnChildren.add(Expanded(child: Container()));
    columnChildren.add(Container(
        height: 150.0,
        alignment: Alignment.center,
        padding: const EdgeInsets.only(bottom: 30.0),
        color: Colors.blueGrey,
        // Platform.isIOS ? getiOSDropdown() : getAndroidDropdown()
        child: getAndroidDropdown()));
    return columnChildren;
  }

  void fetchData() async {
    List<String> newCurrencyRates = [];
    for (String crypto in coindata.cryptoList) {
      String? rate = await net.getRate(crypto, selectedUnit);
      newCurrencyRates.add(rate != null ? rate : '?');
    }
    setState(() => currencyRates = newCurrencyRates);
  }

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text('🤑 Coin Ticker')),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: getCards(),
      ),
    );
  }
}
