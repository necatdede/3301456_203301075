library diyetlendin.globals;
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
