import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bootstrap5/flutter_bootstrap5.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:hms_app/domain/bloc/dashboard/pasien/pasien_bloc.dart';
import 'package:hms_app/domain/models/meta/meta_model.dart';
import 'package:hms_app/presentation/component/component.dart';
import 'package:hms_app/presentation/perina/bloc/analisa/analisa_bloc.dart';
import 'package:hms_app/presentation/kebidanan/presentation/analisa_data/cari_diagnosa_keperawatan_widget.dart';
import 'package:sizer/sizer.dart';

class TambahAnalisaDataWidget extends StatefulWidget {
  const TambahAnalisaDataWidget({super.key});

  @override
  State<TambahAnalisaDataWidget> createState() =>
      _TambahAnalisaDataWidgetState();
}

class _TambahAnalisaDataWidgetState extends State<TambahAnalisaDataWidget> {
  late TextEditingController _dataController;

  @override
  void initState() {
    _dataController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _dataController.clear();
    _dataController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    PasienState pasienState = context.watch<PasienBloc>().state;
    final singlePasien = pasienState.listPasienModel
        .where((element) => element.mrn == pasienState.normSelected);

    return BlocConsumer<AnalisaBloc, AnalisaState>(
      listener: (context, state) {
        if (state.status == AnalisaStatus.isloadingSaveData) {
          EasyLoading.show(maskType: EasyLoadingMaskType.black);
        }

        if (state.status != AnalisaStatus.isloadingSaveData) {
          EasyLoading.dismiss();
        }

        state.saveResult.fold(
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

                      Get.back();

                      // ignore: use_build_context_synchronously
                      context
                          .read<AnalisaBloc>()
                          .add(OnGetDiagnosaKeperawatan());
                      // ignore: use_build_context_synchronously
                      context.read<AnalisaBloc>().add(OnGetAnalisaDataEvent(
                          noReg: singlePasien.first.noreg));

                      return shouldPop ?? false;
                    })));
      },
      builder: (context, state) {
        return SizedBox(
          width: Get.width / 1.4,
          height: Get.height / 1.2,
          child: Scaffold(
            backgroundColor: ThemeColor.bgColor,
            appBar: AppBar(
              automaticallyImplyLeading: false,
              title: Text(
                "TAMBAHKAN ANALISIS DATA",
                style: whiteTextStyle,
              ),
            ),
            body: SingleChildScrollView(
              child: Column(
                children: [
                  FB5Row(
                    classNames: 'px-xs-0 px-lg-0 gx-0',
                    children: [
                      FB5Col(
                          classNames: 'col-12',
                          child: Column(
                            children: [
                              TitleWidget.boxPemeriksaanFisikSugestion(
                                width: 35.sp,
                                widget: Container(
                                  decoration: BoxDecoration(
                                      borderRadius:
                                          BorderRadius.circular(5.sp)),
                                  height: 100.sp,
                                  child: Scaffold(
                                    backgroundColor: ThemeColor.darkGreyColor
                                        .withOpacity(0.2),
                                    floatingActionButton: FloatingActionButton(
                                      backgroundColor: ThemeColor.primaryColor,
                                      onPressed: () {
                                        // ADD DIAGNOSA KEPERAWTAN
                                        CustomDialogWidget.getDialog(
                                            widget:
                                                const CariDiagnosaKeperawatanWidget(),
                                            color: ThemeColor.whiteColor);
                                      },
                                      child: Icon(
                                        FontAwesomeIcons.plus,
                                        color: ThemeColor.bgColor,
                                      ),
                                    ),
                                    body: Wrap(
                                      children:
                                          (state.selectedDiagnosa.isNotEmpty)
                                              ? state.selectedDiagnosa
                                                  .map((e) => SizedBox(
                                                        height: 50.sp,
                                                        width: 50.sp,
                                                        child: Card(
                                                          elevation: 1.sp,
                                                          shape: RoundedRectangleBorder(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          5.sp)),
                                                          color: ThemeColor
                                                              .primaryColor
                                                              .withOpacity(0.5),
                                                          child: Column(
                                                            children: [
                                                              Expanded(
                                                                child: Center(
                                                                  child:
                                                                      Padding(
                                                                    padding:
                                                                        const EdgeInsets
                                                                            .all(
                                                                            8.0),
                                                                    child: Text(
                                                                      "${e.kode} - ${e.judul}",
                                                                      textAlign:
                                                                          TextAlign
                                                                              .center,
                                                                      style: whiteTextStyle.copyWith(
                                                                          fontSize:
                                                                              5.sp),
                                                                    ),
                                                                  ),
                                                                ),
                                                              ),
                                                              SizedBox(
                                                                height: 15.sp,
                                                                width:
                                                                    Get.width,
                                                                child:
                                                                    ElevatedButton(
                                                                        style: ElevatedButton.styleFrom(
                                                                            backgroundColor: ThemeColor
                                                                                .dangerColor,
                                                                            shape: RoundedRectangleBorder(
                                                                                borderRadius: BorderRadius.circular(2
                                                                                    .sp))),
                                                                        onPressed:
                                                                            () {
                                                                          context
                                                                              .read<AnalisaBloc>()
                                                                              .add(OnRemoveDiagnosaKeperawatan(diagnosa: e));
                                                                        },
                                                                        child:
                                                                            Row(
                                                                          mainAxisAlignment:
                                                                              MainAxisAlignment.center,
                                                                          crossAxisAlignment:
                                                                              CrossAxisAlignment.center,
                                                                          children: [
                                                                            Text(
                                                                              "Hapus ",
                                                                              style: blackTextStyle.copyWith(fontWeight: FontWeight.bold),
                                                                            ),
                                                                            const Icon(
                                                                              Icons.delete,
                                                                              color: Colors.black,
                                                                            )
                                                                          ],
                                                                        )),
                                                              )
                                                            ],
                                                          ),
                                                        ),
                                                      ))
                                                  .toList()
                                              : [],
                                    ),
                                  ),
                                ),
                                title: "Diagnosa",
                              ),
                            ],
                          )),
                      FB5Col(
                          classNames: 'col-12',
                          child: Column(
                            children: [
                              TitleWidget.boxPemeriksaanFisikSugestion(
                                width: 35.sp,
                                widget: Container(
                                  decoration: BoxDecoration(
                                      borderRadius:
                                          BorderRadius.circular(5.sp)),
                                  height: 100.sp,
                                  child: FormWidget.textArea(
                                      controller: _dataController,
                                      maxLines: 20,
                                      enabled: true),
                                ),
                                title: "DATA",
                              ),
                            ],
                          )),
                    ],
                  ),
                  FB5Col(
                      classNames: 'col-12',
                      child: Container(
                        padding: EdgeInsets.symmetric(horizontal: 5.sp),
                        height: 15.sp,
                        child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                backgroundColor: ThemeColor.primaryColor,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(1.sp))),
                            onPressed: () {
                              context.read<AnalisaBloc>().add(
                                  OnSaveDiagnosaKeperawatan(
                                      noReg: singlePasien.first.noreg,
                                      data: _dataController.text,
                                      diagnosa: state.selectedDiagnosa));
                            },
                            child: Text(
                              "SIMPAN",
                              style: whiteTextStyle,
                            )),
                      ))
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
