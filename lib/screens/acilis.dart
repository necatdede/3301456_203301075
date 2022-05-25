import 'package:diyetlendin/controllers/veri_controller.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class Acilis extends StatefulWidget {
  const Acilis({Key? key}) : super(key: key);

  @override
  State<Acilis> createState() => _AcilisState();
}

class _AcilisState extends State<Acilis> {
  VeriController veriController = VeriController();

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 1), () {
      veriController.changeLogoSize();
    });

    Future.delayed(const Duration(seconds: 3), () {
      (FirebaseAuth.instance.currentUser == null)
          ? Navigator.popAndPushNamed(context, "/routeGirisYap")
          : Navigator.popAndPushNamed(context, "/routeCerceve");
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            Expanded(
              flex: 4,
              child: Center(
                child: Obx(
                  () => AnimatedContainer(
                    duration: const Duration(seconds: 1),
                    curve: Curves.bounceOut,
                    width: veriController.logoSize.value.w,
                    height: veriController.logoSize.value.h,
                    child: Container(
                      decoration: const BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage("images/logo.png"),
                              fit: BoxFit.contain)),
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: Image.asset(
                "images/yukleniyor.gif",
                height: 75.h,
                width: 75.w,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
