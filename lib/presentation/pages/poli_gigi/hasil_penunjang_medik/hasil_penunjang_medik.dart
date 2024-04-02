import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hms_app/presentation/pages/poli_gigi/hasil_penunjang_medik/emty_penunjang_medik_content.dart';
import 'package:hms_app/presentation/pages/poli_gigi/hasil_penunjang_medik/loading_penunjang_medik_content.dart';
import 'package:hms_app/presentation/pages/poli_gigi/hasil_penunjang_medik/penunjang_medik_data_source.dart';
import 'package:sizer/sizer.dart';
import 'package:syncfusion_flutter_core/theme.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';
import 'package:hms_app/domain/bloc/asesmen/penunjang_medik/penunjang_medik_bloc.dart';
import 'package:hms_app/presentation/component/fonts/font_helper.dart';

// TAMPILKAN TABLE HASIL PENUNJANG MEDIK
class HasilPenunjangMedikWidget extends StatefulWidget {
  const HasilPenunjangMedikWidget({
    super.key,
  });

  @override
  State<HasilPenunjangMedikWidget> createState() =>
      _HasilPenunjangMedikWidgetState();
}

class _HasilPenunjangMedikWidgetState extends State<HasilPenunjangMedikWidget> {
  late PenunjangMedikDataSource employeeDataSource;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PenunjangMedikBloc, PenunjangMedikState>(
      builder: (context, state) {
        employeeDataSource = PenunjangMedikDataSource(
          employeeData: state.penunjangMedik,
          context: context,
        );

        if (state is LoadingState) {
          return const LoadingPenunjangMedikContent();
        }

        if (employeeDataSource.rows.isEmpty) {
          return const EmtyPenunjangMedikContent();
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
                navigationMode: GridNavigationMode.cell,
                selectionMode: SelectionMode.single,
                source: employeeDataSource,
                allowSorting: false,
                columnWidthMode: ColumnWidthMode.fill,
                gridLinesVisibility: GridLinesVisibility.both,
                headerGridLinesVisibility: GridLinesVisibility.both,
                columns: <GridColumn>[
                  gridColumn(name: "no", subTitle: "No"),
                  gridColumn(name: "pelayanan", subTitle: "Asal Pelayanan"),
                  gridColumn(name: "penmed", subTitle: "No Pemeriksaan"),
                  gridColumn(name: "penunjang", subTitle: "Penunjang Medik"),
                  gridColumn(name: "uraian", subTitle: "Uraian"),
                  gridColumn(name: "hasil", subTitle: "Hasil"),
                ]));
      },
    );
  }

  GridColumn gridColumn({required String name, required String subTitle}) {
    return GridColumn(
        width: (name == "no")
            ? 20.sp
            : (name == "pelayanan")
                ? 60.sp
                : (name == "penmed")
                    ? 75.sp
                    : (name == "penunjang")
                        ? 75.sp
                        : 100.sp,
        minimumWidth: 20.sp,
        autoFitPadding: EdgeInsets.zero,
        columnName: name,
        label: Container(
            padding: EdgeInsets.all(8.0),
            alignment: Alignment.center,
            child: Text(
              subTitle,
              style: blackCalibriTextStyle,
            )));
  }
}
