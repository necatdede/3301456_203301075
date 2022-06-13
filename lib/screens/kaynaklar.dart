import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class Kaynaklar extends StatelessWidget {
  const Kaynaklar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Kaynaklar")),
      body: SizedBox(
          height: Get.height,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "Mifflin-St Jeor Formülü",
                  style:
                      TextStyle(fontSize: 30.sp, fontWeight: FontWeight.bold),
                ),
                const Text(
                    '''Üyelerin bazal metabolizma hızları hesaplanırken Mifflin-St Jeor formülü esas alınır.
                    https://www.calculator.net/calorie-calculator.html '''),
              ],
            ),
          )),
    );
  }
}
