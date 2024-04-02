import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:hms_app/domain/bloc/dashboard/pasien/pasien_bloc.dart';
import 'package:hms_app/domain/models/meta/meta_model.dart';
import 'package:hms_app/presentation/component/component.dart';
import 'package:hms_app/presentation/component/loading/loading.dart';
import 'package:hms_app/presentation/pages/widget/header_content_widget.dart';
import 'package:hms_app/presentation/perina/bloc/apgar_score/apgar_score_bloc.dart';
import 'package:sizer/sizer.dart';

class AgparScoreWidgetPage extends StatefulWidget {
  const AgparScoreWidgetPage({super.key});

  @override
  State<AgparScoreWidgetPage> createState() => _AgparScoreWidgetPageState();
}

class _AgparScoreWidgetPageState extends State<AgparScoreWidgetPage> {
  final ScrollController _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    PasienState pasienState = context.watch<PasienBloc>().state;
    final singlePasien = pasienState.listPasienModel
        .where((element) => element.mrn == pasienState.normSelected);
    // AuthState authState = context.watch<AuthBloc>().state;

    return BlocConsumer<ApgarScoreBloc, ApgarScoreState>(
      listener: (context, state) {
        if (state.status == ApgarScoreStatus.isLoadingSave) {
          EasyLoading.show();
        }

        if (state.status != ApgarScoreStatus.isLoadingSave) {
          EasyLoading.dismiss();
        }

        state.saveResult.fold(
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
            isENableAdd: false,
            backgroundColor: ThemeColor.bgColor,
            onPressed: null,
            title: "",
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
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8),
                        child: Container(
                          width: Get.width,
                          decoration: const BoxDecoration(),
                          margin: EdgeInsets.only(right: 10.sp),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              SizedBox(
                                child: Table(
                                  border: TableBorder.all(color: Colors.white),
                                  children: [
                                    TableRow(children: [
                                      TitleWidget.centerButtonBox(
                                          title: "1 Menit",
                                          backgroundColor: (state
                                                  .socreModel.waktu
                                                  .contains("1 Menit"))
                                              ? ThemeColor.greenColor
                                              : ThemeColor.darkColor,
                                          onPressed: () {
                                            context.read<ApgarScoreBloc>().add(
                                                OnChangedWaktuEvent(
                                                    value: "1 Menit"));
                                          }),
                                      TitleWidget.centerButtonBox(
                                          title: "5 Menit",
                                          backgroundColor: (state
                                                  .socreModel.waktu
                                                  .contains("5 Menit"))
                                              ? ThemeColor.greenColor
                                              : ThemeColor.darkColor,
                                          onPressed: () {
                                            context.read<ApgarScoreBloc>().add(
                                                OnChangedWaktuEvent(
                                                    value: "5 Menit"));
                                          }),
                                    ]),
                                  ],
                                ),
                              ),
                              SizedBox(
                                  child: Table(
                                      border: TableBorder.all(),
                                      children: [
                                    TableRow(children: [
                                      TitleWidget.headerLeftTitle(
                                          title: "PARAMETER"),
                                      TitleWidget.headerLeftTitle(
                                          title: "NILAI 0"),
                                      TitleWidget.headerLeftTitle(
                                          title: "NILAI 1"),
                                      TitleWidget.headerLeftTitle(
                                          title: "NILAI 2"),
                                      TitleWidget.headerLeftTitle(
                                          title: "SCORE"),
                                    ]),
                                  ])),
                              SizedBox(
                                child: Table(
                                  border: TableBorder.all(color: Colors.black),
                                  children: [
                                    TableRow(children: [
                                      TitleWidget.boldText(
                                          title: "Denyut Jantung"),
                                      TitleWidget.centerButtonBox(
                                          title: "Tidak ada",
                                          onPressed: () {
                                            // ONCHANGE JANTUNG
                                            context.read<ApgarScoreBloc>().add(
                                                OnChangedJantungEvent(
                                                    value: 0));
                                          },
                                          backgroundColor:
                                              (state.socreModel.jantung == 0)
                                                  ? ThemeColor.greenColor
                                                  : ThemeColor.darkColor),
                                      TitleWidget.centerButtonBox(
                                          title: "Lambat < 100",
                                          onPressed: () {
                                            context.read<ApgarScoreBloc>().add(
                                                OnChangedJantungEvent(
                                                    value: 1));
                                          },
                                          backgroundColor:
                                              (state.socreModel.jantung == 1)
                                                  ? ThemeColor.greenColor
                                                  : ThemeColor.darkColor),
                                      TitleWidget.centerButtonBox(
                                          title: "> 100",
                                          onPressed: () {
                                            context.read<ApgarScoreBloc>().add(
                                                OnChangedJantungEvent(
                                                    value: 2));
                                          },
                                          backgroundColor:
                                              (state.socreModel.jantung == 2)
                                                  ? ThemeColor.greenColor
                                                  : ThemeColor.darkColor),
                                      TitleWidget.centerTextBoxBold(
                                          title: state.socreModel.jantung
                                              .toString()),
                                    ]),
                                    TableRow(children: [
                                      TitleWidget.boldText(
                                          title: "Usaha Nafas"),
                                      TitleWidget.centerButtonBox(
                                          title: "Tidak Ada",
                                          backgroundColor:
                                              (state.socreModel.nafas == 0)
                                                  ? ThemeColor.greenColor
                                                  : ThemeColor.darkColor,
                                          onPressed: () {
                                            context.read<ApgarScoreBloc>().add(
                                                OnChangedUsahaNafasEvent(
                                                    value: 0));
                                          }),
                                      TitleWidget.centerButtonBox(
                                          backgroundColor:
                                              (state.socreModel.nafas == 1)
                                                  ? ThemeColor.greenColor
                                                  : ThemeColor.darkColor,
                                          onPressed: () {
                                            context.read<ApgarScoreBloc>().add(
                                                OnChangedUsahaNafasEvent(
                                                    value: 1));
                                          },
                                          title: "Lambat, tidak teratur"),
                                      TitleWidget.centerButtonBox(
                                          backgroundColor:
                                              (state.socreModel.nafas == 2)
                                                  ? ThemeColor.greenColor
                                                  : ThemeColor.darkColor,
                                          onPressed: () {
                                            context.read<ApgarScoreBloc>().add(
                                                OnChangedUsahaNafasEvent(
                                                    value: 2));
                                          },
                                          title: "Menangis dengan keras"),
                                      TitleWidget.centerTextBoxBold(
                                          title: state.socreModel.nafas
                                              .toString()),
                                    ]),
                                    TableRow(children: [
                                      TitleWidget.boldText(title: "Tonus Otot"),
                                      TitleWidget.centerButtonBox(
                                          title: "Lemah",
                                          backgroundColor:
                                              (state.socreModel.otot == 0)
                                                  ? ThemeColor.greenColor
                                                  : ThemeColor.darkColor,
                                          onPressed: () {
                                            context.read<ApgarScoreBloc>().add(
                                                OnChangedTonusOtotEvent(
                                                    value: 0));
                                          }),
                                      TitleWidget.centerButtonBox(
                                          backgroundColor:
                                              (state.socreModel.otot == 1)
                                                  ? ThemeColor.greenColor
                                                  : ThemeColor.darkColor,
                                          onPressed: () {
                                            context.read<ApgarScoreBloc>().add(
                                                OnChangedTonusOtotEvent(
                                                    value: 1));
                                          },
                                          title: "Fleksi pada ektermitas"),
                                      TitleWidget.centerButtonBox(
                                          backgroundColor:
                                              (state.socreModel.otot == 2)
                                                  ? ThemeColor.greenColor
                                                  : ThemeColor.darkColor,
                                          onPressed: () {
                                            context.read<ApgarScoreBloc>().add(
                                                OnChangedTonusOtotEvent(
                                                    value: 2));
                                          },
                                          title: "Gerakan Akitf"),
                                      TitleWidget.centerTextBoxBold(
                                          title:
                                              state.socreModel.otot.toString()),
                                    ]),
                                    TableRow(children: [
                                      TitleWidget.boldText(
                                          title:
                                              "Kepekaan Refleksi (gremace)/peka rangsang"),
                                      TitleWidget.centerButtonBox(
                                          title: "Tidak Ada",
                                          backgroundColor:
                                              (state.socreModel.refleksi == 0)
                                                  ? ThemeColor.greenColor
                                                  : ThemeColor.darkColor,
                                          onPressed: () {
                                            context.read<ApgarScoreBloc>().add(
                                                OnChangedReflesiEvent(
                                                    value: 0));
                                          }),
                                      TitleWidget.centerButtonBox(
                                          backgroundColor:
                                              (state.socreModel.refleksi == 1)
                                                  ? ThemeColor.greenColor
                                                  : ThemeColor.darkColor,
                                          onPressed: () {
                                            context.read<ApgarScoreBloc>().add(
                                                OnChangedReflesiEvent(
                                                    value: 1));
                                          },
                                          title: "Meringis"),
                                      TitleWidget.centerButtonBox(
                                          backgroundColor:
                                              (state.socreModel.refleksi == 2)
                                                  ? ThemeColor.greenColor
                                                  : ThemeColor.darkColor,
                                          onPressed: () {
                                            context.read<ApgarScoreBloc>().add(
                                                OnChangedReflesiEvent(
                                                    value: 2));
                                          },
                                          title: "Menangis Kuat"),
                                      TitleWidget.centerTextBoxBold(
                                          title: state.socreModel.refleksi
                                              .toString()),
                                    ]),
                                    TableRow(children: [
                                      TitleWidget.boldText(
                                          title: "Warna kulit (apperence)"),
                                      TitleWidget.centerButtonBox(
                                          title: "Biru/Pucat",
                                          backgroundColor:
                                              (state.socreModel.warnaKulit == 0)
                                                  ? ThemeColor.greenColor
                                                  : ThemeColor.darkColor,
                                          onPressed: () {
                                            context.read<ApgarScoreBloc>().add(
                                                OnChangedKulitEvent(value: 0));
                                          }),
                                      TitleWidget.centerButtonBox(
                                          backgroundColor:
                                              (state.socreModel.warnaKulit == 1)
                                                  ? ThemeColor.greenColor
                                                  : ThemeColor.darkColor,
                                          onPressed: () {
                                            context.read<ApgarScoreBloc>().add(
                                                OnChangedKulitEvent(value: 1));
                                          },
                                          title:
                                              "Tubuh merah muda, kestremitas biru"),
                                      TitleWidget.centerButtonBox(
                                          backgroundColor:
                                              (state.socreModel.warnaKulit == 2)
                                                  ? ThemeColor.greenColor
                                                  : ThemeColor.darkColor,
                                          onPressed: () {
                                            context.read<ApgarScoreBloc>().add(
                                                OnChangedKulitEvent(value: 2));
                                          },
                                          title: "Seluruhnya merah muda"),
                                      TitleWidget.centerTextBoxBold(
                                          title: state.socreModel.warnaKulit
                                              .toString()),
                                    ]),
                                    TableRow(children: [
                                      TitleWidget.centerTextBoxBold(
                                          title: "Total"),
                                      TitleWidget.headerLeftTitle(title: ""),
                                      TitleWidget.headerLeftTitle(title: ""),
                                      TitleWidget.headerLeftTitle(title: ""),
                                      TitleWidget.centerTextBoxBold(
                                          title: state.socreModel.total
                                              .toString()),
                                    ]),
                                  ],
                                ),
                              ),
                              SizedBox(
                                child: Table(
                                  border: TableBorder.all(color: Colors.white),
                                  children: [
                                    TableRow(children: [
                                      TitleWidget.centerButtonBox(
                                          title: "SIMPAN",
                                          backgroundColor:
                                              ThemeColor.primaryColor,
                                          onPressed: () {
                                            context.read<ApgarScoreBloc>().add(
                                                OnSaveApgarScoreEvent(
                                                    noReg: singlePasien
                                                        .first.noreg,
                                                    apgarScore:
                                                        state.socreModel));
                                          }),
                                    ]),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),

                      // LOADING DATA APGAR SCORE
                      if (state.status == ApgarScoreStatus.isLoadingGet) ...[
                        Padding(
                          padding: const EdgeInsets.all(8),
                          child: Container(
                            width: Get.width,
                            decoration: const BoxDecoration(),
                            margin: EdgeInsets.only(right: 10.sp),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.end,
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                SizedBox(
                                    child: Table(
                                        border: TableBorder.all(),
                                        children: [
                                      TableRow(children: [
                                        TitleWidget.headerLeftTitle(
                                            title: "PARAMETER"),
                                        TitleWidget.headerLeftTitle(
                                            title: "NILAI 0"),
                                        TitleWidget.headerLeftTitle(
                                            title: "NILAI 1"),
                                        TitleWidget.headerLeftTitle(
                                            title: "NILAI 2"),
                                        TitleWidget.headerLeftTitle(
                                            title: "SCORE"),
                                      ]),
                                    ])),
                                SizedBox(
                                  height: 100.sp,
                                  width: Get.width,
                                  child: Expanded(
                                      child: Loading.expandedLoading()),
                                )
                              ],
                            ),
                          ),
                        ),
                      ],
                      SizedBox(
                        height: 15.sp,
                      ),

                      if (state.dataScoreModel.isNotEmpty) ...[
                        ...state.dataScoreModel.map((e) {
                          return Padding(
                            padding: const EdgeInsets.only(right: 8, left: 8),
                            child: Container(
                                width: Get.width,
                                decoration: const BoxDecoration(),
                                margin:
                                    EdgeInsets.only(right: 10.sp, top: 10.sp),
                                child:
                                    Table(border: TableBorder.all(), children: [
                                  TableRow(children: [
                                    TitleWidget.headerLeftTitle(
                                        title:
                                            "PARAMETER ${e.waktu.toString().toUpperCase()}"),
                                    TitleWidget.headerLeftTitle(
                                        title: "NILAI 0"),
                                    TitleWidget.headerLeftTitle(
                                        title: "NILAI 1"),
                                    TitleWidget.headerLeftTitle(
                                        title: "NILAI 2"),
                                    TitleWidget.headerLeftTitle(title: "SCORE"),
                                  ]),
                                  TableRow(children: [
                                    TitleWidget.boldText(
                                        title: "Denyut Jantung"),
                                    TitleWidget.centerButtonBox(
                                        title: "Tidak ada",
                                        onPressed: () {},
                                        backgroundColor: (e.jantung == 0)
                                            ? ThemeColor.greenColor
                                            : ThemeColor.darkColor),
                                    TitleWidget.centerButtonBox(
                                        title: "Lambat < 100",
                                        onPressed: () {},
                                        backgroundColor: (e.jantung == 1)
                                            ? ThemeColor.greenColor
                                            : ThemeColor.darkColor),
                                    TitleWidget.centerButtonBox(
                                        title: "> 100",
                                        onPressed: () {},
                                        backgroundColor: (e.jantung == 2)
                                            ? ThemeColor.greenColor
                                            : ThemeColor.darkColor),
                                    TitleWidget.centerTextBoxBold(
                                      title: e.jantung.toString(),
                                    ),
                                  ]),
                                  TableRow(children: [
                                    TitleWidget.boldText(title: "Usaha Nafas"),
                                    TitleWidget.centerButtonBox(
                                        onPressed: () {},
                                        backgroundColor: (e.nafas == 0)
                                            ? ThemeColor.greenColor
                                            : ThemeColor.darkColor,
                                        title: "Tidak Ada"),
                                    TitleWidget.centerButtonBox(
                                        onPressed: () {},
                                        backgroundColor: (e.nafas == 1)
                                            ? ThemeColor.greenColor
                                            : ThemeColor.darkColor,
                                        title: "Lambat, tidak teratur"),
                                    TitleWidget.centerButtonBox(
                                        onPressed: () {},
                                        backgroundColor: (e.nafas == 2)
                                            ? ThemeColor.greenColor
                                            : ThemeColor.darkColor,
                                        title: "Menangis dengan keras"),
                                    TitleWidget.centerTextBoxBold(
                                      title: e.nafas.toString(),
                                    )
                                  ]),
                                  TableRow(children: [
                                    TitleWidget.boldText(title: "Tonus Otot"),
                                    TitleWidget.centerButtonBox(
                                        onPressed: () {},
                                        backgroundColor: (e.otot == 0)
                                            ? ThemeColor.greenColor
                                            : ThemeColor.darkColor,
                                        title: "Lemah"),
                                    TitleWidget.centerButtonBox(
                                        onPressed: () {},
                                        backgroundColor: (e.otot == 1)
                                            ? ThemeColor.greenColor
                                            : ThemeColor.darkColor,
                                        title: "Fleksi pada ektermitas"),
                                    TitleWidget.centerButtonBox(
                                        onPressed: () {},
                                        backgroundColor: (e.otot == 2)
                                            ? ThemeColor.greenColor
                                            : ThemeColor.darkColor,
                                        title: "Menangis kuat"),
                                    TitleWidget.centerTextBoxBold(
                                      title: e.otot.toString(),
                                    )
                                  ]),
                                  TableRow(children: [
                                    TitleWidget.boldText(
                                        title:
                                            "Kepekaan Refleksi\n(gremace)/peka rangsang"),
                                    TitleWidget.centerButtonBox(
                                        onPressed: () {},
                                        backgroundColor: (e.refleksi == 0)
                                            ? ThemeColor.greenColor
                                            : ThemeColor.darkColor,
                                        title: "Tidak Ada"),
                                    TitleWidget.centerButtonBox(
                                        onPressed: () {},
                                        backgroundColor: (e.refleksi == 1)
                                            ? ThemeColor.greenColor
                                            : ThemeColor.darkColor,
                                        title: "Meringis"),
                                    TitleWidget.centerButtonBox(
                                        onPressed: () {},
                                        backgroundColor: (e.refleksi == 2)
                                            ? ThemeColor.greenColor
                                            : ThemeColor.darkColor,
                                        title: "Menangis Kuat"),
                                    TitleWidget.centerTextBoxBold(
                                      title: e.refleksi.toString(),
                                    )
                                  ]),
                                  TableRow(children: [
                                    TitleWidget.boldText(
                                        title: "Warna Kulit\n(apperence)"),
                                    TitleWidget.centerButtonBox(
                                        onPressed: () {},
                                        backgroundColor: (e.warnaKulit == 0)
                                            ? ThemeColor.greenColor
                                            : ThemeColor.darkColor,
                                        title: "Biru/Pucat"),
                                    TitleWidget.centerButtonBox(
                                        onPressed: () {},
                                        backgroundColor: (e.warnaKulit == 1)
                                            ? ThemeColor.greenColor
                                            : ThemeColor.darkColor,
                                        title:
                                            "Tubuh merah muda, ektremitas biru"),
                                    TitleWidget.centerButtonBox(
                                        onPressed: () {},
                                        backgroundColor: (e.warnaKulit == 2)
                                            ? ThemeColor.greenColor
                                            : ThemeColor.darkColor,
                                        title: "Seluruhnya merah muda"),
                                    TitleWidget.centerTextBoxBold(
                                      title: e.warnaKulit.toString(),
                                    )
                                  ]),
                                  TableRow(children: [
                                    TitleWidget.headerLeftTitle(title: "Total"),
                                    TitleWidget.headerLeftTitle(title: ""),
                                    TitleWidget.headerLeftTitle(title: ""),
                                    TitleWidget.headerLeftTitle(title: ""),
                                    TitleWidget.centerTextBoxBold(
                                        title: e.total.toString()),
                                  ]),
                                ])),
                          );
                        }),
                        SizedBox(
                          height: 5.sp,
                        )
                      ],
                      SizedBox(
                        height: 25.sp,
                      ),
                    ],
                  ),
                )));
      },
    );
  }
}
