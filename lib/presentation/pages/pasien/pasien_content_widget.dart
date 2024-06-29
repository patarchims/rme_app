import 'package:animate_gradient/animate_gradient.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:hms_app/domain/bloc/dashboard/pasien/pasien_bloc.dart';
import 'package:hms_app/domain/bloc/user/auth/auth_bloc.dart';
import 'package:hms_app/domain/models/response/list_antrean_model_response.dart';
import 'package:hms_app/presentation/component/color/color_helper.dart';
import 'package:hms_app/presentation/component/fonts/font_helper.dart';
import 'package:hms_app/presentation/component/shimer/shimer_loading.dart';
import 'package:hms_app/presentation/pages/asesmen/menu_asesmen.dart';
import 'package:hms_app/presentation/pages/pasien/data_source_pasien.dart';
import 'package:hms_app/presentation/screens/disconect_screenn.dart';
import 'package:hms_app/presentation/screens/emty_page.dart';
import 'package:sizer/sizer.dart';
import 'package:syncfusion_flutter_core/theme.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

class PasienContentWidget extends StatefulWidget {
  const PasienContentWidget({super.key});

  @override
  State<PasienContentWidget> createState() => _PasienContentWidgetState();
}

class _PasienContentWidgetState extends State<PasienContentWidget> {
  late PasienDataSource employeeDataSource;

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

    return BlocConsumer<PasienBloc, PasienState>(
      listener: (context, state) {},
      builder: (context, state) {
        if (state.loadingPasien) {
          return SizedBox(
            height: Get.height,
            width: Get.width,
            child: ShimerLoading.loadingExpandCard(),
          );
        }

        return state.failOrSuccessResult.fold(
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
                    orElse: () => Container(),
                    emty: (value) =>
                        const EmtyScren(subTitle: "Data tidak ditemukan"),
                    loaded: (e) {
                      // ============================================ //
                      List<AntreanPasienModel> result =
                          (e.value['response']["list"] as Iterable)
                              .map((e) => AntreanPasienModel.fromMap(e))
                              .toList();

                      context
                          .read<PasienBloc>()
                          .add(PasienEvent.addPasien(antreanPasien: result));

                      employeeDataSource = PasienDataSource(
                          employeeData: result, context: context);

                      return SizedBox(
                        height: Get.height,
                        width: Get.width,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(4.sp),
                          child: AnimateGradient(
                            primaryBeginGeometry:
                                const AlignmentDirectional(0, 1),
                            primaryEndGeometry:
                                const AlignmentDirectional(0, 2),
                            secondaryBeginGeometry:
                                const AlignmentDirectional(2, 0),
                            secondaryEndGeometry:
                                const AlignmentDirectional(0, -0.8),
                            primaryColors: [
                              ThemeColor.primaryColor.withOpacity(0.5),
                              Colors.blueAccent.withOpacity(0.5),
                              Colors.white.withOpacity(0.2),
                            ],
                            secondaryColors: [
                              ThemeColor.primaryColor.withOpacity(0.2),
                              Colors.blueAccent.withOpacity(0.2),
                              Colors.white.withOpacity(0.4),
                            ],
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
                                rowHeight: 25.sp,
                                shrinkWrapRows: true,
                                navigationMode: GridNavigationMode.cell,
                                selectionMode: SelectionMode.single,
                                allowSorting: false,
                                onCellSecondaryTap: ((details) {
                                  // log(details.toString());
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
                                  ...[
                                    if (authState is Authenticated) ...[
                                      if (authState.user.poliklinik ==
                                          Poliklinik.bangsal) ...[
                                        gridColumn(
                                            name: "antrean", subTitle: "Kamar"),
                                      ],
                                      if (authState.user.poliklinik !=
                                          Poliklinik.bangsal) ...[
                                        gridColumn(
                                            name: "antrean",
                                            subTitle: "Antrean"),
                                      ]
                                    ],
                                    if (authState is Unauthenticated) ...[
                                      gridColumn(
                                          name: "antrean", subTitle: "Antrean"),
                                    ]
                                  ],
                                  gridColumn(name: "mrn", subTitle: "M.R.N/ID"),
                                  gridColumn(name: "nama", subTitle: "NAMA"),
                                  gridColumn(
                                      name: "debitur", subTitle: "DEBITUR"),
                                  gridColumn(name: "dpjp", subTitle: "DPJP"),
                                  gridColumn(name: "soap", subTitle: "ASESMEN"),
                                ],
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                    auAutorized: (e) => Container())));
      },
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
                            ? 50.sp
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
