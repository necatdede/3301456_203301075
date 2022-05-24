class RaporModel {
  String? tarih;
  num? kalori;

  RaporModel({this.tarih, this.kalori});

  RaporModel.fromJson(Map<String, dynamic> json) {
    kalori = json['kalori'];
    tarih = json['tarih'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['kalori'] = kalori;
    data['tarih'] = tarih;
    return data;
  }
}
