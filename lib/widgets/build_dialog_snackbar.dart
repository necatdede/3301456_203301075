import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../my_theme.dart';

void buildSnackBar(String title, String message, SnackPosition snackPosition) {
  Get.rawSnackbar(
      title: title,
      message: message,
      snackPosition: snackPosition,
      backgroundColor: textfieldColor.withOpacity(0.9));
}

void buildDialog(String title, Function() islem, Widget content) {
  Get.defaultDialog(
      content: content,
      title: title,
      onConfirm: islem,
      onCancel: () {},
      buttonColor: textfieldColor,
      textCancel: "İptal",
      textConfirm: "Onayla",
      confirmTextColor: Colors.white,
      cancelTextColor: Colors.black);
}
