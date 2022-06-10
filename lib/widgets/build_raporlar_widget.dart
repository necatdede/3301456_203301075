import 'dart:math' as math;

import 'package:diyetlendin/models/rapor.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../my_theme.dart';

class RaporlarWidget extends StatelessWidget {
  const RaporlarWidget({Key? key, required this.raporList}) : super(key: key);

  final List<RaporModel> raporList;

  List<BarChartGroupData> doldur() {
    List<BarChartGroupData> listData = [];
    for (int i = 0; i < raporList.length; i++) {
      var data = BarChartGroupData(
        x: i,
        barRods: [
          BarChartRodData(
            color: textfieldColor,
            toY: raporList[i].kalori!.toDouble(),
          )
        ],
        showingTooltipIndicators: [0],
      );
      listData.add(data);
    }
    return listData;
  }

  @override
  Widget build(BuildContext context) {
    return BarChart(
      BarChartData(
        barTouchData: barTouchData,
        titlesData: titlesData,
        borderData: borderData,
        barGroups: doldur(),
        gridData: FlGridData(show: false),
        alignment: BarChartAlignment.spaceAround,
        maxY: 4000,
      ),
    );
  }

  BarTouchData get barTouchData => BarTouchData(
        enabled: false,
        touchTooltipData: BarTouchTooltipData(
          rotateAngle: 0,
          tooltipBgColor: Colors.transparent,
          tooltipPadding: const EdgeInsets.all(0),
          tooltipMargin: 8,
          getTooltipItem: (
            BarChartGroupData group,
            int groupIndex,
            BarChartRodData rod,
            int rodIndex,
          ) {
            return BarTooltipItem(
              rod.toY.round().toString() + " kcal",
              TextStyle(
                color: const Color(0xff7589a2),
                fontWeight: FontWeight.bold,
                fontSize: 10.sp,
              ),
            );
          },
        ),
      );

  Widget getTitles(double value, TitleMeta meta) {
    var style = TextStyle(
      color: const Color(0xff7589a2),
      fontWeight: FontWeight.bold,
      fontSize: 9.sp,
    );
    String text;
    text = raporList[value.toInt()].tarih.toString();
    return Center(
        child: Transform.rotate(
            angle: -math.pi / 4, child: Text(text, style: style)));
  }

  FlTitlesData get titlesData => FlTitlesData(
        show: true,
        bottomTitles: AxisTitles(
          axisNameSize: 10.sp,
          sideTitles: SideTitles(
            showTitles: true,
            reservedSize: 60.sp,
            getTitlesWidget: getTitles,
          ),
        ),
        leftTitles: AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        topTitles: AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        rightTitles: AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
      );

  FlBorderData get borderData => FlBorderData(
        border: Border.all(color: textfieldColor, width: 3),
        show: true,
      );
}
