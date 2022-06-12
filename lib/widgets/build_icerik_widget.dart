import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class BuildIcerikWidget extends StatefulWidget {
  const BuildIcerikWidget({
    Key? key,
    required this.imageUrl,
    this.imageUrl2,
    required this.title,
    required this.content,
  }) : super(key: key);

  final String imageUrl;
  final String? imageUrl2;
  final String title;
  final String content;

  @override
  State<BuildIcerikWidget> createState() => _BuildIcerikWidgetState();
}

class _BuildIcerikWidgetState extends State<BuildIcerikWidget> {
  bool isResim = true;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          GestureDetector(
            onVerticalDragCancel: () {
              setState(() {
                isResim = (isResim) ? false : true;
              });
            },
            child: Container(
                height: 250.h,
                width: Get.width * 0.9,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    fit: BoxFit.fill,
                    image: (isResim)
                        ? NetworkImage(widget.imageUrl)
                        : NetworkImage(widget.imageUrl2!),
                  ),
                )),
          ),
          Text(
            widget.title,
            style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.bold),
          ),
          Text(widget.content, softWrap: true),
        ],
      ),
    );
  }
}
