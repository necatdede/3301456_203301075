import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class BuildKesfetWidget extends StatefulWidget {
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
  State<BuildKesfetWidget> createState() => _BuildKesfetWidgetState();
}

class _BuildKesfetWidgetState extends State<BuildKesfetWidget> {
  @override
  Widget build(BuildContext context) {
    double _scaleFactor = 1.0;
    double _baseScaleFactor = 1.0;
    return Card(
      elevation: 10,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              GestureDetector(
                onScaleStart: (details) {
                  _baseScaleFactor = _scaleFactor;
                },
                onScaleUpdate: (details) {
                  setState(() {
                    _scaleFactor = _baseScaleFactor * details.scale;
                  });
                },
                child: Container(
                  height: 50.h,
                  width: 50.w,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                          fit: BoxFit.fill,
                          image: NetworkImage(widget.avatarUrl))),
                ),
              ),
              Text(
                " " + widget.name,
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
                    widget.content,
                    style: TextStyle(fontSize: 20.sp),
                  ),
                  Container(
                    height: Get.width,
                    width: Get.width,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            fit: BoxFit.fill,
                            image: NetworkImage(widget.imageUrl))),
                  ),
                ],
              ))
        ],
      ),
    );
  }
}
