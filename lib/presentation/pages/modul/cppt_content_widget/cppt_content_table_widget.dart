import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:hms_app/domain/bloc/dashboard/cppt/cppt_bloc.dart';
import 'package:hms_app/domain/models/response/list_cppt_pasien_model_response.dart';
import 'package:hms_app/presentation/component/component.dart';
import 'package:hms_app/presentation/pages/modul/cppt_content_widget/data_source_pasien.dart';
import 'package:hms_app/presentation/screens/disconect_screenn.dart';
import 'package:hms_app/presentation/screens/emty_page.dart';
import 'package:sizer/sizer.dart';
import 'package:syncfusion_flutter_core/theme.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

import '../../../component/shimer/shimer_loading.dart';

class CPPTContentTableWidget extends StatefulWidget {
  const CPPTContentTableWidget({super.key});

  @override
  State<CPPTContentTableWidget> createState() => _CPPTContentTableWidgetState();
}

class _CPPTContentTableWidgetState extends State<CPPTContentTableWidget> {
  late CPPTDataSource employeeDataSource;

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
              columnNames: <String>['sub', 'obj', 'ases', 'plan', 'instruksi'],
              child: _getWidgetForStackedHeaderCell(
                  'CATATAN PERKEMBANGAN PASIEN TERINTEGRASI (CPPT)')),
          StackedHeaderCell(
              columnNames: <String>['ppa'],
              child: _getWidgetForStackedHeaderCell('PPA')),
        ])
      ];
      return stackedHeaderRows;
    }

    return BlocBuilder<CpptBloc, CpptState>(
      builder: (context, state) {
        if (state.isLoadingCPPT) {
          return SizedBox(
            height: Get.height,
            width: Get.width,
            child: ShimerLoading.loadingCard(),
          );
        }

        return state.getResult.fold(
            () => Container(),
            (a) => a.fold(
                (l) => l.maybeMap(
                      orElse: () => const DisconectWidget(
                          networkResponse: NetworkResponse.badRequest),
                      badResponse: (e) => const DisconectWidget(
                          networkResponse: NetworkResponse.badRequest),
                      connectionTimeOut: (e) => const DisconectWidget(
                          networkResponse: NetworkResponse.timeOut),
                      disconectToServer: (e) => const DisconectWidget(
                          networkResponse: NetworkResponse.noConnection),
                      failure: (e) => const DisconectWidget(
                          networkResponse: NetworkResponse.failed),
                      noConnection: (e) => const DisconectWidget(
                          networkResponse: NetworkResponse.noConnection),
                    ),
                (r) => r.maybeMap(
                      orElse: () => Text(
                        "Or Else",
                        style: blackTextStyle,
                      ),
                      loaded: (e) {
                        List<CpptPasienModel> result =
                            (e.value['response']["cppt"] as Iterable)
                                .map((e) => CpptPasienModel.fromJson(e))
                                .toList();

                        employeeDataSource = CPPTDataSource(
                            employeeData: result, context: context);

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
                              columnResizeIndicatorColor: Colors.white,
                            ),
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
                              headerGridLinesVisibility:
                                  GridLinesVisibility.both,
                              source: employeeDataSource,
                              columnWidthMode: ColumnWidthMode.fill,
                              stackedHeaderRows: _getStackedHeaderRows(),
                              columns: <GridColumn>[
                                gridColumn(name: "no", subTitle: "NO"),
                                gridColumn(name: "bagian", subTitle: "BAGIAN"),
                                gridColumn(
                                    name: "tanggal", subTitle: "TANGGAL"),
                                // PADA ASESMEN, LAKUKAN METHOD CARI BERDASARKAN LOGIN TERTENTU instruksi
                                gridColumn(name: "sub", subTitle: "SUBJEKTIF"),
                                gridColumn(name: "obj", subTitle: "OBJEKTIF"),
                                gridColumn(name: "ases", subTitle: "ASESMEN"),
                                gridColumn(name: "plan", subTitle: "PLAN"),
                                gridColumn(
                                    name: "instruksi", subTitle: "INSTRUKSI"),
                                gridColumn(name: "pa", subTitle: "PPA"),
                                gridColumn(name: "action", subTitle: "ACTION"),
                              ],
                            ),
                          ),
                        );
                      },
                      emty: (value) => EmtyScren(
                          subTitle: "Data tidak ditemukan",
                          textStyle: blackTextStyle),
                    )));

        //===============
      },
    );
  }

  GridColumn gridColumn({required String name, required String subTitle}) {
    return GridColumn(
        width: (name == "no")
            ? 20.sp
            : (name == "bagian")
                ? 35.sp
                : (name == "tanggal")
                    ? 40.sp
                    : (name == "dpjp")
                        ? 115.sp
                        : (name == "plan")
                            ? 35.sp
                            : (name == "soap")
                                ? 100.sp
                                : (name == "instruksi")
                                    ? 35.sp
                                    : (name == "pa")
                                        ? 20.sp
                                        : (name == "action")
                                            ? 60.sp
                                            : 40.sp,
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
