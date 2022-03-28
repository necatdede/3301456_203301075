import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

import '../main.dart';
import '../globals.dart' as globals;

class KaloriSayacGetir extends StatefulWidget {


  @override
  State<KaloriSayacGetir> createState() => _KaloriSayacGetirState();
}

class _KaloriSayacGetirState extends State<KaloriSayacGetir> {

  var now = DateTime.now();

  String ayHesapla(int ayid) {
    String ay = "";
    switch (ayid) {
      case 1:
        ay = "Ocak";
        break;
      case 2:
        ay = "Şubat";
        break;
      case 3:
        ay = "Mart";
        break;
      case 4:
        ay = "Nisan";
        break;
      case 5:
        ay = "Mayıs";
        break;
      case 6:
        ay = "Haziran";
        break;
      case 7:
        ay = "Temmuz";
        break;
      case 8:
        ay = "Ağustos";
        break;
      case 9:
        ay = "Eylül";
        break;
      case 10:
        ay = "Ekim";
        break;
      case 11:
        ay = "Kasım";
        break;
      case 12:
        ay = "Aralık";
        break;
    }
    return ay;
  }




  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      elevation: 5,
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Flexible(
              flex: 1,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextButton(
                    onPressed: () {
                      showDatePicker(
                          context: context,
                          initialDate: now,
                          firstDate: DateTime(2022),
                          lastDate: DateTime(2024))
                          .then((date) {
                        setState(() {
                          now = date!;
                        });
                      });
                    },
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Icon(
                          LineIcons.calendarWithDayFocus,
                          color: Colors.black,
                          size: 80,
                        ),
                        Text(
                          now.day.toString() +
                              " " +
                              ayHesapla(now.month),
                          style: const TextStyle(
                            color: Colors.black,
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(now.year.toString(),style: const TextStyle(
                          color: Colors.black,
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                        ),),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Flexible(
              flex: 1,
              child: CircularPercentIndicator(
                linearGradient: LinearGradient(
                  colors: [MyApp().bgColor, MyApp().textfieldColor],
                ),
                radius: 170,
                animation: true,
                animationDuration: 1200,
                lineWidth: 10.0,
                percent: globals.alinanKalori / globals.gunlukAlinacakKalori,
                center: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      globals.alinanKalori.toInt().toString()+"/"+globals.gunlukAlinacakKalori.toInt().toString(),
                      style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 30.0,
                          color: Colors.black),
                    ),
                    const Text(
                      "kcal",
                      style: TextStyle(
                          fontSize: 30.0,
                          color: Colors.black38,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                circularStrokeCap: CircularStrokeCap.round,
                backgroundColor: Colors.grey.shade300,
                // progressColor: Colors.black,
              ),
            ),
          ],
        ),
      ),
    );
  }
}