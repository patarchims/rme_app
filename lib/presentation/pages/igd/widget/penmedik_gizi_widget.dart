import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:hms_app/domain/bloc/dashboard/asesmen_igd/asesmen_igd_bloc.dart';
import 'package:hms_app/domain/bloc/dashboard/pasien/pasien_bloc.dart';
import 'package:hms_app/domain/bloc/user/auth/auth_bloc.dart';
import 'package:hms_app/domain/models/devices_info/device_info_model.dart';
import 'package:hms_app/domain/models/meta/meta_model.dart';
import 'package:hms_app/domain/models/response/input_penunjang_model.dart';
import 'package:hms_app/presentation/component/component.dart';
import 'package:hms_app/presentation/pages/igd/widget/save_button_widget.dart';
import 'package:sizer/sizer.dart';

class PenmedikGiziWidget extends StatefulWidget {
  const PenmedikGiziWidget({super.key});

  @override
  State<PenmedikGiziWidget> createState() => _PemedikRadiologiWidgetState();
}

class _PemedikRadiologiWidgetState extends State<PenmedikGiziWidget> {
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

    return BlocConsumer<AsesmenIgdBloc, AsesmenIgdState>(
      listener: (context, state) {
        // TODO: implement listener
        if (state.loadingSaveFisioterapi) {
          EasyLoading.show();
        }
        if (!state.loadingSaveFisioterapi) {
          EasyLoading.dismiss();
        }

        // ====
        state.saveDetailGizi.fold(
            () => null,
            (a) => a.fold(
                (l) => l.maybeMap(
                    orElse: () {},
                    failure: (e) async {
                      final shouldPop = await Alert.loaded(context,
                          subTitle: e.meta.message, title: "Pesan");
                      context
                          .read<AsesmenIgdBloc>()
                          .add(AsesmenIgdEvent.clearGizi());
                      return shouldPop ?? false;
                    }),
                (r) => r.maybeMap(
                    orElse: () {},
                    emty: (e) async {
                      final shouldPop = await Alert.loaded(context,
                          subTitle: "", title: "Pesan");
                      return shouldPop ?? false;
                    },
                    loaded: (e) async {
                      // =================
                      try {
                        MetaModel meta =
                            MetaModel.fromJson(e.value["metadata"]);
                        String noLab = e.value["response"]["no_lab"].toString();

                        final shouldPop = await Alert.loaded(context,
                            subTitle: "Nomor  : ${noLab}  ${meta.message}",
                            title: "Pesan");

                        context
                            .read<AsesmenIgdBloc>()
                            .add(AsesmenIgdEvent.clearGizi());
                        return shouldPop ?? false;
                      } catch (e) {}
                    })));
      },
      builder: (context, state) {
        return Scaffold(
            appBar: AppBar(
              backgroundColor: ThemeColor.primaryColor,
              title: Text(
                "Plan - Rencana Tindakan Konsultasi Gizi Pada Pasien Tersebut (Fee For Services) ?",
                style: whiteTextStyle,
              ),
            ),
            backgroundColor: ThemeColor.bgColor,
            body: Stack(children: [
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
                          labelText: "Cari tindakan",
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
                          SizedBox(
                            width: Get.width / 2.2,
                            height: Get.height,
                            child: Scaffold(
                              backgroundColor: ThemeColor.bgColor,
                              appBar: AppBar(
                                title: Text(
                                  "Daftar Tindakan Konsultasi Yang Terpilih",
                                  style: whiteTextStyle,
                                ),
                                automaticallyImplyLeading: false,
                              ),
                              body: Container(
                                padding: EdgeInsets.all(5.sp),
                                child: ListView(
                                  children: (state.giziModel.isNotEmpty)
                                      ? state.giziModel
                                          .where((element) => element.deskripsi
                                              .contains(valueSearch))
                                          .map((e) {
                                          return Card(
                                            child: ListTile(
                                              title: Text(
                                                e.deskripsi,
                                                style: whiteTextStyle,
                                              ),
                                              subtitle: Text(
                                                e.kdBag,
                                                style: whiteTextStyle,
                                              ),
                                              enabled: true,
                                              trailing: SizedBox(
                                                height: 25.sp,
                                                child: ElevatedButton(
                                                  onPressed: () {
                                                    if (!state.giziSelection
                                                        .contains(e.kode)) {
                                                      log(e.kdBag.toString());
                                                      log(e.kode.toString());
                                                      log(singlePasien
                                                          .first.kdDebitur
                                                          .toString());
                                                      context
                                                          .read<
                                                              AsesmenIgdBloc>()
                                                          .add(AsesmenIgdEvent
                                                              .getTaripGizi(
                                                                  debitur:
                                                                      singlePasien
                                                                          .first
                                                                          .kdDebitur,
                                                                  kode: e.kode,
                                                                  kodeBagian:
                                                                      e.kdBag));

                                                      context
                                                          .read<
                                                              AsesmenIgdBloc>()
                                                          .add(AsesmenIgdEvent
                                                              .addGiziSelection(
                                                                  value:
                                                                      e.kode));
                                                    }

                                                    // GET DETAIL PEMERIKSAAN LABOR
                                                    if (state.giziSelection
                                                        .contains(e.kode)) {
                                                      context
                                                          .read<
                                                              AsesmenIgdBloc>()
                                                          .add(AsesmenIgdEvent
                                                              .deleteGiziSelection(
                                                                  value:
                                                                      e.kode));

                                                      context
                                                          .read<
                                                              AsesmenIgdBloc>()
                                                          .add(AsesmenIgdEvent
                                                              .deleteItemGizi(
                                                                  value:
                                                                      e.kode));
                                                    }
                                                  },
                                                  child: Icon(
                                                    FontAwesomeIcons.check,
                                                    color: Colors.white,
                                                  ),
                                                  style:
                                                      ElevatedButton.styleFrom(
                                                    backgroundColor: (state
                                                            .giziSelection
                                                            .contains(e.kode))
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

                          // ===============================================
                          Expanded(
                              child: Container(
                            color: ThemeColor.primaryColor,
                            child: Scaffold(
                              backgroundColor: ThemeColor.bgColor,
                              appBar: AppBar(
                                title: Text(
                                  "Detail Pemeriksaan Yang Dipilih Untuk Selanjutnya Dikirim Ke Penunjang Medik Radiologi",
                                  style: whiteTextStyle,
                                ),
                                automaticallyImplyLeading: false,
                              ),
                              body: ListView(
                                children:
                                    state.detailGizi.asMap().entries.map((e) {
                                  return Card(
                                    elevation: 1,
                                    child: ExpansionTile(
                                        leading: InkWell(
                                            onTap: () {
                                              // DELETE ITEM
                                              // log("DELETE ITEM");
                                              // log("ITEM ${e.value.kode}");

                                              context
                                                  .read<AsesmenIgdBloc>()
                                                  .add(AsesmenIgdEvent
                                                      .deleteItemGizi(
                                                          value: e.value.kode));

                                              // ===============================

                                              context
                                                  .read<AsesmenIgdBloc>()
                                                  .add(AsesmenIgdEvent
                                                      .deleteItemSelectionGizi(
                                                          value: e.value.kode));
                                            },
                                            child:
                                                Icon(FontAwesomeIcons.trash)),
                                        iconColor: Colors.amber,
                                        title: Text(
                                          e.value.deskripsi,
                                        ),
                                        trailing:
                                            Text(e.value.tarip.toString()),
                                        children: []),
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
                  if (state.giziSelection.isEmpty) {
                    final shouldPop = await Alert.loaded(context,
                        subTitle: "Tindakan GIZI \nBelum Ditentukan",
                        title: "Peringatan");
                    return shouldPop ?? false;
                  } else {
                    if (authState is Authenticated) {
                      dynamic data = await deviceInfo.initPlatformState();

                      // SAVE FISIOTERAPI
                      // detailFisioterapi
                      InputPenunjangModel penunjangModel = InputPenunjangModel(
                          jenisPenunjang: "GIZI",
                          umurPasien: singlePasien.first.umur,
                          noReg: singlePasien.first.noreg,
                          deviceID: "ID - ${data['id']} - ${data['device']}}",
                          dokterPengirim: authState.user.nama,
                          kdPoli: authState.user.kodePoli,
                          ketPoli: authState.user.poliklinik.name,
                          kodeDokter: authState.user.userId,
                          kodeKelas: singlePasien.first.kdKelas,
                          list: state.detailGizi);

                      log("INFO GIZI \n" + penunjangModel.toMap().toString());

                      context.read<AsesmenIgdBloc>().add(
                          AsesmenIgdEvent.saveGizi(
                              inputPenunjangModel: penunjangModel));
                    }
                  }
                },
                onClear: () {
                  // ============================
                  context
                      .read<AsesmenIgdBloc>()
                      .add(AsesmenIgdEvent.clearGizi());
                },
              ),
            ]));
      },
    );
  }
}
