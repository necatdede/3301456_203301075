class VeriModel {
  int? id;
  int? besinId;
  num? besinGram;
  String? ogun;
  String? tarih;

  VeriModel({this.id, this.besinId, this.besinGram, this.ogun, this.tarih});

  VeriModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    besinId = json['besinId'];
    besinGram = json['besinGram'];
    ogun = json['ogun'];
    tarih = json['tarih'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['besinId'] = besinId;
    data['besinGram'] = besinGram;
    data['ogun'] = ogun;
    data['tarih'] = tarih;
    return data;
  }
}
