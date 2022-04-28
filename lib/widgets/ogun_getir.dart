import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OgunGetir extends StatelessWidget {
  const OgunGetir({
    Key? key,
    required this.kalori,
    required this.tur,
    required this.renk,
    required this.renk2,
    required this.yazi,
    required this.ontab,
  }) : super(key: key);

  final String kalori;
  final String tur;
  final Color renk;
  final Color renk2;
  final String yazi;
  final Function() ontab;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 3.0.r),
      child: InkWell(
        borderRadius: const BorderRadius.only(
            topRight: Radius.circular(60),
            topLeft: Radius.circular(20),
            bottomLeft: Radius.circular(20),
            bottomRight: Radius.circular(20)),
        onTap: ontab,
        child: Padding(
          padding: EdgeInsets.all(8.0.r),
          child: Container(
            width: 130.w,
            height: 300.h,
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: renk.withOpacity(1),
                  spreadRadius: 1,
                  blurRadius: 7,
                  offset: const Offset(0, 3), // changes position of shadow
                ),
              ],
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  renk,
                  renk2,
                ],
              ),
              borderRadius: const BorderRadius.only(
                  topRight: Radius.circular(60),
                  topLeft: Radius.circular(20),
                  bottomLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20)),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Image(
                  width: 100.w,
                  height: 100.h,
                  image: AssetImage(tur),
                ),
                Text(
                  yazi,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 15.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  kalori + " kcal",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 12.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
