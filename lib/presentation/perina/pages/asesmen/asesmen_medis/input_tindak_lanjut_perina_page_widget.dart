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
import 'package:hms_app/presentation/perina/bloc/asesmen_bayi/asesmen_bayi_bloc.dart';
import 'package:sizer/sizer.dart';

class InputTindakLanjuPerinaPage extends StatefulWidget {
  const InputTindakLanjuPerinaPage({super.key});

  @override
  State<InputTindakLanjuPerinaPage> createState() =>
      _InputTindakLanjuPerinaPageState();
}

class _InputTindakLanjuPerinaPageState
    extends State<InputTindakLanjuPerinaPage> {
  late TextEditingController _tindakanOperasiController;
  late TextEditingController _tindakanLanjutController;
  late TextEditingController _kontrolUlangController;
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    _tindakanOperasiController = TextEditingController();
    _tindakanLanjutController = TextEditingController();
    _kontrolUlangController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _tindakanOperasiController.clear();
    _tindakanLanjutController.clear();
    _kontrolUlangController.clear();

    _tindakanOperasiController.dispose();
    _tindakanLanjutController.dispose();
    _kontrolUlangController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    PasienState pasienState = context.watch<PasienBloc>().state;
    final singlePasien = pasienState.listPasienModel
        .where((element) => element.mrn == pasienState.normSelected);

    AuthState authState = context.watch<AuthBloc>().state;

    return BlocConsumer<AsesmenBayiBloc, AsesmenBayiState>(
      listener: (context, state) {
        if (state.status == AsesmenBayiStatus.isLoadingSave) {
          EasyLoading.show();
        }

        if (state.status != AsesmenBayiStatus.isLoadingSave) {
          EasyLoading.dismiss();
        }

        state.saveTindakLajutResult.fold(
            () => null,
            (a) => a.fold(
                (l) => l.maybeMap(
                    orElse: () {},
                    failure: (e) async {
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
        if (state.status == AsesmenBayiStatus.loading) {
          return HeaderContentWidget(
            widget: Loading.expandedLoading(),
          );
        }
        return HeaderContentWidget(
            isENableAdd: true,
            title: "SIMPAN",
            backgroundColor: ThemeColor.bgColor,
            onPressed: () async {
              if (authState is Authenticated) {
                dynamic data = await deviceInfo.initPlatformState();

                // ignore: use_build_context_synchronously
                context.read<AsesmenBayiBloc>().add(OnSaveTindakLanjutEvent(
                    noRM: singlePasien.first.mrn,
                    noReg: singlePasien.first.noreg,
                    pelayanan:
                        toPelayanan(poliklinik: authState.user.poliklinik),
                    devicesID: "ID - ${data['id']} - ${data['device']}",
                    person: toPerson(person: authState.user.person),
                    tindakLajut: state.tindakLajut.copyWith(
                        kontrolUlang: _kontrolUlangController.text,
                        tindakLajut: _tindakanLanjutController.text,
                        tindakanOperas: _tindakanOperasiController.text)));
              }
            },
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
                child: Container(
                  padding: EdgeInsets.only(right: 10.sp),
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
                                    widget: FormWidget.textArea(
                                        controller: _tindakanOperasiController
                                          ..text =
                                              state.tindakLajut.tindakanOperas,
                                        enabled: true,
                                        maxLines: 10),
                                    title: "Tindakan Operasi",
                                  ),
                                ],
                              )),
                          FB5Col(
                              classNames: 'col-12',
                              child: Column(
                                children: [
                                  TitleWidget.boxPemeriksaanFisikSugestion(
                                    width: 35.sp,
                                    widget: FormWidget.textArea(
                                        controller: _tindakanLanjutController
                                          ..text =
                                              state.tindakLajut.tindakLajut,
                                        enabled: true,
                                        maxLines: 10),
                                    title: "Tindakan Lanjut",
                                  ),
                                ],
                              )),
                          FB5Col(
                              classNames: 'col-12',
                              child: Column(
                                children: [
                                  TitleWidget.boxPemeriksaanFisikSugestion(
                                    width: 35.sp,
                                    widget: FormWidget.textArea(
                                        controller: _kontrolUlangController
                                          ..text =
                                              state.tindakLajut.kontrolUlang,
                                        enabled: true,
                                        maxLines: 2),
                                    title: "Kontrol Ulang Tanggal",
                                  ),
                                ],
                              )),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ));
      },
    );
  }
}
