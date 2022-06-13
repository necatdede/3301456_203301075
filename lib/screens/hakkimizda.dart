import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class Hakkimizda extends StatelessWidget {
  const Hakkimizda({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Hakkımızda")),
      body: SizedBox(
          height: Get.height,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "Welcome To Diyetlendin",
                  style:
                      TextStyle(fontSize: 30.sp, fontWeight: FontWeight.bold),
                ),
                const Text(
                    '''Diyetlendin is a Professional Health Platform. Here we will provide you only interesting content, which you will like very much. We're dedicated to providing you the best of Health, with a focus on dependability and Online Diet App. We're working to turn our passion for Health into a booming online website. We hope you enjoy our Health as much as we enjoy offering them to you.

I will keep posting more important posts on my Website for all of you. Please give your support and love.'''),
              ],
            ),
          )),
    );
  }
}
