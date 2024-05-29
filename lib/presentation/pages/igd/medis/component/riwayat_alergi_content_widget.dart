import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:hms_app/domain/bloc/dashboard/alergi/alergi_bloc.dart';
import 'package:hms_app/domain/bloc/dashboard/pasien/pasien_bloc.dart';
import 'package:hms_app/domain/bloc/dashboard/triase/triase_bloc.dart';
import 'package:hms_app/domain/bloc/user/auth/auth_bloc.dart';
import 'package:hms_app/domain/models/devices_info/device_info_model.dart';
import 'package:hms_app/domain/models/meta/meta_model.dart';
import 'package:hms_app/domain/models/users/user_model.dart';
import 'package:hms_app/presentation/component/alert/mesage_alert.dart';
import 'package:hms_app/presentation/component/component.dart';
import 'package:hms_app/presentation/component/shimer/shimer_loading.dart';
import 'package:hms_app/presentation/pages/widget/header_content_widget.dart';
import 'package:sizer/sizer.dart';

class RiwayatAlergiWidgetContent extends StatefulWidget {
  const RiwayatAlergiWidgetContent({super.key});

  @override
  State<RiwayatAlergiWidgetContent> createState() =>
      _RiwayatAlergiWidgetContentState();
}

class _RiwayatAlergiWidgetContentState
    extends State<RiwayatAlergiWidgetContent> {
  late String statusAlergi;
  late TextEditingController _riwayatAlergiController;

  @override
  void initState() {
    statusAlergi = "";
    _riwayatAlergiController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _riwayatAlergiController.clear();
    _riwayatAlergiController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    AuthState authState = context.watch<AuthBloc>().state;
    PasienState pasienState = context.watch<PasienBloc>().state;
    final singlePasien = pasienState.listPasienModel
        .where((element) => element.mrn == pasienState.normSelected);

    return BlocConsumer<TriaseBloc, TriaseState>(
      listener: (context, state) {
        if (state.isLoadingSaveRiwyatAlergi) {
          EasyLoading.show();
        }

        if (!state.isLoadingSaveRiwyatAlergi) {
          EasyLoading.dismiss();
        }

        state.savefailOrSuccessResultRiwayatAlergi.fold(
            () => null,
            (a) => a.fold(
                (l) => l.maybeMap(
                    orElse: () {},
                    failure: (e) async {
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
          onPressed: () async {
            dynamic data = await deviceInfo.initPlatformState();
            if (authState is Authenticated) {
              // ignore: use_build_context_synchronously
              context.read<TriaseBloc>().add(TriaseEvent.saveRiwayatAlergi(
                  noReg: singlePasien.first.noreg,
                  keluhanUtama: state.keluhanUtama,
                  statusAlergi: state.statusAlergi,
                  statusAlergiDetail: state.statusAlergiDetail,
                  person: toPerson(person: authState.user.person),
                  userID: authState.user.userId,
                  deviceID: "ID-${data['id']}-${data['device']}",
                  pelayanan:
                      toPelayanan(poliklinik: authState.user.poliklinik)));
            }
          },
          title: "Simpan",
          widget: (state.isLoadingGetRiwayatAlergi)
              ? SizedBox(
                  width: Get.width,
                  height: Get.height,
                  child: ShimerLoading.loadingExpandCard(
                      baseColor: Colors.white.withOpacity(0.5),
                      highLightColor: Colors.lightBlue.withOpacity(0.1)),
                )
              : SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      titleContainer(title: "Keluhan Utama"),
                      // ================================ TAMPILKAN RIWAYAT ALERGI //  =======
                      Container(
                        width: Get.width,
                        color: Colors.white,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // ========================= //
                            Padding(
                                padding: EdgeInsets.all(3.sp),
                                child: Text("Keluhan Utama",
                                    style: blackTextStyle.copyWith())),

                            // ========================= //
                            Padding(
                              padding: EdgeInsets.all(3.sp),
                              child: FormWidget.textArea(
                                maxLines: 8,
                                enabled: true,
                                value: state.keluhanUtama,
                                onChanged: (value) {
                                  context.read<TriaseBloc>().add(
                                      TriaseEvent.keluhanUtamaOnchanged(
                                          value: value));
                                },
                              ),
                            ),
                          ],
                        ),
                      ),

                      titleContainer(title: "Riwayat Penyakit Keluarga"),

                      SizedBox(height: 5.sp),

                      BlocConsumer<AlergiBloc, AlergiState>(
                        listener: (context, state) {
                          state.onSaveRiwayatAlergi.fold(
                              () => null,
                              (a) => a.fold(
                                  (l) => l.maybeMap(
                                      orElse: () {},
                                      failure: (e) async {
                                        // FAILURE

                                        if (e.meta.code == 201) {
                                          final shouldPop =
                                              await Alert.warningMessage(
                                                  context,
                                                  subTitle:
                                                      e.meta.message.toString(),
                                                  title: "Peringatan");
                                          return shouldPop ?? false;
                                        }
                                      }),
                                  (r) => r.maybeMap(
                                      orElse: () {},
                                      loaded: (e) async {
                                        MetaModel meta = MetaModel.fromJson(
                                            e.value["metadata"]);
                                        final shouldPop = await Alert.loaded(
                                            context,
                                            subTitle: meta.message,
                                            title: "Pesan");
                                        // ignore: use_build_context_synchronously
                                        context.read<AlergiBloc>().add(
                                            OnGetAlergiKeluargaEvent(
                                                noRM: singlePasien.first.mrn,
                                                noReg:
                                                    singlePasien.first.noreg));
                                        return shouldPop ?? false;
                                      })));
                        },
                        builder: (context, state) {
                          return Container(
                            width: Get.width,
                            height: 20.sp,
                            padding: EdgeInsets.symmetric(horizontal: 5.sp),
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  shape: RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadius.circular(5.sp))),
                              child: const Icon(
                                FontAwesomeIcons.plus,
                                color: Colors.white,
                              ),
                              onPressed: () {
                                CustomDialogWidget.getDialog(
                                    widget: Container(
                                      height: 100.sp,
                                      width: Get.width / 1.5,
                                      decoration: const BoxDecoration(
                                          color: Colors.white),
                                      child: Column(
                                        children: [
                                          TitleWidget.titleContentWidget(
                                              title:
                                                  "TAMBAH DATA RIWAYAT PENYAKIT KELUARGA"),
                                          Container(
                                              height: 25.sp,
                                              width: Get.width,
                                              padding: EdgeInsets.all(5.sp),
                                              child: FormWidget.textForm(
                                                controller:
                                                    _riwayatAlergiController,
                                                enable: true,
                                              )),
                                          Container(
                                            margin: EdgeInsets.all(5.sp),
                                            height: 20.sp,
                                            width: Get.width,
                                            child: IconButton(
                                                onPressed: () {
                                                  if (authState
                                                      is Authenticated) {
                                                    context.read<AlergiBloc>().add(
                                                        OnSaveRiwayatPenyakitKeluargaEvent(
                                                            noRM: singlePasien
                                                                .first.mrn,
                                                            alergi:
                                                                _riwayatAlergiController
                                                                    .text,
                                                            namaUser: authState
                                                                .user.nama));

                                                    _riwayatAlergiController
                                                        .clear();
                                                  }
                                                },
                                                style: ElevatedButton.styleFrom(
                                                    backgroundColor:
                                                        ThemeColor.primaryColor,
                                                    shape:
                                                        RoundedRectangleBorder(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        2.sp))),
                                                color: ThemeColor.whiteColor,
                                                icon: const Icon(
                                                    FontAwesomeIcons
                                                        .circlePlus)),
                                          ),
                                          Expanded(
                                              child: Container(
                                            decoration: BoxDecoration(
                                                color: ThemeColor.greyColor
                                                    .withOpacity(0.3)),
                                            child: ListView(
                                              children: [
                                                Card(
                                                  color:
                                                      ThemeColor.primaryColor,
                                                  elevation: 1,
                                                  shape: RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              5.sp)),
                                                )
                                              ],
                                            ),
                                          ))
                                        ],
                                      ),
                                    ),
                                    color: Colors.transparent);
                              },
                            ),
                          );
                        },
                      ),
                      Container(
                        height: 150.sp,
                        margin: EdgeInsets.all(5.sp),
                        width: Get.width,
                        decoration: BoxDecoration(
                          color: ThemeColor.bgColor,
                          borderRadius: BorderRadius.all(Radius.circular(5.sp)),
                          border: Border.all(color: Colors.black),
                        ),
                        child: Card(
                          elevation: 1,
                          color: ThemeColor.bgColor,
                          child: SizedBox(
                            width: Get.width,
                            child: BlocBuilder<AlergiBloc, AlergiState>(
                              builder: (context, state) {
                                if (state.status ==
                                    AlergiStatus.loadedPenyakitKeluarga) {
                                  return Wrap(
                                    children: state.alergiData
                                        .map((e) => SizedBox(
                                              width: 100.sp,
                                              height: 20.sp,
                                              child: Card(
                                                child: ListTile(
                                                    trailing: IconButton(
                                                      onPressed: () {
                                                        // === //
                                                        CustomDialogWidget
                                                            .getDialog(
                                                                widget: MessageAlert
                                                                    .deleteAlert(
                                                                        mesage:
                                                                            "Apakah Anda yakin menghapus data ${e.alergi} ini ?",
                                                                        onPressed:
                                                                            () {
                                                                          //  === DELETE DATA ==== /
                                                                          context.read<AlergiBloc>().add(OnRemovePenyakitKeluargaEvent(
                                                                              nomor: e.nomor,
                                                                              noRm: e.noRm,
                                                                              kelompok: e.kelompok));

                                                                          Get.back();
                                                                        }));
                                                      },
                                                      icon: const Icon(
                                                        FontAwesomeIcons
                                                            .circleMinus,
                                                        color: ThemeColor
                                                            .dangerColor,
                                                      ),
                                                    ),
                                                    title: Text(
                                                      e.alergi,
                                                      style: whiteTextStyle,
                                                    )),
                                              ),
                                            ))
                                        .toList(),
                                  );
                                } else {
                                  return const SizedBox();
                                }
                              },
                            ),
                          ),
                        ),
                      ),

                      // =========================== STATUS ALERGI
                      SizedBox(height: 5.sp),
                    ],
                  ),
                ),
        );
      },
    );
  }

  Container titleContainer({required String title}) {
    return Container(
      width: Get.width,
      height: 20.sp,
      decoration: BoxDecoration(
        color: ThemeColor.blueColor.withOpacity(0.5),
      ),
      child: Center(
        child: Text(
          title,
          style: blackTextStyle.copyWith(
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}

List<String> pemulanganPasien = [
  "Ya",
  "Tidak",
];
