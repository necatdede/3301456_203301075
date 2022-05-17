import 'package:diyetlendin/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../models/besin.dart';

class BesinDetay extends StatelessWidget {
  const BesinDetay({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Besin besin = ModalRoute.of(context)?.settings.arguments as Besin;

    return Scaffold(
      appBar: AppBar(
        title: Text(besin.besinAd),
      ),
      body: Container(
        width: Get.width,
        height: Get.height,
        color: const MyApp().bgColor,
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(16.r),
            child: Column(
              children: [
                Container(
                    width: 200.w,
                    height: 200.h,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                          fit: BoxFit.contain,
                          image: NetworkImage(besin.besinFoto)),
                    )),
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      buildBesinDetayWidget(besin.kalori, "images/kalori.png",
                          Colors.blue, context),
                      buildBesinDetayWidget(besin.karbonhidrat,
                          "images/karbonhidrat.png", Colors.yellow, context),
                    ]),
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      buildBesinDetayWidget(besin.protein, "images/protein.png",
                          Colors.red, context),
                      buildBesinDetayWidget(
                          besin.yag, "images/yag.png", Colors.green, context),
                    ]),
              ],
            ),
          ),
        ),
      ),
    );
  }

  SizedBox buildBesinDetayWidget(
      num besin, String resim, Color renk, BuildContext context) {
    return SizedBox(
      height: 190.h,
      width: 160.w,
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        color: Colors.white,
        elevation: 10,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(resim, width: 100.w, height: 100.h, color: renk),
            Text(
              besin.toString() + " gr",
              style: TextStyle(fontSize: 30.sp, color: renk),
            ),
          ],
        ),
      ),
    );
  }
}
