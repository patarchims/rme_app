import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:hms_app/domain/bloc/dashboard/asesmen_keperawatan_bidan/asesmen_keperawatan_bidan_bloc.dart';
import 'package:hms_app/domain/models/response/siki_model.dart';
import 'package:sizer/sizer.dart';
import '../../../component/component.dart';

class IntervensiKeperawatanWidget extends StatelessWidget {
  const IntervensiKeperawatanWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AsesmenKeperawatanBidanBloc,
        AsesmenKeperawatanBidanState>(
      builder: (context, state) {
        return Stack(
          children: [
            // ================= ========
            Positioned(
                top: 0,
                left: 0,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                        margin: EdgeInsets.symmetric(horizontal: 2.sp),
                        height: 20.sp,
                        child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                backgroundColor: ThemeColor.primaryColor,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(4.sp))),
                            onPressed: () {
                              context.read<AsesmenKeperawatanBidanBloc>().add(
                                  const AsesmenKeperawatanBidanEvent
                                      .pilihDiagnosa(
                                      pilihDiagnosaKeperawatan:
                                          PilihDiagnosaKeperawatan.diagnosa));

                              context.read<AsesmenKeperawatanBidanBloc>().add(
                                  const AsesmenKeperawatanBidanEvent
                                      .clearIntervensi());
                            },
                            child: Row(
                              children: [
                                const Icon(
                                  FontAwesomeIcons.arrowLeft,
                                  color: Colors.white,
                                ),
                                SizedBox(
                                  width: 2.sp,
                                ),
                                Text(
                                  "PILIH DIAGNOSA",
                                  style: whiteTextStyle,
                                ),
                              ],
                            ))),
                  ],
                )),
            // ================ =========
            Positioned(
                top: 0,
                right: 0,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                        margin: EdgeInsets.symmetric(horizontal: 2.sp),
                        height: 20.sp,
                        child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                backgroundColor: ThemeColor.primaryColor,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(4.sp))),
                            onPressed: () {
                              // TODO :
                              // CEK APAKAH SIKI SUDAH DIPILIH ATAU TIDAK
                              if (state.selectionSIKI == null) {
                                Get.showSnackbar(
                                  GetSnackBar(
                                    backgroundColor:
                                        ThemeColor.dangerColor.withOpacity(0.8),
                                    title: "Pesan",
                                    message:
                                        'Silahkan pilih siki terlebih dahulu',
                                    icon: const Icon(
                                        FontAwesomeIcons.circleCheck),
                                    duration: const Duration(seconds: 3),
                                  ),
                                );
                              }

                              if (state.selectionSIKI != null) {
                                context.read<AsesmenKeperawatanBidanBloc>().add(
                                    const AsesmenKeperawatanBidanEvent
                                        .pilihDiagnosa(
                                        pilihDiagnosaKeperawatan:
                                            PilihDiagnosaKeperawatan.selesai));
                              }
                            },
                            child: Row(
                              children: [
                                Text(
                                  "SELESAI",
                                  style: whiteTextStyle,
                                ),
                                SizedBox(
                                  width: 2.sp,
                                ),
                                const Icon(
                                  FontAwesomeIcons.arrowRight,
                                  color: Colors.white,
                                ),
                              ],
                            ))),
                  ],
                )),

            //=======||
            if (state.isLoadingGetSIKI) ...[
              Positioned.fill(
                  child: Center(
                      child: SizedBox(
                height: 100.sp,
                width: 100.sp,
                child: CircularProgressIndicator(
                    strokeWidth: 2.sp, color: ThemeColor.primaryColor),
              )))
            ],
            state.getFailOrSuccessCariSiki.fold(
                () => Container(),
                (a) => a.fold(
                    (l) => l.maybeMap(orElse: () {
                          return Container();
                        }),
                    (r) => r.maybeMap(orElse: () {
                          return Container();
                        }, loaded: (e) {
                          //
                          List<SikiModel> data =
                              (e.value["response"] as Iterable)
                                  .map((e) => SikiModel.fromMap(e))
                                  .toList();

                          return Positioned.fill(
                              child: Container(
                            margin: EdgeInsets.only(top: 25.sp),
                            child: ListView(
                              children: data
                                  .asMap()
                                  .entries
                                  .map((e) => Card(
                                        color: (state.selectionSIKI == null)
                                            ? ThemeColor.primaryColor
                                                .withOpacity(0.2)
                                            : (state.selectionSIKI!.kode ==
                                                    e.value.kode)
                                                ? ThemeColor.greenColor
                                                    .withOpacity(0.2)
                                                : ThemeColor.primaryColor
                                                    .withOpacity(0.2),
                                        elevation: 0,
                                        child: Column(
                                          children: [
                                            Card(
                                              color: ThemeColor.bgColor,
                                              elevation: 0,
                                              shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          2.sp),
                                                  side: const BorderSide(
                                                      color: ThemeColor
                                                          .blackColor)),
                                            ),
                                            ListTile(
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(2),
                                              ),
                                              iconColor:
                                                  ThemeColor.primaryColor,
                                              leading: Text(
                                                (e.key + 1).toString(),
                                                style: blackTextStyle.copyWith(
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                              title: Text(
                                                e.value.kode,
                                                style: blackTextStyle.copyWith(
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                              subtitle: Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(e.value.judul,
                                                      style: blackTextStyle
                                                          .copyWith(
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold)),
                                                  Card(
                                                    color: ThemeColor.bgColor,
                                                    elevation: 0,
                                                    shape: RoundedRectangleBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(2.sp),
                                                        side: const BorderSide(
                                                            color: ThemeColor
                                                                .blackColor)),
                                                    child: Column(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .start,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        titleCard(
                                                            title: "OBSERVASI"),
                                                        Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                  .all(8.0),
                                                          child: AutoSizeText(
                                                            e.value.observasi,
                                                            style: blackTextStyle
                                                                .copyWith(
                                                                    fontSize:
                                                                        6.sp),
                                                            maxLines: 30,
                                                          ),
                                                        ),
                                                        titleCard(
                                                            title:
                                                                "TERAPEUTIK"),
                                                        Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                  .all(8.0),
                                                          child: AutoSizeText(
                                                            e.value.terapeutik,
                                                            style: blackTextStyle
                                                                .copyWith(
                                                                    fontSize:
                                                                        6.sp),
                                                            maxLines: 30,
                                                          ),
                                                        ),
                                                        titleCard(
                                                            title: "EDUKASI"),
                                                        Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                  .all(8.0),
                                                          child: AutoSizeText(
                                                            e.value.edukasi,
                                                            style: blackTextStyle
                                                                .copyWith(
                                                                    fontSize:
                                                                        6.sp),
                                                            maxLines: 30,
                                                          ),
                                                        ),
                                                        titleCard(
                                                            title:
                                                                "KOLABORASI"),
                                                        Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                  .all(8.0),
                                                          child: AutoSizeText(
                                                            e.value.kolaborasi,
                                                            style: blackTextStyle
                                                                .copyWith(
                                                                    fontSize:
                                                                        6.sp),
                                                            maxLines: 30,
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              trailing: SizedBox(
                                                height: Get.height,
                                                child: ElevatedButton(
                                                  onPressed: () {
                                                    // TODO: PILIH SIKI
                                                    context
                                                        .read<
                                                            AsesmenKeperawatanBidanBloc>()
                                                        .add(AsesmenKeperawatanBidanEvent
                                                            .selectionSIKI(
                                                                sikiModel:
                                                                    e.value));
                                                  },
                                                  style: ElevatedButton.styleFrom(
                                                      backgroundColor:
                                                          ThemeColor
                                                              .primaryColor,
                                                      shape:
                                                          RoundedRectangleBorder(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          2.sp))),
                                                  child: Text(
                                                    "Pilih",
                                                    style: whiteTextStyle,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ))
                                  .toList(),
                            ),
                          ));
                        }))),
          ],
        );
      },
    );
  }

  Container titleCard({required String title}) {
    return Container(
      padding: const EdgeInsets.all(4),
      decoration: BoxDecoration(
          color: ThemeColor.primaryColor.withOpacity(0.2),
          border: const Border()),
      width: Get.width,
      child: Text(
        title,
        textAlign: TextAlign.center,
        style: blackTextStyle.copyWith(fontWeight: FontWeight.bold),
      ),
    );
  }
}
