import 'package:diyetlendin/screens/anasayfa.dart';
import 'package:diyetlendin/screens/ayarlar.dart';
import 'package:diyetlendin/screens/besin_detay.dart';
import 'package:diyetlendin/screens/cerceve.dart';
import 'package:diyetlendin/screens/besin_ekle.dart';
import 'package:diyetlendin/screens/giris_yap.dart';
import 'package:diyetlendin/screens/kayit_ol.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'widgets/build_button_widget.dart';
import 'widgets/build_textfield_widget.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final Color bgColor = Color(0xffEDF0F2);
  final Color textfieldColor = Color(0xff70D188);

  MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: "/",
      routes: {
        "/": (context) => const GirisYap(),
        "/routeKayitOl": (context) => const KayitOl(),
        "/routeAnaSayfa": (context) => AnaSayfa(),
        "/routeAyarlar": (context) => Ayarlar(),
        "/routeCerceve": (context) => Cerceve(),
        "/routeBesinEkle": (context) => BesinEkle(),
        "/routeBesinDetay": (context) => BesinDetay(),
      },
      title: 'Diyetlendin',
      theme: ThemeData().copyWith(
        colorScheme: ThemeData().colorScheme.copyWith(primary: textfieldColor),
      ),
    );
  }
}
