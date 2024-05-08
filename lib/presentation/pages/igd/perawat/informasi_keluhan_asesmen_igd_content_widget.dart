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
import 'package:hms_app/domain/models/users/user_model.dart';
import 'package:hms_app/presentation/component/component.dart';
import 'package:hms_app/presentation/component/constant/list_constants.dart';
import 'package:hms_app/presentation/component/loading/loading.dart';
import 'package:hms_app/presentation/pages/widget/header_content_widget.dart';
import 'package:sizer/sizer.dart';

class InformasiKeluhanAsesmenIgdContentWidget extends StatefulWidget {
  const InformasiKeluhanAsesmenIgdContentWidget({super.key});

  @override
  State<InformasiKeluhanAsesmenIgdContentWidget> createState() =>
      _InformasiKeluhanAsesmenIgdContentWidgetState();
}

class _InformasiKeluhanAsesmenIgdContentWidgetState
    extends State<InformasiKeluhanAsesmenIgdContentWidget> {
  final ScrollController _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    AuthState authState = context.watch<AuthBloc>().state;
    PasienState pasienState = context.watch<PasienBloc>().state;
    final singlePasien = pasienState.listPasienModel
        .where((element) => element.mrn == pasienState.normSelected);

    return BlocConsumer<AsesmenIgdBloc, AsesmenIgdState>(
      listener: (context, state) {
        if (state.isLoadingSaveInformasiKeluhan) {
          EasyLoading.show();
        }

        if (!state.isLoadingSaveInformasiKeluhan) {
          EasyLoading.dismiss();
        }

        // ================= ================ //
        state.saveInformasiKeluhanResult.fold(
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

        // ================================= //
      },
      builder: (context, state) {
        return (state.isLoadingGetInformasiKeluhan)
            ? Loading.expandedLoading()
            : HeaderContentWidget(
                onPressed: () async {
                  dynamic data = await deviceInfo.initPlatformState();
                  // ACTION SIMPAN DATA
                  if (authState is Authenticated) {
                    // ignore: use_build_context_synchronously
                    context.read<AsesmenIgdBloc>().add(
                        AsesmenIgdEvent.saveInformasiDanKeluhan(
                            asemenKeluhanIgdModel: state.asemenKeluhanIGDModel,
                            noreg: singlePasien.first.noreg,
                            person: toPerson(person: authState.user.person),
                            deviceID: "ID-${data['id']}-${data['device']}",
                            pelayanan: toPelayanan(
                                poliklinik: authState.user.poliklinik)));
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
                    child: Container(
                      margin: EdgeInsets.only(right: 5.sp),
                      width: Get.width,
                      child: Card(
                        color: ThemeColor.bgColor,
                        shape: RoundedRectangleBorder(
                            side: BorderSide(
                                width: 1.sp, color: ThemeColor.blackColor),
                            borderRadius: BorderRadius.circular(2.sp)),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            TitleWidget.titleContainer(
                                title: "Informasi didapat dari ?"),

                            // ================== INFORMASI DAN KELUHAN PASIEN
                            Container(
                              width: Get.width,
                              padding: EdgeInsets.symmetric(
                                  horizontal: 5.sp, vertical: 5.sp),
                              child: Wrap(
                                runAlignment: WrapAlignment.start,
                                runSpacing: 1.sp,
                                spacing: 1.sp,
                                alignment: WrapAlignment.start,
                                children: ListConstants.informasiDidapatDariIGD
                                    .map(
                                      (e) => TitleWidget.boxChoose(
                                          icon: (state.asemenKeluhanIGDModel
                                                      .info ==
                                                  e)
                                              ? const Icon(
                                                  FontAwesomeIcons.check,
                                                  color: Colors.white,
                                                )
                                              : const Icon(
                                                  FontAwesomeIcons.xmark,
                                                  color: Colors.white,
                                                ),
                                          backgroundColor: (state
                                                      .asemenKeluhanIGDModel
                                                      .info ==
                                                  e)
                                              ? Colors.green
                                              : ThemeColor.primaryColor,
                                          onPressed: () {
                                            context.read<AsesmenIgdBloc>().add(
                                                AsesmenIgdEvent
                                                    .selectedInformasi(
                                                        value: e));

                                            if (e !=
                                                ListConstants
                                                    .informasiDidapatDari
                                                    .last) {
                                              context
                                                  .read<AsesmenIgdBloc>()
                                                  .add(const AsesmenIgdEvent
                                                      .selectedInformasiDetail(
                                                      value: ""));
                                            }
                                          },
                                          title: e),
                                    )
                                    .toList(),
                              ),
                            ),

                            if (state.asemenKeluhanIGDModel.info ==
                                ListConstants.informasiDidapatDari.last) ...[
                              Container(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 5.sp, vertical: 2.sp),
                                width: Get.width,
                                child: SizedBox(
                                  child: FormWidget.textArea(
                                      enabled: true,
                                      maxLines: 2,
                                      value: state
                                          .asemenKeluhanIGDModel.infoDetail,
                                      onChanged: (e) {
                                        context.read<AsesmenIgdBloc>().add(
                                            AsesmenIgdEvent
                                                .selectedInformasiDetail(
                                                    value: e));
                                      }),
                                ),
                              ),
                            ],

                            // =============================== CARA MASUK
                            TitleWidget.titleContainer(title: "Cara Masuk ?"),

                            // ================== INFORMASI DAN KELUHAN PASIEN
                            Container(
                              width: Get.width,
                              padding: EdgeInsets.symmetric(
                                  horizontal: 5.sp, vertical: 5.sp),
                              child: Wrap(
                                runAlignment: WrapAlignment.start,
                                runSpacing: 1.sp,
                                spacing: 1.sp,
                                alignment: WrapAlignment.start,
                                children: ListConstants.caraMasuk
                                    .map(
                                      (e) => TitleWidget.boxChoose(
                                          icon: (state.asemenKeluhanIGDModel
                                                      .caraMasuk ==
                                                  e)
                                              ? const Icon(
                                                  FontAwesomeIcons.check,
                                                  color: Colors.white,
                                                )
                                              : const Icon(
                                                  FontAwesomeIcons.xmark,
                                                  color: Colors.white,
                                                ),
                                          backgroundColor: (state
                                                      .asemenKeluhanIGDModel
                                                      .caraMasuk ==
                                                  e)
                                              ? Colors.green
                                              : ThemeColor.primaryColor,
                                          onPressed: () {
                                            context.read<AsesmenIgdBloc>().add(
                                                AsesmenIgdEvent
                                                    .caraMasukOnchanged(
                                                        value: e));

                                            // ignore: unrelated_type_equality_checks
                                            if (e != ListConstants.caraMasuk) {
                                              context
                                                  .read<AsesmenIgdBloc>()
                                                  .add(const AsesmenIgdEvent
                                                      .caraMasukDetailOnchanged(
                                                      value: ""));
                                            }
                                          },
                                          title: e),
                                    )
                                    .toList(),
                              ),
                            ),

                            if (state.asemenKeluhanIGDModel.caraMasuk ==
                                ListConstants.caraMasuk.last) ...[
                              Container(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 5.sp, vertical: 2.sp),
                                width: Get.width,
                                child: SizedBox(
                                  child: FormWidget.textArea(
                                      enabled: true,
                                      maxLines: 3,
                                      value: state.asemenKeluhanIGDModel
                                          .caraMasukDetail,
                                      onChanged: (e) {
                                        context.read<AsesmenIgdBloc>().add(
                                            AsesmenIgdEvent
                                                .caraMasukDetailOnchanged(
                                                    value: e));
                                      }),
                                ),
                              ),
                            ],
                            // ================== JIKA DIPILIH CARA MASUK PALING AKHIR

                            // =============================== CARA MASUK
                            TitleWidget.titleContainer(title: "Asal Masuk ?"),
                            Container(
                              width: Get.width,
                              padding: EdgeInsets.symmetric(
                                  horizontal: 5.sp, vertical: 5.sp),
                              child: Wrap(
                                runAlignment: WrapAlignment.start,
                                runSpacing: 1.sp,
                                spacing: 1.sp,
                                alignment: WrapAlignment.start,
                                children: ListConstants.asalMasuk
                                    .map(
                                      (e) => TitleWidget.boxChoose(
                                          icon: (state.asemenKeluhanIGDModel
                                                      .asalMasuk ==
                                                  e)
                                              ? const Icon(
                                                  FontAwesomeIcons.check,
                                                  color: Colors.white,
                                                )
                                              : const Icon(
                                                  FontAwesomeIcons.xmark,
                                                  color: Colors.white,
                                                ),
                                          backgroundColor: (state
                                                      .asemenKeluhanIGDModel
                                                      .asalMasuk ==
                                                  e)
                                              ? Colors.green
                                              : ThemeColor.primaryColor,
                                          onPressed: () {
                                            context.read<AsesmenIgdBloc>().add(
                                                AsesmenIgdEvent
                                                    .asalMasukOnchanged(
                                                        value: e));

                                            // ignore: unrelated_type_equality_checks
                                            if (e != ListConstants.asalMasuk) {
                                              context
                                                  .read<AsesmenIgdBloc>()
                                                  .add(const AsesmenIgdEvent
                                                      .asalMasukDetailOnchanged(
                                                      value: ""));
                                            }
                                          },
                                          title: e),
                                    )
                                    .toList(),
                              ),
                            ),

                            if (state.asemenKeluhanIGDModel.asalMasuk ==
                                ListConstants.asalMasuk.last) ...[
                              // ===================== ASAL MASUK
                              Container(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 5.sp, vertical: 2.sp),
                                width: Get.width,
                                child: SizedBox(
                                  child: FormWidget.textArea(
                                      enabled: true,
                                      maxLines: 3,
                                      value: state.asemenKeluhanIGDModel
                                          .asalMasukDetail,
                                      onChanged: (e) {
                                        context.read<AsesmenIgdBloc>().add(
                                            AsesmenIgdEvent
                                                .asalMasukDetailOnchanged(
                                                    value: e));
                                      }),
                                ),
                              ),
                            ],

                            // ==============
                            // =============================== CARA MASUK
                            TitleWidget.titleContainer(
                                title: "Riwayat Penyakit Sekarang"),
                            Container(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 5.sp, vertical: 2.sp),
                              width: Get.width,
                              child: SizedBox(
                                child: FormWidget.textArea(
                                    enabled: true,
                                    maxLines: 3,
                                    value: state
                                        .asemenKeluhanIGDModel.riwayatPenyakit,
                                    onChanged: (e) {
                                      context.read<AsesmenIgdBloc>().add(
                                          AsesmenIgdEvent
                                              .riwayatPenyakitOnchanged(
                                                  value: e));
                                    }),
                              ),
                            ),

                            // =============================== CARA MASUK
                            TitleWidget.titleContainer(
                                title: "Riwayat Pengobatan Sebelumnya"),

                            Container(
                              width: Get.width,
                              padding: EdgeInsets.symmetric(
                                  horizontal: 5.sp, vertical: 5.sp),
                              child: Wrap(
                                runAlignment: WrapAlignment.start,
                                runSpacing: 1.sp,
                                spacing: 1.sp,
                                alignment: WrapAlignment.start,
                                children: ListConstants.yaAtauTidak.map((e) {
                                  return TitleWidget.boxChoose(
                                      backgroundColor: ThemeColor.primaryColor,
                                      onPressed: () {},
                                      icon: const Icon(
                                        FontAwesomeIcons.check,
                                        color: ThemeColor.whiteColor,
                                      ),
                                      title: e);
                                }

                                    // TitleWidget.boxChoose(
                                    //     icon: (state.asemenKeluhanIGDModel
                                    //                 .asalMasuk ==
                                    //             e)
                                    //         ? const Icon(
                                    //             FontAwesomeIcons.check,
                                    //             color: Colors.white,
                                    //           )
                                    //         : const Icon(
                                    //             FontAwesomeIcons.xmark,
                                    //             color: Colors.white,
                                    //           ),
                                    //     backgroundColor: (state
                                    //                 .asemenKeluhanIGDModel
                                    //                 .asalMasuk ==
                                    //             e)
                                    //         ? Colors.green
                                    //         : ThemeColor.primaryColor,
                                    //     onPressed: () {
                                    //       context.read<AsesmenIgdBloc>().add(
                                    //           AsesmenIgdEvent
                                    //               .asalMasukOnchanged(
                                    //                   value: e));

                                    //       // ignore: unrelated_type_equality_checks
                                    //       if (e != ListConstants.asalMasuk) {
                                    //         context
                                    //             .read<AsesmenIgdBloc>()
                                    //             .add(const AsesmenIgdEvent
                                    //                 .asalMasukDetailOnchanged(
                                    //                 value: ""));
                                    //       }
                                    //     },
                                    //     title: e),
                                    ).toList(),
                              ),
                            ),

                            Container(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 5.sp, vertical: 2.sp),
                              width: Get.width,
                              child: SizedBox(
                                child: FormWidget.textArea(
                                    enabled: true,
                                    maxLines: 3,
                                    value:
                                        state.asemenKeluhanIGDModel.riwayatObat,
                                    onChanged: (e) {
                                      context.read<AsesmenIgdBloc>().add(
                                          AsesmenIgdEvent.riwayatObatOnchanged(
                                              value: e));
                                    }),
                              ),
                            ),

                            // =============================== CARA MASUK
                            TitleWidget.titleContainer(
                                title: "Skrining Fungsi Aktifias Sehari-hari"),

                            Container(
                              width: Get.width,
                              padding: EdgeInsets.symmetric(
                                  horizontal: 5.sp, vertical: 5.sp),
                              child: Wrap(
                                runAlignment: WrapAlignment.start,
                                runSpacing: 1.sp,
                                spacing: 1.sp,
                                alignment: WrapAlignment.start,
                                children: ListConstants
                                    .skriningFungsiAktifitasSehariHari
                                    .map(
                                      (e) => TitleWidget.boxChoose(
                                          icon: (state.asemenKeluhanIGDModel
                                                      .fungsional ==
                                                  e)
                                              ? const Icon(
                                                  FontAwesomeIcons.check,
                                                  color: Colors.white,
                                                )
                                              : const Icon(
                                                  FontAwesomeIcons.xmark,
                                                  color: Colors.white,
                                                ),
                                          backgroundColor: (state
                                                      .asemenKeluhanIGDModel
                                                      .fungsional ==
                                                  e)
                                              ? Colors.green
                                              : ThemeColor.primaryColor,
                                          onPressed: () {
                                            context.read<AsesmenIgdBloc>().add(
                                                AsesmenIgdEvent
                                                    .fungsionalOnchanged(
                                                        value: e));
                                          },
                                          title: e),
                                    )
                                    .toList(),
                              ),
                            ),

                            // =============================== CARA MASUK
                            TitleWidget.titleContainer(
                                title:
                                    "Asesmen Risiko Jatuh (Get Up & Go Test)"),

                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                "Cara Berjalan Pasien (Salah Satu Atau Lebih)",
                                style: blackTextStyle,
                              ),
                            ),

                            const Divider(),

                            Padding(
                                padding: EdgeInsets.all(6.sp),
                                child: Text(
                                  "1.  Tidak Seimbang/Sempoyongan/Limbung\n2. Jalan Dengan Menggunakan Alat bantu (Tongkat & Tripot, Kursi Roda, Orang Lain)",
                                  style: blackTextStyle,
                                )),

                            Container(
                                width: Get.width,
                                padding: EdgeInsets.symmetric(
                                    horizontal: 5.sp, vertical: 5.sp),
                                child: Wrap(
                                  runAlignment: WrapAlignment.start,
                                  runSpacing: 1.sp,
                                  spacing: 1.sp,
                                  alignment: WrapAlignment.start,
                                  children: ListConstants.yaTidak
                                      .map(
                                        (e) => TitleWidget.boxChoose(
                                            icon: (state.asemenKeluhanIGDModel
                                                        .resikoJatuh1 ==
                                                    e)
                                                ? const Icon(
                                                    FontAwesomeIcons.check,
                                                    color: Colors.white,
                                                  )
                                                : const Icon(
                                                    FontAwesomeIcons.xmark,
                                                    color: Colors.white,
                                                  ),
                                            backgroundColor: (state
                                                        .asemenKeluhanIGDModel
                                                        .resikoJatuh1 ==
                                                    e)
                                                ? Colors.green
                                                : ThemeColor.primaryColor,
                                            onPressed: () {
                                              context
                                                  .read<AsesmenIgdBloc>()
                                                  .add(AsesmenIgdEvent
                                                      .resikoJatuh1Onchanged(
                                                          value: e));
                                            },
                                            title: e),
                                      )
                                      .toList(),
                                )),

                            const Divider(),
                            Padding(
                              padding: EdgeInsets.all(6.sp),
                              child: Text(
                                "1.  Menopang Saat Akan Duduk : Tampak Memegang Pinggang Kursi \nAtau Meja/Benda Lain Sebagai Penopang Saat Akan Duduk",
                                style: blackTextStyle,
                              ),
                            ),

                            Container(
                                width: Get.width,
                                padding: EdgeInsets.symmetric(
                                    horizontal: 5.sp, vertical: 5.sp),
                                child: Wrap(
                                  runAlignment: WrapAlignment.start,
                                  runSpacing: 1.sp,
                                  spacing: 1.sp,
                                  alignment: WrapAlignment.start,
                                  children: ListConstants.yaTidak
                                      .map(
                                        (e) => TitleWidget.boxChoose(
                                            icon: (state.asemenKeluhanIGDModel
                                                        .resikoJatuh2 ==
                                                    e)
                                                ? const Icon(
                                                    FontAwesomeIcons.check,
                                                    color: Colors.white,
                                                  )
                                                : const Icon(
                                                    FontAwesomeIcons.xmark,
                                                    color: Colors.white,
                                                  ),
                                            backgroundColor: (state
                                                        .asemenKeluhanIGDModel
                                                        .resikoJatuh2 ==
                                                    e)
                                                ? Colors.green
                                                : ThemeColor.primaryColor,
                                            onPressed: () {
                                              context
                                                  .read<AsesmenIgdBloc>()
                                                  .add(AsesmenIgdEvent
                                                      .resikoJatuh2Onchanged(
                                                          value: e));
                                            },
                                            title: e),
                                      )
                                      .toList(),
                                )),
                            const Divider(),

                            SizedBox(height: 5.sp),
                            Container(
                              width: Get.width,
                              height: 20.sp,
                              decoration: BoxDecoration(
                                color: (state.asemenKeluhanIGDModel.hasilKaji
                                        .contains("RISIKO TINGGI"))
                                    ? ThemeColor.dangerColor.withOpacity(0.9)
                                    : (state.asemenKeluhanIGDModel.hasilKaji
                                            .contains("RISIKO RENDAH"))
                                        ? ThemeColor.greenColor.withOpacity(0.9)
                                        : ThemeColor.primaryColor,
                              ),
                              child: Center(
                                child: Text(
                                  state.asemenKeluhanIGDModel.hasilKaji,
                                  style: blackTextStyle.copyWith(
                                      fontWeight: FontWeight.bold,
                                      color: (state
                                              .asemenKeluhanIGDModel.hasilKaji
                                              .contains("RISIKO TINGGI"))
                                          ? ThemeColor.whiteColor
                                          : ThemeColor.bgColor),
                                ),
                              ),
                            ),

                            SizedBox(height: 25.sp)
                          ],
                        ),
                      ),
                    ),
                  ),
                ));
      },
    );
  }

  Container yaAtauTidakBox(
      {required String title,
      required String selected,
      required void Function(String?)? onChanged}) {
    return Container(
      margin: EdgeInsets.only(bottom: 2.sp),
      child: Row(
        children: [
          SizedBox(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Wrap(
                  children: yaAtauTidak
                      .map((e) => SizedBox(
                            width: 60.sp,
                            height: 25.sp,
                            child: RadioListTile(
                                selected: (e == selected) ? true : false,
                                activeColor: const Color(0xFF293074),
                                selectedTileColor: Colors.cyan,
                                title: Text(
                                  e,
                                  style: blackCalibriTextStyle.copyWith(
                                      fontSize: 8.sp),
                                  maxLines: 3,
                                  textAlign: TextAlign.start,
                                  softWrap: true,
                                  overflow: TextOverflow.ellipsis,
                                ),
                                value: e,
                                groupValue: selected,
                                onChanged: onChanged),
                          ))
                      .toList(),
                ),
              ],
            ),
          ),
          Expanded(
            child: Text(
              title,
              style: blackTextStyle,
            ),
          ),
        ],
      ),
    );
  }
}

List<String> yaAtauTidak = ["Tidak", "Ya"];
