import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hms_app/domain/bloc/dashboard/pasien/pasien_bloc.dart';
import 'package:hms_app/domain/models/meta/meta_model.dart';
import 'package:hms_app/presentation/component/component.dart';
import 'package:hms_app/presentation/component/extenstion/date_helper.dart';
import 'package:hms_app/presentation/component/loading/loading.dart';
import 'package:hms_app/presentation/kebidanan/presentation/analisa_data/hapus_analisa_data_widget.dart';
import 'package:hms_app/presentation/kebidanan/presentation/analisa_data/on_validasi_analisa_data_widget.dart';
import 'package:hms_app/presentation/perina/bloc/analisa/analisa_bloc.dart';
import 'package:hms_app/presentation/kebidanan/presentation/analisa_data/tambah_analisa_data_widget.dart';
import 'package:hms_app/presentation/pages/widget/header_content_widget.dart';
import 'package:hms_app/presentation/screens/emty_page.dart';
import 'package:sizer/sizer.dart';

class AnalisaDataPageWidget extends StatefulWidget {
  const AnalisaDataPageWidget({super.key});

  @override
  State<AnalisaDataPageWidget> createState() => _AnalisaDataPageWidgetState();
}

class _AnalisaDataPageWidgetState extends State<AnalisaDataPageWidget> {
  final ScrollController _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    PasienState pasienState = context.watch<PasienBloc>().state;
    final singlePasien = pasienState.listPasienModel
        .where((element) => element.mrn == pasienState.normSelected);

