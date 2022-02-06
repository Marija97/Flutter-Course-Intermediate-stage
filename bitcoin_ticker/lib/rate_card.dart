import 'package:flutter/material.dart';
import 'package:crypto_font_icons/crypto_font_icons.dart';

class RateCard extends StatelessWidget {
  final String crypto;
  final String rate;
  final String unit;

  const RateCard({
    required this.crypto,
    required this.rate,
    required this.unit,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(18.0, 18.0, 18.0, 0),
      child: Card(
        color: Colors.blueGrey,
        elevation: 5.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 28.0),
          child: Text(
            '1 $crypto = $rate $unit',
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 20.0, color: Colors.white),
          ),
        ),
      ),
    );
  }
}

//child: Row(
//children: [
//const Icon(CryptoFontIcons.BTC),
//Padding(
//padding:
//const EdgeInsets.symmetric(vertical: 15.0, horizontal: 28.0),
//child: Text(
//'1 $crypto = $rate $unit',
//textAlign: TextAlign.center,
//style: const TextStyle(fontSize: 20.0, color: Colors.white),
//),
//),
//],
//),
