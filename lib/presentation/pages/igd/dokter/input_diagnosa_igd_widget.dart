import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:hms_app/presentation/component/alert/mesage_alert.dart';
import 'package:sizer/sizer.dart';
import 'package:hms_app/domain/bloc/asesmen/input_diagnosa/input_diagnosa_bloc.dart';
import 'package:hms_app/domain/bloc/dashboard/pasien/pasien_bloc.dart';
import '../../../component/component.dart';
import '../../poli_gigi/medis/diagnosa_sesuai_icd/diagnosa_icd_search_widget.dart';

class InputDiagnosaIgdWidget extends StatefulWidget {
  final bool enableEdit;
  const InputDiagnosaIgdWidget({
    super.key,
    required this.enableEdit,
  });

  @override
  State<InputDiagnosaIgdWidget> createState() => _InputDiagnosaIgdWidgetState();
}

class _InputDiagnosaIgdWidgetState extends State<InputDiagnosaIgdWidget> {
  @override
  Widget build(BuildContext context) {
    PasienState pasienState = context.watch<PasienBloc>().state;
    final singlePasien = pasienState.listPasienModel
        .where((element) => element.mrn == pasienState.normSelected);

    return BlocConsumer<InputDiagnosaBloc, InputDiagnosaState>(
      listener: (context, state) async {
        if (state.isErrorSaveData) {
          // JIKA ADA ERROR DATA
          await Alert.loaded(context,
              subTitle: state.errorMessage, title: "Pesan");
        }

        if (state.isDelete) {
          // ignore: use_build_context_synchronously
          context.read<InputDiagnosaBloc>().add(
              InputDiagnosaEvent.getDiagnosa(noreg: singlePasien.first.noreg));
        }

        // =====
      },
      builder: (context, state) {
        return Scaffold(
          floatingActionButton: (widget.enableEdit)
              ? FloatingActionButton(
                  backgroundColor: (state.diagnosa.length <= 6)
                      ? ThemeColor.primaryColor
                      : ThemeColor.primaryColor.withOpacity(0.5),
                  onPressed: (state.diagnosa.length <= 6 && widget.enableEdit)
                      ? () {
                          CustomDialogWidget.getDialog(
                              widget: Container(
                                padding: EdgeInsets.all(12.sp),
                                height: 200.sp,
                                width: 400.sp,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(6.sp),
                                    color: Colors.white),
                                child: const DiagnosaICDSearchWidget(
                                  indexInput: 0,
                                ),
                              ),
                              color: Colors.transparent);
                        }
                      : null,
                  child: Icon(
                    Icons.add,
                    size: 15.sp,
                    color: Colors.white,
                  ),
                )
              : const SizedBox(),
          backgroundColor: ThemeColor.bgColor,
          body: SizedBox(
            width: Get.width,
            height: Get.height,
            child: Card(
              color: ThemeColor.bgColor,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(2.sp),
                  side: BorderSide(width: 1.sp)),
              child: Wrap(
                crossAxisAlignment: WrapCrossAlignment.center,
                alignment: WrapAlignment.center,
                runSpacing: 4.sp,
                spacing: 4.sp,
                children: (state.diagnosa.isNotEmpty)
                    ? state.diagnosa
                        .asMap()
                        .entries
                        .map((e) => SizedBox(
                              height: 90.sp,
                              width: 90.sp,
                              child: Card(
                                color: (e.value.type == "primer")
                                    ? ThemeColor.primaryColor
                                    : ThemeColor.primaryColor.withOpacity(0.5),
                                elevation: 1.sp,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(5.sp)),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Container(
                                        padding: EdgeInsets.all(5.sp),
                                        width: Get.width,
                                        decoration: BoxDecoration(
                                            color:
                                                Colors.yellow.withOpacity(0.5),
                                            borderRadius: BorderRadius.only(
                                                topLeft: Radius.circular(2.sp),
                                                topRight:
                                                    Radius.circular(2.sp))),
                                        child: Text(
                                          e.value.type.toUpperCase(),
                                          style: blackTextStyle.copyWith(
                                              fontWeight: FontWeight.bold),
                                          textAlign: TextAlign.center,
                                        )),
                                    Expanded(
                                      child: Center(
                                        child: Text(
                                          "${e.value.code} - ${e.value.description}",
                                          textAlign: TextAlign.center,
                                          style: whiteTextStyle,
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 20.sp,
                                      width: Get.width,
                                      child: ElevatedButton(
                                          style: ElevatedButton.styleFrom(
                                              backgroundColor:
                                                  ThemeColor.dangerColor,
                                              shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          2.sp))),
                                          onPressed:
                                              (state.diagnosa.length !=
                                                      e.key + 1)
                                                  ? null
                                                  : () {
                                                      // HAPUS DATA DARI DATABASE
                                                      setState(() {
                                                        try {
                                                          // DELETE DIAGNOSA
                                                          CustomDialogWidget
                                                              .getDialog(
                                                                  widget: MessageAlert
                                                                      .deleteAlert(
                                                                          mesage:
                                                                              "Apakah Anda yakin menghapus data ${e.value.description} ?",
                                                                          onPressed:
                                                                              () {
                                                                            context.read<InputDiagnosaBloc>().add(InputDiagnosaEvent.deleteItem(
                                                                                noReg: singlePasien.first.noreg,
                                                                                table: e.value.table));

                                                                            Get.back();
                                                                          }));
                                                        } catch (e) {
                                                          log(e.toString());
                                                        }
                                                      });
                                                    },
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              Text(
                                                "Hapus ",
                                                style: blackTextStyle.copyWith(
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                              const Icon(
                                                Icons.delete,
                                                color: Colors.black,
                                              )
                                            ],
                                          )),
                                    )
                                  ],
                                ),
                              ),
                            ))
                        .toList()
                    : [],
              ),
            ),
          ),
        );
      },
    );
  }
}
