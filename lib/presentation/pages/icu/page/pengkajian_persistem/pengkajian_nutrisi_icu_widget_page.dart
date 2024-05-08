import 'package:flutter/material.dart';
import 'package:hms_app/presentation/component/component.dart';
import 'package:hms_app/presentation/pages/widget/header_content_widget.dart';

class PengkajianNutrisiAnakWidgetPage extends StatefulWidget {
  const PengkajianNutrisiAnakWidgetPage({super.key});

  @override
  State<PengkajianNutrisiAnakWidgetPage> createState() =>
      _PengkajianNutrisiAnakWidgetPageState();
}

class _PengkajianNutrisiAnakWidgetPageState
    extends State<PengkajianNutrisiAnakWidgetPage> {
  final ScrollController _scrollController = ScrollController();
  @override
  Widget build(BuildContext context) {
    return HeaderContentWidget(
        backgroundColor: ThemeColor.bgColor,
        isENableAdd: true,
        onPressed: () {
          // ON PRESSED
        },
        widget: SingleChildScrollView(
          controller: _scrollController,
          child: Column(
            children: [
              // SizedBox(height: 5.sp),
              // Container(
              //   color: Colors.white,
              //   padding: EdgeInsets.symmetric(horizontal: 5.sp),
              //   child: TableDesk(
              //     shape: const RoundedRectangleBorder(
              //       side: BorderSide(color: Colors.black, width: 1),
              //     ),
              //     child: TableDeskRow(
              //       border: const BorderSide(width: 1, color: Colors.black),
              //       gaps: [
              //         TableGap.weight(),
              //         TableGap.width(220),
              //         TableGap.width(220),
              //       ],
              //       children: [
              //         Container(
              //           color: ThemeColor.primaryColor,
              //           child: Padding(
              //             padding: EdgeInsets.all(5.sp),
              //             child: Center(
              //               child: Text(
              //                 "PARAMETER",
              //                 style: whiteTextStyle.copyWith(fontSize: 5.sp),
              //                 textAlign: TextAlign.center,
              //               ),
              //             ),
              //           ),
              //         ),
              //         Container(
              //           color: ThemeColor.primaryColor,
              //           child: Padding(
              //             padding: EdgeInsets.all(5.sp),
              //             child: Center(
              //               child: Text(
              //                 "PILIHAN",
              //                 style: whiteTextStyle.copyWith(fontSize: 5.sp),
              //                 textAlign: TextAlign.center,
              //               ),
              //             ),
              //           ),
              //         ),
              //         Container(
              //           color: ThemeColor.primaryColor,
              //           child: Padding(
              //             padding: EdgeInsets.all(5.sp),
              //             child: Center(
              //               child: Text(
              //                 "NILAI",
              //                 style: whiteTextStyle.copyWith(fontSize: 5.sp),
              //                 textAlign: TextAlign.center,
              //               ),
              //             ),
              //           ),
              //         ),
              //       ],
              //     ),
              //   ),
              // ),
              // Table(
              //   columnWidths: const {
              //     0: FlexColumnWidth(10),
              //     2: FlexColumnWidth(3),
              //     1: FlexColumnWidth(3),
              //   },
              //   children: [
              //     TableRow(children: [
              //       Container(
              //           padding: EdgeInsets.all(5.sp),
              //           child: Text(
              //             "Apakah pasien tampak kurus?",
              //             style: blackTextStyle.copyWith(
              //               fontSize: 5.sp,
              //             ),
              //             textAlign: TextAlign.left,
              //           )),
              //       Container(
              //           padding: EdgeInsets.all(5.sp),
              //           child: Wrap(
              //             runSpacing: 2.sp,
              //             children: [
              //               ElevatedButton(
              //                   onPressed: () {
              //                     context
              //                         .read<PengkajianNutrisiAnakBloc>()
              //                         .add(OnChangedNilai1Event(value: "Ya"));
              //                   },
              //                   style: ElevatedButton.styleFrom(
              //                       elevation: 1,
              //                       shape: RoundedRectangleBorder(
              //                           borderRadius:
              //                               BorderRadius.circular(2.sp)),
              //                       backgroundColor:
              //                           (state.pengkajianNutrisiAnak.n1) == "Ya"
              //                               ? ThemeColor.greenColor
              //                               : ThemeColor.primaryColor),
              //                   child: Padding(
              //                     padding: const EdgeInsets.all(8.0),
              //                     child: Text(
              //                       "Ya",
              //                       style: whiteTextStyle,
              //                     ),
              //                   )),
              //               ElevatedButton(
              //                   onPressed: () {
              //                     context.read<PengkajianNutrisiAnakBloc>().add(
              //                         OnChangedNilai1Event(value: "Tidak"));
              //                   },
              //                   style: ElevatedButton.styleFrom(
              //                       elevation: 1,
              //                       shape: RoundedRectangleBorder(
              //                           borderRadius:
              //                               BorderRadius.circular(2.sp)),
              //                       backgroundColor:
              //                           (state.pengkajianNutrisiAnak.n1) ==
              //                                   "Tidak"
              //                               ? ThemeColor.greenColor
              //                               : ThemeColor.primaryColor),
              //                   child: Padding(
              //                     padding: const EdgeInsets.all(8.0),
              //                     child: Text(
              //                       "Tidak",
              //                       style: whiteTextStyle,
              //                     ),
              //                   )),
              //             ],
              //           )),
              //       Container(
              //           padding: EdgeInsets.all(5.sp),
              //           child: Text(
              //             (state.pengkajianNutrisiAnak.n1 == "Ya") ? "1" : "0",
              //             style: blackTextStyle.copyWith(
              //                 fontSize: 10.sp, fontWeight: FontWeight.bold),
              //             textAlign: TextAlign.left,
              //           )),
              //     ]),
              //     TableRow(children: [
              //       Container(
              //           padding: EdgeInsets.all(5.sp),
              //           child: Text(
              //             "Apakah terdapat penurunan berat badan selama satu bulan terakhir? (bersadarkan penilaian objektif data berat badan bila ada atau penilaian subjektif orang tua pasien atau untuk bayi <1 tahun berat badan tidak naik selama 3 bulan terakhir)",
              //             style: blackTextStyle.copyWith(
              //               fontSize: 5.sp,
              //             ),
              //             textAlign: TextAlign.left,
              //           )),
              //       Container(
              //           padding: EdgeInsets.all(5.sp),
              //           child: Wrap(
              //             runSpacing: 2.sp,
              //             children: [
              //               ElevatedButton(
              //                   onPressed: () {
              //                     context
              //                         .read<PengkajianNutrisiAnakBloc>()
              //                         .add(OnChangedNilai2Event(value: "Ya"));
              //                   },
              //                   style: ElevatedButton.styleFrom(
              //                       elevation: 1,
              //                       shape: RoundedRectangleBorder(
              //                           borderRadius:
              //                               BorderRadius.circular(2.sp)),
              //                       backgroundColor:
              //                           (state.pengkajianNutrisiAnak.n2) == "Ya"
              //                               ? ThemeColor.greenColor
              //                               : ThemeColor.primaryColor),
              //                   child: Padding(
              //                     padding: const EdgeInsets.all(8.0),
              //                     child: Text(
              //                       "Ya",
              //                       style: whiteTextStyle,
              //                     ),
              //                   )),
              //               ElevatedButton(
              //                   onPressed: () {
              //                     context.read<PengkajianNutrisiAnakBloc>().add(
              //                         OnChangedNilai2Event(value: "Tidak"));
              //                   },
              //                   style: ElevatedButton.styleFrom(
              //                       elevation: 1,
              //                       shape: RoundedRectangleBorder(
              //                           borderRadius:
              //                               BorderRadius.circular(2.sp)),
              //                       backgroundColor:
              //                           (state.pengkajianNutrisiAnak.n2) ==
              //                                   "Tidak"
              //                               ? ThemeColor.greenColor
              //                               : ThemeColor.primaryColor),
              //                   child: Padding(
              //                     padding: const EdgeInsets.all(8.0),
              //                     child: Text(
              //                       "Tidak",
              //                       style: whiteTextStyle,
              //                     ),
              //                   )),
              //             ],
              //           )),
              //       Container(
              //           padding: EdgeInsets.all(5.sp),
              //           child: Text(
              //             (state.pengkajianNutrisiAnak.n2 == "Ya") ? "1" : "0",
              //             style: blackTextStyle.copyWith(
              //                 fontSize: 10.sp, fontWeight: FontWeight.bold),
              //             textAlign: TextAlign.left,
              //           )),
              //     ]),
              //     TableRow(children: [
              //       Container(
              //           padding: EdgeInsets.all(5.sp),
              //           child: Text(
              //             "Apakah terdapat salah satu dari kondisi tersebut? (diare ≤ 5 kali/hari dan muntah ≥ 3 kali/hari dalam seminggu terakhir atau asupan makanan berkurang selama 1 minggu terakhir)",
              //             style: blackTextStyle.copyWith(
              //               fontSize: 5.sp,
              //             ),
              //             textAlign: TextAlign.left,
              //           )),
              //       Container(
              //           padding: EdgeInsets.all(5.sp),
              //           child: Wrap(
              //             runSpacing: 2.sp,
              //             children: [
              //               ElevatedButton(
              //                   onPressed: () {
              //                     context
              //                         .read<PengkajianNutrisiAnakBloc>()
              //                         .add(OnChangedNilai3Event(value: "Ya"));
              //                   },
              //                   style: ElevatedButton.styleFrom(
              //                       elevation: 1,
              //                       shape: RoundedRectangleBorder(
              //                           borderRadius:
              //                               BorderRadius.circular(2.sp)),
              //                       backgroundColor:
              //                           (state.pengkajianNutrisiAnak.n3) == "Ya"
              //                               ? ThemeColor.greenColor
              //                               : ThemeColor.primaryColor),
              //                   child: Padding(
              //                     padding: const EdgeInsets.all(8.0),
              //                     child: Text(
              //                       "Ya",
              //                       style: whiteTextStyle,
              //                     ),
              //                   )),
              //               ElevatedButton(
              //                   onPressed: () {
              //                     context.read<PengkajianNutrisiAnakBloc>().add(
              //                         OnChangedNilai3Event(value: "Tidak"));
              //                   },
              //                   style: ElevatedButton.styleFrom(
              //                       elevation: 1,
              //                       shape: RoundedRectangleBorder(
              //                           borderRadius:
              //                               BorderRadius.circular(2.sp)),
              //                       backgroundColor:
              //                           (state.pengkajianNutrisiAnak.n3) ==
              //                                   "Tidak"
              //                               ? ThemeColor.greenColor
              //                               : ThemeColor.primaryColor),
              //                   child: Padding(
              //                     padding: const EdgeInsets.all(8.0),
              //                     child: Text(
              //                       "Tidak",
              //                       style: whiteTextStyle,
              //                     ),
              //                   )),
              //             ],
              //           )),
              //       Container(
              //           padding: EdgeInsets.all(5.sp),
              //           child: Text(
              //             (state.pengkajianNutrisiAnak.n3 == "Ya") ? "1" : "0",
              //             style: blackTextStyle.copyWith(
              //                 fontSize: 10.sp, fontWeight: FontWeight.bold),
              //             textAlign: TextAlign.left,
              //           )),
              //     ]),
              //     TableRow(children: [
              //       Container(
              //           padding: EdgeInsets.all(5.sp),
              //           child: Text(
              //             "Apakah teradapat penyakit atau keadaan yang mengakibatkan pasien beresiko mengalami malnutrisi? (lihat label)",
              //             style: blackTextStyle.copyWith(
              //               fontSize: 5.sp,
              //             ),
              //             textAlign: TextAlign.left,
              //           )),
              //       Container(
              //           padding: EdgeInsets.all(5.sp),
              //           child: Wrap(
              //             runSpacing: 2.sp,
              //             children: [
              //               ElevatedButton(
              //                   onPressed: () {
              //                     context
              //                         .read<PengkajianNutrisiAnakBloc>()
              //                         .add(OnChangedNilai4Event(value: "Ya"));
              //                   },
              //                   style: ElevatedButton.styleFrom(
              //                       elevation: 1,
              //                       shape: RoundedRectangleBorder(
              //                           borderRadius:
              //                               BorderRadius.circular(2.sp)),
              //                       backgroundColor:
              //                           (state.pengkajianNutrisiAnak.n4) == "Ya"
              //                               ? ThemeColor.greenColor
              //                               : ThemeColor.primaryColor),
              //                   child: Padding(
              //                     padding: const EdgeInsets.all(8.0),
              //                     child: Text(
              //                       "Ya",
              //                       style: whiteTextStyle,
              //                     ),
              //                   )),
              //               ElevatedButton(
              //                   onPressed: () {
              //                     context.read<PengkajianNutrisiAnakBloc>().add(
              //                         OnChangedNilai4Event(value: "Tidak"));
              //                   },
              //                   style: ElevatedButton.styleFrom(
              //                       elevation: 1,
              //                       shape: RoundedRectangleBorder(
              //                           borderRadius:
              //                               BorderRadius.circular(2.sp)),
              //                       backgroundColor:
              //                           (state.pengkajianNutrisiAnak.n4) ==
              //                                   "Tidak"
              //                               ? ThemeColor.greenColor
              //                               : ThemeColor.primaryColor),
              //                   child: Padding(
              //                     padding: const EdgeInsets.all(8.0),
              //                     child: Text(
              //                       "Tidak",
              //                       style: whiteTextStyle,
              //                     ),
              //                   )),
              //             ],
              //           )),
              //       Container(
              //           padding: EdgeInsets.all(5.sp),
              //           child: Text(
              //             (state.pengkajianNutrisiAnak.n4 == "Ya") ? "2" : "0",
              //             style: blackTextStyle.copyWith(
              //                 fontSize: 10.sp, fontWeight: FontWeight.bold),
              //             textAlign: TextAlign.left,
              //           )),
              // ]),
              // ],
              // ),
            ],
          ),
        ));
  }
}
