import 'package:diyetlendin/main.dart';
import 'package:diyetlendin/screens/profil.dart';
import 'package:flutter/material.dart';

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

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      backgroundColor: MyApp().bgColor,
      body: Padding(
        padding: const EdgeInsets.only(top: 8.0, right: 8.0, left: 8.0),
        child: SingleChildScrollView(
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * 0.9,
            //margin: EdgeInsets.only(top: 30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Hoşgeldin,${globals.kullaniciAdi}",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Container(
                        child: InkWell(
                          onTap: (){
                            var alert = AlertDialog(
                              title: Profil(),
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
                                image: NetworkImage(globals.resimUrl)),
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
                  physics: AlwaysScrollableScrollPhysics(),
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
                              arguments: ogunAd);
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
                              arguments: ogunAd);
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
                              arguments: ogunAd);
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
                              arguments: ogunAd);
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
