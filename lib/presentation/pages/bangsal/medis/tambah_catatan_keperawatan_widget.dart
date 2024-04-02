import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:hms_app/domain/bloc/dashboard/pasien/pasien_bloc.dart';
import 'package:hms_app/domain/models/meta/meta_model.dart';
import 'package:hms_app/presentation/component/component.dart';
import 'package:hms_app/presentation/pages/bangsal/bloc/cppt_sbar_bangsal/cppt_sbar_bangsal_bloc.dart';
import 'package:sizer/sizer.dart';

class TambahCatatanKeperawatanWidget extends StatefulWidget {
  const TambahCatatanKeperawatanWidget({super.key});

  @override
  State<TambahCatatanKeperawatanWidget> createState() =>
      TambahCatatanKeperawatanWidgetState();
}

class TambahCatatanKeperawatanWidgetState
    extends State<TambahCatatanKeperawatanWidget> {
  late TextEditingController _tambahCatatanKeperawatan;

  @override
  void initState() {
    _tambahCatatanKeperawatan = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _tambahCatatanKeperawatan.clear();
    _tambahCatatanKeperawatan.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // AuthState authState = context.watch<AuthBloc>().state;
    PasienState pasienState = context.watch<PasienBloc>().state;
    final singlePasien = pasienState.listPasienModel
        .where((element) => element.mrn == pasienState.normSelected);

    return BlocConsumer<CpptSbarBangsalBloc, CpptSbarBangsalState>(
      listener: (context, state) {
        // === //
        if (state.status == CPPTSbarBangsalStatus.isLoadingSave) {
          EasyLoading.show(maskType: EasyLoadingMaskType.black);
        }
        if (state.status != CPPTSbarBangsalStatus.isLoadingSave) {
          EasyLoading.dismiss();
        }

        state.saveResultCatatan.fold(
            () => null,
            (a) => a.fold(
                (l) => l.maybeMap(
                    orElse: () {},
                    failure: (e) async {
                      log("ERROR FAILURE $e");
                      // TAMPILKAN PESAN KESALAHAN
                      final shouldPop = await Alert.warningMessage(context,
                          subTitle: e.meta.message.toString());
                      return shouldPop ?? false;
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
        return SizedBox(
            height: Get.height / 2.5,
            width: Get.width / 1.5,
            child: Scaffold(
              backgroundColor: ThemeColor.bgColor,
              appBar: AppBar(
                automaticallyImplyLeading: false,
                backgroundColor: ThemeColor.primaryColor,
                title: Text(
                  "Tambah Catatan Keperawatan",
                  style: whiteTextStyle,
                ),
              ),
              body: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    FormWidget.textArea(
                      maxLines: 8,
                      controller: _tambahCatatanKeperawatan,
                      enabled: true,
                    ),
                    Expanded(
                        child: Container(
                      width: Get.width,
                      color: ThemeColor.bgColor,
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              backgroundColor: ThemeColor.primaryColor,
                              elevation: 1,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(3.sp))),
                          onPressed: () {
                            // SIMPAN DATA
                            context.read<CpptSbarBangsalBloc>().add(
                                OnSaveCatatanEvent(
                                    noReg: singlePasien.first.noreg,
                                    catatan: _tambahCatatanKeperawatan.text));

                            Get.back();
                          },
                          child: Text(
                            "Simpan",
                            style: whiteTextStyle,
                          )),
                    ))
                  ],
                ),
              ),
            ));
      },
    );
  }
}
