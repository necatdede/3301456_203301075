import 'package:diyetlendin/models/hesap.dart';
import 'package:diyetlendin/models/rapor.dart';
import 'package:get/get.dart';

import '../functions/veri_islem.dart';
import '../models/veri.dart';

class VeriController extends GetxController {
  final items = <VeriModel>[].obs;
  final hesapItems = <HesapModel>[].obs;

  final raporItems = <RaporModel>[].obs;

  final kahvaltiKalori = 0.obs;
  final ogleKalori = 0.obs;
  final aksamKalori = 0.obs;
  final atistirmaKalori = 0.obs;

  final karbonhidrat = 0.obs;
  final protein = 0.obs;
  final yag = 0.obs;

  int topla() {
    int sonuc = kahvaltiKalori.value +
        ogleKalori.value +
        aksamKalori.value +
        atistirmaKalori.value;
    return sonuc;
  }

  var tarih = DateTime.now().toString().substring(0, 10).obs;
  var ogun = "Kahvaltı".obs;

  void ogunDegis(String value) {
    ogun.value = value;
    secVeri();
    hesapGetir();
  }

  void tarihDegis(String value) {
    tarih.value = value;
    secVeri();
    hesapGetir();
    kaloriGetir();
    topla();
  }

  @override
  void onInit() {
    super.onInit();
    secVeri();
    hesapGetir();
    kaloriGetir();
    secRapor();
  }

  Future<void> secVeri() async {
    items.value = await Get.find<VeriIslem>().getir(tarih.value, ogun.value);
  }

  Future<void> secRapor() async {
    raporItems.value = await Get.find<VeriIslem>().getirRapor();
  }

  Future<void> ekleVeri(VeriModel model) async {
    await Get.find<VeriIslem>().ekle(model);
    secVeri();
  }

  Future<void> guncelleVeri(int besinId, bool islem, int besinGram) async {
    await Get.find<VeriIslem>()
        .guncelleHareket(islem, tarih.value, besinId, ogun.value, besinGram);
    secVeri();
  }

  Future<void> guncelleHesap(HesapModel hesap, bool islem) async {
    await Get.find<VeriIslem>().guncelleHesap(islem, tarih.value, ogun.value,
        hesap.kalori!, hesap.karbonhidrat!, hesap.protein!, hesap.yag!);
    hesapGetir();
    kaloriGetir();
    secRapor();
  }

  Future<bool> tarihVeri(int besinId) async {
    final sonuc = await Get.find<VeriIslem>()
        .getirTarih(tarih.value, besinId, ogun.value);
    return sonuc;
  }

  Future<bool> tarihVeriHesap() async {
    final sonuc =
        await Get.find<VeriIslem>().getirTarihHesap(tarih.value, ogun.value);
    return sonuc;
  }

  Future<void> hesapGetir() async {
    hesapItems.value = (await Get.find<VeriIslem>().getirHesap(tarih.value));
  }

  Future<void> kaloriGetir() async {
    kahvaltiKalori.value =
        await Get.find<VeriIslem>().getirKalori(tarih.value, "Kahvaltı");

    ogleKalori.value =
        await Get.find<VeriIslem>().getirKalori(tarih.value, "Öğle Yemeği");

    aksamKalori.value =
        await Get.find<VeriIslem>().getirKalori(tarih.value, "Akşam Yemeği");

    atistirmaKalori.value =
        await Get.find<VeriIslem>().getirKalori(tarih.value, "Atıştırma");

    //

    karbonhidrat.value =
        await Get.find<VeriIslem>().getirKarbonhidrat(tarih.value);

    protein.value = await Get.find<VeriIslem>().getirProtein(tarih.value);

    yag.value = await Get.find<VeriIslem>().getirYag(tarih.value);
  }

  Future<void> hesapEkle(HesapModel hesap) async {
    await Get.find<VeriIslem>().ekleHesap(hesap);
    hesapGetir();
    kaloriGetir();
    secRapor();
  }

  Future<void> besinSil(int id) async {
    await Get.find<VeriIslem>().sil(tarih.value, id, ogun.value);
    secVeri();
  }

  Future<void> kapat() async {
    await Get.find<VeriIslem>().kapat();
  }

  Future<void> temizle() async {
    await Get.find<VeriIslem>().temizleHareket();
    await Get.find<VeriIslem>().temizleHesap();
    secVeri();
    hesapGetir();
    kaloriGetir();
  }
}
