library diyetlendin.globals;

import 'models/kullanici.dart';

late Kullanici kullanici;

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

String secilenAktivite = "";
double gunlukAlinacakKalori = 1;
String secilenHedef = "";
double alinanKalori = 300;

double alinacakKarbonhidrat = 1;
double alinanKarbonhidrat = 5;

double alinacakProtein = 1;
double alinanProtein = 5;

double alinacakYag = 1;
double alinanYag = 5;

void hesapla() {
  (kullanici.cinsiyet == false)
      ? gunlukAlinacakKalori = (10 * kullanici.kilo +
                  6.25 * kullanici.boy -
                  5 * kullanici.yas -
                  161) *
              (aktiviteSeviyesi[secilenAktivite]!) +
          hedef[secilenHedef]!
      : gunlukAlinacakKalori = ((10 * kullanici.kilo +
                  6.25 * kullanici.boy -
                  5 * kullanici.yas +
                  5) *
              (aktiviteSeviyesi[secilenAktivite])! +
          hedef[secilenHedef]!);

  alinacakKarbonhidrat = gunlukAlinacakKalori * 0.5 / 4;
  alinacakProtein = gunlukAlinacakKalori * 0.2 / 4;
  alinacakYag = gunlukAlinacakKalori * 0.3 / 9;
}
