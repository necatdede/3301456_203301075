import 'package:diyetlendin/main.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class BuildTextFieldWidget extends StatelessWidget {
  BuildTextFieldWidget({
    Key? key,
    required this.control,
    required this.str,
    required this.icon,
    this.isEnable = true,
    this.kontrol = false,
    this.klavyetur = TextInputType.text,
  }) : super(key: key);

  TextEditingController control;
  String str;
  final IconData icon;
  final bool kontrol;
  final TextInputType klavyetur;
  final bool isEnable;

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(left: 8.r, right: 8.r, top: 4.r, bottom: 4.r),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25),
          color: Colors.white,
        ),
        width: Get.width,
        height: 45.h,
        child: TextField(
          textAlignVertical: TextAlignVertical.center,
          style: TextStyle(fontSize: 12.sp),
          onChanged: (value) {
            str = value;
          },
          enabled: isEnable,
          keyboardType: klavyetur,
          obscureText: kontrol,
          controller: control,
          autocorrect: true,
          decoration: InputDecoration(
              isCollapsed: true,
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: MyApp().textfieldColor, width: 3),
                borderRadius: BorderRadius.circular(25),
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: MyApp().bgColor, width: 3),
                borderRadius: BorderRadius.circular(25),
              ),
              disabledBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: Colors.white, width: 3),
                borderRadius: BorderRadius.circular(25),
              ),
              prefixIcon: Icon(
                icon,
                size: 20.sp,
              ),
              hintText: str,
              hintStyle: TextStyle(fontSize: 12.sp)),
        ));
  }
}
