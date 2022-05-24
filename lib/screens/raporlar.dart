import 'package:diyetlendin/controllers/veri_controller.dart';
import 'package:diyetlendin/my_theme.dart';
import 'package:diyetlendin/widgets/build_raporlar_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class Raporlar extends StatefulWidget {
  const Raporlar({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _RaporlarState();
}

class _RaporlarState extends State<Raporlar> {
  VeriController veriController = VeriController();

  @override
  void initState() {
    super.initState();
    veriController.secRapor();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: EdgeInsets.only(left: 8.0.r, right: 8.r),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Expanded(
              flex: 1,
              child: Center(
                child: Text(
                  "Son 7 günlük alınan kalori miktarları",
                  style: TextStyle(
                    fontSize: 20.sp,
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 9,
              child: Obx(
                () => Card(
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  color: bgColor,
                  child: (veriController.raporItems.isNotEmpty)
                      ? RaporlarWidget(raporList: veriController.raporItems)
                      : _waitingWidget,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget get _waitingWidget => const Center(child: CircularProgressIndicator());
}
