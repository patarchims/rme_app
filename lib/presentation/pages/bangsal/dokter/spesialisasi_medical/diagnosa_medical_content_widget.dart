import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:hms_app/presentation/component/alert/alert.dart';
import 'package:hms_app/presentation/pages/poli_gigi/medis/diagnosa_sesuai_icd/diagnosa_icd_search_widget.dart';
import 'package:sizer/sizer.dart';
import 'package:hms_app/domain/bloc/bloc.dart';
import 'package:hms_app/domain/bloc/asesmen/input_diagnosa/input_diagnosa_bloc.dart';
import 'package:hms_app/presentation/component/alert/custom_dialog.dart';
import 'package:hms_app/presentation/component/color/color_helper.dart';
import 'package:hms_app/presentation/component/fonts/font_helper.dart';
import 'package:hms_app/presentation/component/shimer/shimer_loading.dart';

class InputDignosaMedialRecord extends StatefulWidget {
  final bool enableEdit;
  const InputDignosaMedialRecord({
    super.key,
    required this.enableEdit,
  });
  @override
  State<InputDignosaMedialRecord> createState() => _InputDignosaWidgetState();
}

class _InputDignosaWidgetState extends State<InputDignosaMedialRecord> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    PasienState pasienState = context.watch<PasienBloc>().state;

    final singlePasien = pasienState.listPasienModel
        .where((element) => element.mrn == pasienState.normSelected);

    return BlocConsumer<InputDiagnosaBloc, InputDiagnosaState>(
      listener: (context, state) async {
        log("SIMPAN DIAGNOSA $state");
        // ================== JIKA ADA ERROR

        if (state.isErrorSaveData) {
          // JIKA ADA ERROR DATA
          await Alert.loaded(context,
              subTitle: state.errorMessage, title: "Pesan");
        }

        if (state.isDelete) {
          EasyLoading.show(maskType: EasyLoadingMaskType.black);
        }

        if (!state.isDelete) {
          EasyLoading.dismiss();
        }

        if (state.isSave) {
          EasyLoading.show(maskType: EasyLoadingMaskType.black);
        }

        if (!state.isSave) {
          EasyLoading.dismiss();
        }
      },
      builder: (context, state) {
        log("STATE DIAGNOSA $state");

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
                  ),
                )
              : const SizedBox(),
          backgroundColor: ThemeColor.bgColor,
          body: SizedBox(
            width: Get.width,
            height: Get.height,
            child: (!state.isGet)
                ? Card(
                    color: ThemeColor.bgColor,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(2.sp),
                        side: BorderSide(width: 1.sp)),
                    child: Wrap(
                      crossAxisAlignment: WrapCrossAlignment.center,
                      alignment: WrapAlignment.center,
                      runSpacing: 4.sp,
                      spacing: 4.sp,
                      // ignore: unnecessary_null_comparison
                      children: (state.diagnosa != null)
                          ? state.diagnosa
                              .asMap()
                              .entries
                              .map((e) => SizedBox(
                                    height: 90.sp,
                                    width: 90.sp,
                                    child: Card(
                                      color: (e.value.type == "primer")
                                          ? ThemeColor.primaryColor
                                          : ThemeColor.primaryColor
                                              .withOpacity(0.5),
                                      elevation: 1.sp,
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(5.sp)),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Container(
                                              padding: EdgeInsets.all(5.sp),
                                              width: Get.width,
                                              decoration: BoxDecoration(
                                                  color: Colors.yellow
                                                      .withOpacity(0.5),
                                                  borderRadius:
                                                      BorderRadius.only(
                                                          topLeft:
                                                              Radius.circular(
                                                                  2.sp),
                                                          topRight:
                                                              Radius.circular(
                                                                  2.sp))),
                                              child: Text(
                                                e.value.type.toUpperCase(),
                                                style: blackTextStyle.copyWith(
                                                    fontWeight:
                                                        FontWeight.bold),
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
                                                    shape:
                                                        RoundedRectangleBorder(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        2.sp))),
                                                onPressed: (state
                                                            .diagnosa.length !=
                                                        e.key + 1)
                                                    ? null
                                                    : () {
                                                        // HAPUS DATA DARI DATABASE

                                                        setState(() {
                                                          try {
                                                            context
                                                                .read<
                                                                    InputDiagnosaBloc>()
                                                                .add(InputDiagnosaEvent.deleteItem(
                                                                    noReg: singlePasien
                                                                        .first
                                                                        .noreg,
                                                                    table: e
                                                                        .value
                                                                        .table));
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
                                                      style: blackTextStyle
                                                          .copyWith(
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold),
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
                  )
                : ShimerLoading.loadingExpandCard(),
          ),
        );
      },
    );
  }
}
