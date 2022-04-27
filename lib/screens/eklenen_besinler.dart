import 'package:diyetlendin/controllers/veri_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../besinler.dart';

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

    return Scaffold(
      appBar: AppBar(
        title: const Text("Eklenenler"),
      ),
      body: Obx(
        () => ListView.builder(
            physics: BouncingScrollPhysics(),
            scrollDirection: Axis.vertical,
            itemCount: c.items.length,
            itemBuilder: (context, index) => InkWell(
                  borderRadius: BorderRadius.circular(25),
                  onTap: () {
                    c.besinSil(c.items[index].besinId!);
                    //c.guncelleHesap(c.hesapItems[0], false);
                  },
                  child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    color: Colors.white,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          height: 100.h,
                          width: 100.h,
                          decoration: BoxDecoration(
                            borderRadius: const BorderRadius.only(
                              bottomLeft: Radius.circular(30),
                              topLeft: Radius.circular(30),
                            ),
                            image: DecorationImage(
                              image: NetworkImage(
                                Besinler()
                                    .besinler[c.items[index].besinId!]
                                    .besinFoto,
                              ),
                            ),
                          ),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              " " +
                                  Besinler()
                                      .besinler[c.items[index].besinId!]
                                      .besinAd,
                              style: TextStyle(
                                  fontSize: 25.sp,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold),
                            ),
                            Text(
                              " " +
                                  c.items[index].besinGram.toString() +
                                  " Gram",
                              style: TextStyle(
                                  color: Colors.blue,
                                  fontSize: 20.sp,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                )),
      ),
    );
  }

  Widget get _notFoundWidget => const Center(
        child: Text("Not Found"),
      );
  Widget get _waitingWidget => Center(child: CircularProgressIndicator());
}
