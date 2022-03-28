class Kullanici {
  String _resimUrl = "https://l24.im/CIT";
  String _kullaniciAdi;
  String _sifre;
  String _ad;
  bool _cinsiyet;
  double _kilo;
  int _boy;
  int _yas;

  Kullanici(this._resimUrl, this._kullaniciAdi, this._sifre, this._ad,
      this._cinsiyet, this._kilo, this._boy, this._yas);


  set resimUrl(String value) {
    _resimUrl = value;
  }

  int get yas => _yas;

  int get boy => _boy;

  double get kilo => _kilo;

  bool get cinsiyet => _cinsiyet;

  String get ad => _ad;

  String get sifre => _sifre;

  String get kullaniciAdi => _kullaniciAdi;

  String get resimUrl => _resimUrl;

  set kullaniciAdi(String value) {
    _kullaniciAdi = value;
  }

  set sifre(String value) {
    _sifre = value;
  }

  set ad(String value) {
    _ad = value;
  }

  set cinsiyet(bool value) {
    _cinsiyet = value;
  }

  set kilo(double value) {
    _kilo = value;
  }

  set boy(int value) {
    _boy = value;
  }

  set yas(int value) {
    _yas = value;
  }
}