    return BlocConsumer<AnalisaBloc, AnalisaState>(
      listener: (context, state) {
        state.onDelete.fold(
            () => null,
            (a) => a.fold(
                (l) => l.maybeMap(
                    orElse: () {},
                    failure: (value) async {
                      final shouldPop = await Alert.loaded(context,
                          subTitle: value.meta.message, title: "Pesan");

                      return shouldPop ?? false;
                    }),
                (r) => r.maybeMap(
                    orElse: () {},
                    loaded: (value) async {
                      MetaModel meta =
                          MetaModel.fromJson(value.value["metadata"]);

                      final shouldPop = await Alert.loaded(context,
                          subTitle: meta.message, title: "Pesan");

                      // ignore: use_build_context_synchronously
                      context.read<AnalisaBloc>().add(OnGetAnalisaDataEvent(
                          noReg: singlePasien.first.noreg));
                      return shouldPop ?? false;
                    })));
      },
      builder: (context, state) {
        if (state.status == AnalisaStatus.isLoadingGetAnalisaData) {
          return Expanded(
              child: HeaderContentWidget(widget: Loading.expandedLoading()));
        }
        return Expanded(
            child: HeaderContentWidget(
                isENableAdd: true,
                backgroundColor: ThemeColor.bgColor,
                onPressed: () {
                  CustomDialogWidget.getDialog(
                      widget: const TambahAnalisaDataWidget(),
                      color: ThemeColor.blueColor);
                },
                title: "Tambah",
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
                      decoration: BoxDecoration(color: ThemeColor.bgColor),
                      margin: EdgeInsets.only(right: 10.sp),
                      child: Column(
                        children: (state.analisaData.isNotEmpty)
                            ? state.analisaData.asMap().entries.map((e) {
                                return Card(
                                  color: ThemeColor.bgColor,
                                  elevation: 1.sp,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(2.sp),
                                    side: BorderSide.none,
                                  ),
                                  child: ListTile(
                                      shape: RoundedRectangleBorder(
                                        //<-- SEE HERE
                                        side: const BorderSide(width: 2),
                                        borderRadius:
                                            BorderRadius.circular(2.sp),
                                      ),
                                      leading: CircleAvatar(
                                        backgroundColor:
                                            const Color(0xff6ae792),
                                        child: Text(
                                          "${e.key + 1}",
                                          style: blackTextStyle,
                                        ),
                                      ),
                                      trailing: FloatingActionButton(
                                        backgroundColor:
                                            (e.value.jam == "00:00:00")
                                                ? ThemeColor.primaryColor
                                                : ThemeColor.softBlue,
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(1.sp)),
                                        onPressed: (e.value.jam == "00:00:00")
                                            ? () {
                                                // APAKAH INI SUDAH TERATASI
                                                CustomDialogWidget.getDialog(
                                                    widget:
                                                        OnValidasiAnalisaData(
                                                  kodeAnalisa:
                                                      e.value.kodeAnalisa,
                                                ));
                                              }
                                            : null,
                                        child: Icon(
                                          FontAwesomeIcons.solidCircleCheck,
                                          color: (e.value.jam == "00:00:00")
                                              ? Colors.white
                                              : Colors.green,
                                        ),
                                      ),
                                      title: RichText(
                                          text: TextSpan(
                                              text: "DIAGNOSA  :  ",
                                              style: blackTextStyle,
                                              children: e.value.analisaData
                                                  .map(
                                                    (e) => TextSpan(
                                                        text:
                                                            "${e.idDiagnosa} - ${e.namaDiagnosa}, ",
                                                        style: blackTextStyle
                                                            .copyWith(
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold)),
                                                  )
                                                  .toList())),
                                      subtitle: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          RichText(
                                            text: TextSpan(
                                                text: "DATA : ",
                                                style: blackTextStyle,
                                                children: [
                                                  TextSpan(text: e.value.data),
                                                ]),
                                          ),
                                          Row(
                                            children: [
                                              ElevatedButton(
                                                onPressed: () {},
                                                style: ElevatedButton.styleFrom(
                                                    backgroundColor:
                                                        ThemeColor.primaryColor,
                                                    shape:
                                                        RoundedRectangleBorder(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        2.sp))),
                                                child: Padding(
                                                  padding:
                                                      const EdgeInsets.all(8.0),
                                                  child: Text(
                                                    "Ditemukan, ${tglIndo(e.value.insertDttm.substring(0, 10))}",
                                                    style:
                                                        whiteTextStyle.copyWith(
                                                            fontSize: 4.sp),
                                                  ),
                                                ),
                                              ),
                                              SizedBox(
                                                width: 5.sp,
                                              ),
                                              ElevatedButton(
                                                onPressed: () {},
                                                style: ElevatedButton.styleFrom(
                                                    backgroundColor: (e
                                                                .value.jam ==
                                                            "00:00:00")
                                                        ? ThemeColor
                                                            .primaryColor
                                                        : ThemeColor.greenColor,
                                                    shape:
                                                        RoundedRectangleBorder(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        2.sp))),
                                                child: Padding(
                                                  padding:
                                                      const EdgeInsets.all(8.0),
                                                  child: (e.value.jam ==
                                                          "00:00:00")
                                                      ? Text(
                                                          "Teratasi, -",
                                                          style: whiteTextStyle
                                                              .copyWith(
                                                                  fontSize:
                                                                      4.sp),
                                                        )
                                                      : Text(
                                                          "Teratasi, Tgl : ${tglIndo(e.value.tgl.substring(0, 10))} Jam ${e.value.jam}",
                                                          style: whiteTextStyle
                                                              .copyWith(
                                                                  fontSize:
                                                                      4.sp),
                                                        ),
                                                ),
                                              ),
                                              SizedBox(
                                                width: 5.sp,
                                              ),
                                              ElevatedButton(
                                                onPressed: () {
                                                  CustomDialogWidget.getDialog(
                                                      widget:
                                                          HapusAnalisaDataWidget(
                                                        kodeAnalisa:
                                                            e.value.kodeAnalisa,
                                                      ),
                                                      color: ThemeColor
                                                          .whiteColor);
                                                },
                                                style: ElevatedButton.styleFrom(
                                                    backgroundColor:
                                                        ThemeColor.dangerColor,
                                                    shape:
                                                        RoundedRectangleBorder(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        2.sp))),
                                                child: Padding(
                                                  padding:
                                                      const EdgeInsets.all(8.0),
                                                  child: Text(
                                                    "Hapus",
                                                    style:
                                                        blackTextStyle.copyWith(
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            fontSize: 4.sp),
                                                  ),
                                                ),
                                              )
                                            ],
                                          ),
                                          SizedBox(
                                            height: 5.sp,
                                          ),
                                        ],
                                      ),
                                      enabled: true),
                                );
                              }).toList()
                            : [
                                EmtyScren(
                                  subTitle: "Data Kosong",
                                  textStyle: blackTextStyle,
                                )
                              ],
                      ),
                    ),
                  ),
                )));
      },
    );
  }
}
