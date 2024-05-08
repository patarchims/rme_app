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

class PenmedikFisioTerapiWidget extends StatefulWidget {
  const PenmedikFisioTerapiWidget({super.key});

  @override
  State<PenmedikFisioTerapiWidget> createState() =>
      _PemedikRadiologiWidgetState();
}

class _PemedikRadiologiWidgetState extends State<PenmedikFisioTerapiWidget> {
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
        if (state.loadingSaveFisioterapi) {
          EasyLoading.show();
        }
        if (!state.loadingSaveFisioterapi) {
          EasyLoading.dismiss();
        }

        state.saveFisioterapi.fold(
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
                    emty: (e) async {
                      final shouldPop = await Alert.loaded(context,
                          subTitle: "", title: "Pesan");
                      // ignore: use_build_context_synchronously
                      context
                          .read<AsesmenIgdBloc>()
                          .add(const AsesmenIgdEvent.clearFisioTerapi());
                      return shouldPop ?? false;
                    },
                    loaded: (e) async {
                      // =================
                      try {
                        MetaModel meta =
                            MetaModel.fromJson(e.value["metadata"]);

                        String noLab = e.value["response"]["no_lab"].toString();

                        final shouldPop = await Alert.loaded(context,
                            subTitle: "Nomor  : $noLab ${meta.message}",
                            title: "Pesan");

                        // ignore: use_build_context_synchronously
                        context
                            .read<AsesmenIgdBloc>()
                            .add(const AsesmenIgdEvent.clearFisioTerapi());
                        return shouldPop ?? false;
                        // ignore: empty_catches
                      } catch (e) {}
                    })));
      },
      builder: (context, state) {
        return Scaffold(
            appBar: AppBar(
              backgroundColor: ThemeColor.primaryColor,
              title: Text(
                "Plan - Rencana Tindakan Fisiotheraphy Pada Pasien Tersebut ( Fee For Services ) ?",
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
                          labelText: "Cari pelayanan",
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
                                  "Daftar Grup Tindakan Fisioterapi",
                                  style: whiteTextStyle,
                                ),
                                automaticallyImplyLeading: false,
                              ),
                              body: Container(
                                padding: EdgeInsets.all(5.sp),
                                child: ListView(
                                  children: (state.fisioTerapiModel.isNotEmpty)
                                      ? state.fisioTerapiModel
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
                                                    if (!state
                                                        .fisioterapiSelection
                                                        .contains(e.kode)) {
                                                      // GET TARIP FISIOTERAPI

                                                      context
                                                          .read<
                                                              AsesmenIgdBloc>()
                                                          .add(AsesmenIgdEvent
                                                              .getTaripFisioTerapi(
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
                                                              .addFisioterapiSelection(
                                                                  value:
                                                                      e.kode));
                                                    }

                                                    if (state
                                                        .fisioterapiSelection
                                                        .contains(e.kode)) {
                                                      context
                                                          .read<
                                                              AsesmenIgdBloc>()
                                                          .add(AsesmenIgdEvent
                                                              .deleteFisioTerapiItem(
                                                                  value:
                                                                      e.kode));

                                                      context
                                                          .read<
                                                              AsesmenIgdBloc>()
                                                          .add(AsesmenIgdEvent
                                                              .deleteItemSelectionFisioterapi(
                                                                  value:
                                                                      e.kode));
                                                    }

                                                    log(state
                                                        .fisioterapiSelection
                                                        .toString());
                                                  },
                                                  style:
                                                      ElevatedButton.styleFrom(
                                                    backgroundColor: (state
                                                            .fisioterapiSelection
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
                          Expanded(
                              child: Container(
                            color: ThemeColor.primaryColor,
                            child: Scaffold(
                              backgroundColor: ThemeColor.bgColor,
                              appBar: AppBar(
                                title: Text(
                                  "Detail Tindakan Fisioterapy Pasien Yang Terpilih",
                                  style: whiteTextStyle,
                                ),
                                automaticallyImplyLeading: false,
                              ),
                              body: ListView(
                                children: state.detailFisioterapi
                                    .asMap()
                                    .entries
                                    .map((e) {
                                  return Card(
                                    elevation: 1,
                                    child: ExpansionTile(
                                      leading: InkWell(
                                          onTap: () {
                                            // DELETE ITEM
                                            log("DELETE ITEM");
                                            log("ITEM ${e.value.kode}");

                                            context.read<AsesmenIgdBloc>().add(
                                                AsesmenIgdEvent
                                                    .deleteFisioTerapiItem(
                                                        value: e.value.kode));

                                            context.read<AsesmenIgdBloc>().add(
                                                AsesmenIgdEvent
                                                    .deleteItemSelectionFisioterapi(
                                                        value: e.value.kode));
                                          },
                                          child: const Icon(
                                              FontAwesomeIcons.trash)),
                                      iconColor: Colors.amber,
                                      title: Text(
                                        e.value.deskripsi,
                                      ),
                                      trailing: Text(e.value.tarip.toString()),
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

                  if (state.fisioterapiSelection.isEmpty) {
                    final shouldPop = await Alert.loaded(context,
                        subTitle: "Tindakan FISIOTHERAPHY \nBelum Ditentukan",
                        title: "Peringatan");
                    return shouldPop ?? false;
                  } else {
                    if (authState is Authenticated) {
                      dynamic data = await deviceInfo.initPlatformState();

                      // SAVE FISIOTERAPI detailFisioterapi
                      InputPenunjangModel penunjangModel = InputPenunjangModel(
                          jenisPenunjang: "FISIOTHERAPHY",
                          umurPasien: singlePasien.first.umur,
                          noReg: singlePasien.first.noreg,
                          deviceID: "ID-${data['id']}-${data['device']}",
                          dokterPengirim: authState.user.nama,
                          kdPoli: authState.user.kodePoli,
                          ketPoli: authState.user.poliklinik.name,
                          kodeDokter: authState.user.userId,
                          kodeKelas: singlePasien.first.kdKelas,
                          list: state.detailFisioterapi);

                      // ignore: use_build_context_synchronously
                      context.read<AsesmenIgdBloc>().add(
                          AsesmenIgdEvent.saveFisioterapi(
                              inputPenunjang: penunjangModel));
                    }
                  }
                },
                onClear: () {
                  // ============================
                  context
                      .read<AsesmenIgdBloc>()
                      .add(const AsesmenIgdEvent.clearFisioTerapi());
                },
              ),
            ]));
      },
    );
  }
}
