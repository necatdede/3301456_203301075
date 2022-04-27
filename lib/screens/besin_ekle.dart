import 'package:diyetlendin/controllers/veri_controller.dart';
import 'package:diyetlendin/main.dart';
import 'package:diyetlendin/widgets/build_textfield_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:line_icons/line_icons.dart';

import '../besinler.dart';
import '../models/hesap.dart';
import '../models/veri.dart';
import '../widgets/build_besin_widget.dart';

class BesinEkle extends StatefulWidget {
  const BesinEkle({Key? key}) : super(key: key);

  @override
  _BesinEkleState createState() => _BesinEkleState();
}

class _BesinEkleState extends State<BesinEkle> {
  final c = Get.put(VeriController());
  final besinArama = TextEditingController();
  final besinGram = TextEditingController();

  Future<void> hareketKontrol(
      VeriModel model, int besinId, String ogun, num besinGram) async {
    bool sonuc = await c.tarihVeri(besinId);
    FocusScope.of(context).unfocus();
    if (sonuc) {
      await c.guncelleVeri(model);
      Get.snackbar(
          c.ogun.value,
          model.besinGram.toString() +
              " gram " +
              Besinler().besinler[model.besinId!].besinAd +
              " güncellendi.",
          backgroundColor: MyApp().textfieldColor,
          snackPosition: SnackPosition.BOTTOM);
    } else {
      await c.ekleVeri(model);
      Get.snackbar(
          c.ogun.value,
          model.besinGram.toString() +
              " gram " +
              Besinler().besinler[model.besinId!].besinAd +
              " eklendi.",
          backgroundColor: MyApp().textfieldColor,
          snackPosition: SnackPosition.BOTTOM);
    }
  }

  Future<void> hesapKontrol(
      HesapModel hesap, int besinId, String ogun, num besinGram) async {
    bool sonuc = await c.tarihVeriHesap();
    FocusScope.of(context).unfocus();
    if (sonuc) {
      c.guncelleHesap(hesap, true);
    } else {
      await c.hesapEkle(hesap);
    }
  }

  @override
  Widget build(BuildContext context) {
    MediaQueryData queryData;
    queryData = MediaQuery.of(context);
    var queryHeight = queryData.size.height;
    var queryWidth = queryData.size.width;

    return Scaffold(
      backgroundColor: const MyApp().bgColor,
      appBar: AppBar(
        title: Text(c.ogun.value),
        actions: [
          IconButton(
              onPressed: () {
                c.temizle();
              },
              icon: const Icon(
                LineIcons.removeFormat,
                size: 40,
              )),
          IconButton(
              onPressed: () {
                c.kapat();
              },
              icon: const Icon(
                LineIcons.windowClose,
                size: 40,
              )),
          Padding(
            padding: const EdgeInsets.only(right: 16.0),
            child: IconButton(
                onPressed: () {
                  Navigator.pushNamed(context, "/routeEklenenBesinler");
                },
                icon: const Icon(
                  LineIcons.shoppingBasket,
                  size: 40,
                )),
          ),
        ],
      ),
      body: SizedBox(
        height: queryHeight,
        width: queryWidth,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            BuildTextFieldWidget(
              kontrol: false,
              control: besinArama,
              icon: Icons.search,
              klavyetur: TextInputType.text,
              str: "Besin Arama",
            ),
            Expanded(
              child: ListView.builder(
                  physics: const BouncingScrollPhysics(),
                  scrollDirection: Axis.vertical,
                  itemCount: Besinler().besinler.length,
                  itemBuilder: (context, index) {
                    return BuildBesinWidget(
                      tiklama: () {
                        VeriModel veri = VeriModel(
                            besinId: index,
                            besinGram: num.parse(besinGram.text),
                            ogun: c.ogun.value,
                            tarih: c.tarih.value);
                        num gram = num.parse(besinGram.text);
                        num kalori =
                            (gram / 100 * Besinler().besinler[index].kalori);
                        num karbonhidrat = (gram /
                            100 *
                            Besinler().besinler[index].karbonhidrat);
                        num protein =
                            (gram / 100 * Besinler().besinler[index].protein);
                        num yag = (gram / 100 * Besinler().besinler[index].yag);

                        HesapModel hesap = HesapModel(
                            kalori: kalori,
                            karbonhidrat: karbonhidrat,
                            protein: protein,
                            yag: yag,
                            ogun: c.ogun.value,
                            tarih: c.tarih.value);
                        hareketKontrol(veri, index, c.ogun.value,
                            num.parse(besinGram.text));
                        hesapKontrol(hesap, index, c.ogun.value, gram);
                        besinGram.clear();
                      },
                      kontrol: besinGram,
                      besinler: Besinler().besinler,
                      index: index,
                    );
                  }),
            ),
          ],
        ),
      ),
    );
  }
}
