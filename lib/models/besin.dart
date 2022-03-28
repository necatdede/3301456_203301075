class Besin {
  String _besinAd;
  int _kalori;
  double _karbonhidrat;
  double _protein;
  double _yag;
  String _besinFoto;

  Besin(this._besinAd, this._kalori, this._karbonhidrat, this._protein,
      this._yag, this._besinFoto);

  String get besinFoto => _besinFoto;

  double get yag => _yag;

  double get protein => _protein;

  double get karbonhidrat => _karbonhidrat;

  int get kalori => _kalori;

  String get besinAd => _besinAd;
}
