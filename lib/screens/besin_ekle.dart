import 'package:diyetlendin/controllers/firebase_controller.dart';
import 'package:diyetlendin/controllers/veri_controller.dart';
import 'package:diyetlendin/models/besin.dart';
import 'package:diyetlendin/widgets/build_textfield_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:line_icons/line_icons.dart';

import '../models/hesap.dart';
import '../models/veri.dart';
import '../widgets/build_besin_widget.dart';
import '../widgets/build_dialog_snackbar.dart';

class BesinEkle extends StatefulWidget {
  const BesinEkle({Key? key}) : super(key: key);

  @override
  _BesinEkleState createState() => _BesinEkleState();
}

class _BesinEkleState extends State<BesinEkle> {
  final c = Get.put(VeriController());
  final fController = Get.put(FirebaseController());
  final besinArama = TextEditingController();
  final besinGram = TextEditingController();

  List<Besin> arananBesin = [];
  List<Besin> aranacakBesin = [];

  @override
  void initState() {
    super.initState();

    setState(() {
      filtrele(0);
    });
  }

  onSearch(String search) {
    setState(() {
      arananBesin = aranacakBesin
          .where((besinler) =>
              besinler.besinAd.toString().toLowerCase().contains(search))
          .toList();
    });
  }

  filtrele(int kategoriId) {
    arananBesin.clear();
    setState(() {
      for (int i = 0; i < fController.besinler.length; i++) {
        if (fController.besinler[i].kategoriId == kategoriId) {
          arananBesin.add(fController.besinler[i]);
        }
      }
    });
    aranacakBesin = arananBesin;
  }

  Future<void> hareketKontrol(
      VeriModel model, int besinId, String ogun, num besinGram) async {
    bool sonuc = await c.tarihVeri(besinId);
    FocusScope.of(context).unfocus();
    if (sonuc) {
      await c.guncelleVeri(besinId, true, besinGram.toInt());
    } else {
      await c.ekleVeri(model);
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

  TabBar get tabBar => TabBar(
        unselectedLabelColor: Colors.white,
        physics: const BouncingScrollPhysics(),
        onTap: (index) {
          filtrele(index);
        },
        isScrollable: true,
        indicatorColor: Colors.white,
        indicatorWeight: 3,
        labelColor: Colors.white,
        tabs: const [
          Tab(text: "Et, Tavuk & Balık"),
          Tab(text: "Su & İçecek"),
          Tab(text: "Meyve & Sebze"),
          Tab(text: "Temel Gıda"),
          Tab(text: "Süt Ürünleri"),
          Tab(text: "Kahvaltılık"),
          Tab(text: "Atıştırmalık"),
        ],
      );

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 7,
      child: Scaffold(
        appBar: AppBar(
          bottom: PreferredSize(
            preferredSize: tabBar.preferredSize,
            child: ColoredBox(
              color: const Color(0xff70D188),
              child: tabBar,
            ),
          ),
          title: Text(c.ogun.value),
          actions: [
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
          height: Get.height,
          width: Get.width,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              BuildTextFieldWidget(
                onChanged: (value) => onSearch(value),
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
                    itemCount: arananBesin.length,
                    itemBuilder: (context, index) {
                      return BuildBesinWidget(
                        tiklama: () {
                          buildDialog(arananBesin[index].besinAd.toString(),
                              () {
                            VeriModel veri = VeriModel(
                                besinId: arananBesin[index].besinId!,
                                besinGram: num.parse(besinGram.text),
                                ogun: c.ogun.value,
                                tarih: c.tarih.value);
                            num gram = num.parse(besinGram.text);
                            num kalori =
                                (gram / 100 * arananBesin[index].kalori!);
                            num karbonhidrat =
                                (gram / 100 * arananBesin[index].karbonhidrat!);
                            num protein =
                                (gram / 100 * arananBesin[index].protein!);
                            num yag = (gram / 100 * arananBesin[index].yag!);

                            HesapModel hesap = HesapModel(
                                kalori: kalori,
                                karbonhidrat: karbonhidrat,
                                protein: protein,
                                yag: yag,
                                ogun: c.ogun.value,
                                tarih: c.tarih.value);

                            hareketKontrol(veri, arananBesin[index].besinId!,
                                c.ogun.value, num.parse(besinGram.text));
                            hesapKontrol(hesap, arananBesin[index].besinId!,
                                c.ogun.value, gram);

                            Get.back();
                            buildSnackBar(
                                c.ogun.value,
                                besinGram.text.toString() +
                                    " gram " +
                                    arananBesin[index].besinAd! +
                                    " eklendi.",
                                SnackPosition.BOTTOM);
                            besinGram.clear();
                          },
                              BuildTextFieldWidget(
                                str: "Gram",
                                icon: LineIcons.weight,
                                control: besinGram,
                                klavyetur: TextInputType.number,
                              ));
                        },
                        kontrol: besinGram,
                        besinler: arananBesin,
                        index: index,
                      );
                    }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
