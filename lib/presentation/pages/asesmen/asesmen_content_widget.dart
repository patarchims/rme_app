import 'dart:developer';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:hms_app/domain/bloc/dashboard/alergi/alergi_bloc.dart';
import 'package:hms_app/domain/bloc/dashboard/asesmen_igd/asesmen_igd_bloc.dart';
import 'package:hms_app/domain/bloc/dashboard/pasien/pasien_bloc.dart';
import 'package:hms_app/domain/bloc/dashboard/resiko_jatuh/deteksi_resiko_jatuh/deteksi_resiko_jatuh_bloc.dart';
import 'package:hms_app/domain/bloc/dashboard/triase/triase_bloc.dart';
import 'package:hms_app/domain/bloc/user/auth/auth_bloc.dart';
import 'package:hms_app/presentation/component/button/selection_button.dart';
import 'package:hms_app/presentation/component/color/color_helper.dart';
import 'package:hms_app/presentation/component/fonts/font_helper.dart';
import 'package:hms_app/presentation/component/res/colors.dart';
import 'package:hms_app/presentation/component/resources/app_constant.dart';
import 'package:hms_app/presentation/pages/asesmen/menu_asesmen.dart';
import 'package:hms_app/presentation/route/get_route.dart';
import 'package:lottie/lottie.dart';
import 'package:sizer/sizer.dart';

import '../../../domain/models/response/alergi/riwayat_alergi_pasien_model.dart';

class AsesmenContentWidget extends StatefulWidget {
  final String noRm;
  const AsesmenContentWidget({
    super.key,
    required this.noRm,
  });

  @override
  State<AsesmenContentWidget> createState() => _AsesmenContentWidgetState();
}

class _AsesmenContentWidgetState extends State<AsesmenContentWidget> {
  final ScrollController _scrollController = ScrollController();
  String menuTitle = "";

