import 'package:diyetlendin/screens/anasayfa.dart';
import 'package:diyetlendin/screens/ayarlar.dart';
import 'package:diyetlendin/screens/profil.dart';
import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';
class Cerceve extends StatefulWidget {




  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _CerceveState();
  }
}

class _CerceveState extends State<Cerceve> {
  int gecerli_sayfa = 0;
  Widget gecerliSayfa = AnaSayfa();

  @override
  Widget build(BuildContext context) {

    // TODO: implement build
    return Scaffold(
      appBar: AppBar(title: Text("Diyetlendin",)),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(icon: Icon(LineIcons.home), label: "AnaSayfa"),
          BottomNavigationBarItem(icon: Icon(LineIcons.addressCard), label: "Profil"),
          BottomNavigationBarItem(icon: Icon(LineIcons.cog), label: "Ayarlar"),
        ],
        currentIndex: gecerli_sayfa,
        onTap: (int) {
          setState(() {
            gecerli_sayfa = int;
            if(gecerli_sayfa==0)gecerliSayfa=AnaSayfa();
            if(gecerli_sayfa==1)gecerliSayfa=Profil();
            if(gecerli_sayfa==2)gecerliSayfa=Ayarlar();
          });
        },
      ),
      body: gecerliSayfa,
    );
  }
}
