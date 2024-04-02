import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:hms_app/domain/bloc/dashboard/rincian_informasi/rincian_informasi_bloc.dart';
import 'package:hms_app/domain/models/diagnosa/diagnosa_icd_model.dart';
import 'package:hms_app/presentation/component/alert/custom_dialog.dart';
import 'package:hms_app/presentation/component/color/color_helper.dart';
import 'package:hms_app/presentation/component/fonts/font_helper.dart';
import 'package:hms_app/presentation/component/form/form_textfield_widget.dart';
import 'package:hms_app/presentation/pages/poli_gigi/medis/rincian_informasi/a_kerja_search_widget.dart';
import 'package:hms_app/presentation/pages/poli_gigi/medis/rincian_informasi/bank_data_search_widget.dart';
import 'package:hms_app/presentation/pages/widget/header_content_widget.dart';
import 'package:sizer/sizer.dart';

class RincianInformasiWidget extends StatelessWidget {
  const RincianInformasiWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return HeaderContentWidget(
        onPressed: () {
          // BUTTON SIMPAN
        },
        widget: BlocConsumer<RincianInformasiBloc, RincianInformasiState>(
          listener: (context, state) {
            // TODO LISTENER
            state.getfailOrSuccessResult.fold(
                () => null,
                (a) => a.fold(
                      (l) => null,
                      (r) => r.maybeMap(
                          orElse: () {},
                          loaded: (value) {
                            List<DiagnosaIcdModel> data =
                                (value.value["response"] as Iterable)
                                    .map((e) => DiagnosaIcdModel.fromMap(e))
                                    .toList();

                            context.read<RincianInformasiBloc>().add(
                                RincianInformasiEvent.addDiagnosis(
                                    diagsnosis: data));
                          }),
                    ));
          },
          builder: (context, state) {
            return SizedBox(
              height: Get.height,
              width: Get.width,
              child: Card(
                color: ThemeColor.bgColor,
                shape: RoundedRectangleBorder(
                    side: const BorderSide(
                      width: 1,
                      color: ThemeColor.blackColor,
                    ),
                    borderRadius: BorderRadius.circular(2.sp)),
                child: Column(
                  children: [
                    Container(
                      width: Get.width,
                      height: 20.sp,
                      decoration: BoxDecoration(
                        color: ThemeColor.blueColor.withOpacity(0.5),
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(2.sp),
                            topRight: Radius.circular(2.sp)),
                      ),
                      child: Center(
                        child: Text(
                          "Diagnosis",
                          style: blackTextStyle.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                        child: Row(
                      children: [
                        Container(
                          width: Get.width / 2.7,
                          padding: EdgeInsets.all(2.sp),
                          child: SingleChildScrollView(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                cardForm(
                                    context: context,
                                    title: "a.Kerja",
                                    value: state.aKerjaValue,
                                    onPressed: () {
                                      // GET A KERJA
                                      CustomDialogWidget.getDialog(
                                          widget: Container(
                                            padding: EdgeInsets.all(12.sp),
                                            height: 200.sp,
                                            width: 400.sp,
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(6.sp),
                                                color: Colors.white),
                                            child: const AKerjaSearchWidget(
                                                selection: Selection.kerja),
                                          ),
                                          color: Colors.transparent);
                                    }),
                                cardForm(
                                    context: context,
                                    title: "a.Banding",
                                    value: state.aBandingValue,
                                    onPressed: () {
                                      // todo a.BANDING
                                      // GET A KERJA
                                      CustomDialogWidget.getDialog(
                                          widget: Container(
                                            padding: EdgeInsets.all(12.sp),
                                            height: 200.sp,
                                            width: 400.sp,
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(6.sp),
                                                color: Colors.white),
                                            child: const AKerjaSearchWidget(
                                                selection: Selection.banding),
                                          ),
                                          color: Colors.transparent);
                                    }),
                                cardForm(
                                    context: context,
                                    title: "Dasar Diagnosis",
                                    value: state.dasarDiagnosisValue,
                                    onPressed: () {
                                      context.read<RincianInformasiBloc>().add(
                                          const RincianInformasiEvent
                                              .getBankData(
                                              kategori: "dasar_diagnosa"));

                                      CustomDialogWidget.getDialog(
                                          widget: Container(
                                            padding: EdgeInsets.all(12.sp),
                                            height: 200.sp,
                                            width: 400.sp,
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(6.sp),
                                                color: Colors.white),
                                            child: const BankDataSearhWidget(
                                                kategori:
                                                    Kategori.dasarDiagnosa),
                                          ),
                                          color: Colors.transparent);
                                    }),
                                cardForm(
                                    context: context,
                                    title: "Indikasi Tindakan",
                                    value: state.indikasiTindakanValue,
                                    onPressed: () {
                                      context.read<RincianInformasiBloc>().add(
                                          const RincianInformasiEvent
                                              .getBankData(
                                              kategori: "indikasi_tindakan"));

                                      CustomDialogWidget.getDialog(
                                          widget: Container(
                                            padding: EdgeInsets.all(12.sp),
                                            height: 200.sp,
                                            width: 400.sp,
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(6.sp),
                                                color: Colors.white),
                                            child: const BankDataSearhWidget(
                                                kategori:
                                                    Kategori.indikasiTindakan),
                                          ),
                                          color: Colors.transparent);
                                    }),
                                cardForm(
                                    context: context,
                                    title: "Tata Cara",
                                    value: state.tataCaraValue,
                                    onPressed: () {
                                      context.read<RincianInformasiBloc>().add(
                                          const RincianInformasiEvent
                                              .getBankData(
                                              kategori: "tata_cara"));

                                      CustomDialogWidget.getDialog(
                                          widget: Container(
                                            padding: EdgeInsets.all(12.sp),
                                            height: 200.sp,
                                            width: 400.sp,
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(6.sp),
                                                color: Colors.white),
                                            child: const BankDataSearhWidget(
                                                kategori: Kategori.tataCara),
                                          ),
                                          color: Colors.transparent);
                                    }),
                                cardForm(
                                    context: context,
                                    title: "Tujuan",
                                    value: state.tujuanValue,
                                    onPressed: () {
                                      context.read<RincianInformasiBloc>().add(
                                          const RincianInformasiEvent
                                              .getBankData(
                                              kategori: "tujuan_tindakan"));

                                      CustomDialogWidget.getDialog(
                                          widget: Container(
                                            padding: EdgeInsets.all(12.sp),
                                            height: 200.sp,
                                            width: 400.sp,
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(6.sp),
                                                color: Colors.white),
                                            child: const BankDataSearhWidget(
                                                kategori:
                                                    Kategori.tujuanTindakan),
                                          ),
                                          color: Colors.transparent);
                                    }),
                              ],
                            ),
                          ),
                        ),
                        Expanded(
                            child: Container(
                          padding: EdgeInsets.all(2.sp),
                          child: SingleChildScrollView(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                cardForm(
                                    context: context,
                                    title: "Risiko & Komplikasi",
                                    value: state.risikoValue,
                                    onPressed: () {
                                      context.read<RincianInformasiBloc>().add(
                                          const RincianInformasiEvent
                                              .getBankData(
                                              kategori: "risiko_komplikasi"));

                                      CustomDialogWidget.getDialog(
                                          widget: Container(
                                            padding: EdgeInsets.all(12.sp),
                                            height: 200.sp,
                                            width: 400.sp,
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(6.sp),
                                                color: Colors.white),
                                            child: const BankDataSearhWidget(
                                                kategori:
                                                    Kategori.risikoKomplikasi),
                                          ),
                                          color: Colors.transparent);
                                    }),
                                cardForm(
                                    context: context,
                                    title: "Prognosis",
                                    value: state.pronosisValue,
                                    onPressed: () {
                                      context.read<RincianInformasiBloc>().add(
                                          const RincianInformasiEvent
                                              .getBankData(
                                              kategori: "gigi_prognosis"));

                                      CustomDialogWidget.getDialog(
                                          widget: Container(
                                            padding: EdgeInsets.all(12.sp),
                                            height: 200.sp,
                                            width: 400.sp,
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(6.sp),
                                                color: Colors.white),
                                            child: const BankDataSearhWidget(
                                                kategori:
                                                    Kategori.gigiPrognosis),
                                          ),
                                          color: Colors.transparent);
                                    }),
                                cardForm(
                                    context: context,
                                    title: "Alternatif & Risiko",
                                    value: state.alternatifValue,
                                    onPressed: () {
                                      context.read<RincianInformasiBloc>().add(
                                          const RincianInformasiEvent
                                              .getBankData(
                                              kategori: "alternatif_risiko"));

                                      CustomDialogWidget.getDialog(
                                          widget: Container(
                                            padding: EdgeInsets.all(12.sp),
                                            height: 200.sp,
                                            width: 400.sp,
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(6.sp),
                                                color: Colors.white),
                                            child: const BankDataSearhWidget(
                                                kategori:
                                                    Kategori.alternatifRisiko),
                                          ),
                                          color: Colors.transparent);
                                    }),
                                cardForm(
                                    context: context,
                                    value: state.tidakDilakukanTindakanValue,
                                    title:
                                        "Risiko Bila Tidak\nDilakukan Tindakan",
                                    onPressed: () {
                                      context.read<RincianInformasiBloc>().add(
                                          const RincianInformasiEvent
                                              .getBankData(
                                              kategori:
                                                  "risiko_tanpa_tindakan"));

                                      CustomDialogWidget.getDialog(
                                          widget: Container(
                                            padding: EdgeInsets.all(12.sp),
                                            height: 200.sp,
                                            width: 400.sp,
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(6.sp),
                                                color: Colors.white),
                                            child: const BankDataSearhWidget(
                                                kategori: Kategori
                                                    .tidakDilakukanTindakan),
                                          ),
                                          color: Colors.transparent);
                                    }),
                                cardForm(
                                    context: context,
                                    title: "Lain-Lain",
                                    value: state.lainLainValue,
                                    onPressed: () {
                                      context.read<RincianInformasiBloc>().add(
                                          const RincianInformasiEvent
                                              .getBankData(
                                              kategori: "lain-lain"));

                                      CustomDialogWidget.getDialog(
                                          widget: Container(
                                            padding: EdgeInsets.all(12.sp),
                                            height: 200.sp,
                                            width: 400.sp,
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(6.sp),
                                                color: Colors.white),
                                            child: const BankDataSearhWidget(
                                                kategori: Kategori.lainLain),
                                          ),
                                          color: Colors.transparent);
                                    }),
                              ],
                            ),
                          ),
                        ))
                      ],
                    ))
                  ],
                ),
              ),
            );
          },
        ));
  }

  Container cardForm(
      {required BuildContext context,
      required String title,
      required String value,
      required void Function()? onPressed}) {
    return Container(
      margin: EdgeInsets.only(bottom: 2.sp),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
              width: 40.sp,
              child: Text(
                title,
                textAlign: TextAlign.start,
                style: blackTextStyle,
              )),

          SizedBox(
            width: Get.width / 1.9.sp,
            child: FormWidget.textForm(
                enable: true, controller: TextEditingController(text: value)),
          ),
          SizedBox(
            width: 2.sp,
          ),
          //
          SizedBox(
            width: 30.sp,
            height: 25.sp,
            child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: ThemeColor.primaryColor,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(2.sp))),
                onPressed: onPressed,
                child: const Icon(
                  Icons.search,
                  color: Colors.white,
                )),
          )
          //NOTED
        ],
      ),
    );
  }
}

List<String> rincianInfomrasi = [
  "a.Kerja",
  "b.Banding",
  "Dasar Diagnosis",
  "Indikasi Tindakan",
  "Tata Cara",
  "Tujuan",
  "Risiko & Kompilasi",
  "Prognosis",
  "Alternatif & Risiko",
  "Risiko Bila Tidak Dilakukan Tindakan",
  "Lain-Lain"
];
