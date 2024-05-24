import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:hms_app/domain/bloc/dashboard/pasien/pasien_bloc.dart';
import 'package:hms_app/domain/models/meta/meta_model.dart';
import 'package:hms_app/presentation/component/alert/mesage_alert.dart';
import 'package:hms_app/presentation/component/component.dart';
import 'package:hms_app/presentation/component/loading/loading.dart';
import 'package:hms_app/presentation/kebidanan/bloc/kartu_observasi/kartu_observasi_bloc.dart';
import 'package:hms_app/presentation/kebidanan/presentation/kartu_observasi/tambah_kartu_observasi_page_widget.dart';
import 'package:hms_app/presentation/kebidanan/presentation/kartu_observasi/ubah_kartu_observasi_page_widget.dart';
import 'package:hms_app/presentation/pages/widget/header_content_widget.dart';
import 'package:hms_app/presentation/screens/emty_page.dart';
import 'package:sizer/sizer.dart';

class KartuObservasiPageWidget extends StatefulWidget {
  const KartuObservasiPageWidget({super.key});

  @override
  State<KartuObservasiPageWidget> createState() =>
      _KartuObservasiPageWidgetState();
}

class _KartuObservasiPageWidgetState extends State<KartuObservasiPageWidget> {
  final ScrollController _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    PasienState pasienState = context.watch<PasienBloc>().state;
    final singlePasien = pasienState.listPasienModel
        .where((element) => element.mrn == pasienState.normSelected);

