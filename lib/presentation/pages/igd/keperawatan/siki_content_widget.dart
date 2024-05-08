import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hms_app/domain/bloc/dashboard/asesmen_keperawatan_bidan/asesmen_keperawatan_bidan_bloc.dart';
import 'package:hms_app/domain/models/response/siki_model.dart';
import 'package:hms_app/presentation/component/component.dart';
import 'package:hms_app/presentation/pages/igd/keperawatan/data_source_siki.dart';
import 'package:sizer/sizer.dart';
import 'package:syncfusion_flutter_core/theme.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

class SikiContentWidget extends StatefulWidget {
  const SikiContentWidget({super.key});

  @override
  State<SikiContentWidget> createState() => _PasienContentWidgetState();
}

class _PasienContentWidgetState extends State<SikiContentWidget> {
  late SikiDataSource sikiDataSource;

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
    return BlocConsumer<AsesmenKeperawatanBidanBloc,
        AsesmenKeperawatanBidanState>(
      listener: (context, state) {},
      builder: (context, state) {
        if (state.isLoadingGetSIKI) {
          return SizedBox(
            height: 55.sp,
            child: CircularProgressIndicator(
                color: ThemeColor.primaryColor, strokeWidth: 4.sp),
          );
        }
        return state.getFailOrSuccessCariSiki.fold(
            () => Container(),
            (a) => a.fold(
                (l) => Container(),
                (r) => r.maybeMap(orElse: () {
                      return Container();
                    }, loaded: (e) {
                      //  PARSING
                      //  SIKI MODEL
                      List<SikiModel> result = (e.value["response"] as Iterable)
                          .map((e) => SikiModel.fromMap(e))
                          .toList();

                      sikiDataSource = SikiDataSource(
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
                              columnResizeIndicatorColor: Colors.white),
                          child: SfDataGrid(
                            shrinkWrapRows: true,
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
                            source: sikiDataSource,
                            columnWidthMode: ColumnWidthMode.fill,
                            columns: <GridColumn>[
                              gridColumn(name: "no", subTitle: "NO"),
                              gridColumn(name: "kode", subTitle: "Kode Siki"),
                              gridColumn(name: "judul", subTitle: "Judul"),
                              gridColumn(
                                  name: "detail",
                                  subTitle: "Detail Intervensi"),
                              gridColumn(name: "pilih", subTitle: "Pilih Data"),
                            ],
                          ),
                        ),
                      );
                    })));
      },
    );
  }

  GridColumn gridColumn({required String name, required String subTitle}) {
    return GridColumn(
        width: (name == "no")
            ? 30.sp
            : (name == "kode")
                ? 80.sp
                : 110.sp,
        minimumWidth: 20.sp,
        autoFitPadding: EdgeInsets.zero,
        columnName: name,
        label: Container(
            padding: const EdgeInsets.all(8.0),
            alignment: Alignment.center,
            child: Text(
              subTitle,
              style:
                  blackCalibriTextStyle.copyWith(fontWeight: FontWeight.bold),
            )));
  }
}
