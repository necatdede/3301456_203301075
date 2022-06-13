import 'package:diyetlendin/my_theme.dart';
import 'package:diyetlendin/screens/acilis.dart';
import 'package:diyetlendin/screens/anasayfa.dart';
import 'package:diyetlendin/screens/ayarlar.dart';
import 'package:diyetlendin/screens/besin_detay.dart';
import 'package:diyetlendin/screens/besin_ekle.dart';
import 'package:diyetlendin/screens/bize_ulasin.dart';
import 'package:diyetlendin/screens/cerceve.dart';
import 'package:diyetlendin/screens/eklenen_besinler.dart';
import 'package:diyetlendin/screens/giris_yap.dart';
import 'package:diyetlendin/screens/gizlilik_kosullar.dart';
import 'package:diyetlendin/screens/hakkimizda.dart';
import 'package:diyetlendin/screens/icerik.dart';
import 'package:diyetlendin/screens/icerikler.dart';
import 'package:diyetlendin/screens/iletisim_tercihleri.dart';
import 'package:diyetlendin/screens/kayit_ol.dart';
import 'package:diyetlendin/screens/kaynaklar.dart';
import 'package:diyetlendin/screens/kesfet.dart';
import 'package:diyetlendin/screens/paylasim_yap.dart';
import 'package:diyetlendin/screens/sss.dart';
import 'package:diyetlendin/services/firebase_service.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'functions/veri_islem.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  final db = await VeriIslem.ac();

  Get.put(db);
  Get.put(FirebaseService());

  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(builder: (context) {
      return GetMaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: "/",
        routes: {
          "/": (context) => const Acilis(),
          "/routeGirisYap": (context) => const GirisYap(),
          "/routeKayitOl": (context) => const KayitOl(),
          "/routeAnaSayfa": (context) => const AnaSayfa(),
          "/routeAyarlar": (context) => const Ayarlar(),
          "/routeCerceve": (context) => const Cerceve(),
          "/routeBesinEkle": (context) => const BesinEkle(),
          "/routeBesinDetay": (context) => const BesinDetay(),
          "/routeEklenenBesinler": (context) => const EklenenBesinler(),
          "/routeIcerik": (context) => const Icerik(),
          "/routeIcerikler": (context) => const Icerikler(),
          "/routeKesfet": (context) => const Kesfet(),
          "/routePaylasimYap": (context) => const PaylasimYap(),
          "/routeHakkimizda": (context) => const Hakkimizda(),
          "/routeGizlilikKosullar": (context) => const GizlilikKosullar(),
          "/routeSSS": (context) => const SSS(),
          "/routeBizeUlasin": (context) => BizeUlasin(),
          "/routeKaynaklar": (context) => const Kaynaklar(),
          "/routeIletisimTercihleri": (context) => IletisimTercihleri(),
        },
        title: 'Diyetlendin',
        theme: myTheme,
      );
    });
  }
}
