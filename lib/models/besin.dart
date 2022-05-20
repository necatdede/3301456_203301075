class Besin {
  int? _besinId;
  String? _besinAd;
  int? _kategoriId;
  num? _kalori;
  num? _karbonhidrat;
  num? _protein;
  num? _yag;
  String? _besinUrl;

  Besin(
      {int? besinId,
      String? besinAd,
      int? kategoriId,
      int? kalori,
      double? karbonhidrat,
      double? protein,
      double? yag,
      String? besinUrl}) {
    if (besinId != null) {
      _besinId = besinId;
    }
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
    if (besinUrl != null) {
      _besinUrl = besinUrl;
    }
  }

  int? get besinId => _besinId;
  set besinId(int? besinId) => _besinId = besinId;
  String? get besinAd => _besinAd;
  set besinAd(String? besinAd) => _besinAd = besinAd;

  int? get kategoriId => _kategoriId;
  set kategoriId(int? kategoriId) => _kategoriId = kategoriId;

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
    _besinId = json['besinId'];
    _besinAd = json['besinAd'];
    _kategoriId = json['kategoriId'];
    _kalori = json['kalori'];
    _karbonhidrat = json['karbonhidrat'];
    _protein = json['protein'];
    _yag = json['yag'];
    _besinUrl = json['besinUrl'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['besinId'] = _besinId;
    data['besinAd'] = _besinAd;
    data['kategoriId'] = _kategoriId;
    data['kalori'] = _kalori;
    data['karbonhidrat'] = _karbonhidrat;
    data['protein'] = _protein;
    data['yag'] = _yag;
    data['besinUrl'] = _besinUrl;
    return data;
  }
}
