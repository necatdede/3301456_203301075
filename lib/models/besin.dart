class Besin {
  final String _besinAd;
  final int _kalori;
  final double _karbonhidrat;
  final double _protein;
  final double _yag;
  final String _besinFoto;

  Besin(this._besinAd, this._kalori, this._karbonhidrat, this._protein,
      this._yag, this._besinFoto);

  String get besinFoto => _besinFoto;

  double get yag => _yag;

  double get protein => _protein;

  double get karbonhidrat => _karbonhidrat;

  int get kalori => _kalori;

  String get besinAd => _besinAd;
}
