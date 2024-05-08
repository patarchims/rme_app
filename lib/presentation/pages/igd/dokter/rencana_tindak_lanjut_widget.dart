import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:hms_app/domain/bloc/dashboard/pasien/pasien_bloc.dart';
import 'package:hms_app/domain/bloc/user/auth/auth_bloc.dart';
import 'package:hms_app/domain/models/devices_info/device_info_model.dart';
import 'package:hms_app/domain/models/meta/meta_model.dart';
import 'package:hms_app/domain/models/users/user_model.dart';
import 'package:hms_app/presentation/component/component.dart';
import 'package:hms_app/presentation/component/loading/loading.dart';
import 'package:hms_app/presentation/pages/igd/dokter/cari_dokter_widget.dart';
import 'package:hms_app/presentation/pages/widget/header_content_widget.dart';
import 'package:sizer/sizer.dart';
import 'package:anydrawer/anydrawer.dart';

import '../../../../domain/bloc/dashboard/asesmen_igd/asesmen_igd_bloc.dart';

class RencanaTindakLanjutIGDWiget extends StatefulWidget {
  const RencanaTindakLanjutIGDWiget({super.key});

  @override
  State<RencanaTindakLanjutIGDWiget> createState() =>
      _RencanaTindakLanjutIGDWigetState();
}

