import 'package:hms_app/presentation/kebidanan/presentation/resources/app_asests.dart';
import 'package:hms_app/presentation/kebidanan/presentation/util/urls.dart';

enum ChartType { line, bar, pie, scatter, radar }

extension ChartTypeExtension on ChartType {
  String get displayName => '$simpleName Chart';

  String get simpleName => switch (this) {
        ChartType.line => 'Line',
        ChartType.bar => 'Bar',
        ChartType.pie => 'Pie',
        ChartType.scatter => 'Scatter',
        ChartType.radar => 'Radar',
      };

  String get documentationUrl => Urls.getChartDocumentationUrl(this);

  String get assetIcon => AppAssets.getChartIcon(this);
}
