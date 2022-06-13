import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class GizlilikKosullar extends StatelessWidget {
  const GizlilikKosullar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Gizlilik ve Koşullar")),
      body: SizedBox(
          height: Get.height,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "Privacy Policy for Diyetlendin",
                  style:
                      TextStyle(fontSize: 30.sp, fontWeight: FontWeight.bold),
                ),
                const Text(
                    '''One of our top priorities, which can be found at, is the privacy of our visitors. This paper outlines the types of information that collects and records, as well as how we use it.

Please do not hesitate to contact us if you have any further questions or need additional details about our Privacy Policy.

This Privacy Policy only applies to our online activities and is applicable to information exchanged and/or collected by visitors to our website. This policy does not extend to data collected outside of this website or by other means. The Privacy Policy Generator was used to build our Privacy Policy.'''),
              ],
            ),
          )),
    );
  }
}
