import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:hms_app/domain/bloc/dashboard/pasien/pasien_bloc.dart';
import 'package:hms_app/domain/bloc/user/auth/auth_bloc.dart';
import 'package:hms_app/domain/models/devices_info/device_info_model.dart';
import 'package:hms_app/domain/models/meta/meta_model.dart';
import 'package:hms_app/domain/models/response/input_detail_pemeriksaan_labor_model.dart';
import 'package:hms_app/presentation/pages/igd/widget/save_button_widget.dart';
import 'package:sizer/sizer.dart';

import '../../../../domain/bloc/dashboard/asesmen_igd/asesmen_igd_bloc.dart';
import '../../../component/component.dart';

class PenmedikLaborWidget extends StatefulWidget {
  const PenmedikLaborWidget({super.key});

  @override
  State<PenmedikLaborWidget> createState() => _PenmedikLaborWidgetState();
}

class _PenmedikLaborWidgetState extends State<PenmedikLaborWidget> {
  late TextEditingController _cariController;
  String valueSearch = "";

  @override
  void initState() {
    _cariController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _cariController.clear();
    _cariController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    AuthState authState = context.watch<AuthBloc>().state;
    PasienState pasienState = context.watch<PasienBloc>().state;
    final singlePasien = pasienState.listPasienModel
        .where((element) => element.mrn == pasienState.normSelected);

    return Scaffold(
        appBar: AppBar(
          backgroundColor: ThemeColor.primaryColor,
          title: Text(
            "Plan - Rencana Pasien Ke Laboratorium (Kirim Data Ke Pemeriksaan Laboratorium) !!!",
            style: whiteTextStyle,
          ),
        ),
        body: BlocConsumer<AsesmenIgdBloc, AsesmenIgdState>(
          listener: (context, state) {
            if (state.isLoadingSaveInputDetailLabor) {
              EasyLoading.show();
            }
            if (!state.isLoadingSaveInputDetailLabor) {
              EasyLoading.dismiss();
            }

            state.saveInputDetailLabor.fold(
                () => null,
                (a) => a.fold(
                    (l) => l.maybeMap(
                        orElse: () {},
                        failure: (e) async {
                          final shouldPop = await Alert.loaded(context,
                              subTitle: e.meta.message, title: "Pesan");

                          // ignore: use_build_context_synchronously
                          context
                              .read<AsesmenIgdBloc>()
                              .add(const AsesmenIgdEvent.clearPemeriksaan());

                          return shouldPop ?? false;
                        }),
                    (r) => r.maybeMap(
                        orElse: () {},
                        loaded: (e) async {
                          try {
                            MetaModel meta =
                                MetaModel.fromJson(e.value["metadata"]);
                            String noLab =
                                e.value["response"]["no_lab"].toString();

                            final shouldPop = await Alert.loaded(context,
                                subTitle: "Nomor Lab : $noLab  ${meta.message}",
                                title: "Pesan");

                            // ignore: use_build_context_synchronously
                            context
                                .read<AsesmenIgdBloc>()
                                .add(const AsesmenIgdEvent.clearPemeriksaan());
                            return shouldPop ?? false;
                          } catch (e) {}
                        })));
          },
          builder: (context, state) {
            log("PEMERIKSAAN LABOR ${state.detailPemeriksaanLabor}");
            return Stack(children: [
              Positioned.fill(
                  child: Container(
                color: ThemeColor.bgColor,
                child: Column(
                  children: [
                    Container(
                      padding: EdgeInsets.symmetric(
                          vertical: 5.sp, horizontal: 5.sp),
                      width: Get.width,
                      child: FormWidget.textForm(
                          enable: true,
                          labelText: "Cari kelompok pemeriksaan",
                          controller: _cariController,
                          onChanged: (value) {
                            setState(() {
                              valueSearch = value;
                            });
                          }),
                    ),
                    SizedBox(
                      height: Get.height - 90.sp,
                      width: Get.width,
                      child: Row(
                        children: [
                          //=====
                          SizedBox(
                            width: Get.width / 2.2,
                            height: Get.height,
                            child: Scaffold(
                              backgroundColor: ThemeColor.bgColor,
                              appBar: AppBar(
                                title: Text(
                                  "Daftar Grup Tarip Pemeriksaan Laboratorium",
                                  style: whiteTextStyle,
                                ),
                                automaticallyImplyLeading: false,
                              ),
                              body: Container(
                                padding: EdgeInsets.all(5.sp),
                                child: ListView(
                                  children: (state.kProcedure.isNotEmpty)
                                      ? state.kProcedure
                                          .where((element) => element.nameGrup
                                              .contains(valueSearch))
                                          .map((e) {
                                          return Card(
                                            child: ListTile(
                                              title: Text(
                                                e.nameGrup,
                                                style: whiteTextStyle,
                                              ),
                                              subtitle: Text(
                                                e.kel,
                                                style: whiteTextStyle,
                                              ),
                                              enabled: true,
                                              trailing: SizedBox(
                                                height: 25.sp,
                                                child: ElevatedButton(
                                                  onPressed: () {
                                                    if (!state.laborSelection
                                                        .contains(e.nameGrup)) {
                                                      // GET DETAIL PEMERIKSAAN LABOR

                                                      context
                                                          .read<
                                                              AsesmenIgdBloc>()
                                                          .add(AsesmenIgdEvent
                                                              .getDetailPemeriksaanLabor(
                                                                  nameGrup: e
                                                                      .nameGrup));

                                                      context
                                                          .read<
                                                              AsesmenIgdBloc>()
                                                          .add(AsesmenIgdEvent
                                                              .addLaborSelection(
                                                                  grupName: e
                                                                      .nameGrup));

                                                      // =================================
                                                    }

                                                    if (state.laborSelection
                                                        .contains(e.nameGrup)) {
                                                      context
                                                          .read<
                                                              AsesmenIgdBloc>()
                                                          .add(AsesmenIgdEvent
                                                              .deleteLaborSelection(
                                                                  grupName: e
                                                                      .nameGrup));

                                                      context
                                                          .read<
                                                              AsesmenIgdBloc>()
                                                          .add(AsesmenIgdEvent
                                                              .deleteItemPemeriksaan(
                                                                  grupName: e
                                                                      .nameGrup));
                                                    }

                                                    log(e.urut.toString());
                                                  },
                                                  style:
                                                      ElevatedButton.styleFrom(
                                                    backgroundColor: (state
                                                            .laborSelection
                                                            .contains(
                                                                e.nameGrup))
                                                        ? Colors.green
                                                        : ThemeColor
                                                            .primaryColor,
                                                    shape:
                                                        RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              20),
                                                    ),
                                                  ),
                                                  child: const Icon(
                                                    FontAwesomeIcons.check,
                                                    color: Colors.white,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          );
                                        }).toList()
                                      : [],
                                ),
                              ),
                            ),
                          ),

                          /// =================================================
                          Expanded(
                              child: Container(
                            color: ThemeColor.primaryColor,
                            child: Scaffold(
                              backgroundColor: ThemeColor.bgColor,
                              appBar: AppBar(
                                title: Text(
                                  "Details Pemeriksaan Yang Terpilih Untuk Selanjutnya Di Kirim Ke Penunjang Medik Laboratorium",
                                  style: whiteTextStyle,
                                ),
                                automaticallyImplyLeading: false,
                              ),
                              body: ListView(
                                children: state.detailPemeriksaanLabor
                                    .asMap()
                                    .entries
                                    .map((e) {
                                  return Card(
                                    elevation: 1,
                                    child: ExpansionTile(
                                      leading: InkWell(
                                          onTap: () {
                                            // DELETE ITEM
                                            context.read<AsesmenIgdBloc>().add(
                                                AsesmenIgdEvent
                                                    .deleteItemPemeriksaan(
                                                        grupName: e.value.total
                                                            .namaGrup));

                                            context.read<AsesmenIgdBloc>().add(
                                                AsesmenIgdEvent
                                                    .deleteLaborSelection(
                                                        grupName: e.value.total
                                                            .namaGrup));
                                          },
                                          child: const Icon(
                                              FontAwesomeIcons.trash)),
                                      iconColor: Colors.amber,
                                      title: Text(
                                        e.value.total.namaGrup,
                                      ),
                                      trailing: Text(
                                          e.value.total.taripKelas.toString()),
                                      children: e.value.pemeriksaan
                                          .asMap()
                                          .entries
                                          .map((value) {
                                        return ListTile(
                                          title: Text(
                                              "${value.value.urut}. ${value.value.nameGrup}"),
                                          subtitle:
                                              Text(value.value.pemeriksaan),
                                        );
                                      }).toList(),
                                    ),
                                  );
                                }).toList(),
                              ),
                            ),
                          ))
                        ],
                      ),
                    ),
                  ],
                ),
              )),
              SaveButtonWidget(
                onSave: () async {
                  // todo:
                  if (state.laborSelection.isEmpty) {
                    final shouldPop = await Alert.loaded(context,
                        subTitle: "Tindakan Laboratorium \nBelum Ditentukan",
                        title: "Peringatan");
                    return shouldPop ?? false;
                  } else {
                    if (authState is Authenticated) {
                      dynamic data = await deviceInfo.initPlatformState();
                      final deviceID = data['id'];
                      final deviceName = "ID - $deviceID - ${data['device']}}";

                      InputDetailPemeriksaanLaborModel
                          detailPemeriksaanLaborModel =
                          InputDetailPemeriksaanLaborModel(
                              kodeDokter: authState.user.userId,
                              dokterPengirim: authState.user.nama,
                              kodeKelas: singlePasien.first.kdKelas,
                              umurPasien: singlePasien.first.umur,
                              ketPoli: authState.user.pelayanan,
                              kdPoli: authState.user.kodePoli,
                              noReg: singlePasien.first.noreg,
                              deviceID: deviceName,
                              detailLabor: state.detailPemeriksaanLabor);

                      // ignore: use_build_context_synchronously
                      context.read<AsesmenIgdBloc>().add(
                          AsesmenIgdEvent.inputDetailPemeriksaanLabor(
                              inputDetailPemeriksaanLaborModel:
                                  detailPemeriksaanLaborModel));
                    }
                  }
                },
                onClear: () {
                  context
                      .read<AsesmenIgdBloc>()
                      .add(const AsesmenIgdEvent.clearPemeriksaan());
                },
              )
            ]);
          },
        ));
  }
}
