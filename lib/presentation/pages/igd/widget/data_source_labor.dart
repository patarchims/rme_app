import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

import '../../../../domain/models/response/pemeriksaan_labor_model.dart';
import '../../../component/component.dart';

class LaborDataSource extends DataGridSource {
  LaborDataSource(
      {required List<PemeriksaanLaborModel> employeeData,
      required BuildContext context}) {
    _employeeData = employeeData
        .asMap()
        .entries
        .map((e) => DataGridRow(cells: [
              DataGridCell<String>(columnName: 'num', value: e.value.num),
              DataGridCell<String>(
                  columnName: 'nama_grup', value: e.value.nameGrup),
              DataGridCell<String>(columnName: 'kode', value: e.value.kode),
              DataGridCell<String>(
                  columnName: 'pemeriksaan', value: e.value.pemeriksaan),
              DataGridCell<int>(columnName: 'tarip', value: e.value.taripKelas),
            ]))
        .toList();
  }

  List<DataGridRow> _employeeData = [];

  @override
  List<DataGridRow> get rows => _employeeData;

  @override
  @override
  DataGridRowAdapter buildRow(
    DataGridRow row,
  ) {
    return DataGridRowAdapter(
      cells: row.getCells().map<Widget>((e) {
        switch (e.columnName) {
          default:
            return Container(
              alignment: Alignment.center,
              padding: const EdgeInsets.all(8.0),
              child: Text(
                e.value.toString(),
                style: whiteCalibriTextStyle.copyWith(fontSize: 7.sp),
              ),
            );
        }
      }).toList(),
    );
  }
}
