import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../my_theme.dart';

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
      height: 45.h,
      margin: const EdgeInsets.all(8),
      child: ElevatedButton(
        style: TextButton.styleFrom(
            backgroundColor: textfieldColor,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20))),
        onPressed: islem,
        child: Text(
          str,
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 15.sp),
        ),
      ),
    );
  }
}
