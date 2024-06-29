import 'package:flutter/material.dart';
import 'package:hms_app/domain/models/response/list_antrean_model_response.dart';
import 'package:hms_app/presentation/pages/asesmen/asesmen_content_widget.dart';
import 'package:hms_app/presentation/pages/pasien/detail_pasien_widget.dart';
import 'package:sizer/sizer.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

import '../../component/component.dart';

class PasienDataSource extends DataGridSource {
  PasienDataSource(
      {required List<AntreanPasienModel> employeeData,
      required BuildContext context}) {
    _employeeData = employeeData
        .asMap()
        .entries
        .map((e) => DataGridRow(cells: [
              DataGridCell<int>(columnName: 'no', value: e.key + 1),
              DataGridCell<String>(
                  columnName: 'antrean',
                  value: "No : ${e.value.noAntrean} -\nKasur ${e.value.kasur}"),
              DataGridCell<String>(columnName: 'mrn', value: e.value.mrn),
              DataGridCell<String>(
                  columnName: 'nama', value: e.value.namaPasien),
              DataGridCell<String>(
                  columnName: 'debitur', value: e.value.debitur),
              DataGridCell<String>(
                  columnName: 'dpjp', value: e.value.namaDokter),
              const DataGridCell<String>(columnName: 'soap', value: "SOAP"),
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
          case "soap":
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
                    String noRM = row.getCells()[2].value.toString();

                    CustomDialogWidget.getDialog(
                        widget: AsesmenContentWidget(noRm: noRM),
                        color: ThemeColor.blueColor);
                  },
                  child: Text(
                    "PILIH",
                    style: whiteCalibriTextStyle.copyWith(
                        fontSize: 7.sp, fontWeight: FontWeight.bold),
                  )),
            );
          case 'antrean':
            return Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(e.value.toString(),
                    style: whiteTextStyle.copyWith(fontSize: 6.sp)),
                // SizedBox(
                //     width: 30,
                //     height: 30,
                //     child: ElevatedButton(
                //       style: ElevatedButton.styleFrom(
                //           elevation: 0,
                //           shape: const CircleBorder(),
                //           backgroundColor: Colors.transparent),
                //       child: const Icon(
                //         Icons.play_circle_fill,
                //         color: Colors.white,
                //       ),
                //       onPressed: () async {
                //         try {
                //           // TODO < PLAY audio // AssetsAudioPlayer().open(Audio("assets/sound/ONLINE.wav"));
                //         } catch (t) {
                //           //mp3 unreachable
                //           log(t.toString());
                //         }
                //       },
                //     ))
              ],
            );
          case "no":
            return Center(
              child: Text(
                e.value.toString(),
                style: whiteCalibriTextStyle.copyWith(fontSize: 7.sp),
              ),
            );
          case "dpjp":
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                e.value.toString(),
                textAlign: TextAlign.left,
                style: whiteCalibriTextStyle.copyWith(fontSize: 7.sp),
              ),
            );
          case "debitur":
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                e.value.toString(),
                textAlign: TextAlign.left,
                style: whiteCalibriTextStyle.copyWith(fontSize: 7.sp),
              ),
            );
          case "mrn":
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
                  CustomDialogWidget.getDialog(
                      widget: DetailPasienWidget(
                    norm: e.value,
                  ));
                },
                child: Text(
                  e.value.toString(),
                  textAlign: TextAlign.center,
                  style: whiteTextStyle,
                ),
              ),
            );
          case "nama":
            return Container(
                alignment: Alignment.centerLeft,
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  e.value.toString(),
                  style: whiteCalibriTextStyle.copyWith(fontSize: 7.sp),
                ));
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
