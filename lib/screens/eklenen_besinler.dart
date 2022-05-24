import 'package:diyetlendin/controllers/firebase_controller.dart';
import 'package:diyetlendin/controllers/veri_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:line_icons/line_icons.dart';

import '../models/hesap.dart';
import '../widgets/build_dialog_snackbar.dart';
import '../widgets/build_textfield_widget.dart';

class EklenenBesinler extends StatefulWidget {
  const EklenenBesinler({Key? key}) : super(key: key);

  @override
  _EklenenBesinlerState createState() => _EklenenBesinlerState();
}

class _EklenenBesinlerState extends State<EklenenBesinler> {
  final kontrol = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final c = Get.put(VeriController());
    final fController = Get.put(FirebaseController());
    final besinGram = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        title: const Text("Eklenenler"),
      ),
      body: Obx(
        () => (c.items.isEmpty)
            ? _notFoundWidget
            : ListView.builder(
                physics: const BouncingScrollPhysics(),
                scrollDirection: Axis.vertical,
                itemCount: c.items.length,
                itemBuilder: (context, index) => InkWell(
                      borderRadius: BorderRadius.circular(25),
                      onTap: () {},
                      child: Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                        color: Colors.white,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Flexible(
                              flex: 2,
                              child: Container(
                                height: 100.h,
                                decoration: BoxDecoration(
                                  borderRadius: const BorderRadius.only(
                                    bottomLeft: Radius.circular(30),
                                    topLeft: Radius.circular(30),
                                  ),
                                  image: DecorationImage(
                                    fit: BoxFit.fill,
                                    image: NetworkImage(
                                      fController
                                          .besinler[c.items[index].besinId!]
                                          .besinUrl
                                          .toString(),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Flexible(
                              flex: 2,
                              child: SizedBox(
                                height: 100.h,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      " " +
                                          fController
                                              .besinler[c.items[index].besinId!]
                                              .besinAd
                                              .toString(),
                                      style: TextStyle(
                                          fontSize: 18.sp,
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Text(
                                      " " +
                                          c.items[index].besinGram.toString() +
                                          " Gram",
                                      style: TextStyle(
                                          color: Colors.blue,
                                          fontSize: 18.sp,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Flexible(
                              flex: 1,
                              child: IconButton(
                                onPressed: () {
                                  buildDialog(
                                      fController
                                          .besinler[c.items[index].besinId!]
                                          .besinAd
                                          .toString(), () {
                                    c.guncelleVeri(c.items[index].besinId!,
                                        false, int.parse(besinGram.text));
                                    num gram =
                                        num.parse(besinGram.text.toString());
                                    num kalori = (gram /
                                        100 *
                                        fController
                                            .besinler[c.items[index].besinId!]
                                            .kalori!);
                                    num karbonhidrat = (gram /
                                        100 *
                                        fController
                                            .besinler[c.items[index].besinId!]
                                            .karbonhidrat!);
                                    num protein = (gram /
                                        100 *
                                        fController
                                            .besinler[c.items[index].besinId!]
                                            .protein!);
                                    num yag = (gram /
                                        100 *
                                        fController
                                            .besinler[c.items[index].besinId!]
                                            .yag!);

                                    HesapModel hesap = HesapModel(
                                        kalori: kalori,
                                        karbonhidrat: karbonhidrat,
                                        protein: protein,
                                        yag: yag,
                                        ogun: c.ogun.value,
                                        tarih: c.tarih.value);

                                    c.guncelleHesap(hesap, false);
                                    Get.back();
                                    buildSnackBar(
                                        c.ogun.value,
                                        besinGram.text.toString() +
                                            " gram " +
                                            fController
                                                .besinler[
                                                    c.items[index].besinId!]
                                                .besinAd
                                                .toString() +
                                            " silindi.",
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
                                icon: const Icon(LineIcons.minusCircle),
                                iconSize: 40.sp,
                              ),
                            ),
                          ],
                        ),
                      ),
                    )),
      ),
    );
  }

  Widget get _notFoundWidget => const Center(
        child: Text("Öğünün Boş"),
      );
}
