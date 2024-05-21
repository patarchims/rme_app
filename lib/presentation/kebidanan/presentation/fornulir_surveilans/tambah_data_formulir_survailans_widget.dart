import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hms_app/presentation/component/component.dart';
import 'package:hms_app/presentation/pages/widget/header_content_widget.dart';
import 'package:sizer/sizer.dart';

class TambahFormulirSurvailansWidgetPage extends StatefulWidget {
  const TambahFormulirSurvailansWidgetPage({super.key});

  @override
  State<TambahFormulirSurvailansWidgetPage> createState() =>
      _TambahFormulirSurvailansWidgetPageState();
}

class _TambahFormulirSurvailansWidgetPageState
    extends State<TambahFormulirSurvailansWidgetPage> {
  final ScrollController _scrollController = ScrollController();
  @override
  Widget build(BuildContext context) {
    return HeaderContentWidget(
      widget: RawScrollbar(
        thumbColor: ThemeColor.darkColor,
        thumbVisibility: true,
        interactive: true,
        thickness: 10.sp,
        controller: _scrollController,
        trackVisibility: false,
        child: SingleChildScrollView(
          child: Container(
            margin: EdgeInsets.only(right: 5.sp),
            child: Column(
              children: [
                SizedBox(
                  height: 60.sp,
                  child: Scaffold(
                    appBar: AppBar(
                      automaticallyImplyLeading: false,
                      title: Text(
                        "HAP Bundle Prevention Checklist",
                        style: whiteTextStyle,
                      ),
                    ),
                    body: Column(
                      children: [
                        Container(
                            padding: EdgeInsets.only(
                                top: 5.sp, bottom: 0, right: 5.sp, left: 5.sp),
                            child: Table(
                                border: TableBorder.all(),
                                columnWidths: const {
                                  0: FlexColumnWidth(0.4),
                                },
                                children: [
                                  TableRow(children: [
                                    TitleWidget.headerCenterTitle2(
                                        title: "Tirah Baring Total"),
                                    TitleWidget.headerCenterTitle2(
                                        title: "Cuci Tangan sesuai 5 moment"),
                                    TitleWidget.headerCenterTitle2(
                                        title: "Oral hygine 2x/day"),
                                    TitleWidget.headerCenterTitle2(
                                        title: "Posisi Kepala 30°-45°"),
                                    TitleWidget.headerCenterTitle2(
                                        title:
                                            "Ganti/bersihkan peralatan bila dipakai bersama"),
                                  ]),
                                ])),

                        // GEJALA HAP
                        Container(
                            padding: EdgeInsets.only(
                                top: 0, left: 5.sp, right: 5.sp),
                            child: Table(
                              columnWidths: const {
                                0: FlexColumnWidth(0.4),
                              },
                              border: TableBorder.all(),
                              children: [
                                TableRow(children: [
                                  //=====//
                                  Container(
                                    height: 15.sp,
                                    margin: EdgeInsets.all(2.sp),
                                    padding: EdgeInsets.all(2.sp),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(2.sp),
                                      color: ThemeColor.primaryColor,
                                    ),
                                    child: FloatingActionButton(
                                      backgroundColor: ThemeColor.primaryColor
                                          .withOpacity(0.5),
                                      onPressed: () {
                                        // context.read<DoubleCheckBloc>().add(
                                        //     OnChangedInformasi(
                                        //         isChanged: !state
                                        //             .doubleCheckRepository
                                        //             .informasi));
                                      },
                                      elevation: 1,
                                      heroTag: "2",
                                      child: Icon(FontAwesomeIcons.check,
                                          size: 10.sp,
                                          color: ThemeColor.whiteColor),
                                    ),
                                  ),

                                  Container(
                                    height: 15.sp,
                                    margin: EdgeInsets.all(2.sp),
                                    padding: EdgeInsets.all(2.sp),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(2.sp),
                                      color: ThemeColor.primaryColor,
                                    ),
                                    child: FloatingActionButton(
                                      backgroundColor: ThemeColor.primaryColor
                                          .withOpacity(0.5),
                                      onPressed: () {
                                        // context.read<DoubleCheckBloc>().add(
                                        //     OnChangedInformasi(
                                        //         isChanged: !state
                                        //             .doubleCheckRepository
                                        //             .informasi));
                                      },
                                      elevation: 1,
                                      heroTag: "2",
                                      child: Icon(FontAwesomeIcons.check,
                                          size: 10.sp,
                                          color: ThemeColor.whiteColor),
                                    ),
                                  ),
                                  Container(
                                    height: 15.sp,
                                    margin: EdgeInsets.all(2.sp),
                                    padding: EdgeInsets.all(2.sp),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(2.sp),
                                      color: ThemeColor.primaryColor,
                                    ),
                                    child: FloatingActionButton(
                                      backgroundColor: ThemeColor.primaryColor
                                          .withOpacity(0.5),
                                      onPressed: () {
                                        // context.read<DoubleCheckBloc>().add(
                                        //     OnChangedInformasi(
                                        //         isChanged: !state
                                        //             .doubleCheckRepository
                                        //             .informasi));
                                      },
                                      elevation: 1,
                                      heroTag: "2",
                                      child: Icon(FontAwesomeIcons.check,
                                          size: 10.sp,
                                          color: ThemeColor.whiteColor),
                                    ),
                                  ),
                                  Container(
                                    height: 15.sp,
                                    margin: EdgeInsets.all(2.sp),
                                    padding: EdgeInsets.all(2.sp),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(2.sp),
                                      color: ThemeColor.primaryColor,
                                    ),
                                    child: FloatingActionButton(
                                      backgroundColor: ThemeColor.primaryColor
                                          .withOpacity(0.5),
                                      onPressed: () {
                                        // context.read<DoubleCheckBloc>().add(
                                        //     OnChangedInformasi(
                                        //         isChanged: !state
                                        //             .doubleCheckRepository
                                        //             .informasi));
                                      },
                                      elevation: 1,
                                      heroTag: "2",
                                      child: Icon(FontAwesomeIcons.check,
                                          size: 10.sp,
                                          color: ThemeColor.whiteColor),
                                    ),
                                  ),
                                  Container(
                                    height: 15.sp,
                                    margin: EdgeInsets.all(2.sp),
                                    padding: EdgeInsets.all(2.sp),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(2.sp),
                                      color: ThemeColor.primaryColor,
                                    ),
                                    child: FloatingActionButton(
                                      backgroundColor: ThemeColor.primaryColor
                                          .withOpacity(0.5),
                                      onPressed: () {},
                                      elevation: 1,
                                      heroTag: "2",
                                      child: Icon(FontAwesomeIcons.check,
                                          size: 10.sp,
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
                SizedBox(
                  height: 60.sp,
                  child: Scaffold(
                    appBar: AppBar(
                      automaticallyImplyLeading: false,
                      title: Text(
                        "GEJALA HAP TEMPERATUR",
                        style: whiteTextStyle,
                      ),
                    ),
                    body: SingleChildScrollView(
                      child: Column(
                        children: [
                          Container(
                              padding: EdgeInsets.only(
                                  top: 5.sp,
                                  bottom: 0,
                                  right: 5.sp,
                                  left: 5.sp),
                              child: Table(
                                  border: TableBorder.all(),
                                  columnWidths: const {
                                    // 0: FlexColumnWidth(0.4),
                                  },
                                  children: [
                                    TableRow(children: [
                                      TitleWidget.headerCenterTitle2(
                                          title: "> 38°C"),
                                      TitleWidget.headerCenterTitle2(
                                          title: "< 36°C"),
                                    ]),
                                  ])),
                          Container(
                              padding: EdgeInsets.only(
                                  top: 0, left: 5.sp, right: 5.sp),
                              child: Table(
                                columnWidths: const {
                                  2: FlexColumnWidth(1.2),
                                },
                                border: TableBorder.all(),
                                children: [
                                  TableRow(children: [
                                    //=====//
                                    Container(
                                      height: 15.sp,
                                      margin: EdgeInsets.all(2.sp),
                                      padding: EdgeInsets.all(2.sp),
                                      decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(2.sp),
                                        color: ThemeColor.primaryColor,
                                      ),
                                      child: FloatingActionButton(
                                        backgroundColor: ThemeColor.primaryColor
                                            .withOpacity(0.5),
                                        onPressed: () {
                                          // context.read<DoubleCheckBloc>().add(
                                          //     OnChangedInformasi(
                                          //         isChanged: !state
                                          //             .doubleCheckRepository
                                          //             .informasi));
                                        },
                                        elevation: 1,
                                        heroTag: "2",
                                        child: Icon(FontAwesomeIcons.check,
                                            size: 10.sp,
                                            color: ThemeColor.whiteColor),
                                      ),
                                    ),
                                    Container(
                                      height: 15.sp,
                                      margin: EdgeInsets.all(2.sp),
                                      padding: EdgeInsets.all(2.sp),
                                      decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(2.sp),
                                        color: ThemeColor.primaryColor,
                                      ),
                                      child: FloatingActionButton(
                                        backgroundColor: ThemeColor.primaryColor
                                            .withOpacity(0.5),
                                        onPressed: () {
                                          // context.read<DoubleCheckBloc>().add(
                                          //     OnChangedInformasi(
                                          //         isChanged: !state
                                          //             .doubleCheckRepository
                                          //             .informasi));
                                        },
                                        elevation: 1,
                                        heroTag: "2",
                                        child: Icon(FontAwesomeIcons.check,
                                            size: 10.sp,
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
                ),
                SizedBox(
                  height: 60.sp,
                  child: Scaffold(
                    appBar: AppBar(
                      automaticallyImplyLeading: false,
                      title: Text(
                        "Leukosit",
                        style: whiteTextStyle,
                      ),
                    ),
                    body: SingleChildScrollView(
                      child: Column(
                        children: [
                          Container(
                              padding: EdgeInsets.only(
                                  top: 5.sp,
                                  bottom: 0,
                                  right: 5.sp,
                                  left: 5.sp),
                              child: Table(
                                  border: TableBorder.all(),
                                  columnWidths: const {
                                    0: FlexColumnWidth(0.4),
                                  },
                                  children: [
                                    TableRow(children: [
                                      TitleWidget.headerCenterTitle2(
                                          title: "≥ 12000/mm3"),
                                      TitleWidget.headerCenterTitle2(
                                          title: "≤ 4000/mm3"),
                                    ]),
                                  ])),
                          Container(
                              padding: EdgeInsets.only(
                                  top: 0, left: 5.sp, right: 5.sp),
                              child: Table(
                                columnWidths: const {
                                  2: FlexColumnWidth(1.2),
                                },
                                border: TableBorder.all(),
                                children: [
                                  TableRow(children: [
                                    //=====//
                                    Container(
                                      height: 15.sp,
                                      margin: EdgeInsets.all(2.sp),
                                      padding: EdgeInsets.all(2.sp),
                                      decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(2.sp),
                                        color: ThemeColor.primaryColor,
                                      ),
                                      child: FloatingActionButton(
                                        backgroundColor: ThemeColor.primaryColor
                                            .withOpacity(0.5),
                                        onPressed: () {
                                          // context.read<DoubleCheckBloc>().add(
                                          //     OnChangedInformasi(
                                          //         isChanged: !state
                                          //             .doubleCheckRepository
                                          //             .informasi));
                                        },
                                        elevation: 1,
                                        heroTag: "2",
                                        child: Icon(FontAwesomeIcons.check,
                                            size: 10.sp,
                                            color: ThemeColor.whiteColor),
                                      ),
                                    ),
                                    Container(
                                      height: 15.sp,
                                      margin: EdgeInsets.all(2.sp),
                                      padding: EdgeInsets.all(2.sp),
                                      decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(2.sp),
                                        color: ThemeColor.primaryColor,
                                      ),
                                      child: FloatingActionButton(
                                        backgroundColor: ThemeColor.primaryColor
                                            .withOpacity(0.5),
                                        onPressed: () {
                                          // context.read<DoubleCheckBloc>().add(
                                          //     OnChangedInformasi(
                                          //         isChanged: !state
                                          //             .doubleCheckRepository
                                          //             .informasi));
                                        },
                                        elevation: 1,
                                        heroTag: "2",
                                        child: Icon(FontAwesomeIcons.check,
                                            size: 10.sp,
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
                ),
                SizedBox(
                  height: 60.sp,
                  child: Scaffold(
                    appBar: AppBar(
                      automaticallyImplyLeading: false,
                      title: Text(
                        "ANTIBIOTIK YANG DIBERIKAN",
                        style: whiteTextStyle,
                      ),
                    ),
                    body: SingleChildScrollView(
                      child: Column(
                        children: [
                          Container(
                              padding: EdgeInsets.only(
                                  top: 5.sp,
                                  bottom: 0,
                                  right: 5.sp,
                                  left: 5.sp),
                              child: Table(
                                  border: TableBorder.all(),
                                  columnWidths: const {
                                    0: FlexColumnWidth(0.4),
                                  },
                                  children: [
                                    TableRow(children: [
                                      TitleWidget.headerCenterTitle2(
                                          title: "≥ 12000/mm3"),
                                      TitleWidget.headerCenterTitle2(
                                          title: "≤ 4000/mm3"),
                                    ]),
                                  ])),
                          Container(
                              padding: EdgeInsets.only(
                                  top: 0, left: 5.sp, right: 5.sp),
                              child: Table(
                                columnWidths: const {
                                  2: FlexColumnWidth(1.2),
                                },
                                border: TableBorder.all(),
                                children: [
                                  TableRow(children: [
                                    //=====//
                                    Container(
                                      height: 15.sp,
                                      margin: EdgeInsets.all(2.sp),
                                      padding: EdgeInsets.all(2.sp),
                                      decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(2.sp),
                                        color: ThemeColor.primaryColor,
                                      ),
                                      child: FloatingActionButton(
                                        backgroundColor: ThemeColor.primaryColor
                                            .withOpacity(0.5),
                                        onPressed: () {
                                          // context.read<DoubleCheckBloc>().add(
                                          //     OnChangedInformasi(
                                          //         isChanged: !state
                                          //             .doubleCheckRepository
                                          //             .informasi));
                                        },
                                        elevation: 1,
                                        heroTag: "2",
                                        child: Icon(FontAwesomeIcons.check,
                                            size: 10.sp,
                                            color: ThemeColor.whiteColor),
                                      ),
                                    ),
                                    Container(
                                      height: 15.sp,
                                      margin: EdgeInsets.all(2.sp),
                                      padding: EdgeInsets.all(2.sp),
                                      decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(2.sp),
                                        color: ThemeColor.primaryColor,
                                      ),
                                      child: FloatingActionButton(
                                        backgroundColor: ThemeColor.primaryColor
                                            .withOpacity(0.5),
                                        onPressed: () {
                                          // context.read<DoubleCheckBloc>().add(
                                          //     OnChangedInformasi(
                                          //         isChanged: !state
                                          //             .doubleCheckRepository
                                          //             .informasi));
                                        },
                                        elevation: 1,
                                        heroTag: "2",
                                        child: Icon(FontAwesomeIcons.check,
                                            size: 10.sp,
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
                ),
                SizedBox(
                    height: 60.sp,
                    child: Scaffold(
                      appBar: AppBar(
                          automaticallyImplyLeading: false,
                          title: Text(
                            "SEKRESI TRACHEA",
                            style: whiteTextStyle,
                          )),
                      body: SingleChildScrollView(
                        child: Column(
                          children: [
                            Container(
                                padding: EdgeInsets.only(
                                    top: 5.sp,
                                    bottom: 0,
                                    right: 5.sp,
                                    left: 5.sp),
                                child: Table(
                                    border: TableBorder.all(),
                                    columnWidths: const {
                                      0: FlexColumnWidth(0.4),
                                    },
                                    children: [
                                      TableRow(children: [
                                        TitleWidget.headerCenterTitle2(
                                            title: "≥ 12000/mm3"),
                                        TitleWidget.headerCenterTitle2(
                                            title: "≤ 4000/mm3"),
                                      ]),
                                    ])),
                            Container(
                                padding: EdgeInsets.only(
                                    top: 0, left: 5.sp, right: 5.sp),
                                child: Table(
                                  columnWidths: const {
                                    2: FlexColumnWidth(1.2),
                                  },
                                  border: TableBorder.all(),
                                  children: [
                                    TableRow(children: [
                                      //=====//
                                      Container(
                                        height: 15.sp,
                                        margin: EdgeInsets.all(2.sp),
                                        padding: EdgeInsets.all(2.sp),
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(2.sp),
                                          color: ThemeColor.primaryColor,
                                        ),
                                        child: FloatingActionButton(
                                          backgroundColor: ThemeColor
                                              .primaryColor
                                              .withOpacity(0.5),
                                          onPressed: () {
                                            // context.read<DoubleCheckBloc>().add(
                                            //     OnChangedInformasi(
                                            //         isChanged: !state
                                            //             .doubleCheckRepository
                                            //             .informasi));
                                          },
                                          elevation: 1,
                                          heroTag: "2",
                                          child: Icon(FontAwesomeIcons.check,
                                              size: 10.sp,
                                              color: ThemeColor.whiteColor),
                                        ),
                                      ),
                                      Container(
                                        height: 15.sp,
                                        margin: EdgeInsets.all(2.sp),
                                        padding: EdgeInsets.all(2.sp),
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(2.sp),
                                          color: ThemeColor.primaryColor,
                                        ),
                                        child: FloatingActionButton(
                                          backgroundColor: ThemeColor
                                              .primaryColor
                                              .withOpacity(0.5),
                                          onPressed: () {
                                            // context.read<DoubleCheckBloc>().add(
                                            //     OnChangedInformasi(
                                            //         isChanged: !state
                                            //             .doubleCheckRepository
                                            //             .informasi));
                                          },
                                          elevation: 1,
                                          heroTag: "2",
                                          child: Icon(FontAwesomeIcons.check,
                                              size: 10.sp,
                                              color: ThemeColor.whiteColor),
                                        ),
                                      ),
                                    ])
                                  ],
                                )),
                          ],
                        ),
                      ),
                    )),
                SizedBox(
                  height: 60.sp,
                  child: Scaffold(
                    appBar: AppBar(
                        automaticallyImplyLeading: false,
                        title: Text(
                          "HASIL PEMERIKSAAN KULTUR SPUTUM",
                          style: whiteTextStyle,
                        )),
                    body: SingleChildScrollView(
                      child: Column(
                        children: [
                          Container(
                              padding: EdgeInsets.only(
                                  top: 5.sp,
                                  bottom: 0,
                                  right: 5.sp,
                                  left: 5.sp),
                              child: Table(
                                  border: TableBorder.all(),
                                  columnWidths: const {
                                    0: FlexColumnWidth(0.4),
                                  },
                                  children: [
                                    TableRow(children: [
                                      TitleWidget.headerCenterTitle2(
                                          title:
                                              "Tidak ada pertumbuhan kuman (tumbuh yeast/candida)"),
                                      TitleWidget.headerCenterTitle2(
                                          title:
                                              "Ada pertumbuhan kuman selain yeast/candida"),
                                      TitleWidget.headerCenterTitle2(
                                          title: "Tumbuh kuman selain yeast"),
                                    ]),
                                  ])),
                          Container(
                              padding: EdgeInsets.only(
                                  top: 0, left: 5.sp, right: 5.sp),
                              child: Table(
                                columnWidths: const {
                                  0: FlexColumnWidth(0.4),
                                },
                                border: TableBorder.all(),
                                children: [
                                  TableRow(children: [
                                    //=====//
                                    Container(
                                      height: 15.sp,
                                      margin: EdgeInsets.all(2.sp),
                                      padding: EdgeInsets.all(2.sp),
                                      decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(2.sp),
                                        color: ThemeColor.primaryColor,
                                      ),
                                      child: FloatingActionButton(
                                        backgroundColor: ThemeColor.primaryColor
                                            .withOpacity(0.5),
                                        onPressed: () {
                                          // context.read<DoubleCheckBloc>().add(
                                          //     OnChangedInformasi(
                                          //         isChanged: !state
                                          //             .doubleCheckRepository
                                          //             .informasi));
                                        },
                                        elevation: 1,
                                        heroTag: "2",
                                        child: Icon(FontAwesomeIcons.check,
                                            size: 10.sp,
                                            color: ThemeColor.whiteColor),
                                      ),
                                    ),
                                    Container(
                                      height: 15.sp,
                                      margin: EdgeInsets.all(2.sp),
                                      padding: EdgeInsets.all(2.sp),
                                      decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(2.sp),
                                        color: ThemeColor.primaryColor,
                                      ),
                                      child: FloatingActionButton(
                                        backgroundColor: ThemeColor.primaryColor
                                            .withOpacity(0.5),
                                        onPressed: () {
                                          // context.read<DoubleCheckBloc>().add(
                                          //     OnChangedInformasi(
                                          //         isChanged: !state
                                          //             .doubleCheckRepository
                                          //             .informasi));
                                        },
                                        elevation: 1,
                                        heroTag: "2",
                                        child: Icon(FontAwesomeIcons.check,
                                            size: 10.sp,
                                            color: ThemeColor.whiteColor),
                                      ),
                                    ),
                                    Container(
                                      height: 15.sp,
                                      margin: EdgeInsets.all(2.sp),
                                      padding: EdgeInsets.all(2.sp),
                                      decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(2.sp),
                                        color: ThemeColor.primaryColor,
                                      ),
                                      child: FloatingActionButton(
                                        backgroundColor: ThemeColor.primaryColor
                                            .withOpacity(0.5),
                                        onPressed: () {
                                          // context.read<DoubleCheckBloc>().add(
                                          //     OnChangedInformasi(
                                          //         isChanged: !state
                                          //             .doubleCheckRepository
                                          //             .informasi));
                                        },
                                        elevation: 1,
                                        heroTag: "2",
                                        child: Icon(FontAwesomeIcons.check,
                                            size: 10.sp,
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
                ),
              ],
            ),
          ),
        ),
      ),
      backgroundColor: ThemeColor.bgColor,
      isENableAdd: true,
      onPressed: () {
        // == //
      },
    );
  }
}
