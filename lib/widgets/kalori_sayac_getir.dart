import 'package:diyetlendin/controllers/firebase_controller.dart';
import 'package:diyetlendin/controllers/veri_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:line_icons/line_icons.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

import '../my_theme.dart';

class KaloriSayacGetir extends StatefulWidget {
  const KaloriSayacGetir({Key? key}) : super(key: key);

  @override
  State<KaloriSayacGetir> createState() => _KaloriSayacGetirState();
}

class _KaloriSayacGetirState extends State<KaloriSayacGetir> {
  var now = DateTime.now();

  String ayHesapla(int ayid) {
    String ay = "";
    switch (ayid) {
      case 1:
        ay = "Ocak";
        break;
      case 2:
        ay = "Şubat";
        break;
      case 3:
        ay = "Mart";
        break;
      case 4:
        ay = "Nisan";
        break;
      case 5:
        ay = "Mayıs";
        break;
      case 6:
        ay = "Haziran";
        break;
      case 7:
        ay = "Temmuz";
        break;
      case 8:
        ay = "Ağustos";
        break;
      case 9:
        ay = "Eylül";
        break;
      case 10:
        ay = "Ekim";
        break;
      case 11:
        ay = "Kasım";
        break;
      case 12:
        ay = "Aralık";
        break;
    }
    return ay;
  }

  @override
  Widget build(BuildContext context) {
    final c = Get.put(VeriController());
    final c2 = Get.put(FirebaseController());
    var tarih = DateTime.parse(c.tarih.value);
    return Card(
      color: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      elevation: 5,
      child: Padding(
        padding: EdgeInsets.all(15.0.r),
        child: Obx(
          () => Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Flexible(
                flex: 1,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextButton(
                      onPressed: () {
                        showDatePicker(
                                context: context,
                                initialDate: DateTime.parse(c.tarih.value),
                                firstDate: DateTime(2022),
                                lastDate: DateTime(2024))
                            .then((date) {
                          setState(() {
                            c.tarihDegis(date.toString().substring(0, 10));
                          });
                        });
                      },
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            LineIcons.calendarWithDayFocus,
                            color: Colors.black,
                            size: 60.sp,
                          ),
                          Text(
                            tarih.day.toString() + " " + ayHesapla(tarih.month),
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 20.sp,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            tarih.year.toString(),
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 20.sp,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Flexible(
                flex: 1,
                child: CircularPercentIndicator(
                  progressColor: textfieldColor,
                  radius: 120.sp,
                  animation: true,
                  animationDuration: 1200,
                  lineWidth: 8.0.w,
                  percent: ((c.topla() / c2.kullanici.value.gunlukKalori!) <= 1)
                      ? c.topla() / c2.kullanici.value.gunlukKalori!
                      : 1,
                  center: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        c.topla().toString(),
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 25.sp,
                            color: Colors.black),
                      ),
                      Text(
                        "/" + c2.kullanici.value.gunlukKalori.toString(),
                        style: TextStyle(
                            fontSize: 20.sp,
                            color: Colors.black,
                            fontWeight: FontWeight.bold),
                      ),
                      Text(
                        "kcal",
                        style: TextStyle(
                            fontSize: 20.sp,
                            color: Colors.black38,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  circularStrokeCap: CircularStrokeCap.round, //indikatorun ucu
                  backgroundColor: Colors.grey.shade300,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
