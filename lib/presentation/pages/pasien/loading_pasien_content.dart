import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hms_app/domain/bloc/user/auth/auth_bloc.dart';
import 'package:hms_app/domain/models/response/list_antrean_model_response.dart';
import 'package:hms_app/presentation/component/fonts/font_helper.dart';
import 'package:hms_app/presentation/pages/asesmen/menu_asesmen.dart';
import 'package:hms_app/presentation/pages/pasien/employe_data_source.dart';
import 'package:sizer/sizer.dart';
import 'package:syncfusion_flutter_core/theme.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

import '../../../domain/bloc/dashboard/pasien/pasien_bloc.dart';

class LoadingPasienContent extends StatefulWidget {
  const LoadingPasienContent({super.key});

  @override
  State<LoadingPasienContent> createState() => _LoadingPasienContentState();
}

class _LoadingPasienContentState extends State<LoadingPasienContent> {
  late EmployeeDataSource employeeDataSource;

  @override
  void initState() {
    employeeDataSource = EmployeeDataSource(
      employeeData: List.generate(
        10,
        (index) => const AntreanPasienModel(
            kamar: "",
            kasur: "",
            kelas: "",
            umur: "",
            kdKelas: "",
            usia: 0,
            tglLahir: "",
            jenisKelamin: "",
            kdBagian: "",
            noAntrean: "",
            debitur: "",
            kdDebitur: "",
            noreg: "",
            regType: "",
            mrn: "",
            status: "",
            keterangan: "",
            proses: "",
            namaPasien: "",
            bagian: "",
            pelayanan: "",
            kdDokter: "",
            namaDokter: ""),
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
    // ignore: no_leading_underscores_for_local_identifiers
    AuthState authState = context.watch<AuthBloc>().state;
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

    // ignore: no_leading_underscores_for_local_identifiers
    List<StackedHeaderRow> _getStackedHeaderRows() {
      List<StackedHeaderRow> stackedHeaderRows;
      stackedHeaderRows = <StackedHeaderRow>[
        StackedHeaderRow(cells: <StackedHeaderCell>[
          StackedHeaderCell(columnNames: <String>[
            'antrean',
            'mrn',
            'nama',
            'debitur',
            'dpjp'
          ], child: getWidgetForStackedHeaderCell('PROFIL PASIEN')),
          StackedHeaderCell(
              columnNames: <String>['s', 'o', 'a', 'p'],
              child: getWidgetForStackedHeaderCell('SOAP CONCEPT')),
        ])
      ];
      return stackedHeaderRows;
    }

    return ClipRRect(
      borderRadius: BorderRadius.circular(4.sp),
      child: SfDataGridTheme(
        data: SfDataGridThemeData(
            filterIconHoverColor: Colors.white,
            rowHoverColor: Colors.white,
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
            // log(details.toString());
          }),
          onCellTap: ((detail) {
            if (detail.rowColumnIndex.rowIndex != 0) {
              int selectedRowIndex = detail.rowColumnIndex.rowIndex - 2;

              log(selectedRowIndex.toString());
              var row =
                  employeeDataSource.effectiveRows.elementAt(selectedRowIndex);

              String noRM = row.getCells()[2].value.toString();

              context
                  .read<PasienBloc>()
                  .add(PasienEvent.getDetailPasien(noRM: noRM));
            }
          }),
          gridLinesVisibility: GridLinesVisibility.both,
          headerGridLinesVisibility: GridLinesVisibility.both,
          source: employeeDataSource,
          columnWidthMode: ColumnWidthMode.fill,
          stackedHeaderRows: _getStackedHeaderRows(),
          columns: <GridColumn>[
            gridColumn(name: "no", subTitle: "NO"),
            ...[
              if (authState is Authenticated) ...[
                if (authState.user.poliklinik == Poliklinik.bangsal) ...[
                  gridColumn(name: "antrean", subTitle: "Kamar"),
                ],
                if (authState.user.poliklinik != Poliklinik.bangsal) ...[
                  gridColumn(name: "antrean", subTitle: "Antrean"),
                ],
                if (authState is Unauthenticated) ...[
                  gridColumn(name: "antrean", subTitle: "Antrean"),
                ]
              ]
            ],
            gridColumn(name: "mrn", subTitle: "M.R.N/ID"),
            gridColumn(name: "nama", subTitle: "NAMA"),
            gridColumn(name: "debitur", subTitle: "DEBITUR"),
            gridColumn(name: "dpjp", subTitle: "DPJP"),
            gridColumn(name: "soap", subTitle: "ASESMEN"),
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
                    ? 30.sp
                    : (name == "dpjp")
                        ? 115.sp
                        : (name == "s" ||
                                name == "o" ||
                                name == "a" ||
                                name == "p")
                            ? 30.sp
                            : (name == "antrean")
                                ? 40.sp
                                : (name == "mrn")
                                    ? 40.sp
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
