import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bootstrap5/flutter_bootstrap5.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:hms_app/domain/bloc/dashboard/pasien/pasien_bloc.dart';
import 'package:hms_app/domain/bloc/user/auth/auth_bloc.dart';
import 'package:hms_app/domain/models/devices_info/device_info_model.dart';
import 'package:hms_app/domain/models/meta/meta_model.dart';
import 'package:hms_app/domain/models/users/user_model.dart';
import 'package:hms_app/presentation/component/component.dart';
import 'package:hms_app/presentation/component/loading/loading.dart';
import 'package:hms_app/presentation/pages/widget/header_content_widget.dart';
import 'package:hms_app/presentation/perina/bloc/pemeriksaan_fisik_perina/pemeriksaan_fisik_perina_bloc.dart';
import 'package:sizer/sizer.dart';

class TandaVitalPerinaWidgetPage extends StatefulWidget {
  const TandaVitalPerinaWidgetPage({super.key});

  @override
  State<TandaVitalPerinaWidgetPage> createState() =>
      _TandaVitalPerinaWidgetPageState();
}

class _TandaVitalPerinaWidgetPageState
    extends State<TandaVitalPerinaWidgetPage> {
  final ScrollController _scrollController = ScrollController();

  late TextEditingController _hrController;
  late TextEditingController _rrController;
  late TextEditingController _spo2Controller;
  late TextEditingController _bbController;
  late TextEditingController _tbController;
  late TextEditingController _lingkarKepalaController;
  late TextEditingController _lingkarLenganController;
  late TextEditingController _lingkarDadaController;
  late TextEditingController _lingkarPerutController;
  late TextEditingController _warnaKulitController;
  late TextEditingController _tdController;

  @override
  void initState() {
    _hrController = TextEditingController();
    _rrController = TextEditingController();
    _spo2Controller = TextEditingController();
    _bbController = TextEditingController();
    _tbController = TextEditingController();
    _warnaKulitController = TextEditingController();
    _lingkarKepalaController = TextEditingController();
    _lingkarLenganController = TextEditingController();
    _lingkarDadaController = TextEditingController();
    _lingkarPerutController = TextEditingController();
    _tdController = TextEditingController();

    super.initState();
  }

  @override
  void dispose() {
    _hrController.clear();
    _rrController.clear();
    _spo2Controller.clear();
    _bbController.clear();
    _tbController.clear();
    _warnaKulitController.clear();
    _lingkarKepalaController.clear();
    _lingkarLenganController.clear();
    _lingkarDadaController.clear();
    _lingkarPerutController.clear();
    _tdController.clear();

    _hrController.dispose();
    _rrController.dispose();
    _spo2Controller.dispose();
    _bbController.dispose();
    _tbController.dispose();
    _warnaKulitController.dispose();
    _lingkarKepalaController.dispose();
    _lingkarLenganController.dispose();
    _lingkarDadaController.dispose();
    _lingkarPerutController.dispose();
    _tdController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    PasienState pasienState = context.watch<PasienBloc>().state;
    final singlePasien = pasienState.listPasienModel
        .where((element) => element.mrn == pasienState.normSelected);

    AuthState authState = context.watch<AuthBloc>().state;

    return BlocConsumer<PemeriksaanFisikPerinaBloc,
        PemeriksaanFisikPerinaState>(
      listener: (context, state) {
        // IS LOADING SAVE DATA
        if (state.status == PemeriksaanFisikPerinaStatus.isLoadingSave) {
          EasyLoading.show();
        }

        if (state.status != PemeriksaanFisikPerinaStatus.isLoadingSave) {
          EasyLoading.dismiss();
        }

        state.saveResultVitalSign.fold(
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
        if (state.status == PemeriksaanFisikPerinaStatus.isLoadingGet) {
          return HeaderContentWidget(
            widget: Loading.circleLoading(),
          );
        }

        return HeaderContentWidget(
            backgroundColor: ThemeColor.bgColor,
            isENableAdd: true,
            onPressed: () async {
              dynamic data = await deviceInfo.initPlatformState();

              if (authState is Authenticated) {
                // SIMPAN DATA DVITAL SIGN
                // ignore: use_build_context_synchronously
                context.read<PemeriksaanFisikPerinaBloc>().add(
                    OnSaveDVitalSignFisikPerina(
                        kategori: toPerson(person: authState.user.person),
                        vitalSign: state.vitalSignPerina.copyWith(
                            bb: _bbController.text,
                            hr: _hrController.text,
                            lingkarDada: _lingkarDadaController.text,
                            lingkarKepala: _lingkarKepalaController.text,
                            lingkarLengan: _lingkarLenganController.text,
                            lingkarPerut: _tdController.text,
                            rr: _rrController.text,
                            spo2: _spo2Controller.text,
                            tb: _tbController.text,
                            warnaKulit: _warnaKulitController.text,
                            td: _tdController.text),
                        devicesID: "ID - ${data['id']} - ${data['device']}",
                        pelayanan:
                            toPelayanan(poliklinik: authState.user.poliklinik),
                        person: toPerson(person: authState.user.person),
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
                    FB5Row(
                      classNames: 'px-xs-0 px-lg-0 gx-0',
                      children: [
                        FB5Col(
                          classNames: 'col-6',
                          child: TitleWidget.boxVitalSign(
                            title: "Tinggi Badan",
                            subTitle: "",
                            width: 35.sp,
                            widget: FormWidget.textArea(
                                enabled: true,
                                maxLines: 1,
                                controller: _tbController
                                  ..text = state.vitalSignPerina.tb),
                          ),
                        ),
                        FB5Col(
                          classNames: 'col-6',
                          child: TitleWidget.boxVitalSign(
                            title: "HR",
                            subTitle: "",
                            width: 35.sp,
                            widget: FormWidget.textArea(
                                enabled: true,
                                maxLines: 1,
                                controller: _hrController
                                  ..text = state.vitalSignPerina.hr),
                          ),
                        ),
                        FB5Col(
                          classNames: 'col-6',
                          child: TitleWidget.boxVitalSign(
                            title: "RR",
                            subTitle: "",
                            width: 35.sp,
                            widget: FormWidget.textArea(
                                enabled: true,
                                maxLines: 1,
                                controller: _rrController
                                  ..text = state.vitalSignPerina.rr),
                          ),
                        ),
                        FB5Col(
                          classNames: 'col-6',
                          child: TitleWidget.boxVitalSign(
                            title: "Tekanan\nDarah",
                            subTitle: "",
                            width: 35.sp,
                            widget: FormWidget.textArea(
                                enabled: true,
                                maxLines: 1,
                                controller: _tdController
                                  ..text = state.vitalSignPerina.td),
                          ),
                        ),
                        FB5Col(
                          classNames: 'col-6',
                          child: TitleWidget.boxVitalSign(
                            title: "SPO2",
                            subTitle: "",
                            width: 35.sp,
                            widget: FormWidget.textArea(
                                enabled: true,
                                maxLines: 1,
                                controller: _spo2Controller
                                  ..text = state.vitalSignPerina.spo2),
                          ),
                        ),
                        FB5Col(
                          classNames: 'col-6',
                          child: TitleWidget.boxVitalSign(
                            title: "BB",
                            subTitle: "",
                            width: 35.sp,
                            widget: FormWidget.textArea(
                                enabled: true,
                                maxLines: 1,
                                controller: _bbController
                                  ..text = state.vitalSignPerina.bb),
                          ),
                        ),
                        FB5Col(
                          classNames: 'col-6',
                          child: TitleWidget.boxVitalSign(
                            title: "Lingkar Kepala",
                            subTitle: "",
                            width: 35.sp,
                            widget: FormWidget.textArea(
                                enabled: true,
                                maxLines: 1,
                                controller: _lingkarKepalaController
                                  ..text = state.vitalSignPerina.lingkarKepala),
                          ),
                        ),
                        FB5Col(
                          classNames: 'col-6',
                          child: TitleWidget.boxVitalSign(
                            title: "Lingkar Lengan",
                            subTitle: "",
                            width: 35.sp,
                            widget: FormWidget.textArea(
                                enabled: true,
                                maxLines: 1,
                                controller: _lingkarLenganController
                                  ..text = state.vitalSignPerina.lingkarLengan),
                          ),
                        ),
                        FB5Col(
                          classNames: 'col-6',
                          child: TitleWidget.boxVitalSign(
                            title: "Lingkar Dada",
                            subTitle: "",
                            width: 35.sp,
                            widget: FormWidget.textArea(
                                enabled: true,
                                maxLines: 1,
                                controller: _lingkarDadaController
                                  ..text = state.vitalSignPerina.lingkarDada),
                          ),
                        ),
                        FB5Col(
                          classNames: 'col-6',
                          child: TitleWidget.boxVitalSign(
                            title: "Lingkar Perut",
                            subTitle: "",
                            width: 35.sp,
                            widget: FormWidget.textArea(
                                enabled: true,
                                maxLines: 1,
                                controller: _lingkarPerutController
                                  ..text = state.vitalSignPerina.lingkarPerut),
                          ),
                        ),
                        FB5Col(
                          classNames: 'col-6',
                          child: TitleWidget.boxVitalSign(
                            title: "Warna Kulit",
                            subTitle: "",
                            width: 35.sp,
                            widget: FormWidget.textArea(
                                enabled: true,
                                maxLines: 1,
                                controller: _warnaKulitController
                                  ..text = state.vitalSignPerina.warnaKulit),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ));
      },
    );
  }

  Row formBoxGSC(
      {String? labelText,
      String? valueE,
      String? valueV,
      String? valueM,
      dynamic Function(String)? onChangedE,
      dynamic Function(String)? onChangedV,
      dynamic Function(String)? onChangedM,
      TextEditingController? controller}) {
    return Row(
      children: [
        Container(
          padding: EdgeInsets.only(right: 5.sp),
          child: Text(
            "E :",
            style: blackTextStyle.copyWith(fontSize: 6.sp),
          ),
        ),
        Container(
          padding: EdgeInsets.only(right: 5.sp),
          width: 30.sp,
          child: FormWidget.numberForm(
            onChanged: onChangedE,
            enable: true,
            value: valueE,
          ),
        ),
        Container(
            padding: EdgeInsets.only(right: 5.sp),
            child: Text(
              "V :",
              style: blackTextStyle.copyWith(fontSize: 6.sp),
            )),
        Container(
          padding: EdgeInsets.only(right: 5.sp),
          width: 30.sp,
          child: FormWidget.numberForm(
            onChanged: onChangedV,
            enable: true,
            value: valueV,
          ),
        ),
        Container(
          padding: EdgeInsets.only(right: 5.sp),
          child: Text(
            "M :",
            style: blackTextStyle.copyWith(fontSize: 6.sp),
          ),
        ),
        Container(
          padding: EdgeInsets.only(right: 5.sp),
          width: 30.sp,
          child: FormWidget.numberForm(
              onChanged: onChangedM, value: valueM, enable: true),
        ),
      ],
    );
  }
}
