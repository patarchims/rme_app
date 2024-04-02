import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:hms_app/domain/models/response/list_antrean_model_response.dart';
import 'package:hms_app/presentation/component/color/color_helper.dart';
import 'package:hms_app/presentation/component/fonts/font_helper.dart';
import 'package:sizer/sizer.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

class TandaVitalSource extends DataGridSource {
  TandaVitalSource(
      {required List<AntreanPasienModel> employeeData,
      required BuildContext context}) {
    _employeeData = employeeData
        .asMap()
        .entries
        .map((e) => DataGridRow(cells: [
              DataGridCell<int>(columnName: 'no', value: e.key + 1),
              DataGridCell<String>(
                  columnName: 'riwayat', value: e.value.noAntrean),
              DataGridCell<String>(columnName: 'mrn', value: e.value.mrn),
              DataGridCell<String>(
                  columnName: 'obat', value: e.value.namaPasien),
              DataGridCell<String>(
                  columnName: 'makanan', value: e.value.kdDebitur),
              DataGridCell<String>(
                  columnName: 'lainnya', value: e.value.namaDokter),
            ]))
        .toList();
  }

  List<DataGridRow> _employeeData = [];

  @override
  List<DataGridRow> get rows => _employeeData;

  // final assetsAudioPlayer = AssetsAudioPlayer();
  @override
  @override
  DataGridRowAdapter buildRow(
    DataGridRow row,
  ) {
    return DataGridRowAdapter(
      cells: row.getCells().map<Widget>((e) {
        switch (e.columnName) {
          case "riwayat":
            return Padding(
              padding: EdgeInsets.all(2.sp),
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(2.sp),
                          side: const BorderSide(color: Colors.black)),
                      elevation: 0,
                      backgroundColor: ThemeColor.greenColor.withOpacity(0.5)),
                  onPressed: () {
                    // TAMPILKAN POP UP UNTUK SUBJECTIVE
                    // TODO GET HASIL PENUNJANG MEDIK FIRST PADA PENYAKIT DALAM ATAU INTENIST
                  },
                  child: Text(
                    // TODO: SOAP NAME
                    "Asesmen",
                    style: whiteCalibriTextStyle.copyWith(
                        fontWeight: FontWeight.bold),
                  )),
            );
          case 'obat':
            return Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(e.value.toString(),
                    style: whiteTextStyle.copyWith(fontSize: 6.sp)),
                SizedBox(
                    width: 30,
                    height: 30,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          elevation: 0,
                          shape: const CircleBorder(),
                          backgroundColor: Colors.transparent),
                      child: const Icon(
                        Icons.play_circle_fill,
                        color: Colors.white,
                      ),
                      onPressed: () async {
                        try {
                          // TODO < PLAY audio
                          // AssetsAudioPlayer().open(
                          //   Audio("assets/sound/ONLINE.wav"),
                          // );
                        } catch (t) {
                          //mp3 unreachable
                          log(t.toString());
                        }
                      },
                    ))
              ],
            );
          case "no":
            return Center(
              child: Text(
                e.value.toString(),
                style: whiteCalibriTextStyle.copyWith(fontSize: 7.sp),
              ),
            );
          case "makanan":
            return Padding(
              padding: EdgeInsets.all(2.sp),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                        side: const BorderSide(color: Colors.black, width: 1),
                        borderRadius: BorderRadius.circular(2.sp)),
                    foregroundColor: Colors.white.withOpacity(.1),
                    backgroundColor: Colors.yellow.withOpacity(.3),
                    elevation: 0),
                onPressed: () {
                  // TAMPILKAN DETAIL PASIEN
                  // TODO Tampilkan Detail
                  // CustomDialogWidget.getDialog(
                  //     widget: DetailPasienWidget(
                  //   norm: e.value,
                  // ));
                },
                child: Text(
                  e.value.toString(),
                  textAlign: TextAlign.center,
                  style: whiteTextStyle,
                ),
              ),
            );
          case "lainnya":
            return Container(
              alignment: Alignment.centerLeft,
              padding: const EdgeInsets.all(8.0),
              child: Text(
                e.value.toString(),
                style: whiteCalibriTextStyle.copyWith(fontSize: 7.sp),
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
