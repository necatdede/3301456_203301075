import 'package:diyetlendin/main.dart';
import 'package:diyetlendin/models/kullanici.dart';
import 'package:diyetlendin/screens/profil.dart';
import 'package:flutter/material.dart';

import '../models/besin.dart';
import '../widgets/kalori_detay_getir.dart';
import '../widgets/OgunGetir.dart';
import '../widgets/kalori_sayac_getir.dart';

import '../globals.dart' as globals;

class AnaSayfa extends StatefulWidget {
  @override
  State<AnaSayfa> createState() => _AnaSayfaState();
}

class _AnaSayfaState extends State<AnaSayfa> {
  String ogunAd = "";

  List<Besin> besinler = [
    Besin("Muz", 89, 22.84, 1.09, 0.33, "https://l24.im/ckpeG0"),
    Besin("Çilek", 32, 7.68, 0.67, 0.3, "https://l24.im/efWC"),
    Besin("Yulaf", 351, 57.25, 11.35, 5.8, "https://l24.im/QLewxf"),
    Besin("Ekmek", 238, 43.91, 10.66, 2.15, "https://l24.im/NRUvAO"),
    Besin("Çikolata", 528, 57.9, 4.4, 35.1, "https://l24.im/jGiHt2"),
    Besin("Cips", 532, 7.75, 0.91, 55.39, "https://l24.im/f8GP"),
    Besin("Peynir", 310, 2.53, 20.38, 24.31, "https://l24.im/ZR7u"),
  ];

  double appbar = AppBar().preferredSize.height;
  double bottombar=kBottomNavigationBarHeight;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      backgroundColor: MyApp().bgColor,
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Container(
            width: MediaQuery.of(context).size.width,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              //mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Hoşgeldin,${globals.kullanici.kullaniciAdi}",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Container(
                          child: InkWell(
                            onTap: () {
                              var alert = AlertDialog(
                                backgroundColor: MyApp().bgColor,
                                content: Profil(),
                                //actions: [Profil()],
                               // title: Profil(),
                              );
                              showDialog(
                                  context: context,
                                  builder: (BuildContext context) => alert);
                            },
                          ),
                          width: 70,
                          height: 70,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            image: DecorationImage(
                                fit: BoxFit.fill,
                                image: NetworkImage(globals.kullanici.resimUrl)),
                          )),
                    ],
                  ),
                ),
                KaloriSayacGetir(),
                Card(
                  elevation: 5,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  color: Colors.white,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      KaloriDetayGetir(
                          tur: "Karbonhidrat",
                          deger_yol: "images/karbonhidrat.png",
                          alinan: globals.alinanKarbonhidrat,
                          alinacak: globals.alinacakKarbonhidrat,
                          renk: Colors.yellow.shade300,
                          renk2: Colors.yellow,
                          renk3: Colors.yellow.shade100),
                      KaloriDetayGetir(
                          tur: "Protein",
                          deger_yol: "images/protein.png",
                          alinan: globals.alinanProtein,
                          alinacak: globals.alinacakProtein,
                          renk: Colors.red.shade300,
                          renk2: Colors.red,
                          renk3: Colors.red.shade100),
                      KaloriDetayGetir(
                          tur: "Yağ",
                          deger_yol: "images/yag.png",
                          alinan: globals.alinanYag,
                          alinacak: globals.alinacakYag,
                          renk: Colors.green.shade300,
                          renk2: Colors.green,
                          renk3: Colors.green.shade100),
                    ],
                  ),
                ),
                SingleChildScrollView(
                  physics: BouncingScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      OgunGetir(
                        tur: "images/breakfast.png",
                        renk: Colors.lightBlueAccent.shade200,
                        renk2: Color(0xffcee1f4),
                        yazi: "Kahvaltı",
                        ontab: () {
                          setState(() {
                            ogunAd = "Kahvaltı";
                          });

                          Navigator.pushNamed(context, "/routeBesinEkle",
                              arguments: [ogunAd, besinler]);
                        },
                      ),
                      OgunGetir(
                        tur: "images/lunch.png",
                        renk: Colors.pinkAccent.shade200,
                        renk2: Color(0xfff9dbd2),
                        yazi: "Öğle Yemeği",
                        ontab: () {
                          setState(() {
                            ogunAd = "Öğle Yemeği";
                          });

                          Navigator.pushNamed(context, "/routeBesinEkle",
                              arguments: [ogunAd, besinler]);
                        },
                      ),
                      OgunGetir(
                        tur: "images/dinner.png",
                        renk: Colors.orangeAccent.shade200,
                        renk2: Color(0xfffce0a2),
                        yazi: "Akşam Yemeği",
                        ontab: () {
                          setState(() {
                            ogunAd = "Akşam Yemeği";
                          });

                          Navigator.pushNamed(context, "/routeBesinEkle",
                              arguments: [ogunAd, besinler]);
                        },
                      ),
                      OgunGetir(
                        tur: "images/snack.png",
                        renk: Colors.lightGreenAccent.shade200,
                        renk2: Color(0xffe6edb7),
                        yazi: "Atıştırma",
                        ontab: () {
                          setState(() {
                            ogunAd = "Atıştırma";
                          });
                          Navigator.pushNamed(context, "/routeBesinEkle",
                              arguments: [ogunAd, besinler]);
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
