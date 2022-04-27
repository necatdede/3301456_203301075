import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

class KaloriDetayGetir extends StatelessWidget {
  const KaloriDetayGetir({
    Key? key,
    required this.tur,
    required this.deger_yol,
    required this.alinan,
    required this.alinacak,
    required this.renk,
    required this.renk2,
    required this.renk3,
  }) : super(key: key);

  final String tur;
  final String deger_yol;
  final int alinan;
  final int alinacak;
  final Color renk;
  final Color renk2;
  final Color renk3;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(8.r),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image(
            width: 40.w,
            height: 40.h,
            image: AssetImage(deger_yol),
          ),
          Text(tur,
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 12.sp,
              )),
          LinearPercentIndicator(
            linearGradient: LinearGradient(
              colors: [renk, renk2],
            ),
            percent: ((alinan / alinacak) <= 1) ? alinan / alinacak : 1,
            width: 90.w,
            lineHeight: 8.h,
            animationDuration: 1200,
            animation: true,
            backgroundColor: renk3,
          ),
          Text(
              alinan.toInt().toString() +
                  "/" +
                  alinacak.toInt().toString() +
                  " gr",
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 12.sp,
              )),
        ],
      ),
    );
  }
}