    return BlocConsumer<KartuObservasiBloc, KartuObservasiState>(
      listener: (context, state) {
        // TODO: implement
        state.onDeleteKartuObservasiResult.fold(
            () => null,
            (a) => a.fold(
                (l) => l.maybeMap(
                    orElse: () {},
                    failure: (e) async {
                      // log(e.toString());
                      if (e.meta.code == 201) {
                        final shouldPop = await Alert.warningMessage(context,
                            subTitle: e.meta.message.toString(),
                            title: "Peringatan");
                        return shouldPop ?? false;
                      }
                      if (e.meta.code == 202) {
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
        if (state.status == KartuObservasiStaus.isLoadingGet) {
          return Expanded(
              child: HeaderContentWidget(widget: Loading.expandedLoading()));
        }

        return Expanded(
            child: HeaderContentWidget(
                backgroundColor: ThemeColor.bgColor,
                isENableAdd: true,
                onPressed: () {
                  // TAMBAH DATA
                  CustomDialogWidget.getDialog(
                      widget: SizedBox(
                          height: Get.height - 100.sp,
                          width: Get.width,
                          child: const TambahKartuObservasiPageWidget()),
                      color: ThemeColor.blueColor);
                },
                title: "TAMBAH",
                widget: RawScrollbar(
                  thumbColor: ThemeColor.darkColor,
                  thumbVisibility: true,
                  interactive: true,
                  thickness: 10.sp,
                  controller: _scrollController,
                  trackVisibility: false,
                  radius: Radius.circular(5.sp),
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        Container(
                            padding: EdgeInsets.only(
                                top: 5.sp, bottom: 0, right: 5.sp, left: 5.sp),
                            child: Table(
                                border: TableBorder.all(),
                                columnWidths: const {
                                  // 0: FlexColumnWidth(0.4),
                                  16: FlexColumnWidth(2),
                                },
                                children: [
                                  TableRow(children: [
                                    TitleWidget.headerCenterTitle2(
                                        title: "JAM"),
                                    TitleWidget.headerCenterTitle2(title: "T"),
                                    TitleWidget.headerCenterTitle2(title: "N"),
                                    TitleWidget.headerCenterTitle2(title: "P"),
                                    TitleWidget.headerCenterTitle2(title: "S"),
                                    TitleWidget.headerCenterTitle2(
                                        title: "CVP"),
                                    TitleWidget.headerCenterTitle2(
                                        title: "EKG"),
                                    TitleWidget.headerCenterTitle2(
                                        title: "UKURAN KI"),
                                    TitleWidget.headerCenterTitle2(
                                        title: "UKURAN KA"),
                                    TitleWidget.headerCenterTitle2(
                                        title: "REDAKSI KI"),
                                    TitleWidget.headerCenterTitle2(
                                        title: "REDAKSI KA"),
                                    TitleWidget.headerCenterTitle2(
                                        title: "GERAK ANGGOTA BADAN"),
                                    TitleWidget.headerCenterTitle2(
                                        title: "KESADARAN"),
                                    TitleWidget.headerCenterTitle2(
                                        title: "SPUTUM WARNA"),
                                    TitleWidget.headerCenterTitle2(
                                        title: "ISI CUP"),
                                    TitleWidget.headerCenterTitle2(
                                        title: "KETERANGAN"),
                                    TitleWidget.headerCenterTitle2(
                                        title: "ACTION"),
                                  ]),
                                ])),
                        if (state.kartuObservasi.isEmpty) ...[
                          Container(
                            height: 200.sp,
                            margin: EdgeInsets.only(right: 5.sp, left: 5.sp),
                            decoration: BoxDecoration(
                                color: ThemeColor.primaryColor.withOpacity(0.2),
                                borderRadius: BorderRadius.circular(0.sp)),
                            child: EmtyScren(
                              subTitle: "Data Kosong",
                              textStyle: blackTextStyle,
                            ),
                          ),
                        ],
                        if (state.kartuObservasi.isNotEmpty) ...[
                          Container(
                              padding: EdgeInsets.only(right: 5.sp, left: 5.sp),
                              child: Table(
                                  border: TableBorder.all(),
                                  columnWidths: const {
                                    16: FlexColumnWidth(2),
                                  },
                                  children: state.kartuObservasi.map((e) {
                                    return TableRow(children: [
                                      TitleWidget.contentTitle(
                                          title: e.jam.substring(11, 19)),
                                      TitleWidget.contentTitle(title: e.t),
                                      TitleWidget.contentTitle(title: e.n),
                                      TitleWidget.contentTitle(title: e.p),
                                      TitleWidget.contentTitle(title: e.s),
                                      TitleWidget.contentTitle(title: e.cvp),
                                      TitleWidget.contentTitle(title: e.ekg),
                                      TitleWidget.contentTitle(
                                          title: e.pupilKiri),
                                      TitleWidget.contentTitle(
                                          title: e.pupilKanan),
                                      TitleWidget.contentTitle(
                                          title: e.redaksiKiri),
                                      TitleWidget.contentTitle(
                                          title: e.redaksiKanan),
                                      TitleWidget.contentTitle(
                                          title: e.anggotaBadan),
                                      TitleWidget.contentTitle(
                                          title: e.kesadaran),
                                      TitleWidget.contentTitle(
                                          title: e.sputumWarna),
                                      TitleWidget.contentTitle(title: e.isiCup),
                                      TitleWidget.contentTitle(
                                          title: e.keterangan),
                                      Padding(
                                        padding: EdgeInsets.all(1.sp),
                                        child: Wrap(
                                          children: [
                                            ElevatedButton(
                                              onPressed: () {
                                                //
                                                CustomDialogWidget.getDialog(
                                                    widget: MessageAlert
                                                        .deleteAlert(
                                                            mesage:
                                                                "Apakah Anda yakin menghapus data ${e.kesadaran} ini ?",
                                                            onPressed: () {
                                                              context
                                                                  .read<
                                                                      KartuObservasiBloc>()
                                                                  .add(
                                                                      OnDeleteKartuObservasiEvent(
                                                                    noReg: singlePasien
                                                                        .first
                                                                        .noreg,
                                                                    idKartu: e
                                                                        .idObservasi,
                                                                  ));

                                                              Get.back();
                                                            }));
                                              },
                                              style: ElevatedButton.styleFrom(
                                                  elevation: 1,
                                                  shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            1.sp),
                                                  ),
                                                  backgroundColor:
                                                      ThemeColor.primaryColor),
                                              child: Icon(
                                                FontAwesomeIcons.trash,
                                                size: 3.sp,
                                                color: Colors.red,
                                              ),
                                            ),
                                            SizedBox(
                                              width: 5.sp,
                                            ),
                                            ElevatedButton(
                                              style: ElevatedButton.styleFrom(
                                                  shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            1.sp),
                                                  ),
                                                  backgroundColor:
                                                      ThemeColor.primaryColor),
                                              onPressed: () {
                                                CustomDialogWidget.getDialog(
                                                    widget: SizedBox(
                                                        height:
                                                            Get.height - 90.sp,
                                                        width: Get.width,
                                                        child:
                                                            UpdateKartuObservasiPageWidget(
                                                          kartuObservasiModelRepository:
                                                              e,
                                                        )),
                                                    color:
                                                        ThemeColor.blueColor);
                                              },
                                              child: Icon(
                                                FontAwesomeIcons.pencil,
                                                size: 3.sp,
                                                color: Colors.white,
                                              ),
                                            ),
                                          ],
                                        ),
                                      )
                                    ]);
                                  }).toList())),
                        ]
                      ],
                    ),
                  ),
                )));
      },
    );
  }
}
