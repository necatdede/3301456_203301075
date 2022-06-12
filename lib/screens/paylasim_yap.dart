import 'dart:io';

import 'package:diyetlendin/my_theme.dart';
import 'package:diyetlendin/widgets/build_button_widget.dart';
import 'package:diyetlendin/widgets/build_dialog_snackbar.dart';
import 'package:diyetlendin/widgets/build_textfield_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:line_icons/line_icons.dart';

class PaylasimYap extends StatefulWidget {
  const PaylasimYap({Key? key}) : super(key: key);

  @override
  State<PaylasimYap> createState() => _PaylasimYapState();
}

class _PaylasimYapState extends State<PaylasimYap> {
  File? image;

  TextEditingController comment = TextEditingController();

  Future pickImage() async {
    try {
      final image = await ImagePicker().pickImage(source: ImageSource.gallery);

      if (image == null) return;

      final imageTemp = File(image.path);

      setState(() => this.image = imageTemp);
    } on PlatformException catch (e) {
      print('Failed to pick image: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Diyetlendin")),
      body: Column(
        children: [
          (image != null)
              ? Container(
                  child: GestureDetector(
                    onLongPress: () {
                      buildDialog("Resmi Kaldır", () {
                        setState(() {
                          image = null;
                        });
                        Get.back();
                      }, const Text("Emin Misiniz?"));
                    },
                    onTap: () {
                      pickImage();
                    },
                  ),
                  width: Get.width,
                  height: Get.width,
                  decoration: BoxDecoration(
                      shape: BoxShape.rectangle,
                      image: DecorationImage(
                          fit: BoxFit.fill, image: FileImage(image!))))
              : SizedBox(
                  width: Get.width,
                  height: Get.width,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(primary: Colors.white),
                    onPressed: () {
                      pickImage();
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          LineIcons.image,
                          size: 70.sp,
                          color: textfieldColor,
                        ),
                        Text(
                          'Resim Seç',
                          style: TextStyle(
                            color: textfieldColor,
                            fontSize: 30.sp,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
          BuildTextFieldWidget(
            control: comment,
            str: "Açıklama",
            icon: LineIcons.comment,
            isEnable: true,
          ),
          BuildButtonWidget(
              str: "Gönder",
              islem: () {
                Get.back();
              },
              context: context)
        ],
      ),
    );
  }
}
