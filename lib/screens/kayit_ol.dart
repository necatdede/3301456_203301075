import 'package:diyetlendin/models/kullanici.dart';
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

  bool kontrol() {
    bool kiloSonuc = false;
    bool boySonuc = false;
    bool yasSonuc = false;
    (int.parse(kilo.text) > 29 && (int.parse(kilo.text) < 201))
        ? kiloSonuc = true
        : kiloSonuc = false;
    (int.parse(boy.text) > 139 && (int.parse(boy.text) < 221))
        ? boySonuc = true
        : boySonuc = false;
    (int.parse(yas.text) > 17 && (int.parse(yas.text) < 101))
        ? yasSonuc = true
        : yasSonuc = false;

    return (kiloSonuc && boySonuc && yasSonuc) ? true : false;
  }

  bool bosKontrol() {
    bool sonuc = true;
    (ad.text.isEmpty ||
            kullaniciAdi.text.isEmpty ||
            sifre.text.isEmpty ||
            yas.text.isEmpty ||
            boy.text.isEmpty ||
            kilo.text.isEmpty)
        ? sonuc = false
        : sonuc = true;
    return sonuc;
  }

  Cinsiyet _cinsiyet = Cinsiyet.Kadin;
  String secilenAktivite = "Az Hareketli";

  String secilenHedef = "Kilomu Korumak";

  @override
  Widget build(BuildContext context) {
    globals.secilenAktivite = secilenAktivite;
    globals.secilenHedef = secilenHedef;
    // TODO: implement build
    return Scaffold(
      backgroundColor: const MyApp().bgColor,
      body: Center(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: SizedBox(
            width: MediaQuery.of(context).size.width,
            //height: MediaQuery.of(context).size.height,
            child: Column(
              children: [
                Image.asset(
                  "images/logo.png",
                  width: MediaQuery.of(context).size.width / 1.5,
                  height: MediaQuery.of(context).size.height / 1.5,
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.9,
                  child: Card(
                    shape: const RoundedRectangleBorder(
                      borderRadius:
                          BorderRadius.vertical(top: Radius.circular(50)),
                    ),
                    color: Colors.white,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: SizedBox(
                              width: MediaQuery.of(context).size.width,
                              child: Row(
                                children: [
                                  Flexible(
                                    child: ListTile(
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(30),
                                        side: BorderSide(
                                            color: const MyApp().bgColor, width: 3),
                                      ),
                                      title: const Text(
                                        "Kadın",
                                        style: TextStyle(fontSize: 20),
                                      ),
                                      leading: Radio<Cinsiyet>(
                                        value: Cinsiyet.Kadin,
                                        groupValue: _cinsiyet,
                                        activeColor: const MyApp().textfieldColor,
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
                                            color: const MyApp().bgColor, width: 3),
                                      ),
                                      title: const Text(
                                        "Erkek",
                                        style: TextStyle(fontSize: 20),
                                      ),
                                      leading: Radio<Cinsiyet>(
                                        activeColor: const MyApp().textfieldColor,
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
                          BuildTextFieldWidget(
                            control: ad,
                            str: "Ad Soyad",
                            icon: LineIcons.addressCard,
                            kontrol: false,
                            klavyetur: TextInputType.name,
                          ),
                          BuildTextFieldWidget(
                            control: kullaniciAdi,
                            str: "Kullanıcı Adı",
                            icon: LineIcons.user,
                            kontrol: false,
                            klavyetur: TextInputType.name,
                          ),
                          BuildTextFieldWidget(
                            control: sifre,
                            str: "Şifre",
                            icon: LineIcons.userLock,
                            kontrol: true,
                            klavyetur: TextInputType.name,
                          ),
                          BuildTextFieldWidget(
                              control: yas,
                              str: "Yaş (18-100)",
                              icon: LineIcons.birthdayCake,
                              kontrol: false,
                              klavyetur: TextInputType.number),
                          BuildTextFieldWidget(
                            control: boy,
                            str: "Boy (140-220)",
                            icon: LineIcons.ruler,
                            kontrol: false,
                            klavyetur: TextInputType.number,
                          ),
                          BuildTextFieldWidget(
                            control: kilo,
                            str: "Kilo (30-200)",
                            icon: LineIcons.weight,
                            kontrol: false,
                            klavyetur: TextInputType.number,
                          ),
                          BuildDropDownWidget(
                            secilen: secilenAktivite,
                            veri: const [
                              'Az Hareketli',
                              'Orta Hareketli(Haftada 1-3 Egzersiz)',
                              'Çok Hareketli(Haftada 4-5 Egzersiz)'
                            ],
                            islem: (String? newValue) {
                              setState(() {
                                secilenAktivite = newValue!;
                                globals.secilenAktivite = newValue;
                              });
                            },
                          ),
                          BuildDropDownWidget(
                            secilen: secilenHedef,
                            veri: const [
                              'Kilomu Korumak',
                              'Kilo Almak',
                              'Kilo Vermek'
                            ],
                            islem: (String? newValue) {
                              setState(() {
                                secilenHedef = newValue!;
                                globals.secilenHedef = newValue;
                              });
                            },
                          ),
                          BuildButtonWidget(
                              context: context,
                              str: "Kayıt Ol",
                              islem: () {
                                if (bosKontrol()) {
                                  if (kontrol()) {
                                    try {
                                      var user = Kullanici(
                                          "https://l24.im/CIT",
                                          kullaniciAdi.text,
                                          sifre.text,
                                          ad.text,
                                          _cinsiyet.index == 0 ? false : true,
                                          double.parse(kilo.text),
                                          int.parse(boy.text),
                                          int.parse(yas.text));

                                      globals.kullanici = user;

                                      globals.hesapla();

                                      const snackbar = SnackBar(
                                        content: Text("Kayıt Olundu!"),
                                      );
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(snackbar);

                                      Navigator.pop(context);
                                    } catch (e) {
                                      const snackbar = SnackBar(
                                        content: Text("Kayıt Olunamadı!"),
                                      );
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(snackbar);
                                    }
                                  } else {
                                    const snackbar = SnackBar(
                                      content: Text(
                                          "Lütfen Geçerli Değerler Giriniz!"),
                                    );
                                    ScaffoldMessenger.of(context)
                                        .showSnackBar(snackbar);
                                  }
                                } else {
                                  const snackbar = SnackBar(
                                    content: Text(
                                        "Boş Bırakılan Alanları Doldurunuz!"),
                                  );
                                  ScaffoldMessenger.of(context)
                                      .showSnackBar(snackbar);
                                }
                              }),
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
    );
  }
}
