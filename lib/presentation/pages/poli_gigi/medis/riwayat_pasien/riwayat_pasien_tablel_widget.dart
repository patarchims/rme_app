import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hms_app/domain/bloc/dashboard/pasien/pasien_bloc.dart';
import 'package:hms_app/domain/models/users/detail_profil_pasien_model.dart';
import 'package:hms_app/presentation/pages/poli_gigi/medis/riwayat_pasien/loading_riwayat_detail_pasien_widget.dart';
import 'package:hms_app/presentation/pages/poli_gigi/medis/riwayat_pasien/riwayat_pasien_data_source.dart';
import 'package:hms_app/presentation/screens/emty_page.dart';
import 'package:sizer/sizer.dart';
import 'package:syncfusion_flutter_core/theme.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';
import '../../../../component/component.dart';

class RiwayatPasienTabelWidget extends StatefulWidget {
  const RiwayatPasienTabelWidget({super.key});

  @override
  State<RiwayatPasienTabelWidget> createState() =>
      _RiwayatPasienTabelWidgetState();
}

class _RiwayatPasienTabelWidgetState extends State<RiwayatPasienTabelWidget> {
  late RiwayatPasienDataSource riwayatPasienDataSource;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PasienBloc, PasienState>(
      builder: (context, state) {
        if (state.loadingDetailRiwayatPasien) {
          return const LoadingRiwayatPasienContent();
        }
        return state.getDetailPasien.fold(
            () => EmtyScren(
                subTitle: "Riwayat pasien tidak ditemukan", size: 125.sp),
            (a) => a.fold(
                (l) => l.maybeMap(
                    orElse: () => EmtyScren(
                        subTitle: "Riwayat pasien tidak ditemukan",
                        size: 125.sp)),
                (r) => r.maybeMap(
                    orElse: () => EmtyScren(
                        subTitle: "Riwayat pasien tidak ditemukan",
                        size: 125.sp),
                    emty: (e) => EmtyScren(
                        subTitle: "Riwayat pasien tidak ditemukan",
                        size: 125.sp),
                    loaded: (e) {
                      // ============
                      List<DetailProfilPasienModel> result =
                          (e.value['response'] as Iterable)
                              .map((e) => DetailProfilPasienModel.fromMap(e))
                              .toList();

                      if (result.isEmpty) {
                        riwayatPasienDataSource = RiwayatPasienDataSource(
                            employeeData: [], context: context);
                      }

                      if (result.isNotEmpty) {
                        riwayatPasienDataSource = RiwayatPasienDataSource(
                            employeeData: result, context: context);

                        context.read<PasienBloc>().add(
                            PasienEvent.addRiwayatPasien(
                                detailProfilePasien: result));
                      }

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
                              footer: Container(
                                  color: Colors.grey[400],
                                  child: const Center(
                                      child: Text(
                                    'FOOTER VIEW',
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  ))),
                              navigationMode: GridNavigationMode.cell,
                              allowColumnsResizing: false,
                              selectionMode: SelectionMode.multiple,
                              source: riwayatPasienDataSource,
                              allowSorting: false,
                              columnWidthMode: ColumnWidthMode.fill,
                              gridLinesVisibility: GridLinesVisibility.both,
                              headerGridLinesVisibility:
                                  GridLinesVisibility.vertical,
                              columns: <GridColumn>[
                                gridColumn(name: "no", subTitle: "No"),
                                gridColumn(
                                    name: "tgl_kunjungan",
                                    subTitle: "TANGGAL KUNJUNGAN"),
                                gridColumn(
                                    name: "diagnosa", subTitle: "DIAGNOSA"),
                                gridColumn(
                                    name: "keluhan_utama",
                                    subTitle: "Keluhan Utama"),
                                gridColumn(
                                    name: "radiologi",
                                    subTitle: "HASIl PEMERIKSAAN RADIOLOGI"),
                                gridColumn(
                                    name: "labor",
                                    subTitle: "HASIL PEMERIKSAAN LABORATORIUM"),
                                gridColumn(name: "copy", subTitle: "Copy"),
                              ]));
                    })));
      },
    );
  }

  GridColumn gridColumn({required String name, required String subTitle}) {
    return GridColumn(
        autoFitPadding: EdgeInsets.zero,
        columnName: name,
        label: Container(
            height: 150.sp,
            padding: const EdgeInsets.all(2),
            alignment: Alignment.center,
            child: Text(
              subTitle,
              textAlign: TextAlign.center,
              style: blackCalibriTextStyle,
            )));
  }
}
