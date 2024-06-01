import 'package:flutter/material.dart';
import 'package:flutter_spinbox/flutter_spinbox.dart';
import 'package:hms_app/presentation/component/component.dart';
import 'package:hms_app/presentation/pages/widget/header_content_widget.dart';
import 'package:sizer/sizer.dart';

class TambahAsesmenUlangNyeriWidget extends StatelessWidget {
  const TambahAsesmenUlangNyeriWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return HeaderContentWidget(
      backgroundColor: ThemeColor.bgColor,
      isENableAdd: true,
      onPressed: () {},
      title: "SIMPAN",
      widget: SingleChildScrollView(
        child: Column(
          children: [
            Container(
                padding: EdgeInsets.only(
                    top: 5.sp, bottom: 0, right: 5.sp, left: 5.sp),
                child: Table(border: TableBorder.all(), columnWidths: const {
                  // 0: FlexColumnWidth(0.4),
                }, children: [
                  TableRow(children: [
                    TitleWidget.headerCenterTitle2(title: "SKOR NYERI"),
                    TitleWidget.headerCenterTitle2(title: "TD"),
                    TitleWidget.headerCenterTitle2(title: "NADI"),
                    TitleWidget.headerCenterTitle2(title: "RR"),
                    TitleWidget.headerCenterTitle2(title: "NAMA OBAT"),
                    TitleWidget.headerCenterTitle2(title: "DOSIS"),
                    TitleWidget.headerCenterTitle2(title: "RUTE"),
                    TitleWidget.headerCenterTitle2(title: "INTERVENSI"),
                    TitleWidget.headerCenterTitle2(title: "WAKTU KAJI ULANG"),
                  ]),
                ])),
            Container(
                padding: EdgeInsets.only(bottom: 0, right: 5.sp, left: 5.sp),
                child: Table(
                    border: TableBorder.all(),
                    columnWidths: const {},
                    children: [
                      TableRow(children: [
                        SizedBox(
                          height: 60.sp,
                          child: Wrap(
                            children: skorNyeri
                                .map((e) => Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: ElevatedButton(
                                          style: ElevatedButton.styleFrom(
                                            shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(
                                                        2.sp)),
                                            backgroundColor:
                                                ThemeColor.primaryColor,
                                          ),
                                          onPressed: () {},
                                          child: Text(
                                            e.toString(),
                                            style: whiteTextStyle,
                                          )),
                                    ))
                                .toList(),
                          ),
                        ),
                        Container(
                            height: 110.sp,
                            margin: EdgeInsets.all(2.sp),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(2.sp),
                              color: ThemeColor.primaryColor,
                            ),
                            child: CupertinoSpinBox(
                              textStyle: whiteTextStyle,
                              min: 1,
                              decimals: 1,
                              max: 500,
                              // value: "",
                              direction: Axis.vertical,
                              decoration: BoxDecoration(
                                  color: ThemeColor.primaryColor,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(2.sp))),
                              onChanged: (value) {
                                //   context
                                //       .read<EarlyWarningSystemBloc>()
                                //       .add(OnChangedSuhu(value: value));
                              },
                            )),
                        Container(
                            height: 110.sp,
                            margin: EdgeInsets.all(2.sp),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(2.sp),
                              color: ThemeColor.primaryColor,
                            ),
                            child: CupertinoSpinBox(
                              textStyle: whiteTextStyle,
                              min: 1,
                              decimals: 1,
                              max: 500,
                              // value: "",
                              direction: Axis.vertical,
                              decoration: BoxDecoration(
                                  color: ThemeColor.primaryColor,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(2.sp))),
                              onChanged: (value) {
                                //   context
                                //       .read<EarlyWarningSystemBloc>()
                                //       .add(OnChangedSuhu(value: value));
                              },
                            )),
                        Container(
                            height: 110.sp,
                            margin: EdgeInsets.all(2.sp),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(2.sp),
                              color: ThemeColor.primaryColor,
                            ),
                            child: CupertinoSpinBox(
                              textStyle: whiteTextStyle,
                              min: 1,
                              decimals: 1,
                              max: 500,
                              // value: "",
                              direction: Axis.vertical,
                              decoration: BoxDecoration(
                                  color: ThemeColor.primaryColor,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(2.sp))),
                              onChanged: (value) {
                                //   context
                                //       .read<EarlyWarningSystemBloc>()
                                //       .add(OnChangedSuhu(value: value));
                              },
                            )),
                        Container(
                            height: 110.sp,
                            margin: EdgeInsets.all(2.sp),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(2.sp),
                              // color: ThemeColor.primaryColor,
                            ),
                            child: FormWidget.textArea(
                              maxLines: 20,
                              enabled: true,
                            )),
                        Container(
                            height: 110.sp,
                            margin: EdgeInsets.all(2.sp),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(2.sp),
                              // color: ThemeColor.primaryColor,
                            ),
                            child: FormWidget.textArea(
                              maxLines: 20,
                              enabled: true,
                            )),
                        Container(
                            height: 110.sp,
                            margin: EdgeInsets.all(2.sp),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(2.sp),
                              // color: ThemeColor.primaryColor,
                            ),
                            child: FormWidget.textArea(
                              maxLines: 20,
                              enabled: true,
                            )),
                        Container(
                            height: 110.sp,
                            margin: EdgeInsets.all(2.sp),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(2.sp),
                              // color: ThemeColor.primaryColor,
                            ),
                            child: FormWidget.textArea(
                              maxLines: 20,
                              enabled: true,
                            )),
                        SizedBox(
                          height: 60.sp,
                          child: Wrap(
                            children: waktuKajiUlang
                                .map((e) => Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: ElevatedButton(
                                          style: ElevatedButton.styleFrom(
                                            shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(
                                                        2.sp)),
                                            backgroundColor:
                                                ThemeColor.primaryColor,
                                          ),
                                          onPressed: () {},
                                          child: Text(
                                            e.toString(),
                                            style: whiteTextStyle,
                                          )),
                                    ))
                                .toList(),
                          ),
                        ),
                      ]),
                    ])),
          ],
        ),
      ),
    );
  }
}

List<int> skorNyeri = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10];
List<int> waktuKajiUlang = [0, 1, 2, 3, 4, 5, 6, 7];
