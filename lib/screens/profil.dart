import 'package:diyetlendin/controllers/firebase_controller.dart';
import 'package:diyetlendin/widgets/build_textfield_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:line_icons/line_icons.dart';

class Profil extends StatelessWidget {
  const Profil({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final c = Get.put(FirebaseController());
    final bos = TextEditingController();
    return Scaffold(
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: SizedBox(
          height: Get.height,
          child: Padding(
            padding: const EdgeInsets.only(top: 16.0),
            child: Obx(
              () => Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                      width: 200.w,
                      height: 200.h,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                            fit: BoxFit.fill,
                            image: NetworkImage(c.imageUrl.value)),
                      )),
                  BuildTextFieldWidget(
                    control: bos,
                    str: c.kullanici.value.ad.toString(),
                    icon: LineIcons.addressCard,
                    isEnable: false,
                  ),
                  BuildTextFieldWidget(
                    control: bos,
                    str: c.kullanici.value.boy.toString(),
                    icon: LineIcons.ruler,
                    isEnable: false,
                  ),
                  BuildTextFieldWidget(
                    control: bos,
                    str: c.kullanici.value.kilo.toString(),
                    icon: LineIcons.weight,
                    isEnable: false,
                  ),
                  BuildTextFieldWidget(
                    control: bos,
                    str: c.kullanici.value.yas.toString(),
                    icon: LineIcons.birthdayCake,
                    isEnable: false,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
