import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class BuildKesfetWidget extends StatelessWidget {
  const BuildKesfetWidget({
    Key? key,
    required this.avatarUrl,
    required this.name,
    required this.content,
    required this.imageUrl,
  }) : super(key: key);

  final String avatarUrl;
  final String name;
  final String content;
  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 10,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                height: 50.h,
                width: 50.w,
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                        fit: BoxFit.fill, image: NetworkImage(avatarUrl))),
              ),
              Text(
                " " + name,
                style: TextStyle(fontSize: 15.sp),
              ),
            ],
          ),
          SizedBox(
              width: Get.width,
              height: Get.width * 1.2,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    content,
                    style: TextStyle(fontSize: 20.sp),
                  ),
                  Container(
                    height: Get.width,
                    width: Get.width,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            fit: BoxFit.fill, image: NetworkImage(imageUrl))),
                  ),
                ],
              ))
        ],
      ),
    );
  }
}
