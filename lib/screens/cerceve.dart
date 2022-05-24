import 'package:diyetlendin/screens/anasayfa.dart';
import 'package:diyetlendin/screens/ayarlar.dart';
import 'package:diyetlendin/screens/profil.dart';
import 'package:diyetlendin/screens/raporlar.dart';
import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';

class Cerceve extends StatefulWidget {
  const Cerceve({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _CerceveState();
  }
}

class _CerceveState extends State<Cerceve> {
  int gecerliIndex = 0;
  Widget gecerliSayfa = const AnaSayfa();

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
          title: const Text(
        "Diyetlendin",
      )),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(
              icon: Icon(LineIcons.home), label: "AnaSayfa"),
          BottomNavigationBarItem(
              icon: Icon(LineIcons.addressCard), label: "Profil"),
          BottomNavigationBarItem(
              icon: Icon(LineIcons.barChartAlt), label: "Raporlar"),
          BottomNavigationBarItem(icon: Icon(LineIcons.cog), label: "Ayarlar"),
        ],
        currentIndex: gecerliIndex,
        onTap: (int) {
          setState(() {
            gecerliIndex = int;
            if (gecerliIndex == 0) gecerliSayfa = const AnaSayfa();
            if (gecerliIndex == 1) gecerliSayfa = const Profil();
            if (gecerliIndex == 2) gecerliSayfa = const Raporlar();
            if (gecerliIndex == 3) gecerliSayfa = const Ayarlar();
          });
        },
      ),
      body: gecerliSayfa,
    );
  }
}
