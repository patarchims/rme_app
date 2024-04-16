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

class AsesmenTindakLanjutIGDContentWidget extends StatefulWidget {
  const AsesmenTindakLanjutIGDContentWidget({super.key});

  @override
  State<AsesmenTindakLanjutIGDContentWidget> createState() =>
      _AsesmenTindakLanjutIGDContentWidgetState();
}

class _AsesmenTindakLanjutIGDContentWidgetState
    extends State<AsesmenTindakLanjutIGDContentWidget> {
  final ScrollController _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    AuthState authState = context.watch<AuthBloc>().state;
    PasienState pasienState = context.watch<PasienBloc>().state;
    final singlePasien = pasienState.listPasienModel
        .where((element) => element.mrn == pasienState.normSelected);

    return BlocConsumer<AsesmenIgdBloc, AsesmenIgdState>(
      listener: (context, state) {
        if (state.isLoadingSaveTindakLanjut) {
          EasyLoading.show();
        }

        if (!state.isLoadingSaveTindakLanjut) {
          EasyLoading.dismiss();
        }

        state.saveTindakLanjutIGDResult.fold(
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

        //=====//
      },
      builder: (context, state) {
        // =============================== //
        return (state.isLoadingGetTindakLanjut)
            ? Loading.expandedLoading()
            : HeaderContentWidget(
                title: "Simpan",
                onPressed: () async {
                  // ON  PRESSED
                  if (authState is Authenticated) {
                    dynamic data = await deviceInfo.initPlatformState();
                    // ignore: use_build_context_synchronously
                    context.read<AsesmenIgdBloc>().add(
                        AsesmenIgdEvent.saveTindakLanjut(
                            tindakLanjut: state.tindakLanjutIGDModel,
                            noreg: singlePasien.first.noreg,
                            person: toPerson(person: authState.user.person),
                            deviceID: "ID - ${data['id']} - ${data['device']}",
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
                  child: SingleChildScrollView(
                    controller: _scrollController,
                    child: SizedBox(
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
                                title:
                                    "Kondisi Pasien Saat Pindah / Pulang Dari IGD"),

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
                                children: ListConstants.kodisiSaatPulangChoose
                                    .map(
                                      (e) => TitleWidget.boxChoose(
                                          icon: (state.tindakLanjutIGDModel
                                                      .pulang1 ==
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
                                                      .tindakLanjutIGDModel
                                                      .pulang1 ==
                                                  e)
                                              ? Colors.green
                                              : ThemeColor.primaryColor,
                                          onPressed: () {
                                            context.read<AsesmenIgdBloc>().add(
                                                AsesmenIgdEvent
                                                    .kondisiPasienOnchanged(
                                                        value: e));
                                          },
                                          title: e),
                                    )
                                    .toList(),
                              ),
                            ),

                            TitleWidget.titleContainer(
                                title: "Transportasi Pulang"),

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
                                children: ListConstants.transportasiPulangChoose
                                    .map(
                                      (e) => TitleWidget.boxChoose(
                                          icon: (state.tindakLanjutIGDModel
                                                      .pulang2 ==
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
                                                      .tindakLanjutIGDModel
                                                      .pulang2 ==
                                                  e)
                                              ? Colors.green
                                              : ThemeColor.primaryColor,
                                          onPressed: () {
                                            context.read<AsesmenIgdBloc>().add(
                                                AsesmenIgdEvent
                                                    .transportasiPulangOnchanged(
                                                        value: e));
                                          },
                                          title: e),
                                    )
                                    .toList(),
                              ),
                            ),

                            TitleWidget.titleContainer(
                                title: "Cara Keluar dari IGD"),

                            Container(
                              width: Get.width,
                              padding: EdgeInsets.symmetric(
                                  horizontal: 5.sp, vertical: 5.sp),
                              child: Wrap(
                                runAlignment: WrapAlignment.start,
                                runSpacing: 1.sp,
                                spacing: 1.sp,
                                alignment: WrapAlignment.start,
                                children: ListConstants.caraKeluarDariIGD
                                    .map(
                                      (e) => TitleWidget.boxChoose(
                                          icon: (state.tindakLanjutIGDModel
                                                      .caraKeluar ==
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
                                                      .tindakLanjutIGDModel
                                                      .caraKeluar ==
                                                  e)
                                              ? Colors.green
                                              : ThemeColor.primaryColor,
                                          onPressed: () {
                                            context.read<AsesmenIgdBloc>().add(
                                                AsesmenIgdEvent
                                                    .caraPulangOnChanged(
                                                        value: e));
                                          },
                                          title: e),
                                    )
                                    .toList(),
                              ),
                            ),

                            TitleWidget.titleContainer(
                                title:
                                    "Jam Keluar/dipulangkan/dirujuk/ditransfer IGD"),

                            Container(
                              width: Get.width,
                              decoration:
                                  const BoxDecoration(color: Colors.white),
                              child: Center(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Container(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 10, vertical: 5),
                                      decoration: BoxDecoration(
                                          color: ThemeColor.blueColor,
                                          borderRadius:
                                              BorderRadius.circular(10)),
                                      child: DropdownButton<String>(
                                        icon: const Icon(Icons.arrow_drop_down),
                                        iconSize: 42,
                                        underline: const SizedBox(),
                                        dropdownColor: ThemeColor.primaryColor,
                                        value: (state
                                                    .tindakLanjutIGDModel.jam ==
                                                "")
                                            ? times.first
                                            : state.tindakLanjutIGDModel.jam,
                                        items: times
                                            .map<DropdownMenuItem<String>>(
                                                (String value) {
                                          return DropdownMenuItem<String>(
                                            value: value,
                                            child: Text(
                                              value,
                                              style: whiteTextStyle.copyWith(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 10.sp),
                                            ),
                                          );
                                        }).toList(),
                                        onChanged: (String? newValue) {
                                          context.read<AsesmenIgdBloc>().add(
                                              AsesmenIgdEvent.jamOnchanged(
                                                  value: newValue.toString()));
                                        },
                                      ),
                                    ),
                                    SizedBox(width: 10.sp),
                                    Container(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 10, vertical: 5),
                                      decoration: BoxDecoration(
                                          color: ThemeColor.blueColor,
                                          borderRadius:
                                              BorderRadius.circular(10)),
                                      child: DropdownButton<String>(
                                        icon: const Icon(Icons.arrow_drop_down),
                                        iconSize: 42,
                                        underline: const SizedBox(),
                                        dropdownColor: ThemeColor.primaryColor,
                                        value: (state.tindakLanjutIGDModel
                                                    .menit ==
                                                "")
                                            ? menit.first
                                            : state.tindakLanjutIGDModel.menit,
                                        items: menit
                                            .map<DropdownMenuItem<String>>(
                                                (String value) {
                                          return DropdownMenuItem<String>(
                                            value: value,
                                            child: Text(
                                              value,
                                              style: whiteTextStyle.copyWith(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 10.sp),
                                            ),
                                          );
                                        }).toList(),
                                        // Step 5.
                                        onChanged: (String? newValue) {
                                          context.read<AsesmenIgdBloc>().add(
                                              AsesmenIgdEvent.menitOnchanged(
                                                  value: newValue.toString()));
                                        },
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),

                            TitleWidget.titleContainer(
                                title: "Pendidikan kesehatan pasien pulang :"),

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
                                children: ListConstants.pendidikanSaatPulang
                                    .map(
                                      (e) => TitleWidget.boxChoose(
                                          icon: (state.tindakLanjutIGDModel
                                                      .pulang3 ==
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
                                                      .tindakLanjutIGDModel
                                                      .pulang3 ==
                                                  e)
                                              ? Colors.green
                                              : ThemeColor.primaryColor,
                                          onPressed: () {
                                            context.read<AsesmenIgdBloc>().add(
                                                AsesmenIgdEvent
                                                    .pendidikanKesehatanOnchanged(
                                                        value: e));

                                            if (e !=
                                                ListConstants
                                                    .pendidikanSaatPulang
                                                    .last) {
                                              context
                                                  .read<AsesmenIgdBloc>()
                                                  .add(const AsesmenIgdEvent
                                                      .pendidikanKesehatanOnchangedDetail(
                                                      value: ""));
                                            }
                                          },
                                          title: e),
                                    )
                                    .toList(),
                              ),
                            ),

                            if (state.tindakLanjutIGDModel.pulang3 ==
                                ListConstants.pendidikanSaatPulang.last) ...[
                              Container(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 5.sp, vertical: 2.sp),
                                width: Get.width,
                                child: SizedBox(
                                  child: FormWidget.textArea(
                                      enabled: true,
                                      maxLines: 3,
                                      value: state
                                          .tindakLanjutIGDModel.pulang3Detail,
                                      onChanged: (e) {
                                        context.read<AsesmenIgdBloc>().add(
                                            AsesmenIgdEvent
                                                .pendidikanKesehatanOnchangedDetail(
                                                    value: e));
                                      }),
                                ),
                              ),
                            ],

                            SizedBox(height: 15.sp)
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

List<String> times = [
  "1",
  "2",
  "3",
  "4",
  "5",
  "6",
  "7",
  "8",
  "9",
  "10",
  "11",
  "12",
  "13",
  "14",
  "15",
  "16",
  "17",
  "18",
  "19",
  "20",
  "21",
  "22",
  "23",
  "24"
];

List<String> menit = [
  "10",
  "15",
  "20",
  "25",
  "30",
  "35",
  "40",
  "45",
  "50",
  "55"
];
