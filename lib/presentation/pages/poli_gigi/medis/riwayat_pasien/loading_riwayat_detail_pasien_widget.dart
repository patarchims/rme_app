import 'package:flutter/material.dart';
import 'package:hms_app/domain/models/users/detail_profil_pasien_model.dart';
import 'package:hms_app/presentation/component/fonts/font_helper.dart';
import 'package:hms_app/presentation/pages/poli_gigi/medis/riwayat_pasien/loading_riwayat_pasien_data_source.dart';
import 'package:sizer/sizer.dart';
import 'package:syncfusion_flutter_core/theme.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

class LoadingRiwayatPasienContent extends StatefulWidget {
  const LoadingRiwayatPasienContent({super.key});

  @override
  State<LoadingRiwayatPasienContent> createState() =>
      _LoadingRiwayatPasienContentState();
}

class _LoadingRiwayatPasienContentState
    extends State<LoadingRiwayatPasienContent> {
  late LoadingDataRiwayatPasienSource riwayatPasienSource;
  @override
  void initState() {
    riwayatPasienSource = LoadingDataRiwayatPasienSource(
      employeeData: List.generate(
        10,
        (index) => DetailProfilPasienModel(
            tanggal: "",
            diagnosa: "",
            keluhanUtama: "",
            riwayatSekarang: "",
            riwayatPenyakitKeluarga: "",
            riwayatAlergiDetail: "",
            terapi: "",
            noreg: "",
            noRm: "",
            detailPenmed: [],
            detailLabor: []),
      ),
      context: context,
    );
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SfDataGridTheme(
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
            allowColumnsResizing: false,
            selectionMode: SelectionMode.multiple,
            source: riwayatPasienSource,
            allowSorting: false,
            columnWidthMode: ColumnWidthMode.fill,
            gridLinesVisibility: GridLinesVisibility.both,
            headerGridLinesVisibility: GridLinesVisibility.vertical,
            columns: <GridColumn>[
              gridColumn(name: "no", subTitle: "No"),
              gridColumn(name: "tgl_kunjungan", subTitle: "TANGGAL KUNJUNGAN"),
              gridColumn(name: "diagnosa", subTitle: "DIAGNOSA"),
              gridColumn(name: "keluhan_utama", subTitle: "Keluhan Utama"),
              gridColumn(
                  name: "radiologi", subTitle: "HASIl PEMERIKSAAN RADIOLOGI"),
              gridColumn(
                  name: "labor", subTitle: "HASIL PEMERIKSAAN LABORATORIUM"),
              gridColumn(name: "copy", subTitle: "Copy"),
            ]));
  }

  GridColumn gridColumn({required String name, required String subTitle}) {
    return GridColumn(
        autoFitPadding: EdgeInsets.zero,
        columnName: name,
        label: Container(
            height: 50.sp,
            padding: EdgeInsets.symmetric(vertical: 2.sp),
            alignment: Alignment.center,
            child: Text(
              subTitle,
              textAlign: TextAlign.center,
              style: blackCalibriTextStyle,
            )));
  }
}
