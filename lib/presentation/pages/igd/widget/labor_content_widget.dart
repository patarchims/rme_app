import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:hms_app/domain/models/response/pemeriksaan_labor_model.dart';
import 'package:hms_app/presentation/component/component.dart';
import 'package:hms_app/presentation/pages/igd/widget/data_source_labor.dart';
import 'package:sizer/sizer.dart';
import 'package:syncfusion_flutter_core/theme.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

class LaborContentWidget extends StatefulWidget {
  const LaborContentWidget({super.key});

  @override
  State<LaborContentWidget> createState() => _LaborContentWidgetState();
}

class _LaborContentWidgetState extends State<LaborContentWidget> {
  late LaborDataSource laborDataSource;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // ignore: no_leading_underscores_for_local_identifiers
    Widget _getWidgetForStackedHeaderCell(String title) {
      return Container(
          color: Colors.white.withOpacity(0.6),
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          alignment: Alignment.center,
          child: Text(
            title,
            style: blackCalibriTextStyle,
          ));
    }

    // ignore: no_leading_underscores_for_local_identifiers
    List<StackedHeaderRow> _getStackedHeaderRows() {
      List<StackedHeaderRow> stackedHeaderRows;
      stackedHeaderRows = <StackedHeaderRow>[
        StackedHeaderRow(cells: <StackedHeaderCell>[
          StackedHeaderCell(
              columnNames: <String>['nama_grup', 'kode', 'pemeriksaan'],
              child: _getWidgetForStackedHeaderCell(
                  'Detail Grup Pemeriksaan Laboratorium Terpilih')),
        ])
      ];
      return stackedHeaderRows;
    }

    List<PemeriksaanLaborModel> result = [
      PemeriksaanLaborModel(
          num: "num",
          nameGrup: "nameGrup",
          kode: "kode",
          pemeriksaan: "pemeriksaan",
          taripKelas: 1000),
      PemeriksaanLaborModel(
          num: "num",
          nameGrup: "nameGrup",
          kode: "kode",
          pemeriksaan: "pemeriksaan",
          taripKelas: 1000)
    ];

    laborDataSource = LaborDataSource(employeeData: result, context: context);

    return ClipRRect(
      borderRadius: BorderRadius.circular(4.sp),
      child: SfDataGridTheme(
        data: SfDataGridThemeData(
            filterIconHoverColor: Colors.white,
            rowHoverColor: Colors.white.withOpacity(0.3),
            gridLineColor: Colors.white.withOpacity(0.6),
            selectionColor: Colors.white.withOpacity(0.2),
            sortOrderNumberBackgroundColor: Colors.white,
            headerColor: Colors.white.withOpacity(0.6),
            headerHoverColor: Colors.transparent,
            columnResizeIndicatorColor: Colors.white),
        child: SfDataGrid(
          navigationMode: GridNavigationMode.cell,
          selectionMode: SelectionMode.single,
          allowSorting: false,
          onCellSecondaryTap: ((details) {
            log(details.toString());
          }),
          onCellTap: ((detail) {
            if (detail.rowColumnIndex.rowIndex != 0) {}
          }),
          gridLinesVisibility: GridLinesVisibility.both,
          headerGridLinesVisibility: GridLinesVisibility.both,
          source: laborDataSource,
          columnWidthMode: ColumnWidthMode.fill,
          stackedHeaderRows: _getStackedHeaderRows(),
          columns: <GridColumn>[
            gridColumn(name: "num", subTitle: "Num."),
            gridColumn(name: "nama_grup", subTitle: "Nama Grup"),
            gridColumn(name: "kode", subTitle: "Kode"),
            gridColumn(name: "pemeriksaan", subTitle: "Pemeriksaan"),
            gridColumn(name: "tarip", subTitle: "Tarip Kelas Rajal"),
          ],
        ),
      ),
    );
  }

  GridColumn gridColumn({required String name, required String subTitle}) {
    return GridColumn(
        minimumWidth: 20.sp,
        autoFitPadding: EdgeInsets.zero,
        columnName: name,
        label: Container(
            padding: const EdgeInsets.all(8.0),
            alignment: Alignment.center,
            child: Text(
              subTitle,
              style: blackCalibriTextStyle,
            )));
  }
}
