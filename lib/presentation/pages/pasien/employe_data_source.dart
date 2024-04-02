import 'package:flutter/material.dart';
import 'package:hms_app/domain/models/response/list_antrean_model_response.dart';
import 'package:hms_app/presentation/component/shimer/shimer_loading.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

class EmployeeDataSource extends DataGridSource {
  EmployeeDataSource(
      {required List<AntreanPasienModel> employeeData,
      required BuildContext context}) {
    _employeeData = employeeData
        .asMap()
        .entries
        .map((e) => DataGridRow(cells: [
              DataGridCell<int>(columnName: 'no', value: e.key + 1),
              DataGridCell<String>(
                  columnName: 'antrean', value: e.value.noAntrean),
              DataGridCell<String>(columnName: 'mrn', value: e.value.mrn),
              DataGridCell<String>(
                  columnName: 'nama', value: e.value.namaPasien),
              DataGridCell<String>(
                  columnName: 'debitur', value: e.value.kdDebitur),
              DataGridCell<String>(
                  columnName: 'dpjp', value: e.value.namaDokter),
              const DataGridCell<String>(columnName: 's', value: "S"),
              const DataGridCell<String>(columnName: 'o', value: "O"),
              const DataGridCell<String>(columnName: 'a', value: "A"),
              const DataGridCell<String>(columnName: 'p', value: "P"),
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
        switch (e.columnName) {
          case "s":
            return ShimerLoading.loadingTextField();
          case "o":
            return ShimerLoading.loadingTextField();
          case "a":
            return ShimerLoading.loadingTextField();
          case "p":
            return ShimerLoading.loadingTextField();
          case "debitur":
            return ShimerLoading.loadingTextField();
          case 'antrean':
            return ShimerLoading.loadingTextField();
          case "no":
            return ShimerLoading.loadingTextField();
          case "mrn":
            return ShimerLoading.loadingTextField();
          case "nama":
            return ShimerLoading.loadingTextField();
          default:
            return ShimerLoading.loadingTextField();
        }
      }).toList(),
    );
  }
}
