import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:hms_app/presentation/component/constant/app_constants.dart';
import 'package:hms_app/presentation/component/loading/loading.dart';
import 'package:hms_app/presentation/component/loading/progress_report_card.dart';
import 'package:marquee/marquee.dart';
import 'package:sizer/sizer.dart';

class DashboardWidget extends StatelessWidget {
  const DashboardWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _buildProgress(),
        Expanded(
            child: Container(
          margin: EdgeInsets.all(10.sp),
          decoration: BoxDecoration(
            boxShadow: [BoxShadow(blurRadius: 3.sp)],
            borderRadius: BorderRadius.circular(
              5.sp,
            ),
            gradient: const LinearGradient(colors: [
              Color(0xFF3067DC),
              Color(0xFFA31987),
            ], begin: Alignment.topLeft, end: Alignment.bottomRight),
          ),
          child: LineChart(
            LineChartData(
              lineBarsData: [
                LineChartBarData(
                  spots: const [
                    FlSpot(0, 24),
                    FlSpot(1, 24),
                    FlSpot(2, 40),
                    FlSpot(3, 84),
                    FlSpot(4, 100),
                    FlSpot(5, 80),
                    FlSpot(6, 64),
                    FlSpot(7, 86),
                    FlSpot(8, 108),
                    FlSpot(9, 105),
                    FlSpot(10, 105),
                    FlSpot(11, 124),
                  ],
                )
              ],
              titlesData: const FlTitlesData(),
              maxY: 140,
              gridData: const FlGridData(show: false),
              borderData: FlBorderData(show: false),
            ),
          ),
        ))
      ],
    );
  }

  Widget _buildProgress({Axis axis = Axis.horizontal}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: kSpacing),
      child: (axis == Axis.horizontal)
          ? Row(
              children: [
                Flexible(
                  flex: 5,
                  child: Loading.progressCardLoading(
                      data: const ProgressCardData(
                        totalUndone: 10,
                        totalTaskInProress: 2,
                      ),
                      onPressedCheck: () {}),
                ),
                const SizedBox(width: kSpacing / 2),
                const Flexible(
                  flex: 4,
                  child: ProgressReportCard(
                    data: ProgressReportCardData(
                      title: "1st Sprint",
                      doneTask: 5,
                      percent: .3,
                      task: 3,
                      undoneTask: 2,
                    ),
                  ),
                ),
              ],
            )
          : Column(
              children: [
                Loading.progressCardLoading(
                    data: const ProgressCardData(
                      totalUndone: 10,
                      totalTaskInProress: 2,
                    ),
                    onPressedCheck: () {}),
                const SizedBox(height: kSpacing / 2),
                const ProgressReportCard(
                  data: ProgressReportCardData(
                    title: "1st Sprint",
                    doneTask: 5,
                    percent: .3,
                    task: 3,
                    undoneTask: 2,
                  ),
                ),
              ],
            ),
    );
  }

  Widget _buildProgress1({Axis axis = Axis.horizontal}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: kSpacing),
      child: (axis == Axis.horizontal)
          ? Row(
              children: [
                Flexible(
                  flex: 5,
                  child: Loading.progressCardLoading(
                      data: const ProgressCardData(
                        totalUndone: 10,
                        totalTaskInProress: 2,
                      ),
                      onPressedCheck: () {}),
                ),
                const SizedBox(width: kSpacing / 2),
                Flexible(
                  flex: 4,
                  child: Marquee(
                    // key: Key("$_useRtlText"),
                    text:
                        'זהו משפט ראשון של הטקסט הארוך. זהו המשפט השני של הטקסט הארוך',
                    style: TextStyle(fontWeight: FontWeight.bold),
                    scrollAxis: Axis.horizontal,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    blankSpace: 20,
                    velocity: 100,
                    pauseAfterRound: Duration(seconds: 1),
                    showFadingOnlyWhenScrolling: true,
                    fadingEdgeStartFraction: 0.1,
                    fadingEdgeEndFraction: 0.1,
                    numberOfRounds: 3,
                    startPadding: 10,
                    accelerationDuration: Duration(seconds: 1),
                    accelerationCurve: Curves.linear,
                    decelerationDuration: Duration(milliseconds: 500),
                    decelerationCurve: Curves.easeOut,
                    textDirection: TextDirection.ltr,
                  ),
                ),
              ],
            )
          : Column(
              children: [
                Loading.progressCardLoading(
                    data: const ProgressCardData(
                      totalUndone: 10,
                      totalTaskInProress: 2,
                    ),
                    onPressedCheck: () {}),
                const SizedBox(height: kSpacing / 2),
                const ProgressReportCard(
                  data: ProgressReportCardData(
                    title: "1st Sprint",
                    doneTask: 5,
                    percent: .3,
                    task: 3,
                    undoneTask: 2,
                  ),
                ),
              ],
            ),
    );
  }
}
