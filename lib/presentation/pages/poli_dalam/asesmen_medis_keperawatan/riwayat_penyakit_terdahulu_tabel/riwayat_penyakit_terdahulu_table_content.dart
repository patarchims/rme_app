import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:hms_app/presentation/pages/poli_dalam/asesmen_medis_keperawatan/riwayat_penyakit_terdahulu_tabel/data_source_tanda_vital.dart';
import 'package:sizer/sizer.dart';
import 'package:syncfusion_flutter_core/theme.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';
import '../../../../component/component.dart';

class RiwayatPenyakitTerdahuluTableContent extends StatefulWidget {
  const RiwayatPenyakitTerdahuluTableContent({super.key});

  @override
  State<RiwayatPenyakitTerdahuluTableContent> createState() =>
      _RiwayatPenyakitTerdahuluTableContentState();
}

class _RiwayatPenyakitTerdahuluTableContentState
    extends State<RiwayatPenyakitTerdahuluTableContent> {
  late TandaVitalSource tandaVitalSource;

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
    Widget getWidgetForStackedHeaderCell(String title) {
      return Container(
          color: Colors.white.withOpacity(0.6),
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          alignment: Alignment.center,
          child: Text(
            title,
            style: blackCalibriTextStyle,
          ));
    }

    List<StackedHeaderRow> getStackedHeaderRows() {
      List<StackedHeaderRow> stackedHeaderRows;
      stackedHeaderRows = <StackedHeaderRow>[
        StackedHeaderRow(cells: <StackedHeaderCell>[
          StackedHeaderCell(columnNames: <String>[
            'riwayat',
            'obat',
            'makanan',
            'lainnya',
          ], child: getWidgetForStackedHeaderCell('RIWAYAT PASIEN')),
        ])
      ];
      return stackedHeaderRows;
    }

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
          source: tandaVitalSource,
          columnWidthMode: ColumnWidthMode.fill,
          stackedHeaderRows: getStackedHeaderRows(),
          columns: <GridColumn>[
            gridColumn(name: "no", subTitle: "NO"),
            gridColumn(name: "riwayat", subTitle: "Riwayat Penyakit Terdahulu"),
            gridColumn(name: "obat", subTitle: "Alergi Obat"),
            gridColumn(name: "makanan", subTitle: "Alergi Makanan"),
            gridColumn(name: "lainnya", subTitle: "Alergi Lainnya"),
          ],
        ),
      ),
    );
  }

  GridColumn gridColumn({required String name, required String subTitle}) {
    return GridColumn(
        width: (name == "no")
            ? 20.sp
            : (name == "nama")
                ? 73.sp
                : (name == "debitur")
                    ? 50.sp
                    : (name == "dpjp")
                        ? 115.sp
                        : (name == "soap")
                            ? 100.sp
                            : (name == "antrean")
                                ? 40.sp
                                : (name == "mrn")
                                    ? 50.sp
                                    : 50.sp,
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
