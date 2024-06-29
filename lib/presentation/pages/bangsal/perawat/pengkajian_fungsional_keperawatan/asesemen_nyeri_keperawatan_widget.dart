import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:hms_app/domain/bloc/dashboard/pasien/pasien_bloc.dart';
import 'package:hms_app/domain/bloc/user/auth/auth_bloc.dart';
import 'package:hms_app/domain/models/devices_info/device_info_model.dart';
import 'package:hms_app/domain/models/meta/meta_model.dart';
import 'package:hms_app/domain/models/users/user_model.dart';
import 'package:hms_app/presentation/component/component.dart';
import 'package:hms_app/presentation/component/loading/loading.dart';
import 'package:hms_app/presentation/pages/bangsal/bloc/asesmen_nyeri/asesmen_nyeri_bloc.dart';
import 'package:hms_app/presentation/pages/widget/header_content_widget.dart';
import 'package:sizer/sizer.dart';

class AsesmenAwalNyeriKeperawatanWidgetPage extends StatefulWidget {
  const AsesmenAwalNyeriKeperawatanWidgetPage({super.key});

  @override
  State<AsesmenAwalNyeriKeperawatanWidgetPage> createState() =>
      _AsesmenAwalNyeriKeperawatanWidgetPageState();
}

class _AsesmenAwalNyeriKeperawatanWidgetPageState
    extends State<AsesmenAwalNyeriKeperawatanWidgetPage> {
  final ScrollController _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    PasienState pasienState = context.watch<PasienBloc>().state;
    final singlePasien = pasienState.listPasienModel
        .where((element) => element.mrn == pasienState.normSelected);

    AuthState authState = context.watch<AuthBloc>().state;

    return BlocConsumer<AsesmenNyeriBloc, AsesmenNyeriState>(
      listener: (context, state) {
        if (state.status == AsesmenNyeriStatus.isLoadingSave) {
          EasyLoading.show(maskType: EasyLoadingMaskType.black);
        }

        // TUTUP LOADING
        if (state.status != AsesmenNyeriStatus.isLoadingSave) {
          EasyLoading.dismiss();
        }

        state.saveResultFailure.fold(
            () => null,
            (a) => a.fold(
                (l) => l.maybeMap(
                    orElse: () {},
                    failure: (e) async {
                      final shouldPop = await Alert.warningMessage(context,
                          subTitle: e.meta.message.toString());
                      return shouldPop ?? false;
                    }),
                (r) => r.maybeMap(
                    orElse: () {},
                    loaded: (e) async {
                      final meta = MetaModel.fromJson(e.value["metadata"]);
                      final shouldPop = await Alert.loaded(context,
                          subTitle: meta.message, title: "Pesan");
                      return shouldPop ?? false;
                    })));
      },
      builder: (context, state) {
        if (state.status == AsesmenNyeriStatus.isLoadingGet) {
          return HeaderContentWidget(
              backgroundColor: ThemeColor.bgColor,
              widget: Loading.expandedLoading());
        }
        return HeaderContentWidget(
            backgroundColor: ThemeColor.bgColor,
            isENableAdd: true,
            onPressed: () async {
              dynamic data = await deviceInfo.initPlatformState();
              if (authState is Authenticated) {
                // ignore: use_build_context_synchronously
                context.read<AsesmenNyeriBloc>().add(OnSaveAsesemenNyeri(
                    noReg: singlePasien.first.noreg,
                    skalaNyeri: state.skalaNyeri.skalaNyeri,
                    person: toPerson(person: authState.user.person),
                    pelayanan:
                        toPelayanan(poliklinik: authState.user.poliklinik),
                    devicesID: "ID-${data['id']}-${data['device']}"));
              }
            },
            title: "SIMPAN",
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
                    //===//
                    TitleWidget.titleContainer(title: "ASESMEN AWAL NYERI"),

                    Slider(
                      value: state.skalaNyeri.skalaNyeri.toDouble(),
                      max: 10,
                      divisions: 10,
                      label: state.skalaNyeri.skalaNyeri.toString(),
                      onChanged: (double value) {
                        context.read<AsesmenNyeriBloc>().add(
                            OnCHangedAsesmenNyeri(skalaNyeri: value.toInt()));
                      },
                    ),

                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          InkWell(
                            onTap: () {
                              context
                                  .read<AsesmenNyeriBloc>()
                                  .add(OnCHangedAsesmenNyeri(skalaNyeri: 1));
                            },
                            child: SizedBox(
                                height: 20.sp,
                                child:
                                    Image.asset("assets/images/nyeri/1.png")),
                          ),
                          InkWell(
                            onTap: () {
                              context
                                  .read<AsesmenNyeriBloc>()
                                  .add(OnCHangedAsesmenNyeri(skalaNyeri: 3));
                            },
                            child: SizedBox(
                                height: 20.sp,
                                child:
                                    Image.asset("assets/images/nyeri/2.png")),
                          ),
                          InkWell(
                            onTap: () {
                              context
                                  .read<AsesmenNyeriBloc>()
                                  .add(OnCHangedAsesmenNyeri(skalaNyeri: 5));
                            },
                            child: SizedBox(
                                height: 20.sp,
                                child:
                                    Image.asset("assets/images/nyeri/3.png")),
                          ),
                          InkWell(
                            onTap: () {
                              context
                                  .read<AsesmenNyeriBloc>()
                                  .add(OnCHangedAsesmenNyeri(skalaNyeri: 7));
                            },
                            child: SizedBox(
                                height: 20.sp,
                                child:
                                    Image.asset("assets/images/nyeri/4.png")),
                          ),
                          InkWell(
                            onTap: () {
                              context
                                  .read<AsesmenNyeriBloc>()
                                  .add(OnCHangedAsesmenNyeri(skalaNyeri: 8));
                            },
                            child: SizedBox(
                                height: 20.sp,
                                child:
                                    Image.asset("assets/images/nyeri/5.png")),
                          ),
                          InkWell(
                            onTap: () {
                              context
                                  .read<AsesmenNyeriBloc>()
                                  .add(OnCHangedAsesmenNyeri(skalaNyeri: 10));
                            },
                            child: SizedBox(
                                height: 20.sp,
                                child:
                                    Image.asset("assets/images/nyeri/6.png")),
                          ),
                        ],
                      ),
                    ),

                    SizedBox(
                      height: 10.sp,
                    ),

                    SizedBox(
                      child: Row(
                        children: [
                          SizedBox(
                            width: Get.width / 2.5,
                            child: Text(
                              "Skala\nNyeri\n${state.skalaNyeri.skalaNyeri}",
                              style: blackTextStyle.copyWith(
                                  fontWeight: FontWeight.bold),
                              textAlign: TextAlign.center,
                            ),
                          ),
                          Expanded(
                              child: SizedBox(
                            child: Column(
                              children: [
                                SizedBox(
                                    height: 50.sp,
                                    child: Image.asset(toNyeri(
                                        nyeri: state.skalaNyeri.skalaNyeri
                                            .toDouble()))),
                                Text(
                                  toNyeriText(
                                      nyeri: state.skalaNyeri.skalaNyeri
                                          .toDouble()),
                                  style: blackTextStyle,
                                )
                              ],
                            ),
                          )),
                        ],
                      ),
                    ),

                    SizedBox(
                      height: 10.sp,
                    ),
                    Container(
                      height: 45.sp,
                      width: Get.width,
                      margin: EdgeInsets.symmetric(horizontal: 15.sp),
                      padding: EdgeInsets.all(5.sp),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5.sp),
                        color: ThemeColor.lightGrey,
                      ),
                      child: Text(
                        "0        :  (Tidak Nyeri)\n1-3     :  (Ringan)\n4-6    :  (Sedang)\n7-10    : (Berat)",
                        style: blackTextStyle,
                      ),
                    )
                  ],
                ),
              ),
            ));
      },
    );
  }

  String toNyeriText({required double nyeri}) {
    switch (nyeri) {
      case 1:
        return "Tidak Ada Nyeri";
      case 2:
        return "Nyeri Ringan";
      case 3:
        return "Nyeri Ringan";
      case 4:
        return "Nyeri Yang Menganggu";
      case 5:
        return "Nyeri Yang Menganggu";
      case 6:
        return "Nyeri Yang Menyusahkan";
      case 7:
        return "Nyeri Yang Menyusahkan";
      case 8:
        return "Nyeri Hebat";
      case 9:
        return "Nyeri Hebat";
      case 10:
        return "Nyeri Sangat Hebat";
      default:
        return "Tidak Ada Nyeri";
    }
  }

  String toNyeri({required double nyeri}) {
    switch (nyeri) {
      case 1:
        return "assets/images/nyeri/1.png";
      case 2:
        return "assets/images/nyeri/2.png";
      case 3:
        return "assets/images/nyeri/2.png";
      case 4:
        return "assets/images/nyeri/3.png";
      case 5:
        return "assets/images/nyeri/3.png";
      case 6:
        return "assets/images/nyeri/4.png";
      case 7:
        return "assets/images/nyeri/5.png";
      case 8:
        return "assets/images/nyeri/5.png";
      case 9:
        return "assets/images/nyeri/6.png";
      case 10:
        return "assets/images/nyeri/6.png";
      default:
        return "assets/images/nyeri/1.png";
    }
  }
}
