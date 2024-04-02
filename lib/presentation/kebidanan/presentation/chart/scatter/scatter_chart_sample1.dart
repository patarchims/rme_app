import 'dart:math';

import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:hms_app/presentation/kebidanan/presentation/resources/app_resources.dart';

class ScatterChartSample1 extends StatefulWidget {
  ScatterChartSample1({super.key});

  final blue1 = AppColors.contentColorBlue.withOpacity(0.5);
  final blue2 = AppColors.contentColorBlue;

  @override
  State<StatefulWidget> createState() => ScatterChartSample1State();
}

class ScatterChartSample1State extends State<ScatterChartSample1> {
  final maxX = 50.0;
  final maxY = 50.0;
  final radius = 8.0;

  bool showFlutter = true;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          showFlutter = !showFlutter;
        });
      },
      child: AspectRatio(
        aspectRatio: 1,
        child: ScatterChart(
          ScatterChartData(
            scatterSpots: showFlutter ? flutterLogoData() : randomData(),
            minX: 0,
            maxX: maxX,
            minY: 0,
            maxY: maxY,
            borderData: FlBorderData(
              show: false,
            ),
            gridData: FlGridData(
              show: false,
            ),
            titlesData: FlTitlesData(
              show: false,
            ),
            scatterTouchData: ScatterTouchData(
              enabled: false,
            ),
          ),
          swapAnimationDuration: const Duration(milliseconds: 600),
          swapAnimationCurve: Curves.fastOutSlowIn,
        ),
      ),
    );
  }

  List<ScatterSpot> flutterLogoData() {
    return [
      /// section 1
      ScatterSpot(
        20,
        14.5,
      ),
      ScatterSpot(
        20,
        14.5,
      ),
      ScatterSpot(
        22,
        16.5,
      ),
      ScatterSpot(
        24,
        18.5,
      ),

      ScatterSpot(
        22,
        12.5,
      ),
      ScatterSpot(
        24,
        14.5,
      ),
      ScatterSpot(
        26,
        16.5,
      ),

      ScatterSpot(
        24,
        10.5,
      ),
      ScatterSpot(
        26,
        12.5,
      ),
      ScatterSpot(
        28,
        14.5,
      ),

      ScatterSpot(
        26,
        8.5,
      ),
      ScatterSpot(
        28,
        10.5,
      ),
      ScatterSpot(
        30,
        12.5,
      ),

      ScatterSpot(
        28,
        6.5,
      ),
      ScatterSpot(
        30,
        8.5,
      ),
      ScatterSpot(
        32,
        10.5,
      ),

      ScatterSpot(
        30,
        4.5,
      ),
      ScatterSpot(
        32,
        6.5,
      ),
      ScatterSpot(
        34,
        8.5,
      ),

      ScatterSpot(
        34,
        4.5,
      ),
      ScatterSpot(
        36,
        6.5,
      ),

      ScatterSpot(
        38,
        4.5,
      ),

      /// section 2
      ScatterSpot(
        20,
        14.5,
      ),
      ScatterSpot(
        22,
        12.5,
      ),
      ScatterSpot(
        24,
        10.5,
      ),

      ScatterSpot(
        22,
        16.5,
      ),
      ScatterSpot(
        24,
        14.5,
      ),
      ScatterSpot(
        26,
        12.5,
      ),

      ScatterSpot(
        24,
        18.5,
      ),
      ScatterSpot(
        26,
        16.5,
      ),
      ScatterSpot(
        28,
        14.5,
      ),

      ScatterSpot(
        26,
        20.5,
      ),
      ScatterSpot(
        28,
        18.5,
      ),
      ScatterSpot(
        30,
        16.5,
      ),

      ScatterSpot(
        28,
        22.5,
      ),
      ScatterSpot(
        30,
        20.5,
      ),
      ScatterSpot(
        32,
        18.5,
      ),

      ScatterSpot(
        30,
        24.5,
      ),
      ScatterSpot(
        32,
        22.5,
      ),
      ScatterSpot(
        34,
        20.5,
      ),

      ScatterSpot(
        34,
        24.5,
      ),
      ScatterSpot(
        36,
        22.5,
      ),

      ScatterSpot(
        38,
        24.5,
      ),

      /// section 3
      ScatterSpot(
        10,
        25,
      ),
      ScatterSpot(
        12,
        23,
      ),
      ScatterSpot(
        14,
        21,
      ),

      ScatterSpot(
        12,
        27,
      ),
      ScatterSpot(
        14,
        25,
      ),
      ScatterSpot(
        16,
        23,
      ),

      ScatterSpot(
        14,
        29,
      ),
      ScatterSpot(
        16,
        27,
      ),
      ScatterSpot(
        18,
        25,
      ),

      ScatterSpot(
        16,
        31,
      ),
      ScatterSpot(
        18,
        29,
      ),
      ScatterSpot(
        20,
        27,
      ),

      ScatterSpot(
        18,
        33,
      ),
      ScatterSpot(
        20,
        31,
      ),
      ScatterSpot(
        22,
        29,
      ),

      ScatterSpot(
        20,
        35,
      ),
      ScatterSpot(
        22,
        33,
      ),
      ScatterSpot(
        24,
        31,
      ),

      ScatterSpot(
        22,
        37,
      ),
      ScatterSpot(
        24,
        35,
      ),
      ScatterSpot(
        26,
        33,
      ),

      ScatterSpot(
        24,
        39,
      ),
      ScatterSpot(
        26,
        37,
      ),
      ScatterSpot(
        28,
        35,
      ),

      ScatterSpot(
        26,
        41,
      ),
      ScatterSpot(
        28,
        39,
      ),
      ScatterSpot(
        30,
        37,
      ),

      ScatterSpot(
        28,
        43,
      ),
      ScatterSpot(
        30,
        41,
      ),
      ScatterSpot(
        32,
        39,
      ),

      ScatterSpot(
        30,
        45,
      ),
      ScatterSpot(
        32,
        43,
      ),
      ScatterSpot(
        34,
        41,
      ),

      ScatterSpot(
        34,
        45,
      ),
      ScatterSpot(
        36,
        43,
      ),

      ScatterSpot(
        38,
        45,
      ),
    ];
  }

  List<ScatterSpot> randomData() {
    const blue1Count = 21;
    const blue2Count = 57;
    return List.generate(blue1Count + blue2Count, (i) {
      if (i < blue1Count) {
      } else {}

      return ScatterSpot(
        (Random().nextDouble() * (maxX - 8)) + 4,
        (Random().nextDouble() * (maxY - 8)) + 4,
      );
    });
  }
}
