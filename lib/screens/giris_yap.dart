
import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';

import '../widgets/build_button_widget.dart';
import '../widgets/build_textfield_widget.dart';
import '../main.dart';
import '../globals.dart' as globals;

class GirisYap extends StatefulWidget {
  const GirisYap({Key? key}) : super(key: key);

  @override
  _GirisYapState createState() => _GirisYapState();
}

class _GirisYapState extends State<GirisYap> {

  var alert = AlertDialog(
    title: Column(
      children: [
        Icon(
          Icons.error_outline,
          color: Colors.red,
          size: 75,
        ),
        SizedBox(
          height: 10,
        ),
        Text(
          "Kullanıcı Adı, Şifre Yanlış",
          style: TextStyle(fontSize: 25),
        ),
      ],
    ),
  );

  final kullaniciAdi = TextEditingController();
  final sifre = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: MyApp().bgColor,
      body: Center(
        child: SingleChildScrollView(
          child: Container(
            // decoration: BoxDecoration(
            //   image: DecorationImage(
            //       colorFilter: ColorFilter.mode(
            //           Colors.black.withOpacity(0.1), BlendMode.dstATop),
            //       image: AssetImage('images/logo.png'),
            //       fit: BoxFit.cover),
            // ),
            width: screenSize.width,
            height: screenSize.height,
            /*
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Color(0xFFEDF0F2),Color(0xFFFEFEFE)],
              ),
            ),

             */

            child: Column(
              //mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Image.asset(
                  "images/logo.png",
                  width: screenSize.width * 0.7,
                  height: screenSize.height * 0.5,
                ),
                Container(
                  width: screenSize.width * 0.7,
                  height: screenSize.height * 0.5,
                  child: Card(
                    elevation: 20,
                    shape: const RoundedRectangleBorder(
                      borderRadius:
                          BorderRadius.vertical(top: Radius.circular(50)),
                    ),
                    color: Colors.white,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          buildTextFieldWidget(
                            control: kullaniciAdi,
                            str: "Kullanıcı Adı",
                            icon: LineIcons.user,
                            klavyetur: TextInputType.name,
                          ),
                          buildTextFieldWidget(
                            control: sifre,
                            str: "Şifre",
                            icon: LineIcons.userLock,
                            kontrol: true,
                          ),
                          build_button_widget(
                              context: context,
                              str: "Giriş Yap",
                              islem: () {
                                try {
                                  (globals.kullanici.kullaniciAdi ==
                                              kullaniciAdi.text &&
                                          globals.kullanici.sifre == sifre.text)
                                      ? Navigator.popAndPushNamed(
                                          context,
                                          "/routeCerceve",
                                        )
                                      : showDialog(
                                          context: context,
                                          builder: (BuildContext context) =>
                                              alert);
                                } catch (e) {
                                  showDialog(
                                      context: context,
                                      builder: (BuildContext context) => alert);
                                }
                              }),
                          TextButton(
                              onPressed: () {
                                Navigator.pushNamed(context, "/routeKayitOl");
                              },
                              child: Text(
                                "Üye Değil Misin ?",
                                style: TextStyle(
                                  color: Colors.grey.shade800,
                                ),
                              )),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
