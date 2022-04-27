import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../main.dart';

class BuildAyarlarWidget extends StatelessWidget {
  const BuildAyarlarWidget({
    required this.yazi,
    required this.icon,
    required this.islem,
    required this.yazi2,
    Key? key,
  }) : super(key: key);

  final String yazi;
  final IconData icon;
  final Function() islem;
  final String yazi2;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Get.width,
      height: 50.h,
      //margin: EdgeInsets.only(bottom: 8.r, top: 8.r),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: const MyApp().textfieldColor,
            width: 1,
          ),
        ),
      ),
      child: ListTile(
        onTap: islem,
        title: Text(yazi,
            style: TextStyle(
              color: Colors.grey.shade800,
              fontSize: 15.sp,
            )),
        iconColor: Colors.grey.shade600,
        leading: Icon(
          icon,
          size: 20.sp,
        ),
        trailing: Text(
          yazi2,
          style: TextStyle(fontSize: 15.sp, color: Colors.grey.shade600),
        ),
      ),
    );
  }
}
