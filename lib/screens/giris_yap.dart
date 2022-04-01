
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
      children: const [
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
      backgroundColor: const MyApp().bgColor,
      body: Center(
        child: SingleChildScrollView(
          child: SizedBox(
            width: screenSize.width,
            height: screenSize.height,

            child: Column(
              children: [
                Image.asset(
                  "images/logo.png",
                  width: screenSize.width * 0.7,
                  height: screenSize.height * 0.5,
                ),
                SizedBox(
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
                          BuildTextFieldWidget(
                            control: kullaniciAdi,
                            str: "Kullanıcı Adı",
                            icon: LineIcons.user,
                            klavyetur: TextInputType.name,
                          ),
                          BuildTextFieldWidget(
                            control: sifre,
                            str: "Şifre",
                            icon: LineIcons.userLock,
                            kontrol: true,
                          ),
                          BuildButtonWidget(
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
