library diyetlendin.globals;

import 'widgets/besin_widget.dart';
String resimUrl="https://l24.im/CIT";
String kullaniciAdi = "";
String sifre="";
String ad = "";
bool cinsiyet = true;
double agirlik = 0;
int boy = 0;
int yas = 0;
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
double gunlukAlinacakKalori = 3000;
String secilenHedef="";
double alinanKalori=300;


double alinacakKarbonhidrat=300;
double alinanKarbonhidrat=50;

double alinacakProtein=300;
double alinanProtein=45;

double alinacakYag=300;
double alinanYag=67;

void hesapla() {
  (cinsiyet == false)
      ? gunlukAlinacakKalori = (10 * agirlik + 6.25 * boy - 5 * yas - 161)*(aktiviteSeviyesi[secilenAktivite]!)+hedef[secilenHedef]!
      : gunlukAlinacakKalori = ((10 * agirlik + 6.25 * boy - 5 * yas + 5)*(aktiviteSeviyesi[secilenAktivite])!+hedef[secilenHedef]!);

    alinacakKarbonhidrat=gunlukAlinacakKalori*0.5/4;
    alinacakProtein=gunlukAlinacakKalori*0.2/4;
    alinacakYag=gunlukAlinacakKalori*0.3/9;
}

List urunler = [
  BesinWidget("Muz", 89, 22.84, 1.09, 0.33, "https://l24.im/ckpeG0"),
  BesinWidget("Çilek", 32, 7.68, 0.67, 0.3, "https://l24.im/efWC"),
  BesinWidget("Yulaf", 351, 57.25, 11.35, 5.8, "https://l24.im/QLewxf"),
  BesinWidget("Ekmek", 238, 43.91, 10.66, 2.15, "https://l24.im/NRUvAO"),
  BesinWidget("Çikolata", 528, 57.9, 4.4, 35.1, "https://l24.im/jGiHt2"),
  BesinWidget("Cips", 532, 7.75, 0.91, 55.39, "https://l24.im/f8GP"),
  BesinWidget("Peynir", 310, 2.53, 20.38, 24.31, "https://l24.im/ZR7u")];

 List yenmisler = [
];