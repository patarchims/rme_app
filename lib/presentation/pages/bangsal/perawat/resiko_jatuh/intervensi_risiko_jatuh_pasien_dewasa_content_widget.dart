import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:hms_app/domain/bloc/dashboard/pasien/pasien_bloc.dart';
import 'package:hms_app/domain/bloc/dashboard/resiko_jatuh/resiko_jatuh_intervensi/resiko_jatuh_bloc.dart';
import 'package:hms_app/domain/bloc/user/auth/auth_bloc.dart';
import 'package:hms_app/domain/models/devices_info/device_info_model.dart';
import 'package:hms_app/domain/models/meta/meta_model.dart';
import 'package:hms_app/domain/models/users/user_model.dart';
import 'package:hms_app/presentation/component/constant/list_constants.dart';
import 'package:hms_app/presentation/component/extenstion/date_helper.dart';
import 'package:sizer/sizer.dart';

import 'package:hms_app/presentation/component/component.dart';
import 'package:hms_app/presentation/pages/widget/header_content_widget.dart';

class IntervensiRisikoJaatuhPasienDewasaContentWidget extends StatefulWidget {
  const IntervensiRisikoJaatuhPasienDewasaContentWidget({super.key});

  @override
  State<IntervensiRisikoJaatuhPasienDewasaContentWidget> createState() =>
      _IntervensiRisikoJaatuhPasienDewasaContentWidgetState();
}

