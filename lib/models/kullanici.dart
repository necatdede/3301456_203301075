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

  Kullanici({
    String? ad,
    int? boy,
    int? kilo,
    int? yas,
    int? gunlukKalori,
    int? gunlukKarbonhidrat,
    int? gunlukProtein,
    int? gunlukYag,
    bool? cinsiyet,
  }) {
    if (ad != null) {
      _ad = ad;
    }
    if (boy != null) {
      _boy = boy;
    }
    if (kilo != null) {
      _kilo = kilo;
    }
    if (yas != null) {
      _yas = yas;
    }
    if (gunlukKalori != null) {
      _gunlukKalori = gunlukKalori;
    }
    if (gunlukKarbonhidrat != null) {
      _gunlukKarbonhidrat = gunlukKarbonhidrat;
    }
    if (gunlukProtein != null) {
      _gunlukProtein = gunlukProtein;
    }
    if (gunlukYag != null) {
      _gunlukYag = gunlukYag;
    }
    if (cinsiyet != null) {
      _cinsiyet = cinsiyet;
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
    return data;
  }
}
