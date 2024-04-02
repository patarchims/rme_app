import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hms_app/domain/models/response/list_cppt_pasien_model_response.dart';
import 'package:hms_app/presentation/component/component.dart';
import 'package:hms_app/presentation/pages/modul/cppt_content_widget/cppt_edit_content_pasien.dart';
import 'package:hms_app/presentation/pages/modul/cppt_content_widget/on_delete_content_cppt_widget.dart';
import 'package:sizer/sizer.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

class CPPTDataSource extends DataGridSource {
  CPPTDataSource(
      {required List<CpptPasienModel> employeeData,
      required BuildContext context}) {
    _employeeData = employeeData
        .asMap()
        .entries
        .map((e) => DataGridRow(cells: [
              DataGridCell<int>(columnName: 'no', value: e.key + 1),
              DataGridCell<String>(columnName: 'bagian', value: e.value.bagian),
              DataGridCell<String>(
                  columnName: 'tanggal', value: e.value.tanggal),
              DataGridCell<String>(columnName: 'sub', value: e.value.subjektif),
              DataGridCell<String>(columnName: 'obj', value: e.value.objectif),
              DataGridCell<String>(columnName: 'ases', value: e.value.asesmen),
              DataGridCell<String>(columnName: 'plan', value: e.value.plan),
              DataGridCell<String>(
                  columnName: 'instruksi', value: e.value.instruksiPpa),
              DataGridCell<String>(columnName: 'ppa', value: e.value.ppa),
              DataGridCell<String>(
                  columnName: 'action', value: e.value.id.toString()),
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
      color: ThemeColor.darkColor,
      cells: row.getCells().map<Widget>((e) {
        switch (e.columnName) {
          case "action":
            return Padding(
              padding: EdgeInsets.all(1.sp),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          elevation: 1,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(2.sp)),
                          backgroundColor: ThemeColor.dangerColor),
                      onPressed: () {
                        // TAMPILKAN PESAN EDIT

                        CustomDialogWidget.getDialog(
                            widget: OnDeleteCppTContentWidget(
                          idCppt: int.parse(row.getCells()[9].value.toString()),
                        ));
                      },
                      child: const Icon(
                        FontAwesomeIcons.circleXmark,
                        color: ThemeColor.whiteColor,
                      )),
                  SizedBox(width: 1.sp),
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          elevation: 1,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(2.sp)),
                          backgroundColor: ThemeColor.greenColor),
                      onPressed: () {
                        // UBAH DATA
                        CustomDialogWidget.getDialog(
                            widget: CPPTEditContentPasienWidget(
                                ppa: row.getCells()[7].value.toString(),
                                asesmen: row.getCells()[5].value.toString(),
                                subjetif: row.getCells()[3].value.toString(),
                                id: int.parse(
                                    row.getCells()[9].value.toString()),
                                objectif: row.getCells()[4].value.toString(),
                                plan: row.getCells()[6].value.toString()),
                            color: Colors.transparent);
                      },
                      child: const Icon(
                        FontAwesomeIcons.pen,
                        color: ThemeColor.whiteColor,
                      )),
                ],
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