class _IntervensiRisikoJaatuhPasienDewasaContentWidgetState
    extends State<IntervensiRisikoJaatuhPasienDewasaContentWidget> {
  final ScrollController _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    PasienState pasienState = context.watch<PasienBloc>().state;
    final singlePasien = pasienState.listPasienModel
        .where((element) => element.mrn == pasienState.normSelected);
    AuthState authState = context.watch<AuthBloc>().state;

    return BlocConsumer<ResikoJatuhBloc, ResikoJatuhState>(
      listener: (context, state) {
        if (state.status == ResikoJatuhStatus.isLoadingSave) {
          EasyLoading.show(maskType: EasyLoadingMaskType.black);
        }

        if (state.status != ResikoJatuhStatus.isLoadingSave) {
          EasyLoading.dismiss();
        }

        state.saveData.fold(
            () => null,
            (a) => a.fold(
                (l) => l.maybeMap(
                    orElse: () {},
                    failure: (e) async {
                      // FAILURE
                      if (e.meta.code == 201) {
                        final shouldPop = await Alert.warningMessage(context,
                            subTitle: e.meta.message.toString(),
                            title: "Peringatan");
                        return shouldPop ?? false;
                      }
                    }),
                (r) => r.maybeMap(
                    orElse: () {},
                    loaded: (e) async {
                      MetaModel meta = MetaModel.fromJson(e.value["metadata"]);
                      final shouldPop = await Alert.loaded(context,
                          subTitle: meta.message, title: "Pesan");
                      return shouldPop ?? false;
                    })));
      },
      builder: (context, state) {
        return HeaderContentWidget(
            isENableAdd: true,
            onPressed: () async {
              // ===================== //
              dynamic data = await deviceInfo.initPlatformState();

              if (authState is Authenticated) {
                // ignore: use_build_context_synchronously
                context.read<ResikoJatuhBloc>().add(OnSaveIntervensiResikoJatuh(
                    shift: state.shiftSelected,
                    noReg: singlePasien.first.noreg,
                    person: toPerson(person: authState.user.person),
                    kategori: toKategoriString(
                        spesiliasasi: authState.user.spesialisasi),
                    deviceID: "ID-${data['id']}-${data['device']}",
                    pelayanan:
                        toPelayanan(poliklinik: authState.user.poliklinik),
                    resikoJatuh: state.resikoJatuh));
              }
            },
            title: "Simpan",
            widget: RawScrollbar(
              thumbColor: ThemeColor.darkColor,
              thumbVisibility: true,
              interactive: true,
              thickness: 10.sp,
              controller: _scrollController,
              trackVisibility: false,
              radius: Radius.circular(5.sp),
              child: SingleChildScrollView(
                controller: _scrollController,
                child: Column(
                  children: [
                    TitleWidget.titleContainer(
                        title: "INTERVENSI RISIKO JATUH PASIEN "),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Text(
                            "Berikan Tanda ",
                            style: blackTextStyle,
                          ),
                          const Icon(
                            FontAwesomeIcons.check,
                            color: ThemeColor.blackColor,
                          ),
                          Text(
                            "Pada tindakan yang dilaksanakan ",
                            style: blackTextStyle,
                          ),
                        ],
                      ),
                    ),
                    Container(
                        width: Get.width,
                        padding: EdgeInsets.symmetric(
                            vertical: 5.sp, horizontal: 8.sp),
                        decoration:
                            BoxDecoration(color: Colors.green.withOpacity(0.5)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              "Tanggal : ${tglIndo(DateTime.now().toString())} ",
                              textAlign: TextAlign.start,
                              style: blackTextStyle.copyWith(
                                  fontWeight: FontWeight.bold),
                            ),
                            Wrap(
                              runAlignment: WrapAlignment.spaceAround,
                              runSpacing: 10,
                              spacing: 10,
                              alignment: WrapAlignment.spaceAround,
                              children: ListConstants.shiftList
                                  .map((e) => SizedBox(
                                        height: 15.sp,
                                        child: ElevatedButton(
                                          onPressed: () {
                                            context.read<ResikoJatuhBloc>().add(
                                                OnChangeShiftResikoJatuh(
                                                    value: e));

                                            // LAKUKAN CLEAR PADA CECKLIS
                                            context.read<ResikoJatuhBloc>().add(
                                                OnClearCheckListResikoJatuh());
                                          },
                                          style: ElevatedButton.styleFrom(
                                            backgroundColor:
                                                (state.shiftSelected == e)
                                                    ? ThemeColor.greenColor
                                                    : ThemeColor.primaryColor,
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(5.sp),
                                            ),
                                          ),
                                          child: Text(
                                            e,
                                            style: whiteTextStyle,
                                          ),
                                        ),
                                      ))
                                  .toList(),
                            )
                          ],
                        )),
                    Container(
                      width: Get.width,
                      decoration: const BoxDecoration(),
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: state.resikoJatuh
                              .asMap()
                              .entries
                              .map((resiko) => Column(
                                    children: [
                                      Container(
                                        padding: EdgeInsets.symmetric(
                                          vertical: 5.sp,
                                        ),
                                        decoration: BoxDecoration(
                                            color:
                                                Colors.yellow.withOpacity(0.5)),
                                        child: Center(
                                          child: Text(
                                            resiko.value.namaFaktor,
                                            style: blackTextStyle.copyWith(
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceAround,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: resiko.value.resikoJatuh
                                              .asMap()
                                              .entries
                                              .map((sub) => Column(
                                                    children: [
                                                      Container(
                                                        padding: EdgeInsets
                                                            .symmetric(
                                                                horizontal:
                                                                    15.sp,
                                                                vertical: 2.sp),
                                                        width: Get.width,
                                                        child: Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .start,
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .center,
                                                          children: [
                                                            Text(
                                                              sub.value.noUrut
                                                                  .toString(),
                                                              style: blackTextStyle
                                                                  .copyWith(
                                                                      fontSize:
                                                                          6.sp,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .bold),
                                                            ),
                                                            SizedBox(
                                                              width: 10.sp,
                                                            ),
                                                            Text(
                                                              sub.value
                                                                  .kategoriFaktor,
                                                              style: blackTextStyle
                                                                  .copyWith(
                                                                      fontSize:
                                                                          6.sp,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .bold),
                                                            ),
                                                            const Spacer(),
                                                            SizedBox(
                                                              height: 15.sp,
                                                              width: 20.sp,
                                                              child:
                                                                  ElevatedButton(
                                                                onPressed: () {
                                                                  context.read<ResikoJatuhBloc>().add(OnCheckIntervensiResikoJatuh(
                                                                      faktorIndex:
                                                                          resiko
                                                                              .key,
                                                                      resikoJatuhIndex:
                                                                          sub
                                                                              .key,
                                                                      resikoJatuh: sub
                                                                          .value
                                                                          .copyWith(
                                                                              isEnable: !sub.value.isEnable)));
                                                                },
                                                                style: ElevatedButton
                                                                    .styleFrom(
                                                                  backgroundColor: (sub
                                                                          .value
                                                                          .isEnable)
                                                                      ? Colors
                                                                          .green
                                                                      : ThemeColor
                                                                          .primaryColor,
                                                                  shape:
                                                                      RoundedRectangleBorder(
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            5.sp),
                                                                  ),
                                                                ),
                                                                child: (sub
                                                                        .value
                                                                        .isEnable)
                                                                    ? Icon(
                                                                        FontAwesomeIcons
                                                                            .check,
                                                                        color: Colors
                                                                            .white,
                                                                        size: 5
                                                                            .sp,
                                                                      )
                                                                    : Icon(
                                                                        FontAwesomeIcons
                                                                            .minus,
                                                                        color: Colors
                                                                            .white,
                                                                        size: 5
                                                                            .sp,
                                                                      ),
                                                              ),
                                                            )
                                                          ],
                                                        ),
                                                      ),
                                                      const Divider(),
                                                    ],
                                                  ))
                                              .toList(),
                                        ),
                                      ),
                                    ],
                                  ))
                              .toList()),
                    ),
                    SizedBox(
                      height: 35.sp,
                    )
                  ],
                ),
              ),
            ));
      },
    );
  }

  Container headerTitle({required String title}) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 2.sp),
      decoration: BoxDecoration(color: Colors.yellow.withOpacity(0.5)),
      child: Center(
        child: Text(
          title,
          style: blackTextStyle.copyWith(fontWeight: FontWeight.bold),
        ),
      ),
    );
  }

  Padding textBox({required String title}) {
    return Padding(
      padding: EdgeInsets.all(2.sp),
      child: Text(
        title,
        style: blackTextStyle,
      ),
    );
  }
}
