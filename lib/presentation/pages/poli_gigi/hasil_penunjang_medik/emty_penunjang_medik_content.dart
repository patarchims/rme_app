import 'package:flutter/material.dart';
import 'package:hms_app/domain/models/soap/medis/hasil_penunjang_medik_model.dart';
import 'package:hms_app/presentation/component/fonts/font_helper.dart';
import 'package:hms_app/presentation/pages/poli_gigi/hasil_penunjang_medik/penunjang_medik_data_emty.dart';
import 'package:sizer/sizer.dart';
import 'package:syncfusion_flutter_core/theme.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

class EmtyPenunjangMedikContent extends StatefulWidget {
  const EmtyPenunjangMedikContent({super.key});

  @override
  State<EmtyPenunjangMedikContent> createState() => _EmtyPasienContentState();
}

class _EmtyPasienContentState extends State<EmtyPenunjangMedikContent> {
  late PenunjangMedikDataSourceEmty employeeDataSource;

  @override
  void initState() {
    employeeDataSource = PenunjangMedikDataSourceEmty(
      employeeData: List.generate(
        1,
        (index) => PenunjangMedikModel(
            asalPelayanan: "",
            catatan: "",
            hasil: "",
            kdPelayanan: KdPelayanan(bagian: "", kdBagian: "", pelayanan: ""),
            kodePenunjang: "",
            penmed: "",
            uraian: ""),
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
        onCellSecondaryTap: ((details) {}),
        onCellTap: ((detail) {}),
        gridLinesVisibility: GridLinesVisibility.both,
        headerGridLinesVisibility: GridLinesVisibility.both,
        source: employeeDataSource,
        columnWidthMode: ColumnWidthMode.fill,
        columns: <GridColumn>[
          gridColumn(name: "no", subTitle: "No"),
          gridColumn(name: "pelayanan", subTitle: "Asal Pelayanan"),
          gridColumn(name: "penmed", subTitle: "No Pemeriksaan"),
          gridColumn(name: "penunjang", subTitle: "Penunjang Medik"),
          gridColumn(name: "uraian", subTitle: "Uraian"),
          gridColumn(name: "hasil", subTitle: "Hasil"),
        ],
      ),
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
            padding: const EdgeInsets.all(8.0),
            alignment: Alignment.center,
            child: Text(
              subTitle,
              style: blackCalibriTextStyle,
            )));
  }
}