class _RencanaTindakLanjutIGDWigetState
    extends State<RencanaTindakLanjutIGDWiget> {
  final _keyForm = GlobalKey<FormState>();
  late TextEditingController _cariController;
  final ScrollController _scrollController = ScrollController();

  DrawerConfig config = const DrawerConfig();

  final AnyDrawerController controller = AnyDrawerController();

  @override
  void dispose() {
    _cariController.clear();
    _cariController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    _cariController = TextEditingController();
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    AuthState authState = context.watch<AuthBloc>().state;
    return BlocConsumer<AsesmenIgdBloc, AsesmenIgdState>(
      listener: (context, state) {
        // ===============

        if (state.isLoadingSaveRencanaTindakLanjut) {
          EasyLoading.show();
        }

        if (!state.isLoadingSaveRencanaTindakLanjut) {
          EasyLoading.dismiss();
        }

        // LAKUKAN SIMPAN DATA
        state.saveRencanaTindakLanjut.fold(
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
                      if (e.meta.code == 202) {
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
        PasienState pasienState = context.watch<PasienBloc>().state;
        final singlePasien = pasienState.listPasienModel
            .where((element) => element.mrn == pasienState.normSelected);

        if (state.isLoadingGetTindakLanjut) {
          return HeaderContentWidget(
              isENableAdd: true,
              onPressed: () {},
              title: "Simpan",
              widget: Loading.expandedLoading());
        }

        return HeaderContentWidget(
            onPressed: () async {
              // LAKUKAN SAVE DATA
              dynamic data = await deviceInfo.initPlatformState();

              if (authState is Authenticated) {
                // ignore: use_build_context_synchronously
                context.read<AsesmenIgdBloc>().add(
                    AsesmenIgdEvent.saveRencanaTindakLanjut(
                        prognosis: state.prognosisStr,
                        alasanKonsul: state.alasanKonsulStr,
                        pelayanan:
                            toPelayanan(poliklinik: authState.user.poliklinik),
                        person: toPerson(person: authState.user.person),
                        userID: authState.user.userId,
                        deviceID: "ID-${data['id']}-${data['device']}",
                        noreg: singlePasien.first.noreg,
                        anjuran: state.asuhanTerapiStr,
                        alasanOpname: state.alasanObnameStr,
                        konsulKe: state.dokterSpesialisSelected));
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
                child: SizedBox(
                  width: Get.width,
                  child: Card(
                    color: ThemeColor.bgColor,
                    shape: RoundedRectangleBorder(
                        side: BorderSide(
                          width: 1.sp,
                          color: ThemeColor.blackColor,
                        ),
                        borderRadius: BorderRadius.circular(2.sp)),
                    child: Form(
                      key: _keyForm,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          titleContainer(
                              title:
                                  "Planning : Penatalaksanaan / Pengobatan / Rencana Tindakan / Konsultasi"),
                          Container(
                            padding: EdgeInsets.all(2.sp),
                            width: Get.width,
                            child: FormWidget.textArea(
                              enabled: true,
                              maxLines: 5,
                              value: state.asuhanTerapiStr,
                              validator: (value) {
                                return value == ''
                                    ? "Rencana tidak boleh kosong"
                                    : null;
                              },
                              hinText: "Rencana Asuhan & Terapi",
                              onChanged: (value) {
                                context.read<AsesmenIgdBloc>().add(
                                    AsesmenIgdEvent.asuhanTerapiOnchanged(
                                        value: value));
                              },
                            ),
                          ),
                          titleContainer(title: "Prognosa"),
                          Container(
                            padding: EdgeInsets.all(2.sp),
                            width: Get.width,
                            child: Wrap(
                              runSpacing: 2,
                              alignment: WrapAlignment.spaceAround,
                              crossAxisAlignment: WrapCrossAlignment.center,
                              children: prognosa
                                  .map((e) => Container(
                                        height: 20.sp,
                                        width: 80.sp,
                                        margin: EdgeInsets.only(right: 5.sp),
                                        child: ElevatedButton(
                                            style: ElevatedButton.styleFrom(
                                                shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            2.sp)),
                                                backgroundColor:
                                                    (state.prognosisStr == e)
                                                        ? ThemeColor.greenColor
                                                        : ThemeColor
                                                            .primaryColor),
                                            onPressed: () {
                                              context
                                                  .read<AsesmenIgdBloc>()
                                                  .add(AsesmenIgdEvent
                                                      .prognosisOnchanged(
                                                          value: e));
                                            },
                                            child: Text(
                                              e,
                                              style: whiteTextStyle,
                                            )),
                                      ))
                                  .toList(),
                            ),
                          ),
                          SizedBox(
                            height: 15.sp,
                          ),
                          titleContainer(title: "Konsul Ke"),
                          SizedBox(
                            width: Get.width,
                            child: FormWidget.textForm(
                              enable: false,
                              value: state.dokterSpesialisSelected,
                              labelText: state.dokterSpesialisSelected,
                            ),
                          ),
                          Container(
                              width: Get.width,
                              height: 25.sp,
                              padding: EdgeInsets.all(2.sp),
                              child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                      backgroundColor: ThemeColor.blueColor,
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(4.sp))),
                                  onPressed: () {
                                    // TAMPILKAN MODAL DOKTER
                                    context.read<AsesmenIgdBloc>().add(
                                        const AsesmenIgdEvent
                                            .getDokterSpesialis());

                                    CustomDialogWidget.getDialog(
                                        widget: Container(
                                          height: 200.sp,
                                          width: 400.sp,
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(6.sp),
                                              color: Colors.white),
                                          child:
                                              const CariDokterSpesialisWidget(),
                                        ),
                                        color: Colors.transparent);
                                  },
                                  child: Icon(
                                    FontAwesomeIcons.userDoctor,
                                    color: Colors.white,
                                    size: 15.sp,
                                  ))),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ));
      },
    );
  }

  Container titleContainer({required String title}) {
    return Container(
      width: Get.width,
      height: 20.sp,
      decoration: BoxDecoration(
        color: ThemeColor.blueColor.withOpacity(0.5),
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(2.sp), topRight: Radius.circular(2.sp)),
      ),
      child: Center(
        child: Text(
          title,
          style: blackTextStyle.copyWith(
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}

List<String> penMed = ["LABORATORIUM", "RADIOLOGI", "FISIOTERAPI", "GIZI"];

List<String> prognosa = [
  "Baik",
  "Dubia et Bonam",
  "Dubia et Malam",
  "Tidak Baik"
];
