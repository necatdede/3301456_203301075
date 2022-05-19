class Besin {
  String? _besinAd;
  num? _kalori;
  num? _karbonhidrat;
  num? _protein;
  num? _yag;
  String? _besinUrl;

  Besin(
      {String? besinAd,
      int? kalori,
      double? karbonhidrat,
      double? protein,
      double? yag,
      String? besinPath}) {
    if (besinAd != null) {
      _besinAd = besinAd;
    }
    if (kalori != null) {
      _kalori = kalori;
    }
    if (karbonhidrat != null) {
      _karbonhidrat = karbonhidrat;
    }
    if (protein != null) {
      _protein = protein;
    }
    if (yag != null) {
      _yag = yag;
    }
    if (besinPath != null) {
      _besinUrl = besinPath;
    }
  }

  String? get besinAd => _besinAd;
  set besinAd(String? besinAd) => _besinAd = besinAd;

  num? get kalori => _kalori;
  set kalori(num? kalori) => _kalori = kalori;

  num? get karbonhidrat => _karbonhidrat;
  set karbonhidrat(num? karbonhidrat) => _karbonhidrat = karbonhidrat;

  num? get protein => _protein;
  set protein(num? protein) => _protein = protein;

  num? get yag => _yag;
  set yag(num? yag) => _yag = yag;

  String? get besinUrl => _besinUrl;
  set besinUrl(String? besinUrl) => _besinUrl = besinUrl;

  Besin.fromJson(Map<String, dynamic> json) {
    _besinAd = json['besinAd'];
    _kalori = json['kalori'];
    _karbonhidrat = json['karbonhidrat'];
    _protein = json['protein'];
    _yag = json['yag'];
    _besinUrl = json['besinUrl'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['besinAd'] = _besinAd;
    data['kalori'] = _kalori;
    data['karbonhidrat'] = _karbonhidrat;
    data['protein'] = _protein;
    data['yag'] = _yag;
    data['besinUrl'] = _besinUrl;
    return data;
  }
}
