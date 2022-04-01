import 'package:diyetlendin/screens/acilis.dart';
import 'package:diyetlendin/screens/anasayfa.dart';
import 'package:diyetlendin/screens/ayarlar.dart';
import 'package:diyetlendin/screens/besin_detay.dart';
import 'package:diyetlendin/screens/cerceve.dart';
import 'package:diyetlendin/screens/besin_ekle.dart';
import 'package:diyetlendin/screens/eklenen_besinler.dart';
import 'package:diyetlendin/screens/giris_yap.dart';
import 'package:diyetlendin/screens/kayit_ol.dart';
import 'package:flutter/material.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  final Color bgColor = const Color(0xffEDF0F2);
  final Color textfieldColor = const Color(0xff70D188);

  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: "/",
      routes: {
        "/":(context)=>const Acilis(),
        "/routeGirisYap": (context) => const GirisYap(),
        "/routeKayitOl": (context) => const KayitOl(),
        "/routeAnaSayfa": (context) => const AnaSayfa(),
        "/routeAyarlar": (context) => const Ayarlar(),
        "/routeCerceve": (context) => const Cerceve(),
        "/routeBesinEkle": (context) => const BesinEkle(),
        "/routeBesinDetay": (context) => const BesinDetay(),
        "/routeEklenenBesinler": (context) => const EklenenBesinler(),
      },
      title: 'Diyetlendin',
      theme: ThemeData().copyWith(
        colorScheme: ThemeData().colorScheme.copyWith(primary: textfieldColor),
      ),
    );
  }
}
