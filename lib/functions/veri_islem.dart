import 'dart:async';

import 'package:diyetlendin/models/hesap.dart';
import 'package:diyetlendin/models/veri.dart';
import 'package:sqflite/sqflite.dart';

import '../models/rapor.dart';

class VeriIslem {
  static Future<VeriIslem> ac() async {
    final db = VeriIslem();
    await db._ac();
    return db;
  }

  final String _userDatabaseName = "diyetlendinData";
  late final Database database;
  final int _version = 1;

  Future<void> _ac() async {
    database = await openDatabase(_userDatabaseName, version: _version,
        onCreate: (db, version) {
      hareketOlustur(db);
      hesapOlustur(db);
    });
  }

  Future<void> hareketOlustur(Database db) async {
    await db.execute(
        'CREATE TABLE hareket ( id INTEGER PRIMARY KEY AUTOINCREMENT, besinId INTEGER,besinGram INTEGER,ogun Text,tarih Text)');
  }

  Future<void> hesapOlustur(Database db) async {
    await db.execute(
        'CREATE TABLE hesap ( id INTEGER PRIMARY KEY AUTOINCREMENT, kalori INTEGER,karbonhidrat INTEGER,protein INTEGER,yag INTEGER,ogun Text,tarih Text)');
  }

  Future<List<VeriModel>> getir(String tarih, String ogun) async {
    var select = await database.query("hareket",
        where: 'tarih=? and ogun=?', whereArgs: [tarih, ogun]);
    return select.map((e) => VeriModel.fromJson(e)).toList();
  }

  Future<List<Map<String, dynamic>>> hepsiniGetir() async {
    var select = await database.query("hareket");
    return select;
  }

  Future<bool> getirTarih(String tarih, int besinId, String ogun) async {
    bool sonuc;
    final dataMaps = await database.query("hareket",
        where: 'tarih=? and besinId=? and ogun=?',
        whereArgs: [tarih, besinId, ogun]);
    (dataMaps.isNotEmpty) ? sonuc = true : sonuc = false;
    return sonuc;
  }

  Future<bool> getirTarihHesap(String tarih, String ogun) async {
    bool sonuc;
    final dataMaps = await database
        .query("hesap", where: 'tarih=? and ogun=?', whereArgs: [tarih, ogun]);
    (dataMaps.isNotEmpty) ? sonuc = true : sonuc = false;
    return sonuc;
  }

  Future<void> ekle(VeriModel model) async {
    await database.insert("hareket", model.toJson());
  }

  Future<void> ekleHesap(HesapModel hesap) async {
    await database.insert("hesap", hesap.toJson());
  }

  Future<List<HesapModel>> getirHesap(String tarih) async {
    var select = await database.query("hesap",
        where: 'tarih=?', whereArgs: [tarih], orderBy: 'ogun');
    return select.map((e) => HesapModel.fromJson(e)).toList();
  }

  Future<List<RaporModel>> getirRapor() async {
    var select = await database.rawQuery(
        "select tarih,sum(kalori) as kalori from hesap GROUP by tarih order by tarih desc limit 7");
    var sonuc = select.map((e) => RaporModel.fromJson(e)).toList();
    return sonuc;
  }

  Future<int> getirKarbonhidrat(String tarih) async {
    var select = await database.rawQuery(
        "Select sum(karbonhidrat) as karbonhidrat FROM hesap WHERE tarih='$tarih'");
    var sonuc = select.map((e) => HesapModel.fromJson(e)).toList();
    return (sonuc.isNotEmpty && sonuc[0].karbonhidrat != null)
        ? sonuc[0].karbonhidrat!.toInt()
        : 0;
  }

  Future<int> getirProtein(String tarih) async {
    var select = await database.rawQuery(
        "Select sum(protein) as protein FROM hesap WHERE tarih='$tarih'");
    var sonuc = select.map((e) => HesapModel.fromJson(e)).toList();
    return (sonuc.isNotEmpty && sonuc[0].protein != null)
        ? sonuc[0].protein!.toInt()
        : 0;
  }

  Future<int> getirYag(String tarih) async {
    var select = await database
        .rawQuery("Select sum(yag) as yag FROM hesap WHERE tarih='$tarih'");
    var sonuc = select.map((e) => HesapModel.fromJson(e)).toList();
    return (sonuc.isNotEmpty && sonuc[0].yag != null)
        ? sonuc[0].yag!.toInt()
        : 0;
  }

  Future<int> getirKalori(String tarih, String ogun) async {
    var select = await database
        .query("hesap", where: 'tarih=? and ogun=?', whereArgs: [tarih, ogun]);
    var sonuc = select.map((e) => HesapModel.fromJson(e)).toList();
    return (sonuc.isNotEmpty && sonuc[0].kalori != null)
        ? sonuc[0].kalori!.toInt()
        : 0;
  }

  Future<void> sil(String tarih, int besinId, String ogun) async {
    await database.execute(
        "DELETE FROM hareket WHERE ogun='$ogun' and besinId=$besinId and tarih='$tarih'");
  }

  Future<void> temizleHareket() async {
    await database.execute("DELETE FROM hareket");
  }

  Future<void> temizleHesap() async {
    await database.execute("DELETE FROM hesap");
  }

  Future<void> guncelleHareket(
    bool islem,
    String tarih,
    int besinId,
    String ogun,
    num besinGram,
  ) async {
    (islem)
        ? await database.execute(
            "update hareket set besinGram=besinGram+$besinGram where besinId=$besinId and ogun='$ogun' and tarih='$tarih'")
        : await database.execute(
            "update hareket set besinGram=besinGram-$besinGram where besinId=$besinId and ogun='$ogun' and tarih='$tarih' and besinGram>=$besinGram");
  }

  Future<void> guncelleHesap(
    bool islem,
    String tarih,
    String ogun,
    num kalori,
    num karbonhidrat,
    num protein,
    num yag,
  ) async {
    (islem)
        ? await database.execute(
            "update hesap set kalori=kalori+$kalori,karbonhidrat=karbonhidrat+$karbonhidrat,protein=protein+$protein,yag=yag+$yag where ogun='$ogun' and tarih='$tarih'")
        : await database.execute(
            "update hesap set kalori=kalori-$kalori,karbonhidrat=karbonhidrat-$karbonhidrat,protein=protein-$protein,yag=yag-$yag where ogun='$ogun' and tarih='$tarih' and kalori>=$kalori");
  }

  Future<void> kapat() async {
    await database.close();
  }
}
