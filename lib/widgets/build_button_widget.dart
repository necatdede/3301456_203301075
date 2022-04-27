import 'package:diyetlendin/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class BuildButtonWidget extends StatelessWidget {
  const BuildButtonWidget({
    Key? key,
    required this.str,
    required this.islem,
    required this.context,
  }) : super(key: key);

  final String str;
  final Function()? islem;
  final BuildContext context;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Get.width,
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.white.withOpacity(0.5),
            spreadRadius: 5,
            blurRadius: 7,
            offset: const Offset(0, 3), // changes position of shadow
          ),
        ],
        borderRadius: BorderRadius.circular(50),
        color: Colors.white,
      ),
      height: 45.h,
      margin: const EdgeInsets.all(8),
      child: ElevatedButton(
        style: TextButton.styleFrom(
            backgroundColor: const MyApp().textfieldColor,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20))),
        onPressed: islem,
        child: Ink(
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(30.0)),
          child: Container(
            constraints: const BoxConstraints(maxWidth: 250.0, minHeight: 50.0),
            alignment: Alignment.center,
            child: Text(
              str,
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.grey.shade900, fontSize: 15.sp),
            ),
          ),
        ),
      ),
    );
  }
}
