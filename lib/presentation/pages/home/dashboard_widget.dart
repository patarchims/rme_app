import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:hms_app/presentation/component/constant/app_constants.dart';
import 'package:hms_app/presentation/component/loading/loading.dart';
import 'package:hms_app/presentation/component/loading/progress_report_card.dart';
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
              titlesData: FlTitlesData(),
              maxY: 140,
              gridData: FlGridData(show: false),
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
}
