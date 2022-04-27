class HesapModel {
  int? id;
  num? kalori;
  num? karbonhidrat;
  num? protein;
  num? yag;
  String? ogun;
  String? tarih;

  HesapModel(
      {this.id,
      this.kalori,
      this.karbonhidrat,
      this.protein,
      this.yag,
      this.ogun,
      this.tarih});

  HesapModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    kalori = json['kalori'];
    karbonhidrat = json['karbonhidrat'];
    protein = json['protein'];
    yag = json['yag'];
    ogun = json['ogun'];
    tarih = json['tarih'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['kalori'] = kalori;
    data['karbonhidrat'] = karbonhidrat;
    data['protein'] = protein;
    data['yag'] = yag;
    data['ogun'] = ogun;
    data['tarih'] = tarih;
    return data;
  }
}
