import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../models/besin.dart';

class BesinDetay extends StatefulWidget {
  const BesinDetay({Key? key}) : super(key: key);

  @override
  State<BesinDetay> createState() => _BesinDetayState();
}

class _BesinDetayState extends State<BesinDetay> {
  @override
  Widget build(BuildContext context) {
    Besin besin = ModalRoute.of(context)?.settings.arguments as Besin;

    return Scaffold(
      appBar: AppBar(
        title: Text(besin.besinAd.toString()),
      ),
      body: SizedBox(
        width: Get.width,
        height: Get.height,
        child: Padding(
          padding: EdgeInsets.all(16.r),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                  width: 200.w,
                  height: 200.h,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                        fit: BoxFit.contain,
                        image: NetworkImage(besin.besinUrl.toString())),
                  )),
              Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
                buildBesinDetayWidget(num.parse(besin.kalori.toString()),
                    "assets/images/kalori.png", Colors.blue, context),
                buildBesinDetayWidget(num.parse(besin.karbonhidrat.toString()),
                    "assets/images/karbonhidrat.png", Colors.yellow, context),
              ]),
              Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
                buildBesinDetayWidget(num.parse(besin.protein.toString()),
                    "assets/images/protein.png", Colors.red, context),
                buildBesinDetayWidget(num.parse(besin.yag.toString()),
                    "assets/images/yag.png", Colors.green, context),
              ]),
            ],
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
