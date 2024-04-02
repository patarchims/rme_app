import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:hms_app/domain/bloc/dashboard/asesmen_keperawatan_bidan/asesmen_keperawatan_bidan_bloc.dart';
import 'package:hms_app/domain/bloc/dashboard/asuhan_keperawatan/deskripsi_luaran_slki/deskripsi_luaran_slki_bloc.dart';
import 'package:hms_app/domain/models/response/sdki_model.dart';
import 'package:hms_app/presentation/component/component.dart';
import 'package:hms_app/presentation/screens/emty_page.dart';
import 'package:sizer/sizer.dart';

class MasalahKeperawatanWidget extends StatefulWidget {
  const MasalahKeperawatanWidget({super.key});

  @override
  State<MasalahKeperawatanWidget> createState() =>
      _MasalahKeperawatanWidgetState();
}

class _MasalahKeperawatanWidgetState extends State<MasalahKeperawatanWidget> {
  late TextEditingController _cariController;
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    _cariController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _cariController.clear();
    _cariController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: ThemeColor.bgColor,
        body: Padding(
          padding: EdgeInsets.all(8.sp),
          child: Column(
            children: [
              Row(
                children: [
                  // ======
                  Padding(
                    padding: EdgeInsets.only(right: 4.sp),
                    child: Text("Cari Diagnosa Keperawatan",
                        style: blackTextStyle.copyWith(fontSize: 9.sp)),
                  ),

                  // ======
                  Expanded(
                      child: FormWidget.textForm(
                          enable: true,
                          autoFocus: true,
                          controller: _cariController)),

                  Container(
                    padding: EdgeInsets.all(3.sp),
                    width: 35.sp,
                    child: FloatingActionButton(
                      backgroundColor: ThemeColor.primaryColor,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(2.sp)),
                      onPressed: () {
                        if (_cariController.text == "") {
                          Get.showSnackbar(GetSnackBar(
                              backgroundColor:
                                  ThemeColor.dangerColor.withOpacity(0.8),
                              title: "Kesalahan",
                              message: 'Diagnosa tidak boleh kosong ',
                              icon: const Icon(FontAwesomeIcons.xmark),
                              duration: const Duration(seconds: 2)));
                        }

                        if (_cariController.text != "") {
                          // CARI MASALAH KEPERAWATAN
                          context.read<AsesmenKeperawatanBidanBloc>().add(
                              AsesmenKeperawatanBidanEvent.cariSDKI(
                                  value: _cariController.text));
                        }
                      },
                      heroTag: "cari",
                      child: const Icon(
                        FontAwesomeIcons.magnifyingGlass,
                        color: Colors.white,
                      ),
                    ),
                  )
                ],
              ),
              Expanded(
                  child: Card(
                elevation: 1.sp,
                shape: RoundedRectangleBorder(
                  side: const BorderSide(color: Colors.black),
                  borderRadius: BorderRadius.circular(2.sp),
                ),
                margin: EdgeInsets.only(top: 5.sp),
                color: ThemeColor.primaryColor.withOpacity(0.4),
                child: BlocBuilder<AsesmenKeperawatanBidanBloc,
                    AsesmenKeperawatanBidanState>(
                  builder: (context, state) {
                    if (state.isLoadingCariSDKI) {
                      return Center(
                        child: SizedBox(
                          height: 100.sp,
                          width: 100.sp,
                          child: CircularProgressIndicator(
                              strokeWidth: 2.sp,
                              color: ThemeColor.primaryColor),
                        ),
                      );
                    }

                    return state.getfailOrSuccessCariSDKI.fold(
                        () => Container(),
                        (a) => a.fold(
                            (l) => l.maybeMap(orElse: () {
                                  return const EmtyScren(subTitle: "Gagal");
                                }, failure: (e) {
                                  return EmtyScren(
                                      subTitle: e.meta.message.toString());
                                }),
                            (r) => r.maybeMap(orElse: () {
                                  return Container();
                                }, loaded: (e) {
                                  // PARSING DATA

                                  List<SDKIModel> data =
                                      (e.value["response"] as Iterable)
                                          .map((e) => SDKIModel.fromMap(e))
                                          .toList();

                                  return Scrollbar(
                                    thumbVisibility: true,
                                    interactive: true,
                                    controller: _scrollController, // <
                                    child: ListView(
                                      controller: _scrollController,
                                      children: data
                                          .asMap()
                                          .entries
                                          .map((e) => Padding(
                                                padding: EdgeInsets.symmetric(
                                                    horizontal: 2.sp,
                                                    vertical: 1.sp),
                                                child: Card(
                                                  elevation: 0,
                                                  color: ThemeColor.bgColor,
                                                  shape: RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              2.sp)),
                                                  child: ListTile(
                                                      trailing:
                                                          FloatingActionButton(
                                                        backgroundColor:
                                                            ThemeColor
                                                                .greenColor
                                                                .withOpacity(
                                                                    0.5),
                                                        shape: RoundedRectangleBorder(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        2.sp)),
                                                        onPressed: () {
                                                          // CARI // INTERVENSI

                                                          log("CETAK DIAGNOSA  ${e.value.kode}");

                                                          context
                                                              .read<
                                                                  DeskripsiLuaranSlkiBloc>()
                                                              .add(OnGetDeskripsiLuaranSikiEvent(
                                                                  diagnosa: e
                                                                      .value
                                                                      .kode));
                                                          context
                                                              .read<
                                                                  AsesmenKeperawatanBidanBloc>()
                                                              .add(AsesmenKeperawatanBidanEvent
                                                                  .selectSDKI(
                                                                      sdkiModel:
                                                                          e.value));

                                                          log(e.value.slki
                                                              .toString());

                                                          context
                                                              .read<
                                                                  AsesmenKeperawatanBidanBloc>()
                                                              .add(AsesmenKeperawatanBidanEvent
                                                                  .selectedKeluaran(
                                                                      value:
                                                                          "${e.value.kode} ${e.value.judul}"));

                                                          context
                                                              .read<
                                                                  AsesmenKeperawatanBidanBloc>()
                                                              .add(const AsesmenKeperawatanBidanEvent
                                                                  .pilihDiagnosa(
                                                                  pilihDiagnosaKeperawatan:
                                                                      PilihDiagnosaKeperawatan
                                                                          .keluaran));
                                                        },
                                                        heroTag: e.value.kode,
                                                        child: const Icon(
                                                          FontAwesomeIcons
                                                              .arrowRight,
                                                          color: ThemeColor
                                                              .whiteColor,
                                                        ),
                                                      ),
                                                      subtitle: Text(
                                                        e.value.kode,
                                                        style: blackTextStyle
                                                            .copyWith(
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold),
                                                      ),
                                                      title: Text(
                                                        e.value.judul,
                                                        style: blackTextStyle,
                                                      )),
                                                ),
                                              ))
                                          .toList(),
                                    ),
                                  );
                                }, emty: (e) {
                                  return const EmtyScren(
                                      subTitle: "Data kosong");
                                })));
                  },
                ),
              ))
            ],
          ),
        ));
  }
}
