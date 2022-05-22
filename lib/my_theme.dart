import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

const Color bgColor = Color(0xffEDF0F2);
const Color textfieldColor = Color(0xff70D188);

final ThemeData myTheme = ThemeData().copyWith(
    scaffoldBackgroundColor: bgColor,
    colorScheme: ThemeData()
        .colorScheme
        .copyWith(primary: textfieldColor, onPrimary: Colors.white),
    inputDecorationTheme: InputDecorationTheme(
      hintStyle: TextStyle(fontSize: 12.sp),
      focusedBorder: OutlineInputBorder(
        borderSide: const BorderSide(color: textfieldColor, width: 3),
        borderRadius: BorderRadius.circular(25),
      ),
      enabledBorder: OutlineInputBorder(
        borderSide: const BorderSide(color: bgColor, width: 3),
        borderRadius: BorderRadius.circular(25),
      ),
      disabledBorder: OutlineInputBorder(
        borderSide: const BorderSide(color: Colors.white, width: 3),
        borderRadius: BorderRadius.circular(25),
      ),
    ));
