import 'package:diyetlendin/main.dart';
import 'package:diyetlendin/models/kullanici.dart';
import 'package:diyetlendin/services/firebase_service.dart';
import 'package:diyetlendin/widgets/build_button_widget.dart';
import 'package:diyetlendin/widgets/build_textfield_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:line_icons/line_icons.dart';

import '../controllers/firebase_controller.dart';
import '../widgets/build_dropdown_widget.dart';

enum Cinsiyet { Kadin, Erkek } //enum önceden belirlenmiş sabit veriler

class KayitOl extends StatefulWidget {
  const KayitOl({Key? key}) : super(key: key);

  @override
  State<KayitOl> createState() => _KayitOl();
}

class _KayitOl extends State<KayitOl> {
  FirebaseService service = FirebaseService();
  final c = Get.put(FirebaseController());
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
    // TODO: implement build
    return Scaffold(
      backgroundColor: const MyApp().bgColor,
      body: Center(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: SizedBox(
            width: MediaQuery.of(context).size.width,
            child: Column(
              children: [
                Image.asset(
                  "images/logo.png",
                  width: 300.w,
                  height: 300.h,
                ),
                SizedBox(
                  width: 300.w,
                  child: Card(
                    shape: const RoundedRectangleBorder(
                      borderRadius:
                          BorderRadius.vertical(top: Radius.circular(50)),
                    ),
                    color: Colors.white,
                    child: Padding(
                      padding: EdgeInsets.all(8.0.r),
                      child: Column(
                        children: [
                          Padding(
                            padding: EdgeInsets.all(8.0.r),
                            child: SizedBox(
                              width: MediaQuery.of(context).size.width,
                              child: Row(
                                children: [
                                  Flexible(
                                    child: Container(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(25),
                                        border: Border.all(
                                          color: MyApp().bgColor,
                                          width: 3,
                                        ),
                                      ),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Radio<Cinsiyet>(
                                            value: Cinsiyet.Kadin,
                                            groupValue: _cinsiyet,
                                            activeColor:
                                                const MyApp().textfieldColor,
                                            onChanged: (Cinsiyet? value) {
                                              setState(() {
                                                _cinsiyet = value!;
                                              });
                                            },
                                          ),
                                          Text(
                                            "Kadın",
                                            style: TextStyle(fontSize: 15.sp),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  Flexible(
                                    child: Container(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(25),
                                        border: Border.all(
                                          color: MyApp().bgColor,
                                          width: 3,
                                        ),
                                      ),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Radio<Cinsiyet>(
                                            activeColor:
                                                const MyApp().textfieldColor,
                                            value: Cinsiyet.Erkek,
                                            groupValue: _cinsiyet,
                                            onChanged: (Cinsiyet? value) {
                                              setState(() {
                                                _cinsiyet = value!;
                                              });
                                            },
                                          ),
                                          Text(
                                            "Erkek",
                                            style: TextStyle(fontSize: 15.sp),
                                          ),
                                        ],
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
                            str: "E-mail",
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
                                c.secilenAktivite.value = secilenAktivite;
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
                                c.secilenHedef.value = secilenHedef;
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
                                      c.hesapla(
                                          int.parse(yas.text),
                                          int.parse(boy.text),
                                          double.parse(kilo.text),
                                          _cinsiyet.index == 0 ? false : true);

                                      var user = Kullanici(
                                        gunlukKalori: c.gunlukKalori.value,
                                        gunlukKarbonhidrat:
                                            c.gunlukKarbonhidrat.value,
                                        gunlukProtein: c.gunlukProtein.value,
                                        gunlukYag: c.gunlukYag.value,
                                        resimUrl: "https://l24.im/CIT",
                                        ad: ad.text,
                                        yas: int.parse(yas.text),
                                        kilo: int.parse(kilo.text),
                                        boy: int.parse(boy.text),
                                        cinsiyet:
                                            _cinsiyet.index == 0 ? false : true,
                                      );

                                      service.createUser(
                                          kullaniciAdi.text, sifre.text, user);

                                      Get.snackbar(
                                        "Bilgi",
                                        "Kayıt Olundu",
                                        backgroundColor: MyApp().textfieldColor,
                                      );

                                      Navigator.pop(context);
                                    } catch (e) {
                                      print(e);
                                      Get.snackbar(
                                        "Hata",
                                        "Kayıt Olunamadı",
                                        backgroundColor: MyApp().textfieldColor,
                                      );
                                    }
                                  } else {
                                    Get.snackbar(
                                      "Hata",
                                      "Lütfen Geçerli Değerler Giriniz",
                                      backgroundColor: MyApp().textfieldColor,
                                    );
                                  }
                                } else {
                                  Get.snackbar(
                                    "Hata",
                                    "Boş Bırakılan Alanları Doldurunuz",
                                    backgroundColor: MyApp().textfieldColor,
                                  );
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
