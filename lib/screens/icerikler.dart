import 'package:diyetlendin/icerik_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class Icerikler extends StatelessWidget {
  const Icerikler({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: Get.height,
      child: GridView.count(
        crossAxisSpacing: 10,
        crossAxisCount: 2,
        children: List.generate(
          icerikData.length,
          (index) => GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, "/routeIcerik", arguments: index);
            },
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                    height: 150.h,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(40),
                      image: DecorationImage(
                        fit: BoxFit.fill,
                        image: NetworkImage(icerikData[index].imageUrl!),
                      ),
                    )),
                Text(
                  icerikData[index].title!,
                  style:
                      TextStyle(fontSize: 12.sp, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
