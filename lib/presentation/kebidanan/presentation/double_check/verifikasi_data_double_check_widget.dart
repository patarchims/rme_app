import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hms_app/presentation/component/color/color_helper.dart';
import 'package:hms_app/presentation/component/fonts/font_helper.dart';
import 'package:hms_app/presentation/component/title/title_component.dart';
import 'package:hms_app/presentation/kebidanan/bloc/double_check/double_check_bloc.dart';
import 'package:hms_app/presentation/pages/widget/header_content_widget.dart';
import 'package:sizer/sizer.dart';

class VerifikasiDataDoubleCheckWidgetPage extends StatelessWidget {
  const VerifikasiDataDoubleCheckWidgetPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<DoubleCheckBloc, DoubleCheckState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        return Expanded(
            child: HeaderContentWidget(
          title: "SIMPAN",
          onPressed: () {
            // ON SAVE VERIFY DOUBLE CHECK
          },
          backgroundColor: ThemeColor.bgColor,
          isENableAdd: true,
          widget: Scaffold(
            appBar: AppBar(
              excludeHeaderSemantics: false,
              automaticallyImplyLeading: false,
              title: Text("VERIFY FORMULIR DOUBLE CHECK HIGH ALERT MEDICATIONS",
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
                              title: "VERIFY\nBENAR PASIEN"),
                          TitleWidget.headerCenterTitle2(
                              title: "VERIFY\nBENAR OBAT"),
                          TitleWidget.headerCenterTitle2(
                              title: "VERIFY\nBENAR DOSIS"),
                          TitleWidget.headerCenterTitle2(
                              title: "VERIFY\nBENAR CARA"),
                          TitleWidget.headerCenterTitle2(
                              title: "VERIFY\nBENAR WAKTU"),
                          TitleWidget.headerCenterTitle2(
                              title: "VERIFY\nBENAR INFORMASI"),
                          TitleWidget.headerCenterTitle2(
                              title: "VERIFY\nBENAR DOKUMENTASI"),
                        ]),
                      ])),
                  Container(
                      padding: EdgeInsets.only(top: 0, left: 5.sp, right: 5.sp),
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
                                    : ThemeColor.primaryColor.withOpacity(0.5),
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
                                    : ThemeColor.primaryColor.withOpacity(0.5),
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
                                    : ThemeColor.primaryColor.withOpacity(0.5),
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
                                    : ThemeColor.primaryColor.withOpacity(0.5),
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
                                    : ThemeColor.primaryColor.withOpacity(0.5),
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
                                    : ThemeColor.primaryColor.withOpacity(0.5),
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
                                    : ThemeColor.primaryColor.withOpacity(0.5),
                                onPressed: () {
                                  context.read<DoubleCheckBloc>().add(
                                      OnChangedDokumentasi(
                                          isChanged: !state
                                              .doubleCheckRepository
                                              .dokumentasi));
                                },
                                elevation: 1,
                                heroTag: "2",
                                child: (state.doubleCheckRepository.dokumentasi)
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
                ],
              ),
            ),
          ),
        ));
      },
    );
  }
}
