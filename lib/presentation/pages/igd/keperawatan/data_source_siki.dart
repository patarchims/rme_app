import 'package:flutter/material.dart';
import 'package:hms_app/domain/models/response/siki_model.dart';
import 'package:hms_app/presentation/component/fonts/font_helper.dart';
import 'package:sizer/sizer.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

class SikiDataSource extends DataGridSource {
  SikiDataSource(
      {required List<SikiModel> employeeData, required BuildContext context}) {
    _employeeData = employeeData
        .asMap()
        .entries
        .map((e) => DataGridRow(cells: [
              DataGridCell<int>(columnName: 'no', value: e.key + 1),
              DataGridCell<String>(columnName: 'kode', value: e.value.kode),
              DataGridCell<String>(columnName: 'judul', value: e.value.judul),
              DataGridCell<String>(
                  columnName: 'detail', value: e.value.kolaborasi),
              const DataGridCell<String>(columnName: 'pilih', value: "PILIH"),
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
          case "no":
            return Center(
              child: Text(
                e.value.toString(),
                style: blackTextStyle.copyWith(fontSize: 7.sp),
              ),
            );
          case "judul":
            return Center(
              child: Text(
                e.value.toString(),
                style: blackTextStyle.copyWith(fontSize: 7.sp),
              ),
            );

          case "pilih":
            return Padding(
              padding: EdgeInsets.all(2.sp),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                        side: const BorderSide(color: Colors.black, width: 1),
                        borderRadius: BorderRadius.circular(2.sp)),
                    foregroundColor: Colors.white.withOpacity(.1),
                    backgroundColor: Colors.blue.withOpacity(.3),
                    elevation: 0),
                onPressed: () {},
                child: Text(
                  e.value.toString(),
                  textAlign: TextAlign.center,
                  style: blackTextStyle,
                ),
              ),
            );

          case "kode":
            return Container(
              alignment: Alignment.centerLeft,
              padding: const EdgeInsets.all(8.0),
              child: Text(
                e.value.toString(),
                style: blackTextStyle.copyWith(fontSize: 7.sp),
              ),
            );

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
