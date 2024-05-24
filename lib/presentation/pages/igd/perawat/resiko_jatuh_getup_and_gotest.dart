import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:hms_app/domain/bloc/dashboard/pasien/pasien_bloc.dart';
import 'package:hms_app/domain/bloc/user/auth/auth_bloc.dart';
import 'package:hms_app/domain/models/devices_info/device_info_model.dart';
import 'package:hms_app/domain/models/users/user_model.dart';
import 'package:hms_app/presentation/component/component.dart';
import 'package:hms_app/presentation/component/constant/list_constants.dart';
import 'package:hms_app/presentation/component/loading/loading.dart';
import 'package:hms_app/presentation/pages/igd/bloc/resiko_jatuh_getup/resiko_jatuh_getup_bloc.dart';
import 'package:hms_app/presentation/pages/widget/header_content_widget.dart';
import 'package:sizer/sizer.dart';

class ResikoJatuhGetUpAndGoTestPageWidget extends StatefulWidget {
  const ResikoJatuhGetUpAndGoTestPageWidget({super.key});

  @override
  State<ResikoJatuhGetUpAndGoTestPageWidget> createState() =>
      _ResikoJatuhGetUpAndGoTestPageWidgetState();
}

class _ResikoJatuhGetUpAndGoTestPageWidgetState
    extends State<ResikoJatuhGetUpAndGoTestPageWidget> {
  final ScrollController _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    AuthState authState = context.watch<AuthBloc>().state;
    PasienState pasienState = context.watch<PasienBloc>().state;
    final singlePasien = pasienState.listPasienModel
        .where((element) => element.mrn == pasienState.normSelected);

    return BlocConsumer<ResikoJatuhGetupBloc, ResikoJatuhGetupState>(
      listener: (context, state) {},
      builder: (context, state) {
        if (state.status == ResikoJatuhGetupStatus.isLoadingGet) {
          return HeaderContentWidget(widget: Loading.expandedLoading());
        }

        return HeaderContentWidget(
            backgroundColor: ThemeColor.bgColor,
            isENableAdd: true,
            onPressed: () async* {
              // TODO : SAVE DATA
              dynamic data = await deviceInfo.initPlatformState();
              if (authState is Authenticated) {
                // ignore: use_build_context_synchronously
                context
                    .read<ResikoJatuhGetupBloc>()
                    .add(OnSaveResikoJatuhGetUpGoTestEvent(
                        resikoJatuh1: state.resikoJatuh.resikoJatuh1,
                        resikoJatuh2: state.resikoJatuh.resikoJatuh2,
                        tindakan: state.resikoJatuh.tindakan,
                        person: toPerson(person: authState.user.person),
                        deviceID: "ID-${data['id']}-${data['device']}",
                        noReg: singlePasien.first.noreg,
                        pelayanan: toPelayanan(
                          poliklinik: authState.user.poliklinik,
                        )));
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
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // TODO SAVE DATA
                    // ==== // / =============================== CARA MASUK
                    TitleWidget.titleContainer(
                        title: "Asesmen Risiko Jatuh (Get Up & Go Test)"),

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
                            style: blackTextStyle)),

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
                                    icon: (state.resikoJatuh.resikoJatuh1 == e)
                                        ? const Icon(
                                            FontAwesomeIcons.check,
                                            color: Colors.white,
                                          )
                                        : const Icon(
                                            FontAwesomeIcons.xmark,
                                            color: Colors.white,
                                          ),
                                    backgroundColor:
                                        (state.resikoJatuh.resikoJatuh1 == e)
                                            ? Colors.green
                                            : ThemeColor.primaryColor,
                                    onPressed: () {
                                      context.read<ResikoJatuhGetupBloc>().add(
                                          OnChangeResikoJatuh1Event(value: e));
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
                                    icon: (state.resikoJatuh.resikoJatuh2 == e)
                                        ? const Icon(
                                            FontAwesomeIcons.check,
                                            color: Colors.white,
                                          )
                                        : const Icon(
                                            FontAwesomeIcons.xmark,
                                            color: Colors.white,
                                          ),
                                    backgroundColor:
                                        (state.resikoJatuh.resikoJatuh2 == e)
                                            ? Colors.green
                                            : ThemeColor.primaryColor,
                                    onPressed: () {
                                      context.read<ResikoJatuhGetupBloc>().add(
                                          OnChangeResikoJatuh2Event(value: e));
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
                        color: (state.resikoJatuh.tindakan
                                .contains("RISIKO TINGGI"))
                            ? ThemeColor.dangerColor.withOpacity(0.9)
                            : (state.resikoJatuh.tindakan
                                    .contains("RISIKO RENDAH"))
                                ? ThemeColor.greenColor.withOpacity(0.9)
                                : ThemeColor.primaryColor,
                      ),
                      child: Center(
                        child: Text(
                          state.resikoJatuh.tindakan,
                          style: blackTextStyle.copyWith(
                              fontWeight: FontWeight.bold,
                              color: (state.resikoJatuh.tindakan
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
            ));
      },
    );
  }
}
