import 'package:flutter/material.dart';
import 'package:hms_app/domain/models/users/detail_profil_pasien_model.dart';
import 'package:hms_app/presentation/component/shimer/shimer_loading.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

class LoadingDataRiwayatPasienSource extends DataGridSource {
  LoadingDataRiwayatPasienSource(
      {required List<DetailProfilPasienModel> employeeData,
      required BuildContext context}) {
    _employeeData = employeeData
        .asMap()
        .entries
        .map((e) => DataGridRow(cells: [
              DataGridCell<int>(columnName: 'no', value: e.key + 1),
              DataGridCell<String>(
                  columnName: 'tgl_kunjungan', value: e.value.tanggal),
              DataGridCell<String>(
                  columnName: 'diagnosa', value: e.value.diagnosa),
              DataGridCell<String>(
                  columnName: 'keluhan_utama', value: e.value.keluhanUtama),
              const DataGridCell<String>(columnName: 'labor', value: ""),
              const DataGridCell<String>(columnName: 'radiologi', value: ""),
              const DataGridCell<String>(columnName: 'copy', value: ""),
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
        return ShimerLoading.loadingTextField();
      }).toList(),
    );
  }
}
