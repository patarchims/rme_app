import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:hms_app/domain/bloc/dashboard/pasien/pasien_bloc.dart';
import 'package:hms_app/domain/bloc/dashboard/resiko_jatuh/resiko_jatuh_anak/resiko_jatuh_anak_bloc.dart';
import 'package:hms_app/domain/bloc/user/auth/auth_bloc.dart';
import 'package:hms_app/domain/models/devices_info/device_info_model.dart';
import 'package:hms_app/domain/models/meta/meta_model.dart';
import 'package:hms_app/domain/models/users/user_model.dart';
import 'package:hms_app/presentation/component/component.dart';
import 'package:hms_app/presentation/pages/widget/header_content_widget.dart';
import 'package:sizer/sizer.dart';

class AsesmenResikoJatuhPadaAnak extends StatefulWidget {
  const AsesmenResikoJatuhPadaAnak({super.key});

  @override
  State<AsesmenResikoJatuhPadaAnak> createState() =>
      _AsesmenResikoJatuhPadaAnakState();
}

class _AsesmenResikoJatuhPadaAnakState
    extends State<AsesmenResikoJatuhPadaAnak> {
  final ScrollController _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    PasienState pasienState = context.watch<PasienBloc>().state;
    final singlePasien = pasienState.listPasienModel
        .where((element) => element.mrn == pasienState.normSelected);
    AuthState authState = context.watch<AuthBloc>().state;

    return BlocConsumer<ResikoJatuhAnakBloc, ResikoJatuhAnakState>(
      listener: (context, state) {
        // === === //
        if (state.status == ResikoJatuhAnakStatus.isLoadingSave) {
          EasyLoading.show(maskType: EasyLoadingMaskType.black);
        }

        if (state.status != ResikoJatuhAnakStatus.isLoadingSave) {
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
          title: "Simpan",
          onPressed: () async {
            // SIMPAN DATA ASESEMEN RESIKO JATUH ANAK

            dynamic data = await deviceInfo.initPlatformState();

            if (authState is Authenticated) {
              // ignore: use_build_context_synchronously
              context.read<ResikoJatuhAnakBloc>().add(OnSaveResikoJatuhAnak(
                  resikoJatuh: state.resikoJatuh,
                  noreg: singlePasien.first.noreg,
                  person: toPerson(person: authState.user.person),
                  kategori: toKategoriString(
                      spesiliasasi: authState.user.spesialisasi),
                  deviceID: "ID-${data['id']}-${data['device']}",
                  skor: state.total!,
                  jenis: "Anak",
                  pelayanan:
                      toPelayanan(poliklinik: authState.user.poliklinik)));
            }
          },
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
                      title: "ASSESMEN PASIEN RESIKO JATUH PADA ANAK"),
                  Padding(
                    padding: EdgeInsets.all(8.sp),
                    child: RichText(
                      text: TextSpan(
                        text:
                            'Lakukan pengkajian ( skoring ) risiko jatuh pada saat pasien masuk, ketika terjadi ',
                        style: blackTextStyle,
                        children: <TextSpan>[
                          TextSpan(
                              text: 'perubahan kondisi', style: blackTextStyle),
                          TextSpan(
                              text:
                                  'pasien/therapi, saat pasien pindah ruangan lain, pasien risiko tinggi dikaji setiap 24 jam atau sesaat setelah terjadi kasus jatuh.',
                              style: blackTextStyle),
                        ],
                      ),
                    ),
                  ),
                  if (state.total != null) ...[
                    Container(
                      padding: EdgeInsets.all(5.sp),
                      width: Get.width,
                      height: 20.sp,
                      decoration: BoxDecoration(
                        color: ThemeColor.greenColor.withOpacity(0.5),
                      ),
                      child: RichText(
                        text: TextSpan(
                            text: "Total Skor : ${state.total.toString()}",
                            style: blackTextStyle.copyWith(
                                fontWeight: FontWeight.bold),
                            children: [
                              TextSpan(
                                  text:
                                      '   Kategori Resiko : ${(state.total! <= 12) ? "Resiko Rendah" : "Resiko Tinggi"}',
                                  style: blackTextStyle.copyWith(
                                      fontWeight: FontWeight.bold)),
                            ]),
                      ),
                    ),
                  ],
                  // =================== //
                  if (state.resikoJatuh.isNotEmpty) ...[
                    SizedBox(
                      child: Column(
                        children: state.resikoJatuh.map((resiko) {
                          return SizedBox(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  padding: EdgeInsets.all(5.sp),
                                  width: Get.width,
                                  height: 20.sp,
                                  decoration: BoxDecoration(
                                    color:
                                        ThemeColor.yellowColor.withOpacity(0.5),
                                  ),
                                  child: Text(
                                    resiko.namaFaktor,
                                    textAlign: TextAlign.start,
                                    style: blackTextStyle.copyWith(
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: resiko.resikoJatuh
                                        .map((e) => Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceAround,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceAround,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Container(
                                                      width: Get.width / 2,
                                                      padding:
                                                          EdgeInsets.all(5.sp),
                                                      child: Text(
                                                        e.kategoriFaktor,
                                                        style: blackTextStyle,
                                                      ),
                                                    ),
                                                    SizedBox(
                                                      height: 15.sp,
                                                      width: 20.sp,
                                                      child: ElevatedButton(
                                                        onPressed: () {
                                                          // ONN PRESS
                                                          context
                                                              .read<
                                                                  ResikoJatuhAnakBloc>()
                                                              .add(OnCheclistResikoJatuhAnak(
                                                                  faktorIndex:
                                                                      resiko
                                                                          .noUrut,
                                                                  resikoJatuhIndex:
                                                                      e.noUrut,
                                                                  resikoJatuh: e
                                                                      .copyWith(
                                                                          isEnable:
                                                                              !e.isEnable)));
                                                        },
                                                        style: ElevatedButton
                                                            .styleFrom(
                                                          backgroundColor: (e
                                                                  .isEnable)
                                                              ? Colors.green
                                                              : ThemeColor
                                                                  .primaryColor,
                                                          shape:
                                                              RoundedRectangleBorder(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        5.sp),
                                                          ),
                                                        ),
                                                        child: Text(
                                                          e.skor.toString(),
                                                          style: whiteTextStyle,
                                                        ),
                                                      ),
                                                    )
                                                  ],
                                                ),
                                                const Divider()
                                              ],
                                            ))
                                        .toList(),
                                  ),
                                )
                              ],
                            ),
                          );
                        }).toList(),
                      ),
                    )
                  ],
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
