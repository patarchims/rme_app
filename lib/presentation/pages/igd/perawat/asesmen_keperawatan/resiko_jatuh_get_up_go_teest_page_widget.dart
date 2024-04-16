import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:hms_app/domain/bloc/dashboard/asesmen_igd/asesmen_igd_bloc.dart';
import 'package:hms_app/domain/models/meta/meta_model.dart';
import 'package:hms_app/presentation/component/alert/alert.dart';
import 'package:hms_app/presentation/component/color/color_helper.dart';
import 'package:hms_app/presentation/component/constant/list_constants.dart';
import 'package:hms_app/presentation/component/fonts/font_helper.dart';
import 'package:hms_app/presentation/component/title/title_component.dart';
import 'package:hms_app/presentation/pages/widget/header_content_widget.dart';
import 'package:sizer/sizer.dart';

class ResikoJatuhGetUpGoTestPageWidget extends StatelessWidget {
  const ResikoJatuhGetUpGoTestPageWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AsesmenIgdBloc, AsesmenIgdState>(
      listener: (context, state) {
        // TODO: implement listener

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
      },
      builder: (context, state) {
        return HeaderContentWidget(
            widget: SingleChildScrollView(
          child: Column(
            children: [
              // =============================== CARA MASUK
              TitleWidget.titleContainer(
                  title: "Skrining Fungsi Aktifias Sehari-hari"),

              Container(
                width: Get.width,
                padding: EdgeInsets.symmetric(horizontal: 5.sp, vertical: 5.sp),
                child: Wrap(
                  runAlignment: WrapAlignment.start,
                  runSpacing: 1.sp,
                  spacing: 1.sp,
                  alignment: WrapAlignment.start,
                  children: ListConstants.skriningFungsiAktifitasSehariHari
                      .map(
                        (e) => TitleWidget.boxChoose(
                            icon: (state.asemenKeluhanIGDModel.fungsional == e)
                                ? const Icon(
                                    FontAwesomeIcons.check,
                                    color: Colors.white,
                                  )
                                : const Icon(
                                    FontAwesomeIcons.xmark,
                                    color: Colors.white,
                                  ),
                            backgroundColor:
                                (state.asemenKeluhanIGDModel.fungsional == e)
                                    ? Colors.green
                                    : ThemeColor.primaryColor,
                            onPressed: () {
                              context.read<AsesmenIgdBloc>().add(
                                  AsesmenIgdEvent.fungsionalOnchanged(
                                      value: e));
                            },
                            title: e),
                      )
                      .toList(),
                ),
              ),

              // =============================== CARA MASUK
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
                    style: blackTextStyle,
                  )),

              Container(
                  width: Get.width,
                  padding:
                      EdgeInsets.symmetric(horizontal: 5.sp, vertical: 5.sp),
                  child: Wrap(
                    runAlignment: WrapAlignment.start,
                    runSpacing: 1.sp,
                    spacing: 1.sp,
                    alignment: WrapAlignment.start,
                    children: ListConstants.yaTidak
                        .map(
                          (e) => TitleWidget.boxChoose(
                              icon: (state.asemenKeluhanIGDModel.resikoJatuh1 ==
                                      e)
                                  ? const Icon(
                                      FontAwesomeIcons.check,
                                      color: Colors.white,
                                    )
                                  : const Icon(
                                      FontAwesomeIcons.xmark,
                                      color: Colors.white,
                                    ),
                              backgroundColor:
                                  (state.asemenKeluhanIGDModel.resikoJatuh1 ==
                                          e)
                                      ? Colors.green
                                      : ThemeColor.primaryColor,
                              onPressed: () {
                                context.read<AsesmenIgdBloc>().add(
                                    AsesmenIgdEvent.resikoJatuh1Onchanged(
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
                  padding:
                      EdgeInsets.symmetric(horizontal: 5.sp, vertical: 5.sp),
                  child: Wrap(
                    runAlignment: WrapAlignment.start,
                    runSpacing: 1.sp,
                    spacing: 1.sp,
                    alignment: WrapAlignment.start,
                    children: ListConstants.yaTidak
                        .map(
                          (e) => TitleWidget.boxChoose(
                              icon: (state.asemenKeluhanIGDModel.resikoJatuh2 ==
                                      e)
                                  ? const Icon(
                                      FontAwesomeIcons.check,
                                      color: Colors.white,
                                    )
                                  : const Icon(
                                      FontAwesomeIcons.xmark,
                                      color: Colors.white,
                                    ),
                              backgroundColor:
                                  (state.asemenKeluhanIGDModel.resikoJatuh2 ==
                                          e)
                                      ? Colors.green
                                      : ThemeColor.primaryColor,
                              onPressed: () {
                                context.read<AsesmenIgdBloc>().add(
                                    AsesmenIgdEvent.resikoJatuh2Onchanged(
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
                        color: (state.asemenKeluhanIGDModel.hasilKaji
                                .contains("RISIKO TINGGI"))
                            ? ThemeColor.whiteColor
                            : ThemeColor.bgColor),
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
