import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:hms_app/domain/models/users/detail_profil_pasien_model.dart';
import 'package:hms_app/presentation/component/component.dart';
import 'package:hms_app/presentation/pages/poli_gigi/medis/riwayat_pasien/widget/riwayat_labor_widget.dart';
import 'package:hms_app/presentation/pages/poli_gigi/medis/riwayat_pasien/widget/riwayat_radiologi_widget.dart';
import 'package:sizer/sizer.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

class RiwayatPasienDataSource extends DataGridSource {
  RiwayatPasienDataSource(
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
        switch (e.columnName) {
          case "labor":
            return Padding(
              padding: EdgeInsets.all(2.sp),
              child: SizedBox(
                width: 155.sp,
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(2.sp),
                            side: const BorderSide(color: Colors.black)),
                        elevation: 0,
                        backgroundColor:
                            ThemeColor.greenColor.withOpacity(0.5)),
                    onPressed: () {
                      // TAMPILKAN POP UP UNTUK SUBJECTIVE
                      String tanggal = row.getCells()[1].value.toString();

                      // TAMPILKAN SOAP CONTENT
                      CustomDialogWidget.getDialog(
                          widget: RiwayatRadiologiWidget(tanggal: tanggal),
                          color: Colors.white);
                    },
                    child: Text(
                      // TODO: SOAP NAME
                      "Radiologi",
                      style: whiteTextStyle,
                    )),
              ),
            );
          case "radiologi":
            return Padding(
              padding: EdgeInsets.all(2.sp),
              child: SizedBox(
                width: 155.sp,
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(2.sp),
                            side: const BorderSide(color: Colors.black)),
                        elevation: 0,
                        backgroundColor:
                            ThemeColor.greenColor.withOpacity(0.5)),
                    onPressed: () {
                      // TAMPILKAN POP UP UNTUK SUBJECTIVE
                      String tanggal = row.getCells()[1].value.toString();

                      // TAMPILKAN SOAP CONTENT
                      CustomDialogWidget.getDialog(
                          widget: RiwayatLaborWidget(tanggal: tanggal),
                          color: Colors.transparent);
                    },
                    child: Text(
                      "Laboratorium",
                      style: whiteTextStyle,
                    )),
              ),
            );
          case "copy":
            return Padding(
              padding: EdgeInsets.all(2.sp),
              child: SizedBox(
                width: 155.sp,
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(2.sp),
                            side: const BorderSide(color: Colors.black)),
                        elevation: 0,
                        backgroundColor:
                            ThemeColor.greenColor.withOpacity(0.5)),
                    onPressed: () {
                      // TAMPILKAN POP UP UNTUK SUBJECTIVE
                      String noRM = row.getCells()[2].value.toString();
                      log(noRM.toLowerCase());

                      // TAMPILKAN SOAP CONTENT
                      // TODO
                      // Tampilkan SOAP CONTENT WIDGET
                      // Berdasarkan nama poli
                      // CustomDialogWidget.getDialog(
                      //     widget: Container(), color: Colors.transparent);
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(
                          Icons.copy,
                          color: Colors.white,
                        ),
                        Text(
                          "Copy",
                          style: whiteTextStyle,
                        ),
                      ],
                    )),
              ),
            );

          default:
            return Container(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                e.value.toString(),
              ),
            );
        }
      }).toList(),
    );
  }
}
