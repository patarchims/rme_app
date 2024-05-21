import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hms_app/domain/bloc/dashboard/pasien/pasien_bloc.dart';
import 'package:hms_app/domain/models/devices_info/device_info_model.dart';
import 'package:hms_app/domain/models/meta/meta_model.dart';
import 'package:hms_app/presentation/component/component.dart';
import 'package:hms_app/presentation/kebidanan/bloc/double_check/double_check_bloc.dart';
import 'package:hms_app/presentation/pages/widget/header_content_widget.dart';
import 'package:sizer/sizer.dart';

class TambahDoubleCheckHighAlertPageWidget extends StatelessWidget {
  const TambahDoubleCheckHighAlertPageWidget({super.key});

  @override
  Widget build(BuildContext context) {
    PasienState pasienState = context.watch<PasienBloc>().state;
    final singlePasien = pasienState.listPasienModel
        .where((element) => element.mrn == pasienState.normSelected);

    return BlocConsumer<DoubleCheckBloc, DoubleCheckState>(
      listener: (context, state) {
        if (state.status == DoubleCheckStatus.isLoadingSave) {
          EasyLoading.show();
        }
        if (state.status != DoubleCheckStatus.isLoadingSave) {
          EasyLoading.dismiss();
        }

        state.saveResult.fold(
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

        ///=====//
      },
      builder: (context, state) {
        return HeaderContentWidget(
            backgroundColor: ThemeColor.bgColor,
            isENableAdd: true,
            onPressed: () async {
              // SIMPAN DOUBLE CHECK
              // ignore: use_build_context_synchronously
              dynamic data = await deviceInfo.initPlatformState();
              // ignore: use_build_context_synchronously
              context.read<DoubleCheckBloc>().add(OnSaveDoubleCheckHigh(
                  noReg: singlePasien.first.noreg,
                  devices: "ID-${data['id']}-${data['device']}",
                  pasien: state.doubleCheckRepository.pasien,
                  obat: state.doubleCheckRepository.obat,
                  dosis: state.doubleCheckRepository.dosis,
                  cara: state.doubleCheckRepository.cara,
                  waktu: state.doubleCheckRepository.waktu,
                  informasi: state.doubleCheckRepository.informasi,
                  dokumentasi: state.doubleCheckRepository.dokumentasi,
                  keterangan: state.doubleCheckRepository.keterangan));

              //==//
            },
            title: "SIMPAN",
            widget: Scaffold(
              appBar: AppBar(
                excludeHeaderSemantics: false,
                automaticallyImplyLeading: false,
                title: Text("FORMULIR DOUBLE CHECK HIGH ALERT MEDICATIONS",
                    style: whiteTextStyle),
              ),
              body: SingleChildScrollView(
                child: Column(
                  children: [
                    Container(
                        padding: EdgeInsets.only(
                            top: 5.sp, bottom: 0, right: 5.sp, left: 5.sp),
                        child: Table(border: TableBorder.all(), children: [
                          TableRow(children: [
                            TitleWidget.headerCenterTitle2(
                                title: "BENAR PASIEN"),
                            TitleWidget.headerCenterTitle2(title: "BENAR OBAT"),
                            TitleWidget.headerCenterTitle2(
                                title: "BENAR DOSIS"),
                            TitleWidget.headerCenterTitle2(title: "BENAR CARA"),
                            TitleWidget.headerCenterTitle2(
                                title: "BENAR WAKTU"),
                            TitleWidget.headerCenterTitle2(
                                title: "BENAR INFORMASI"),
                            TitleWidget.headerCenterTitle2(
                                title: "BENAR DOKUMENTASI"),
                          ]),
                        ])),
                    //== ==//
                    Container(
                        padding:
                            EdgeInsets.only(top: 0, left: 5.sp, right: 5.sp),
                        child: Table(
                          columnWidths: const {
                            2: FlexColumnWidth(1.2),
                          },
                          border: TableBorder.all(),
                          children: [
                            TableRow(children: [
                              //=====//
                              Container(
                                height: 50.sp,
                                margin: EdgeInsets.all(2.sp),
                                padding: EdgeInsets.all(2.sp),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(2.sp),
                                    color: ThemeColor.primaryColor),
                                child: FloatingActionButton(
                                  backgroundColor: (state
                                          .doubleCheckRepository.pasien)
                                      ? ThemeColor.greenColor.withOpacity(0.5)
                                      : ThemeColor.primaryColor
                                          .withOpacity(0.5),
                                  onPressed: () {
                                    context.read<DoubleCheckBloc>().add(
                                        OnChangedPasien(
                                            isChanged: !state
                                                .doubleCheckRepository.pasien));
                                  },
                                  elevation: 1,
                                  heroTag: "1",
                                  child: (state.doubleCheckRepository.pasien)
                                      ? Icon(FontAwesomeIcons.check,
                                          size: 15.sp,
                                          color: ThemeColor.whiteColor)
                                      : Icon(FontAwesomeIcons.minus,
                                          size: 15.sp,
                                          color: ThemeColor.whiteColor),
                                ),
                              ),

                              //=======//
                              Container(
                                height: 50.sp,
                                margin: EdgeInsets.all(2.sp),
                                padding: EdgeInsets.all(2.sp),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(2.sp),
                                  color: ThemeColor.primaryColor,
                                ),
                                child: FloatingActionButton(
                                  backgroundColor: (state
                                          .doubleCheckRepository.obat)
                                      ? ThemeColor.greenColor.withOpacity(0.5)
                                      : ThemeColor.primaryColor
                                          .withOpacity(0.5),
                                  onPressed: () {
                                    context.read<DoubleCheckBloc>().add(
                                        OnChangedObat(
                                            isChanged: !state
                                                .doubleCheckRepository.obat));
                                  },
                                  elevation: 1,
                                  heroTag: "2",
                                  child: (state.doubleCheckRepository.obat)
                                      ? Icon(FontAwesomeIcons.check,
                                          size: 15.sp,
                                          color: ThemeColor.whiteColor)
                                      : Icon(FontAwesomeIcons.minus,
                                          size: 15.sp,
                                          color: ThemeColor.whiteColor),
                                ),
                              ),

                              //=======//
                              Container(
                                height: 50.sp,
                                margin: EdgeInsets.all(2.sp),
                                padding: EdgeInsets.all(2.sp),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(2.sp),
                                  color: ThemeColor.primaryColor,
                                ),
                                child: FloatingActionButton(
                                  backgroundColor: (state
                                          .doubleCheckRepository.dosis)
                                      ? ThemeColor.greenColor.withOpacity(0.5)
                                      : ThemeColor.primaryColor
                                          .withOpacity(0.5),
                                  onPressed: () {
                                    context.read<DoubleCheckBloc>().add(
                                        OnChangedDosis(
                                            isChanged: !state
                                                .doubleCheckRepository.dosis));
                                  },
                                  elevation: 1,
                                  heroTag: "2",
                                  child: (state.doubleCheckRepository.dosis)
                                      ? Icon(FontAwesomeIcons.check,
                                          size: 15.sp,
                                          color: ThemeColor.whiteColor)
                                      : Icon(FontAwesomeIcons.minus,
                                          size: 15.sp,
                                          color: ThemeColor.whiteColor),
                                ),
                              ),

                              //=======//
                              Container(
                                height: 50.sp,
                                margin: EdgeInsets.all(2.sp),
                                padding: EdgeInsets.all(2.sp),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(2.sp),
                                  color: ThemeColor.primaryColor,
                                ),
                                child: FloatingActionButton(
                                  backgroundColor: (state
                                          .doubleCheckRepository.cara)
                                      ? ThemeColor.greenColor.withOpacity(0.5)
                                      : ThemeColor.primaryColor
                                          .withOpacity(0.5),
                                  onPressed: () {
                                    context
                                        .read<DoubleCheckBloc>()
                                        .add(OnChangedCara(
                                          isChanged:
                                              !state.doubleCheckRepository.cara,
                                        ));
                                  },
                                  elevation: 1,
                                  heroTag: "3",
                                  child: (state.doubleCheckRepository.cara)
                                      ? Icon(FontAwesomeIcons.check,
                                          size: 15.sp,
                                          color: ThemeColor.whiteColor)
                                      : Icon(FontAwesomeIcons.minus,
                                          size: 15.sp,
                                          color: ThemeColor.whiteColor),
                                ),
                              ),

                              //=======//
                              Container(
                                height: 50.sp,
                                margin: EdgeInsets.all(2.sp),
                                padding: EdgeInsets.all(2.sp),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(2.sp),
                                  color: ThemeColor.primaryColor,
                                ),
                                child: FloatingActionButton(
                                  backgroundColor: (state
                                          .doubleCheckRepository.waktu)
                                      ? ThemeColor.greenColor.withOpacity(0.5)
                                      : ThemeColor.primaryColor
                                          .withOpacity(0.5),
                                  onPressed: () {
                                    context.read<DoubleCheckBloc>().add(
                                        OnChangedWaktu(
                                            isChanged: !state
                                                .doubleCheckRepository.waktu));
                                  },
                                  elevation: 1,
                                  heroTag: "2",
                                  child: (state.doubleCheckRepository.waktu)
                                      ? Icon(FontAwesomeIcons.check,
                                          size: 15.sp,
                                          color: ThemeColor.whiteColor)
                                      : Icon(FontAwesomeIcons.minus,
                                          size: 15.sp,
                                          color: ThemeColor.whiteColor),
                                ),
                              ),

                              //=======//
                              Container(
                                height: 50.sp,
                                margin: EdgeInsets.all(2.sp),
                                padding: EdgeInsets.all(2.sp),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(2.sp),
                                  color: ThemeColor.primaryColor,
                                ),
                                child: FloatingActionButton(
                                  backgroundColor: (state
                                          .doubleCheckRepository.informasi)
                                      ? ThemeColor.greenColor.withOpacity(0.5)
                                      : ThemeColor.primaryColor
                                          .withOpacity(0.5),
                                  onPressed: () {
                                    context.read<DoubleCheckBloc>().add(
                                        OnChangedInformasi(
                                            isChanged: !state
                                                .doubleCheckRepository
                                                .informasi));
                                  },
                                  elevation: 1,
                                  heroTag: "2",
                                  child: (state.doubleCheckRepository.informasi)
                                      ? Icon(FontAwesomeIcons.check,
                                          size: 15.sp,
                                          color: ThemeColor.whiteColor)
                                      : Icon(FontAwesomeIcons.minus,
                                          size: 15.sp,
                                          color: ThemeColor.whiteColor),
                                ),
                              ),

                              //=======//
                              Container(
                                height: 50.sp,
                                margin: EdgeInsets.all(2.sp),
                                padding: EdgeInsets.all(2.sp),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(2.sp),
                                  color: ThemeColor.primaryColor,
                                ),
                                child: FloatingActionButton(
                                  backgroundColor: (state
                                          .doubleCheckRepository.dokumentasi)
                                      ? ThemeColor.greenColor.withOpacity(0.5)
                                      : ThemeColor.primaryColor
                                          .withOpacity(0.5),
                                  onPressed: () {
                                    context.read<DoubleCheckBloc>().add(
                                        OnChangedDokumentasi(
                                            isChanged: !state
                                                .doubleCheckRepository
                                                .dokumentasi));
                                  },
                                  elevation: 1,
                                  heroTag: "2",
                                  child:
                                      (state.doubleCheckRepository.dokumentasi)
                                          ? Icon(FontAwesomeIcons.check,
                                              size: 15.sp,
                                              color: ThemeColor.whiteColor)
                                          : Icon(FontAwesomeIcons.minus,
                                              size: 15.sp,
                                              color: ThemeColor.whiteColor),
                                ),
                              ),
                            ])
                          ],
                        )),
                    //== ==//
                    Container(
                        padding: EdgeInsets.only(
                            top: 5.sp, bottom: 0, right: 5.sp, left: 5.sp),
                        child: Table(border: TableBorder.all(), children: [
                          TableRow(children: [
                            TitleWidget.headerCenterTitle2(title: "KETERANGAN"),
                          ]),
                        ])),
                    //=======//
                    Container(
                      height: 50.sp,
                      margin: EdgeInsets.only(
                        left: 5.sp,
                        right: 5.sp,
                      ),
                      padding: EdgeInsets.all(2.sp),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(2.sp),
                        color: ThemeColor.primaryColor,
                      ),
                      child: FormWidget.textArea(
                        hinText: "Keterangan",
                        maxLines: 20,
                        enabled: true,
                      ),
                    ),
                  ],
                ),
              ),
            ));
      },
    );
  }
}
