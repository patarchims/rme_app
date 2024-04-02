import 'package:flutter/material.dart';
import 'package:hms_app/presentation/kebidanan/presentation/chart/chart_sample.dart';
import 'package:hms_app/presentation/kebidanan/presentation/resources/app_resources.dart';
import 'package:hms_app/presentation/kebidanan/presentation/util/app_utils.dart';

class ChartHolder extends StatelessWidget {
  final ChartSample chartSample;

  const ChartHolder({
    super.key,
    required this.chartSample,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Row(
          children: [
            const SizedBox(width: 6),
            Text(
              chartSample.name,
              style: const TextStyle(
                color: AppColors.primary,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            Expanded(child: Container()),
            IconButton(
              onPressed: () => AppUtils().tryToLaunchUrl(chartSample.url),
              icon: const Icon(
                Icons.code,
                color: AppColors.primary,
              ),
              tooltip: 'Source code',
            ),
          ],
        ),
        const SizedBox(height: 2),
        Container(
          decoration: const BoxDecoration(
            color: AppColors.itemsBackground,
            borderRadius:
                BorderRadius.all(Radius.circular(AppDimens.defaultRadius)),
          ),
          child: chartSample.builder(context),
        ),
      ],
    );
  }
}
