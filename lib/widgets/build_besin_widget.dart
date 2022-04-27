import 'package:diyetlendin/models/besin.dart';
import 'package:diyetlendin/widgets/build_textfield_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:line_icons/line_icons.dart';

class BuildBesinWidget extends StatelessWidget {
  BuildBesinWidget({
    Key? key,
    required this.besinler,
    required this.index,
    required this.kontrol,
    required this.tiklama,
  }) : super(key: key);

  final List<Besin> besinler;
  final int index;
  final TextEditingController kontrol;
  final Function()? tiklama;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(30),
      onTap: () {
        Navigator.pushNamed(context, "/routeBesinDetay",
            arguments: besinler[index]);
      },
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        ),
        color: Colors.white,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Flexible(
              flex: 2,
              child: Container(
                height: 100.h,
                // width: width*0.4,
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(30),
                    topLeft: Radius.circular(30),
                  ),
                  image: DecorationImage(
                      fit: BoxFit.fill,
                      image: NetworkImage(besinler[index].besinFoto)),
                ),
              ),
            ),
            Flexible(
              flex: 2,
              child: Container(
                height: 100.h,
                //width: width*0.6,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(30),
                      bottomRight: Radius.circular(30)),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      " " + besinler[index].besinAd,
                      style: TextStyle(
                          fontSize: 15.sp,
                          color: Colors.black,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      " " + besinler[index].kalori.toString() + " Kalori",
                      style: TextStyle(
                          color: Colors.blue,
                          fontSize: 12.sp,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
            ),
            Flexible(
              flex: 3,
              child: BuildTextFieldWidget(
                str: "Gram",
                icon: LineIcons.weight,
                control: kontrol,
                klavyetur: TextInputType.number,
              ),
            ),
            Flexible(
              flex: 1,
              child: IconButton(
                onPressed: tiklama!,
                icon: const Icon(LineIcons.plusCircle),
                iconSize: 40.sp,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
