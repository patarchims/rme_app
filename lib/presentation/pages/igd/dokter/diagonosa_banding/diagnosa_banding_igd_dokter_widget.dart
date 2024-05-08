import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:hms_app/domain/bloc/dashboard/pasien/pasien_bloc.dart';
import 'package:hms_app/domain/bloc/user/auth/auth_bloc.dart';
import 'package:hms_app/domain/models/devices_info/device_info_model.dart';
import 'package:hms_app/domain/models/meta/meta_model.dart';
import 'package:hms_app/domain/models/users/user_model.dart';
import 'package:hms_app/presentation/component/component.dart';
import 'package:hms_app/presentation/component/loading/loading.dart';
import 'package:hms_app/presentation/pages/igd/bloc/diagnosa_banding/diagnosa_banding_bloc.dart';
import 'package:hms_app/presentation/pages/poli_gigi/medis/diagnosa_sesuai_icd/diagnosa_banding_icd_search_widget.dart';
import 'package:hms_app/presentation/pages/widget/header_content_widget.dart';
import 'package:sizer/sizer.dart';

class DiagnosaBandingIGDDokterWidget extends StatelessWidget {
  const DiagnosaBandingIGDDokterWidget({super.key});

  @override
  Widget build(BuildContext context) {
    PasienState pasienState = context.watch<PasienBloc>().state;
    final singlePasien = pasienState.listPasienModel
        .where((element) => element.mrn == pasienState.normSelected);

    AuthState authState = context.watch<AuthBloc>().state;

    return BlocConsumer<DiagnosaBandingBloc, DiagnosaBandingState>(
      listener: (context, state) {
        if (state.status == DiagnosaBandingStatus.isLoadingSave) {
          EasyLoading.show(maskType: EasyLoadingMaskType.black);
        }
        if (state.status != DiagnosaBandingStatus.isLoadingSave) {
          EasyLoading.dismiss();
        }

        state.saveResultFailure.fold(
            () => null,
            (a) => a.fold(
                (l) => l.maybeMap(
                    orElse: () {},
                    failure: (e) async {
                      final shouldPop = await Alert.loaded(context,
                          subTitle: e.meta.message, title: "Pesan");

                      return shouldPop ?? false;
                    }),
                (r) => r.maybeMap(
                    orElse: () {},
                    loaded: (value) async {
                      MetaModel meta =
                          MetaModel.fromJson(value.value["metadata"]);

                      final shouldPop = await Alert.loaded(context,
                          subTitle: meta.message, title: "Pesan");

                      return shouldPop ?? false;
                    })));
      },
      builder: (context, state) {
        if (state.status == DiagnosaBandingStatus.isLodingGetDiagnosaBanding) {
          return HeaderContentWidget(widget: Loading.expandedLoading());
        }
        return HeaderContentWidget(
            title: "Simpan",
            isENableAdd: false,
            onPressed: null,
            widget: SizedBox(
              height: Get.height,
              width: Get.width,
              child: Card(
                color: ThemeColor.bgColor,
                shape: RoundedRectangleBorder(
                    side: BorderSide(
                      width: 1.sp,
                      color: ThemeColor.blackColor,
                    ),
                    borderRadius: BorderRadius.circular(2.sp)),
                child: Column(
                  children: [
                    TitleWidget.titleContainer(title: "Diagnosa Banding"),
                    Expanded(
                        child: Container(
                      padding: EdgeInsets.all(5.sp),
                      child: Scaffold(
                        backgroundColor: ThemeColor.bgColor,
                        floatingActionButton: FloatingActionButton(
                          backgroundColor: ThemeColor.primaryColor,
                          onPressed: () {
                            CustomDialogWidget.getDialog(
                                widget: Container(
                                  padding: EdgeInsets.all(12.sp),
                                  height: 200.sp,
                                  width: 400.sp,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(6.sp),
                                      color: Colors.white),
                                  child: const DiagnosaBandingICDSearchWidget(
                                    indexInput: 0,
                                  ),
                                ),
                                color: Colors.transparent);
                          },
                          child: const Icon(
                            FontAwesomeIcons.plus,
                            color: ThemeColor.whiteColor,
                          ),
                        ),
                        body: Container(
                          height: Get.height,
                          width: Get.width,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(3.sp),
                              color: ThemeColor.primaryColor.withOpacity(0.2)),
                          child: Wrap(
                            alignment: WrapAlignment.center,
                            crossAxisAlignment: WrapCrossAlignment.center,
                            children: [
                              (state.diagnosaBandingResponse.diagnosa != " ")
                                  ? SizedBox(
                                      height: 90.sp,
                                      width: 90.sp,
                                      child: Card(
                                        color: ThemeColor.primaryColor,
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
                                                    borderRadius: BorderRadius
                                                        .only(
                                                            topLeft:
                                                                Radius.circular(
                                                                    2.sp),
                                                            topRight:
                                                                Radius.circular(
                                                                    2.sp))),
                                                child: Text(
                                                  "Diagnosa Banding",
                                                  style:
                                                      blackTextStyle.copyWith(
                                                          fontWeight:
                                                              FontWeight.bold),
                                                  textAlign: TextAlign.center,
                                                )),
                                            Expanded(
                                              child: Center(
                                                child: Text(
                                                  " ${state.diagnosaBandingResponse.diagnosa} - ${state.diagnosaBandingResponse.description}",
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
                                                          ThemeColor
                                                              .dangerColor,
                                                      shape:
                                                          RoundedRectangleBorder(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          2.sp))),
                                                  onPressed: () async {
                                                    if (authState
                                                        is Authenticated) {
                                                      dynamic data =
                                                          await deviceInfo
                                                              .initPlatformState();
                                                      // ignore: use_build_context_synchronously
                                                      context
                                                          .read<
                                                              DiagnosaBandingBloc>()
                                                          .add(OnSaveDiagnosaBandingIGD(
                                                              devicesID:
                                                                  "ID - ${data['id']} - ${data['device']}",
                                                              pelayanan: toPelayanan(
                                                                  poliklinik: authState
                                                                      .user
                                                                      .poliklinik),
                                                              noReg:
                                                                  singlePasien
                                                                      .first
                                                                      .noreg,
                                                              person: toPerson(
                                                                  person: authState
                                                                      .user
                                                                      .person),
                                                              diagnosa: " "));
                                                    }
                                                  },
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .center,
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
                                    )
                                  : const SizedBox()
                            ],
                          ),
                        ),
                      ),
                    )),
                    SizedBox(height: 25.sp),
                  ],
                ),
              ),
            ));
      },
    );
  }
}
