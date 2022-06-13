import 'package:diyetlendin/controllers/firebase_controller.dart';
import 'package:diyetlendin/controllers/veri_controller.dart';
import 'package:diyetlendin/my_theme.dart';
import 'package:diyetlendin/screens/profil.dart';
import 'package:diyetlendin/services/firebase_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../widgets/kalori_detay_getir.dart';
import '../widgets/kalori_sayac_getir.dart';
import '../widgets/ogun_getir.dart';

class AnaSayfa extends StatefulWidget {
  const AnaSayfa({Key? key}) : super(key: key);

  @override
  State<AnaSayfa> createState() => _AnaSayfaState();
}

class _AnaSayfaState extends State<AnaSayfa> {
  FirebaseService service = FirebaseService();
  final c = Get.put(VeriController());
  final c2 = Get.put(FirebaseController());

  @override
  void initState() {
    super.initState();
    c2.getirKullanici();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(
        () => SizedBox(
          width: Get.width,
          child: Padding(
            padding: EdgeInsets.only(right: 8.0.r, left: 8.0.r, top: 8.r),
            child: (c2.imageUrl.value == "" ||
                    c2.kullanici.value.ad == null ||
                    c2.kullanici.value.gunlukKalori == null)
                ? _waitingWidget
                : Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Flexible(
                        flex: 1,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              flex: 4,
                              child: Text(
                                "Hoşgeldin,${c2.kullanici.value.ad}",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 20.sp,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            Expanded(
                              flex: 1,
                              child: Container(
                                  child: InkWell(
                                    onTap: () {
                                      var alert = const AlertDialog(
                                        backgroundColor: bgColor,
                                        content: Profil(),
                                      );
                                      showDialog(
                                          context: context,
                                          builder: (BuildContext context) =>
                                              alert);
                                    },
                                  ),
                                  width: 70.w,
                                  height: 70.h,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    image: DecorationImage(
                                        fit: BoxFit.fill,
                                        image: NetworkImage(c2.imageUrl.value)),
                                  )),
                            ),
                          ],
                        ),
                      ),
                      const Flexible(flex: 3, child: KaloriSayacGetir()),
                      Flexible(
                        flex: 2,
                        child: Card(
                          elevation: 5,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                          color: Colors.white,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              KaloriDetayGetir(
                                  tur: "Karbonhidrat",
                                  degerYol: "assets/images/karbonhidrat.png",
                                  alinan: c.karbonhidrat.value,
                                  alinacak:
                                      c2.kullanici.value.gunlukKarbonhidrat!,
                                  renk: Colors.yellow.shade300,
                                  renk2: Colors.yellow,
                                  renk3: Colors.yellow.shade100),
                              KaloriDetayGetir(
                                  tur: "Protein",
                                  degerYol: "assets/images/protein.png",
                                  alinan: c.protein.value,
                                  alinacak: c2.kullanici.value.gunlukProtein!,
                                  renk: Colors.red.shade300,
                                  renk2: Colors.red,
                                  renk3: Colors.red.shade100),
                              KaloriDetayGetir(
                                  tur: "Yağ",
                                  degerYol: "assets/images/yag.png",
                                  alinan: c.yag.value,
                                  alinacak: c2.kullanici.value.gunlukYag!,
                                  renk: Colors.green.shade300,
                                  renk2: Colors.green,
                                  renk3: Colors.green.shade100),
                            ],
                          ),
                        ),
                      ),
                      Flexible(
                        flex: 3,
                        child: SingleChildScrollView(
                          physics: const BouncingScrollPhysics(),
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            children: [
                              OgunGetir(
                                kalori: c.kahvaltiKalori.value.toString(),
                                tur: "assets/images/breakfast.png",
                                renk: Colors.lightBlueAccent.shade200,
                                renk2: const Color(0xffcee1f4),
                                yazi: "Kahvaltı",
                                ontab: () {
                                  c2.getirBesin();
                                  c.ogunDegis("Kahvaltı");

                                  Navigator.pushNamed(
                                      context, "/routeBesinEkle");
                                },
                              ),
                              OgunGetir(
                                kalori: c.ogleKalori.value.toString(),
                                tur: "assets/images/lunch.png",
                                renk: Colors.pinkAccent.shade200,
                                renk2: const Color(0xfff9dbd2),
                                yazi: "Öğle Yemeği",
                                ontab: () {
                                  c.ogunDegis("Öğle Yemeği");

                                  Navigator.pushNamed(
                                      context, "/routeBesinEkle");
                                },
                              ),
                              OgunGetir(
                                kalori: c.aksamKalori.value.toString(),
                                tur: "assets/images/dinner.png",
                                renk: Colors.orangeAccent.shade200,
                                renk2: const Color(0xfffce0a2),
                                yazi: "Akşam Yemeği",
                                ontab: () {
                                  c.ogunDegis("Akşam Yemeği");

                                  Navigator.pushNamed(
                                      context, "/routeBesinEkle");
                                },
                              ),
                              OgunGetir(
                                kalori: c.atistirmaKalori.value.toString(),
                                tur: "assets/images/snack.png",
                                renk: Colors.lightGreenAccent.shade200,
                                renk2: const Color(0xffe6edb7),
                                yazi: "Atıştırma",
                                ontab: () {
                                  c.ogunDegis("Atıştırma");

                                  Navigator.pushNamed(
                                      context, "/routeBesinEkle");
                                },
                              ),
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

  Widget get _waitingWidget => const Center(child: CircularProgressIndicator());
}
