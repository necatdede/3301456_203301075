import 'package:diyetlendin/controllers/firebase_controller.dart';
import 'package:diyetlendin/controllers/veri_controller.dart';
import 'package:diyetlendin/widgets/build_textfield_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:line_icons/line_icons.dart';

import '../widgets/build_ayarlar_widget.dart';
import '../widgets/build_dialog_snackbar.dart';

class Ayarlar extends StatefulWidget {
  const Ayarlar({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _Ayarlar();
  }
}

class _Ayarlar extends State<Ayarlar> {
  final firebaseControl = Get.put(FirebaseController());
  final veriControl = Get.put(VeriController());
  final boy = TextEditingController();
  final kilo = TextEditingController();

  @override
  Widget build(BuildContext context) {
    veriControl.sonGirisGetir();
    return Scaffold(
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: SizedBox(
          height: Get.height,
          child: Column(
            children: [
              BuildAyarlarWidget(
                yazi2: "",
                yazi: "Hakkımızda",
                icon: LineIcons.infoCircle,
                islem: () {
                  Navigator.pushNamed(context, "/routeHakkimizda");
                },
              ),
              BuildAyarlarWidget(
                yazi2: "",
                yazi: "Gizlilik ve Koşullar",
                icon: LineIcons.alternateShield,
                islem: () {
                  Navigator.pushNamed(context, "/routeGizlilikKosullar");
                },
              ),
              BuildAyarlarWidget(
                yazi2: "",
                yazi: "Sıkça Sorulan Sorular",
                icon: LineIcons.questionCircle,
                islem: () {
                  Navigator.pushNamed(context, "/routeSSS");
                },
              ),
              BuildAyarlarWidget(
                yazi2: "",
                yazi: "İletişim Tercihleri",
                icon: LineIcons.questionCircle,
                islem: () {
                  Navigator.pushNamed(context, "/routeIletisimTercihleri");
                },
              ),
              BuildAyarlarWidget(
                yazi2: firebaseControl.kullanici.value.boy.toString(),
                yazi: "Boy",
                icon: LineIcons.ruler,
                islem: () {
                  buildDialog("Boyunu Güncelle", () {
                    Get.back(closeOverlays: true);
                    buildSnackBar(
                        "Bilgi", "Boyunuz Güncellendi!", SnackPosition.BOTTOM);
                  },
                      Column(
                        children: [
                          BuildTextFieldWidget(
                              control: boy,
                              str: "Boy",
                              icon: LineIcons.ruler,
                              kontrol: false,
                              klavyetur: TextInputType.number),
                        ],
                      ));
                },
              ),
              BuildAyarlarWidget(
                yazi2: firebaseControl.kullanici.value.kilo.toString(),
                yazi: "Kilo",
                icon: LineIcons.weight,
                islem: () {
                  buildDialog("Kilonu Güncelle", () {
                    Get.back(closeOverlays: true);
                    buildSnackBar(
                        "Bilgi", "Kilonuz Güncellendi!", SnackPosition.BOTTOM);
                  },
                      Column(
                        children: [
                          BuildTextFieldWidget(
                              control: kilo,
                              str: "Kilo",
                              icon: LineIcons.weight,
                              kontrol: false,
                              klavyetur: TextInputType.number),
                        ],
                      ));
                },
              ),
              BuildAyarlarWidget(
                yazi2: "",
                yazi: "Bize Ulaşmak İçin",
                icon: LineIcons.comments,
                islem: () {
                  Navigator.pushNamed(context, "/routeBizeUlasin");
                },
              ),
              BuildAyarlarWidget(
                yazi2: "",
                yazi: "Kaynaklar",
                icon: LineIcons.file,
                islem: () {
                  Navigator.pushNamed(context, "/routeKaynaklar");
                },
              ),
              BuildAyarlarWidget(
                yazi2: "",
                yazi: "Tüm Verileri Sil",
                icon: LineIcons.trash,
                islem: () {
                  buildDialog("Uyarı", () {
                    veriControl.temizle();
                    Get.back(closeOverlays: true);
                    buildSnackBar(
                        "Bilgi", "Tüm veriler silindi.", SnackPosition.BOTTOM);
                  }, const Text("Tüm veriler silinsin mi?"));
                },
              ),
              Obx(
                () => BuildAyarlarWidget(
                  yazi2: veriControl.sonGiris.value,
                  yazi: "Son Giriş",
                  icon: LineIcons.history,
                  islem: () {},
                ),
              ),
              BuildAyarlarWidget(
                yazi2: "",
                yazi: "Çıkış",
                icon: LineIcons.doorOpen,
                islem: () {
                  firebaseControl.cikis();
                  Navigator.popAndPushNamed(context, "/");
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
