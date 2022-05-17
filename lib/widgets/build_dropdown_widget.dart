import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../main.dart';

class BuildDropDownWidget extends StatefulWidget {
  const BuildDropDownWidget({
    Key? key,
    required this.secilen,
    required this.veri,
    required this.islem,
  }) : super(key: key);

  final String secilen;
  final List<String> veri;
  final Function(String?)? islem;

  @override
  State<BuildDropDownWidget> createState() => _BuildDropDownWidgetState();
}

class _BuildDropDownWidgetState extends State<BuildDropDownWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        border: Border.all(
          color: const MyApp().bgColor,
          width: 3,
        ),
        borderRadius: BorderRadius.circular(25),
        color: Colors.white,
      ),
      width: Get.width,
      height: 45.h,
      child: Center(
        child: DropdownButton<String>(
          iconSize: 20.sp,
          underline: const SizedBox(),
          isExpanded: true,
          onChanged: widget.islem,
          value: widget.secilen,
          items: widget.veri.map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Center(
                child: Text(
                  value,
                  style: TextStyle(fontSize: 13.sp),
                ),
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}
