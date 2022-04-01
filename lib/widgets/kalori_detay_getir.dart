import 'package:flutter/material.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

class KaloriDetayGetir extends StatelessWidget {
  const KaloriDetayGetir({
    Key? key,
    required this.tur,
    required this.deger_yol,
    required this.alinan,
    required this.alinacak,
    required this.renk,
    required this.renk2,
    required this.renk3,
  }) : super(key: key);

  final String tur;
  final String deger_yol;
  final double alinan;
  final double alinacak;
  final Color renk;
  final Color renk2;
  final Color renk3;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 8, right: 8, top: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(
            deger_yol,
            width: 50,
            height: 50,
            color: renk2,
          ),
          Text(tur,
              style: const TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 20,
              )),
          LinearPercentIndicator(
            linearGradient: LinearGradient(
              colors: [renk, renk2],
            ),
            percent: alinan / alinacak,
            width: 100,
            lineHeight: 15,
            animation: true,
            backgroundColor: renk3,
          ),
          Text(alinan.toInt().toString() + "/" + alinacak.toInt().toString(),
              style: const TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 20,
              )),
        ],
      ),
    );
  }
}
