import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class BuildTextFieldWidget extends StatelessWidget {
  const BuildTextFieldWidget({
    Key? key,
    required this.control,
    required this.str,
    required this.icon,
    this.onChanged,
    this.isEnable = true,
    this.kontrol = false,
    this.klavyetur = TextInputType.text,
  }) : super(key: key);

  final TextEditingController control;
  final String str;
  final IconData icon;
  final bool kontrol;
  final TextInputType klavyetur;
  final bool isEnable;
  final Function(String)? onChanged;

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.all(6.sp),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25),
          color: Colors.white,
        ),
        width: Get.width,
        child: TextField(
            textAlignVertical: TextAlignVertical.center,
            style: TextStyle(fontSize: 12.sp),
            onChanged: onChanged,
            enabled: isEnable,
            keyboardType: klavyetur,
            obscureText: kontrol,
            controller: control,
            autocorrect: true,
            decoration: InputDecoration(
              isCollapsed: true,
              prefixIcon: Icon(
                icon,
                size: 20.sp,
              ),
              hintText: str,
            )));
  }
}
