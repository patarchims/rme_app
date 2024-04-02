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
import 'package:hms_app/presentation/component/alert/mesage_alert.dart';
import 'package:hms_app/presentation/component/component.dart';
import 'package:hms_app/presentation/pages/igd/bloc/resep/resep_bloc.dart';
import 'package:hms_app/presentation/pages/igd/dokter/pemeriksaaan_penunjang/peresepan_pasien/tambah_resep_obat_widget.dart';
import 'package:hms_app/presentation/pages/widget/header_content_widget.dart';
import 'package:sizer/sizer.dart';

class PeresepanPasienWidget extends StatefulWidget {
  const PeresepanPasienWidget({super.key});

  @override
  State<PeresepanPasienWidget> createState() => _PeresepanPasienWidgetState();
}

class _PeresepanPasienWidgetState extends State<PeresepanPasienWidget> {
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    // _scrollController.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    AuthState authState = context.watch<AuthBloc>().state;
    PasienState pasienState = context.watch<PasienBloc>().state;
    final singlePasien = pasienState.listPasienModel
        .where((element) => element.mrn == pasienState.normSelected);

    return BlocConsumer<ResepBloc, ResepState>(
      listener: (context, state) {
        // TODO: implement listener
        if (state.status == ResepStatus.isLoadingSaveResep) {
          EasyLoading.show();
        }
        if (state.status != ResepStatus.isLoadingSaveResep) {
          EasyLoading.dismiss();
        }

        state.saveResultResepFailure.fold(
            () => null,
            (a) => a.fold(
                (l) => l.maybeMap(
                    orElse: () {},
                    failure: (e) async {
                      // FAILURE
                      log(e.toString());

                      if (e.meta.code == 201) {
                        final shouldPop = await Alert.warningMessage(context,
                            subTitle: e.meta.message.toString(),
                            title: "Peringatan");
                        return shouldPop ?? false;
                      } else {
                        final shouldPop = await Alert.warningMessage(context,
                            subTitle: "Gagal diproses", title: "Peringatan");
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

        //==//
      },
      builder: (context, state) {
        return HeaderContentWidget(
            backgroundColor: ThemeColor.bgColor,
            isENableAdd: true,
            onPressed: () async {
              if (state.ktaripObatSelection.isEmpty) {
                // tampilkan alert
                final shouldPop = await Alert.warningMessage(context,
                    subTitle: "Silahkan pilih terlebih dahulu\nResep Obat",
                    title: "Peringatan");
                return shouldPop ?? false;
              }
              if (state.ktaripObatSelection.isNotEmpty) {
                dynamic data = await deviceInfo.initPlatformState();
                if (authState is Authenticated) {
                  // ignore: use_build_context_synchronously
                  context.read<ResepBloc>().add(OnSaveResepObatEvent(
                      namaPasien: singlePasien.first.namaPasien,
                      noReg: singlePasien.first.noreg,
                      noRM: singlePasien.first.mrn,
                      catatan: state.informasiResep,
                      keterangan: "",
                      deviceID: "ID - ${data['id']} - ${data['device']}}",
                      namaUser: authState.user.nama,
                      selectionResep: state.ktaripObatSelection));
                }
              }
            },
            widget: SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                      width: Get.width,
                      margin: EdgeInsets.all(7.sp),
                      height: 20.sp,
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            elevation: 1,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(1.sp)),
                            backgroundColor: ThemeColor.darkBlueColor,
                          ),
                          onPressed: () {
                            // TAMBAHKAN RESEP
                            CustomDialogWidget.getDialog(
                                widget: const TambahResepObatWidget());
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              const Icon(
                                FontAwesomeIcons.pills,
                                color: Colors.white,
                              ),
                              SizedBox(
                                width: 5.sp,
                              ),
                              Text(
                                "Tambah Resep",
                                style: whiteTextStyle.copyWith(
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          ))),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 5.sp),
                    child: FormWidget.textArea(
                        onChanged: (value) {
                          context
                              .read<ResepBloc>()
                              .add(OnChangeInformasiResepEvent(value: value));
                        },
                        hinText:
                            "Informasi Resep Pada Riwayat Alergi Pasien Tersebut & Lainnya",
                        maxLines: 3,
                        value: state.informasiResep,
                        enabled: true),
                  ),
                  Container(
                    height: 115.sp,
                    width: Get.width,
                    margin: EdgeInsets.symmetric(horizontal: 5.sp),
                    child: Card(
                      color: ThemeColor.bgColor,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(2.sp),
                          side: BorderSide(width: 1.sp)),
                      child: BlocBuilder<ResepBloc, ResepState>(
                        builder: (context, state) {
                          return Scrollbar(
                            thumbVisibility: true,
                            interactive: true,
                            scrollbarOrientation: ScrollbarOrientation.left,
                            controller: _scrollController, // <
                            child: SingleChildScrollView(
                              controller: _scrollController, // <
                              child: Wrap(
                                spacing: 2,
                                crossAxisAlignment: WrapCrossAlignment.start,
                                alignment: WrapAlignment.start,
                                runSpacing: 2,
                                children: state.ktaripObatSelection.map((e) {
                                  return SizedBox(
                                    width: 100.sp,
                                    child: ListTile(
                                      enabled: true,
                                      style: ListTileStyle.list,
                                      trailing: IconButton(
                                          onPressed: () {
                                            // HAPUS OBAT
                                            CustomDialogWidget.getDialog(
                                                widget:
                                                    MessageAlert.deleteAlert(
                                                        mesage:
                                                            "Apakah Anda yakin menghapus data ${e.namaObat}ini ?",
                                                        onPressed: () {
                                                          // DELETE DATA
                                                          context
                                                              .read<ResepBloc>()
                                                              .add(OnDeleteResepObatEvent(
                                                                  kTaripObatModel:
                                                                      e));

                                                          Get.back();
                                                        }));
                                          },
                                          icon: const Icon(
                                            FontAwesomeIcons.trash,
                                            color: Colors.white,
                                          )),
                                      tileColor: ThemeColor.primaryColor,
                                      title: Text(
                                        "${e.namaObat}\nJumlah ${e.jumlah}\nSatuan ${e.satuan}\nDosis${e.dosis}, \nAturan ${e.aturan}\nPrescriptio ${e.prescriptio}\nFlag ${e.flag}",
                                        style: whiteTextStyle,
                                      ),
                                    ),
                                  );
                                }).toList(),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ));
      },
    );
  }
}
