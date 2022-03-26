import 'package:diyetlendin/widgets/build_button_widget.dart';
import 'package:diyetlendin/widgets/build_textfield_widget.dart';
import 'package:diyetlendin/main.dart';
import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';
import '../widgets/build_dropdown_widget.dart';
import '../globals.dart' as globals;

enum Cinsiyet { Kadin, Erkek } //enum önceden belirlenmiş sabit veriler

class KayitOl extends StatefulWidget {
  const KayitOl({Key? key}) : super(key: key);

  @override
  State<KayitOl> createState() => _KayitOl();
}

class _KayitOl extends State<KayitOl> {
  final ad = TextEditingController();
  final kullaniciAdi = TextEditingController();
  final sifre = TextEditingController();
  final yas = TextEditingController();
  final boy = TextEditingController();
  final kilo = TextEditingController();

  Cinsiyet _cinsiyet = Cinsiyet.Kadin;
  String secilenAktivite = "Az Hareketli";
  String secilenHedef = "Kilomu Korumak";

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      backgroundColor: MyApp().bgColor,
      body: Center(
        child: SingleChildScrollView(
          child: Container(
            width: MediaQuery.of(context).size.width,
            //height: MediaQuery.of(context).size.height,
            child: Column(
              children: [
                Image.asset(
                  "images/logo.png",
                  width: MediaQuery.of(context).size.width / 1.5,
                  height: MediaQuery.of(context).size.height / 1.5,
                ),
                Card(
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.vertical(top: Radius.circular(50)),
                  ),
                  color: Colors.white,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: SizedBox(
                            width: MediaQuery.of(context).size.width*0.8,
                            child: Row(
                              children: [
                                Flexible(
                                  child: ListTile(
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(30),
                                      side: BorderSide(
                                          color: MyApp().bgColor,
                                          width: 3),
                                    ),
                                    title: Text(
                                      "Kadın",
                                      style: TextStyle(fontSize: 20),
                                    ),
                                    leading: Radio<Cinsiyet>(
                                      value: Cinsiyet.Kadin,
                                      groupValue: _cinsiyet,
                                      activeColor: MyApp().textfieldColor,
                                      onChanged: (Cinsiyet? value) {
                                        setState(() {
                                          _cinsiyet = value!;
                                        });
                                      },
                                    ),
                                  ),
                                ),
                                Flexible(
                                  child: ListTile(
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(30),
                                      side: BorderSide(
                                          color: MyApp().bgColor,
                                          width: 3),
                                    ),
                                    title: Text(
                                      "Erkek",
                                      style: TextStyle(fontSize: 20),
                                    ),
                                    leading: Radio<Cinsiyet>(
                                      activeColor: MyApp().textfieldColor,
                                      value: Cinsiyet.Erkek,
                                      groupValue: _cinsiyet,
                                      onChanged: (Cinsiyet? value) {
                                        setState(() {
                                          _cinsiyet = value!;
                                        });
                                      },
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        buildTextFieldWidget(
                          control: ad,
                          str: "Ad Soyad",
                          icon: LineIcons.addressCard,
                          kontrol: false,
                          klavyetur: TextInputType.name,
                        ),
                        buildTextFieldWidget(
                          control: kullaniciAdi,
                          str: "Kullanıcı Adı",
                          icon: LineIcons.user,
                          kontrol: false,
                          klavyetur: TextInputType.name,
                        ),
                        buildTextFieldWidget(
                          control: sifre,
                          str: "Şifre",
                          icon: LineIcons.userLock,
                          kontrol: true,
                          klavyetur: TextInputType.name,
                        ),

                        buildTextFieldWidget(
                            control: yas,
                            str: "Yaş",
                            icon:LineIcons.birthdayCake,
                            kontrol: false,
                            klavyetur: TextInputType.number),
                        buildTextFieldWidget(
                          control: boy,
                          str: "Boy",
                          icon: LineIcons.ruler,
                          kontrol: false,
                          klavyetur: TextInputType.number,
                        ),
                        buildTextFieldWidget(
                          control: kilo,
                          str: "Kilo",
                          icon: LineIcons.weight,
                          kontrol: false,
                          klavyetur: TextInputType.number,
                        ),
                        BuildDropDownWidget(
                          secilen: secilenAktivite,
                          veri: [
                            'Az Hareketli',
                            'Orta Hareketli(Haftada 1-3 Egzersiz)',
                            'Çok Hareketli(Haftada 4-5 Egzersiz)'
                          ],
                          islem: (String? newValue) {
                            setState(() {
                              secilenAktivite = newValue!;
                              globals.secilenAktivite = newValue;
                              print(globals.secilenAktivite);
                            });
                          },
                        ),
                        BuildDropDownWidget(
                          secilen: secilenHedef,
                          veri: ['Kilomu Korumak', 'Kilo Almak', 'Kilo Vermek'],
                          islem: (String? newValue) {
                            setState(() {
                              secilenHedef = newValue!;
                              globals.secilenHedef = newValue;
                              print(globals.secilenHedef);
                            });
                          },
                        ),
                        build_button_widget(
                            context: context,
                            str: "Kayıt Ol",
                            islem: () {
                              (_cinsiyet.index == 0)
                                  ? globals.cinsiyet = false
                                  : globals.cinsiyet = true;

                              globals.kullaniciAdi = kullaniciAdi.text;
                              globals.sifre = sifre.text;
                              globals.ad = ad.text;
                              globals.yas = int.parse(yas.text);
                              globals.boy = int.parse(boy.text);
                              globals.agirlik = double.parse(kilo.text);

                              globals.hesapla();

                              Navigator.pop(context);
                            }),
                      ],
                    ),
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