  @override
  void initState() {
    context.read<PasienBloc>().add(PasienEvent.selectedNorm(norm: widget.noRm));
    super.initState();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    AuthState authState = context.watch<AuthBloc>().state;
    context.read<AsesmenIgdBloc>().add(const AsesmenIgdEvent.started());

    // BERSIHKAN KEADAAN // ASESMEN KEPERAWATAN BIDAN
    PasienState pasienState = context.watch<PasienBloc>().state;

    final singlePasien = pasienState.listPasienModel
        .where((element) => element.mrn == widget.noRm);

    // LAKUKAN EKSEKUASI DATA PADA BAGIAN TERTENTU
    context
        .read<DeteksiResikoJatuhBloc>()
        .add(OnGetDetectionResikoJatuhEvent(noReg: singlePasien.first.noreg));

    context.read<AlergiBloc>().add(OnGetRiwayatAlergi(
        noRM: singlePasien.first.mrn, noReg: singlePasien.first.noreg));

    return BlocBuilder<PasienBloc, PasienState>(
      builder: (context, state) {
        final singlePasien = state.listPasienModel
            .where((element) => element.mrn == widget.noRm);
        return Container(
          // ==========
          height: Get.height - 40.sp,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(6.sp),
          ),
          child: Row(
            children: [
              Container(
                height: 250.sp,
                width: 80.sp,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5.sp),
                    gradient: const LinearGradient(
                        colors: [
                          AppColors.secondaryColor,
                          Color(0xFF143658),
                        ],
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter)),
                child: RawScrollbar(
                  thumbColor: ThemeColor.lightGrey,
                  thumbVisibility: true,
                  interactive: true,
                  thickness: 5.sp,
                  controller: _scrollController,
                  trackVisibility: false,
                  radius: Radius.circular(5.sp),
                  child: ListView(
                    controller: _scrollController,
                    children: [
                      // MENU MEDIS
                      Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(5.sp),
                                topRight: Radius.circular(5.sp)),
                            border: Border.all(
                              color: Colors.black,
                            )),
                        child: Column(
                          children: [
                            // TAMPIKAN DETAIL DARI PASIEN TERSEBUT
                            Container(
                              width: Get.width,
                              // padding: const EdgeInsets.all(8.0),
                              decoration: BoxDecoration(
                                  color: Colors.blue.withOpacity(0.5),
                                  borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(5.sp),
                                      topRight: Radius.circular(5.sp))),
                              child: Text(
                                "Pasien",
                                textAlign: TextAlign.center,
                                style: whiteCalibriTextStyle.copyWith(
                                    fontWeight: FontWeight.bold),
                              ),
                            ),

                            SizedBox(height: 6.sp),

                            InkWell(
                              onTap: () {
                                // TAMPILKAN DETAIL PASIEN
                                context.read<PasienBloc>().add(
                                    PasienEvent.getDetailPasien(
                                        noRM: state.normSelected));
                                Get.toNamed(GetRoutes.detailPasienPage);
                              },
                              child: Container(
                                height: 35.sp,
                                width: 35.sp,
                                decoration: BoxDecoration(
                                    border: Border.all(
                                        color: Colors.black, width: 1.sp),
                                    shape: BoxShape.circle,
                                    boxShadow: const [],
                                    // JENIS KELAMIN SESUAIKAN DENGAN GAMBAR
                                    image: DecorationImage(
                                        image: AssetImage(
                                      (singlePasien.first.jenisKelamin ==
                                              "Laki-Laki")
                                          ? "assets/images/man_pasien.png"
                                          : "assets/images/woman_pasien.png",
                                    ))),
                              ),
                            ),

                            SizedBox(height: 5.sp),

                            Text(
                                "${singlePasien.first.mrn} # \n${singlePasien.first.noreg} \n ${singlePasien.first.namaPasien}",
                                style: whiteTextStyle,
                                textAlign: TextAlign.center),

                            SizedBox(height: 5.sp),

                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  // TAMPILKAN ANIMASI // TAMPILKAN PEINGATAN TENTAN RESIKO JATUH
                                  BlocBuilder<DeteksiResikoJatuhBloc,
                                      DeteksiResikoJatuhState>(
                                    builder: (context, state) {
                                      if (state.resiko.isShow) {
                                        return Lottie.asset(
                                            AppConstant.alergiAnimate,
                                            height: 20.sp,
                                            reverse: true,
                                            repeat: true);
                                      }
                                      return Container();
                                    },
                                  ),

                                  BlocBuilder<AlergiBloc, AlergiState>(
                                    builder: (context, state) {
                                      if (state
                                          .riwayatAlergi.alergi.isNotEmpty) {
                                        // ==== //
                                        Iterable<Alergi> newAlergi = state
                                            .riwayatAlergi.alergi
                                            .where((element) =>
                                                element.alergi.toLowerCase() !=
                                                "TIDAK ADA".toLowerCase());

                                        if (newAlergi.isNotEmpty) {
                                          // return Text(newAlergi.toString());
                                          return Lottie.asset(
                                              AppConstant.alertAnimate,
                                              height: 20.sp,
                                              reverse: true,
                                              repeat: true);
                                        }

                                        // return Text(state
                                        //     .riwayatAlergi.alergi.first.alergi
                                        //     .toString());
                                      }
                                      return Container();
                                    },
                                  )
                                ],
                              ),
                            ),

                            SizedBox(height: 15.sp),

                            Container(
                              width: Get.width,
                              padding: const EdgeInsets.all(8.0),
                              decoration: BoxDecoration(
                                  color: Colors.blue.withOpacity(0.5),
                                  borderRadius: const BorderRadius.only(
                                      topLeft: Radius.circular(0),
                                      topRight: Radius.circular(0))),
                              child: Text(
                                "LAPORAN",
                                textAlign: TextAlign.center,
                                style: blackTextStyle.copyWith(
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                            if (authState is Authenticated) ...[
                              // TAMPILKAN PILIHAN // UNTUK MEDIS DOKTER
                              SelectionButton(
                                  data: MenuAsesmen.laporan(
                                          poliklinik: authState.user.poliklinik,
                                          person: authState.user.person)
                                      .map((e) => SelectionButtonData(
                                            activeIcon: EvaIcons.grid,
                                            icon: EvaIcons.gridOutline,
                                            label: e,
                                          ))
                                      .toList(),
                                  onSelected: (index, value) {
                                    setState(() {
                                      menuTitle = value.label;
                                    });
                                  }),
                            ],

                            // TAMPILKAN MENU MEDIS
                            Container(
                                width: Get.width,
                                padding: const EdgeInsets.all(8.0),
                                decoration: BoxDecoration(
                                    color: Colors.blue.withOpacity(0.5),
                                    borderRadius: const BorderRadius.only(
                                        topLeft: Radius.circular(0),
                                        topRight: Radius.circular(0))),
                                child: Text("INPUT DATA",
                                    textAlign: TextAlign.center,
                                    style: blackTextStyle.copyWith(
                                        fontWeight: FontWeight.bold))),

                            if (authState is Authenticated) ...[
                              // TAMPILKAN PILIHAN // UNTUK MEDIS DOKTER
                              SelectionButton(
                                  data: MenuAsesmen.medis(
                                          poliklinik: authState.user.poliklinik,
                                          person: authState.user.person)
                                      .map((e) => SelectionButtonData(
                                            activeIcon: EvaIcons.grid,
                                            icon: EvaIcons.gridOutline,
                                            label: e,
                                          ))
                                      .toList(),
                                  onSelected: (index, value) {
                                    // AMBIL VALUE
                                    setState(() {
                                      menuTitle = value.label;
                                    });

                                    if (value.label == "Triase") {
                                      //  GET DATA TRIASEE
                                      log(value.label.toString());
                                      context.read<TriaseBloc>().add(
                                          TriaseEvent.getTriase(
                                              noReg: singlePasien.first.noreg));
                                    }
                                  }),
                            ],

                            SizedBox(
                              height: 10.sp,
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              /// KONTENT KETIKA MENU DIKLIK
              Expanded(
                child: Container(
                  height: Get.height,
                  margin: EdgeInsets.only(left: 6.sp),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5.sp),
                      color: Colors.white.withOpacity(0.5)),
                  child: Column(
                    children: [
                      // MENU  MEDIS
                      Container(
                        width: Get.width,
                        padding: const EdgeInsets.all(8.0),
                        decoration: BoxDecoration(
                            color: Colors.blue.withOpacity(0.5),
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(5.sp),
                                topRight: Radius.circular(5.sp))),
                        child: Text(
                          menuTitle,
                          textAlign: TextAlign.center,
                          style: blackTextStyle.copyWith(
                              fontWeight: FontWeight.bold),
                        ),
                      ),

                      if (authState is Authenticated) ...[
                        MenuAsesmen.content(
                            poliklinik: authState.user.poliklinik,
                            person: authState.user.person,
                            menu: menuTitle,
                            context: context)
                      ]
                    ],
                  ),
                ),
              ),

              // ===============
            ],
          ),
        );
      },
    );
  }
}
