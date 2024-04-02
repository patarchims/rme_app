import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:hms_app/domain/bloc/dashboard/pasien/pasien_bloc.dart';
import 'package:hms_app/domain/bloc/user/auth/auth_bloc.dart';
import 'package:hms_app/domain/models/meta/meta_model.dart';
import 'package:hms_app/domain/models/users/user_model.dart';
import 'package:hms_app/presentation/component/component.dart';
import 'package:hms_app/presentation/component/loading/loading.dart';
import 'package:hms_app/presentation/pages/widget/header_content_widget.dart';
import 'package:hms_app/presentation/perina/bloc/down_socre_nonatus/down_score_neonatus_bloc.dart';
import 'package:sizer/sizer.dart';

class DownScroePadaNeoNatusPageWidget extends StatefulWidget {
  const DownScroePadaNeoNatusPageWidget({super.key});

  @override
  State<DownScroePadaNeoNatusPageWidget> createState() =>
      _DownScroePadaNeoNatusPageWidgetState();
}

class _DownScroePadaNeoNatusPageWidgetState
    extends State<DownScroePadaNeoNatusPageWidget> {
  final ScrollController _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    PasienState pasienState = context.watch<PasienBloc>().state;
    final singlePasien = pasienState.listPasienModel
        .where((element) => element.mrn == pasienState.normSelected);

    AuthState authState = context.watch<AuthBloc>().state;

    return BlocConsumer<DownScoreNeonatusBloc, DownScoreNeonatusState>(
      listener: (context, state) {
        if (state.status == DownScoreStatus.isLoadingSave) {
          EasyLoading.show();
        }

        if (state.status != DownScoreStatus.isLoadingSave) {
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
        if (state.status == DownScoreStatus.isLoadingGet) {
          return HeaderContentWidget(widget: Loading.expandedLoading());
        }
        return HeaderContentWidget(
            isENableAdd: true,
            backgroundColor: ThemeColor.bgColor,
            onPressed: () {
              // SIMPAN DATAS
              if (authState is Authenticated) {
                context.read<DownScoreNeonatusBloc>().add(OnSaveScroeNeoNatus(
                    person: toPerson(person: authState.user.person),
                    neoNatus: state.score,
                    noReg: singlePasien.first.noreg));
              }
            },
            title: "SIMPAN",
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
                      padding: EdgeInsets.all(5.sp),
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
                                border: TableBorder.all(color: Colors.black),
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
                                    TitleWidget.headerLeftTitle(title: "SCORE"),
                                  ]),
                                ],
                              ),
                            ),
                            SizedBox(
                              child: Table(
                                border: TableBorder.all(),
                                children: [
                                  TableRow(children: [
                                    TitleWidget.textBox(
                                        title: "Frekwensi Nafas"),
                                    TitleWidget.centerButtonBox(
                                        title: "<60/menit",
                                        backgroundColor:
                                            (state.score.nifas == 0)
                                                ? ThemeColor.greenColor
                                                : ThemeColor.primaryColor,
                                        onPressed: () {
                                          context
                                              .read<DownScoreNeonatusBloc>()
                                              .add(OnChangeFrekwesiEvent(
                                                  value: 0));
                                        }),
                                    TitleWidget.centerButtonBox(
                                        title: "60-80/menit",
                                        onPressed: () {
                                          context
                                              .read<DownScoreNeonatusBloc>()
                                              .add(OnChangeFrekwesiEvent(
                                                  value: 1));
                                        },
                                        backgroundColor:
                                            (state.score.nifas == 1)
                                                ? ThemeColor.greenColor
                                                : ThemeColor.primaryColor),
                                    TitleWidget.centerButtonBox(
                                        title: ">80/menit",
                                        backgroundColor:
                                            (state.score.nifas == 2)
                                                ? ThemeColor.greenColor
                                                : ThemeColor.primaryColor,
                                        onPressed: () {
                                          context
                                              .read<DownScoreNeonatusBloc>()
                                              .add(OnChangeFrekwesiEvent(
                                                  value: 2));
                                        }),
                                    TitleWidget.centerTextBoxBold(
                                        title: state.score.nifas.toString()),
                                  ]),
                                ],
                              ),
                            ),
                            SizedBox(
                              child: Table(
                                border: TableBorder.all(),
                                children: [
                                  TableRow(children: [
                                    TitleWidget.textBox(title: "Sianosis"),
                                    TitleWidget.centerButtonBox(
                                        backgroundColor:
                                            (state.score.sianosis == 0)
                                                ? ThemeColor.greenColor
                                                : ThemeColor.primaryColor,
                                        onPressed: () {
                                          context
                                              .read<DownScoreNeonatusBloc>()
                                              .add(OnChangedSianosisEvent(
                                                  value: 0));
                                        },
                                        title: "Tidak Sianosi"),
                                    TitleWidget.centerButtonBox(
                                        backgroundColor:
                                            (state.score.sianosis == 1)
                                                ? ThemeColor.greenColor
                                                : ThemeColor.primaryColor,
                                        onPressed: () {
                                          context
                                              .read<DownScoreNeonatusBloc>()
                                              .add(OnChangedSianosisEvent(
                                                  value: 1));
                                        },
                                        title: "Sianosis bilang dengan O2"),
                                    TitleWidget.centerButtonBox(
                                        backgroundColor:
                                            (state.score.sianosis == 2)
                                                ? ThemeColor.greenColor
                                                : ThemeColor.primaryColor,
                                        onPressed: () {
                                          context
                                              .read<DownScoreNeonatusBloc>()
                                              .add(OnChangedSianosisEvent(
                                                  value: 2));
                                        },
                                        title:
                                            "Sianosis menetap walaupun diberi 02"),
                                    TitleWidget.centerTextBoxBold(
                                      title: state.score.sianosis.toString(),
                                    ),
                                  ]),
                                ],
                              ),
                            ),
                            SizedBox(
                              child: Table(
                                border: TableBorder.all(),
                                children: [
                                  TableRow(children: [
                                    TitleWidget.textBox(title: "Retraksi"),
                                    TitleWidget.centerButtonBox(
                                        backgroundColor:
                                            (state.score.retraksi == 0)
                                                ? ThemeColor.greenColor
                                                : ThemeColor.primaryColor,
                                        onPressed: () {
                                          context
                                              .read<DownScoreNeonatusBloc>()
                                              .add(OnChangedRetraksiEvent(
                                                  value: 0));
                                        },
                                        title: "Tidak ada retraksi"),
                                    TitleWidget.centerButtonBox(
                                        backgroundColor:
                                            (state.score.retraksi == 1)
                                                ? ThemeColor.greenColor
                                                : ThemeColor.primaryColor,
                                        onPressed: () {
                                          context
                                              .read<DownScoreNeonatusBloc>()
                                              .add(OnChangedRetraksiEvent(
                                                  value: 1));
                                        },
                                        title: "Retraksi Ringan"),
                                    TitleWidget.centerButtonBox(
                                        backgroundColor:
                                            (state.score.retraksi == 2)
                                                ? ThemeColor.greenColor
                                                : ThemeColor.primaryColor,
                                        onPressed: () {
                                          context
                                              .read<DownScoreNeonatusBloc>()
                                              .add(OnChangedRetraksiEvent(
                                                  value: 2));
                                        },
                                        title: "Retraksi Berat"),
                                    TitleWidget.centerTextBoxBold(
                                        title: state.score.retraksi.toString()),
                                  ]),
                                ],
                              ),
                            ),
                            SizedBox(
                              child: Table(
                                border: TableBorder.all(),
                                children: [
                                  TableRow(children: [
                                    TitleWidget.textBox(title: "Air Entry"),
                                    TitleWidget.centerButtonBox(
                                        backgroundColor:
                                            (state.score.airEntry == 0)
                                                ? ThemeColor.greenColor
                                                : ThemeColor.primaryColor,
                                        onPressed: () {
                                          context
                                              .read<DownScoreNeonatusBloc>()
                                              .add(OnChangedAirEntryEvent(
                                                  value: 0));
                                        },
                                        title: "Udara masuk bilateral baik"),
                                    TitleWidget.centerButtonBox(
                                        backgroundColor:
                                            (state.score.airEntry == 1)
                                                ? ThemeColor.greenColor
                                                : ThemeColor.primaryColor,
                                        onPressed: () {
                                          context
                                              .read<DownScoreNeonatusBloc>()
                                              .add(OnChangedAirEntryEvent(
                                                  value: 1));
                                        },
                                        title: "Penurunan ringan udara masuk"),
                                    TitleWidget.centerButtonBox(
                                      backgroundColor:
                                          (state.score.airEntry == 2)
                                              ? ThemeColor.greenColor
                                              : ThemeColor.primaryColor,
                                      onPressed: () {
                                        context
                                            .read<DownScoreNeonatusBloc>()
                                            .add(OnChangedAirEntryEvent(
                                                value: 2));
                                      },
                                      title: "Tidak ada udara",
                                    ),
                                    TitleWidget.centerTextBoxBold(
                                        title: state.score.airEntry.toString()),
                                  ]),
                                ],
                              ),
                            ),
                            SizedBox(
                              child: Table(
                                border: TableBorder.all(),
                                children: [
                                  TableRow(children: [
                                    TitleWidget.textBox(title: "Merintih"),
                                    TitleWidget.centerButtonBox(
                                        backgroundColor:
                                            (state.score.merintih == 0)
                                                ? ThemeColor.greenColor
                                                : ThemeColor.primaryColor,
                                        onPressed: () {
                                          context
                                              .read<DownScoreNeonatusBloc>()
                                              .add(OnChangeMerintihEvent(
                                                  value: 0));
                                        },
                                        title: "Tidak merintih"),
                                    TitleWidget.centerButtonBox(
                                        backgroundColor:
                                            (state.score.merintih == 1)
                                                ? ThemeColor.greenColor
                                                : ThemeColor.primaryColor,
                                        onPressed: () {
                                          context
                                              .read<DownScoreNeonatusBloc>()
                                              .add(OnChangeMerintihEvent(
                                                  value: 1));
                                        },
                                        title:
                                            "Dapat didengan dengan stetoskope"),
                                    TitleWidget.centerButtonBox(
                                        backgroundColor:
                                            (state.score.merintih == 2)
                                                ? ThemeColor.greenColor
                                                : ThemeColor.primaryColor,
                                        onPressed: () {
                                          context
                                              .read<DownScoreNeonatusBloc>()
                                              .add(OnChangeMerintihEvent(
                                                  value: 2));
                                        },
                                        title:
                                            "Dapt didengar tanpa alat bantu"),
                                    TitleWidget.centerTextBoxBold(
                                        title: state.score.merintih.toString()),
                                  ]),
                                ],
                              ),
                            ),
                            SizedBox(
                              child: Table(
                                border: TableBorder.all(),
                                children: [
                                  TableRow(children: [
                                    TitleWidget.headerLeftTitle(title: "Total"),
                                    TitleWidget.headerLeftTitle(title: ""),
                                    TitleWidget.headerLeftTitle(title: ""),
                                    TitleWidget.headerLeftTitle(title: ""),
                                    TitleWidget.centerTextBoxBold(
                                        title: state.score.total.toString()),
                                  ]),
                                ],
                              ),
                            ),
                          ],
                        ),
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
