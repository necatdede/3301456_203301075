import 'package:diyetlendin/models/kullanici.dart';
import 'package:get/get.dart';

import '../services/firebase_service.dart';

class FirebaseController extends GetxController {
  final kullanici = Kullanici().obs;

  final gunlukKalori = 10.obs;

  final gunlukKarbonhidrat = 10.obs;

  final gunlukProtein = 10.obs;

  final gunlukYag = 10.obs;

  final secilenAktivite = "Az Hareketli".obs;
  final secilenHedef = "Kilomu Korumak".obs;

  var aktiviteSeviyesi = {
    "Az Hareketli": 1.2, // Anahtar: Değer
    "Orta Hareketli(Haftada 1-3 Egzersiz)": 1.375,
    "Çok Hareketli(Haftada 4-5 Egzersiz)": 1.465,
  };

  var hedef = {
    "Kilomu Korumak": 0, // Anahtar: Değer
    "Kilo Almak": 500,
    "Kilo Vermek": -500,
  };

  @override
  void onInit() {
    super.onInit();
    getirKullanici();
  }

  void hesapla(int yas, int boy, double kilo, bool cinsiyet) {
    (cinsiyet == false)
        ? gunlukKalori.value = ((10 * kilo + 6.25 * boy - 5 * yas - 161) *
                    (aktiviteSeviyesi[secilenAktivite.value]!) +
                hedef[secilenHedef.value]!)
            .toInt()
        : gunlukKalori.value = ((10 * kilo + 6.25 * boy - 5 * yas + 5) *
                    (aktiviteSeviyesi[secilenAktivite.value]!) +
                hedef[secilenHedef.value]!)
            .toInt();

    gunlukKarbonhidrat.value = (gunlukKalori * 0.5 / 4).toInt();
    gunlukProtein.value = (gunlukKalori * 0.2 / 4).toInt();
    gunlukYag.value = (gunlukKalori * 0.3 / 9).toInt();
  }

  Future<void> getirKullanici() async {
    kullanici.value = await Get.find<FirebaseService>().getUser();
  }
}
