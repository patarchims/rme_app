import 'package:flutter/material.dart';
import 'package:hms_app/domain/models/soap/medis/hasil_penunjang_medik_model.dart';
import 'package:hms_app/presentation/component/fonts/font_helper.dart';
import 'package:sizer/sizer.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

class PenunjangMedikDataSource extends DataGridSource {
  PenunjangMedikDataSource(
      {required List<PenunjangMedikModel> employeeData,
      required BuildContext context}) {
    _employeeData = employeeData
        .asMap()
        .entries
        .map((e) => DataGridRow(cells: [
              DataGridCell<int>(columnName: 'no', value: e.key + 1),
              DataGridCell<String>(
                  columnName: 'pelayanan', value: e.value.asalPelayanan),
              DataGridCell<String>(columnName: 'penmed', value: e.value.penmed),
              DataGridCell<String>(
                  columnName: 'penunjang',
                  value: e.value.kdPelayanan.pelayanan),
              DataGridCell<String>(columnName: 'uraian', value: e.value.uraian),
              DataGridCell<String>(columnName: 'hasil', value: e.value.hasil),
            ]))
        .toList();
  }

  List<DataGridRow> _employeeData = [];

  @override
  List<DataGridRow> get rows => _employeeData;

  @override
  DataGridRowAdapter buildRow(
    DataGridRow row,
  ) {
    return DataGridRowAdapter(
      cells: row.getCells().map<Widget>((e) {
        return Center(
          child: Text(
            e.value.toString(),
            style: blackTextStyle.copyWith(fontSize: 6.sp),
          ),
        );
      }).toList(),
    );
  }
}
