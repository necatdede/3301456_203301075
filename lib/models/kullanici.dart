class Kullanici {
  String? _ad;
  int? _boy;
  int? _kilo;
  int? _yas;
  int? _gunlukKalori;
  int? _gunlukKarbonhidrat;
  int? _gunlukProtein;
  int? _gunlukYag;
  bool? _cinsiyet;
  String? _resimUrl;

  Kullanici(
      {String? ad,
      int? boy,
      int? kilo,
      int? yas,
      int? gunlukKalori,
      int? gunlukKarbonhidrat,
      int? gunlukProtein,
      int? gunlukYag,
      bool? cinsiyet,
      String? resimUrl}) {
    if (ad != null) {
      this._ad = ad;
    }
    if (boy != null) {
      this._boy = boy;
    }
    if (kilo != null) {
      this._kilo = kilo;
    }
    if (yas != null) {
      this._yas = yas;
    }
    if (gunlukKalori != null) {
      this._gunlukKalori = gunlukKalori;
    }
    if (gunlukKarbonhidrat != null) {
      this._gunlukKarbonhidrat = gunlukKarbonhidrat;
    }
    if (gunlukProtein != null) {
      this._gunlukProtein = gunlukProtein;
    }
    if (gunlukYag != null) {
      this._gunlukYag = gunlukYag;
    }
    if (cinsiyet != null) {
      this._cinsiyet = cinsiyet;
    }
    if (resimUrl != null) {
      this._resimUrl = resimUrl;
    }
  }

  String? get ad => _ad;
  set ad(String? ad) => _ad = ad;
  int? get boy => _boy;
  set boy(int? boy) => _boy = boy;
  int? get kilo => _kilo;
  set kilo(int? kilo) => _kilo = kilo;
  int? get yas => _yas;
  set yas(int? yas) => _yas = yas;
  int? get gunlukKalori => _gunlukKalori;
  set gunlukKalori(int? gunlukKalori) => _gunlukKalori = gunlukKalori;
  int? get gunlukKarbonhidrat => _gunlukKarbonhidrat;
  set gunlukKarbonhidrat(int? gunlukKarbonhidrat) =>
      _gunlukKarbonhidrat = gunlukKarbonhidrat;
  int? get gunlukProtein => _gunlukProtein;
  set gunlukProtein(int? gunlukProtein) => _gunlukProtein = gunlukProtein;
  int? get gunlukYag => _gunlukYag;
  set gunlukYag(int? gunlukYag) => _gunlukYag = gunlukYag;
  bool? get cinsiyet => _cinsiyet;
  set cinsiyet(bool? cinsiyet) => _cinsiyet = cinsiyet;
  String? get resimUrl => _resimUrl;
  set resimUrl(String? resimUrl) => _resimUrl = resimUrl;

  Kullanici.fromJson(Map<String, dynamic> json) {
    _ad = json['ad'];
    _boy = json['boy'];
    _kilo = json['kilo'];
    _yas = json['yas'];
    _gunlukKalori = json['gunlukKalori'];
    _gunlukKarbonhidrat = json['gunlukKarbonhidrat'];
    _gunlukProtein = json['gunlukProtein'];
    _gunlukYag = json['gunlukYag'];
    _cinsiyet = json['cinsiyet'];
    _resimUrl = json['resimUrl'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['ad'] = _ad;
    data['boy'] = _boy;
    data['kilo'] = _kilo;
    data['yas'] = _yas;
    data['gunlukKalori'] = _gunlukKalori;
    data['gunlukKarbonhidrat'] = _gunlukKarbonhidrat;
    data['gunlukProtein'] = _gunlukProtein;
    data['gunlukYag'] = _gunlukYag;
    data['cinsiyet'] = _cinsiyet;
    data['resimUrl'] = _resimUrl;
    return data;
  }
}
