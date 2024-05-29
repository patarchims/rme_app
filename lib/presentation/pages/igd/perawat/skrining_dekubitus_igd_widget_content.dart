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

class SkriningDekubitusIGdContentWidget extends StatefulWidget {
  const SkriningDekubitusIGdContentWidget({super.key});

  @override
  State<SkriningDekubitusIGdContentWidget> createState() =>
      _SkriningDekubitusIGdContentWidgetState();
}

class _SkriningDekubitusIGdContentWidgetState
    extends State<SkriningDekubitusIGdContentWidget> {
  final ScrollController _scrollController = ScrollController();
  @override
  Widget build(BuildContext context) {
    AuthState authState = context.watch<AuthBloc>().state;
    PasienState pasienState = context.watch<PasienBloc>().state;
    final singlePasien = pasienState.listPasienModel
        .where((element) => element.mrn == pasienState.normSelected);

    return BlocConsumer<AsesmenIgdBloc, AsesmenIgdState>(
      listener: (context, state) {
        if (state.isLoadingSaveResikoDekubitus) {
          EasyLoading.show();
        }

        if (!state.isLoadingSaveResikoDekubitus) {
          EasyLoading.dismiss();
        }

        // ================================= //
        state.saveSkriningResikoDekubitus.fold(
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
        return (state.isloadingGetResikoDekubitus)
            ? Loading.expandedLoading()
            : HeaderContentWidget(
                title: "Simpan",
                onPressed: () async {
                  // ==================================== // LAKUKAN SIMPAN DATA

                  dynamic data = await deviceInfo.initPlatformState();
                  // ACTION SIMPAN DATA
                  if (authState is Authenticated) {
                    // ignore: use_build_context_synchronously
                    context.read<AsesmenIgdBloc>().add(
                        AsesmenIgdEvent.saveSkriningResikoDekubitus(
                            skringinResikoDekubitusModel:
                                state.skriningResikoDekubitus,
                            noreg: singlePasien.first.noreg,
                            person: toPerson(person: authState.user.person),
                            deviceID: "ID-${data['id']}-${data['device']}",
                            pelayanan: toPelayanan(
                                poliklinik: authState.user.poliklinik)));
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
                  child: Container(
                    margin: EdgeInsets.only(right: 10.sp),
                    child: SingleChildScrollView(
                      controller: _scrollController,
                      child: Card(
                        color: ThemeColor.bgColor,
                        shape: RoundedRectangleBorder(
                            side: BorderSide(
                                width: 1.sp, color: ThemeColor.blackColor),
                            borderRadius: BorderRadius.circular(2.sp)),
                        child: Column(
                          children: [
                            // ===================== // [ ==================== ]
                            TitleWidget.titleContainer(
                                title: "Skrining Resiko Dikubitus"),

                            Row(
                              children: [
                                Container(
                                  width: Get.width / 3,
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
                                              width: 80.sp,
                                              icon:
                                                  (state.skriningResikoDekubitus
                                                              .dekubitus1 ==
                                                          e)
                                                      ? const Icon(
                                                          FontAwesomeIcons
                                                              .check,
                                                          color: Colors.white,
                                                        )
                                                      : const Icon(
                                                          FontAwesomeIcons
                                                              .xmark,
                                                          color: Colors.white,
                                                        ),
                                              backgroundColor:
                                                  (state.skriningResikoDekubitus
                                                              .dekubitus1 ==
                                                          e)
                                                      ? Colors.green
                                                      : ThemeColor.primaryColor,
                                              onPressed: () {
                                                context
                                                    .read<AsesmenIgdBloc>()
                                                    .add(AsesmenIgdEvent
                                                        .dekubitusOnchaged1(
                                                            value: e));
                                              },
                                              title: e),
                                        )
                                        .toList(),
                                  ),
                                ),
                                Expanded(
                                  child: Text(
                                    "Apakah Pasien Menggunakan Kursi Roda Atau Membutuhkan Bantuan ?",
                                    style: blackTextStyle.copyWith(
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                )
                              ],
                            ),

                            // ===================== //
                            const Divider(),
                            // ===================== //
                            Row(
                              children: [
                                Container(
                                  width: Get.width / 3,
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
                                              width: 80.sp,
                                              icon:
                                                  (state.skriningResikoDekubitus
                                                              .dekubitus2 ==
                                                          e)
                                                      ? const Icon(
                                                          FontAwesomeIcons
                                                              .check,
                                                          color: Colors.white,
                                                        )
                                                      : const Icon(
                                                          FontAwesomeIcons
                                                              .xmark,
                                                          color: Colors.white,
                                                        ),
                                              backgroundColor:
                                                  (state.skriningResikoDekubitus
                                                              .dekubitus2 ==
                                                          e)
                                                      ? Colors.green
                                                      : ThemeColor.primaryColor,
                                              onPressed: () {
                                                context
                                                    .read<AsesmenIgdBloc>()
                                                    .add(AsesmenIgdEvent
                                                        .dekubitusOnchaged2(
                                                            value: e));
                                              },
                                              title: e),
                                        )
                                        .toList(),
                                  ),
                                ),
                                Expanded(
                                  child: Text(
                                    "Apakah Anda Inkontinensia Uri Atau Alvi?",
                                    style: blackTextStyle.copyWith(
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                )
                              ],
                            ),

                            // ===================== //
                            const Divider(),
                            // ===================== //
                            Row(
                              children: [
                                Container(
                                  width: Get.width / 3,
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
                                              width: 80.sp,
                                              icon:
                                                  (state.skriningResikoDekubitus
                                                              .dekubitus3 ==
                                                          e)
                                                      ? const Icon(
                                                          FontAwesomeIcons
                                                              .check,
                                                          color: Colors.white,
                                                        )
                                                      : const Icon(
                                                          FontAwesomeIcons
                                                              .xmark,
                                                          color: Colors.white,
                                                        ),
                                              backgroundColor:
                                                  (state.skriningResikoDekubitus
                                                              .dekubitus3 ==
                                                          e)
                                                      ? Colors.green
                                                      : ThemeColor.primaryColor,
                                              onPressed: () {
                                                context
                                                    .read<AsesmenIgdBloc>()
                                                    .add(AsesmenIgdEvent
                                                        .dekubitusOnchaged3(
                                                            value: e));
                                              },
                                              title: e),
                                        )
                                        .toList(),
                                  ),
                                ),
                                Expanded(
                                  child: Text(
                                    "Apakah Ada Riwayat Dekubitus Atau Luka Dekubitus?",
                                    style: blackTextStyle.copyWith(
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                )
                              ],
                            ),

                            // ===================== //
                            const Divider(),
                            // ===================== //
                            Row(
                              children: [
                                Container(
                                  width: Get.width / 3,
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
                                              width: 80.sp,
                                              icon:
                                                  (state.skriningResikoDekubitus
                                                              .dekubitus4 ==
                                                          e)
                                                      ? const Icon(
                                                          FontAwesomeIcons
                                                              .check,
                                                          color: Colors.white,
                                                        )
                                                      : const Icon(
                                                          FontAwesomeIcons
                                                              .xmark,
                                                          color: Colors.white,
                                                        ),
                                              backgroundColor:
                                                  (state.skriningResikoDekubitus
                                                              .dekubitus4 ==
                                                          e)
                                                      ? Colors.green
                                                      : ThemeColor.primaryColor,
                                              onPressed: () {
                                                context
                                                    .read<AsesmenIgdBloc>()
                                                    .add(AsesmenIgdEvent
                                                        .dekubitusOnchaged4(
                                                            value: e));
                                              },
                                              title: e),
                                        )
                                        .toList(),
                                  ),
                                ),
                                Expanded(
                                  child: Text(
                                    "Apakah Pasien Di atas 65 Tahun?",
                                    style: blackTextStyle.copyWith(
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                )
                              ],
                            ),

                            // ===================== //
                            TitleWidget.titleContainer(title: "Khusus Anak"),

                            Row(
                              children: [
                                Container(
                                  width: Get.width / 3,
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
                                              width: 80.sp,
                                              icon:
                                                  (state.skriningResikoDekubitus
                                                              .dekubitusAnak ==
                                                          e)
                                                      ? const Icon(
                                                          FontAwesomeIcons
                                                              .check,
                                                          color: Colors.white,
                                                        )
                                                      : const Icon(
                                                          FontAwesomeIcons
                                                              .xmark,
                                                          color: Colors.white,
                                                        ),
                                              backgroundColor:
                                                  (state.skriningResikoDekubitus
                                                              .dekubitusAnak ==
                                                          e)
                                                      ? Colors.green
                                                      : ThemeColor.primaryColor,
                                              onPressed: () {
                                                context
                                                    .read<AsesmenIgdBloc>()
                                                    .add(AsesmenIgdEvent
                                                        .dekubitusOnchagedAnak(
                                                            value: e));
                                              },
                                              title: e),
                                        )
                                        .toList(),
                                  ),
                                ),
                                Expanded(
                                  child: Text(
                                    "Apakah Ekstremitas Dan Badan Tidak Sesuai Dengan Usia Perkembangan?",
                                    style: blackTextStyle.copyWith(
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              );
      },
    );
  }
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
                children: ListConstants.yaTidak
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
