import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:hms_app/domain/bloc/dashboard/asesmen_igd/asesmen_igd_bloc.dart';
import 'package:hms_app/domain/bloc/dashboard/pasien/pasien_bloc.dart';
import 'package:hms_app/domain/bloc/user/auth/auth_bloc.dart';
import 'package:hms_app/domain/models/devices_info/device_info_model.dart';
import 'package:hms_app/domain/models/meta/meta_model.dart';
import 'package:hms_app/domain/models/users/user_model.dart';
import 'package:hms_app/presentation/component/component.dart';
import 'package:hms_app/presentation/component/loading/loading.dart';
import 'package:hms_app/presentation/pages/widget/header_content_widget.dart';
import 'package:sizer/sizer.dart';

class PrognosisContentAnakWidget extends StatelessWidget {
  const PrognosisContentAnakWidget({super.key});

  @override
  Widget build(BuildContext context) {
    AuthState authState = context.watch<AuthBloc>().state;
    PasienState pasienState = context.watch<PasienBloc>().state;
    final singlePasien = pasienState.listPasienModel
        .where((element) => element.mrn == pasienState.normSelected);

    return BlocConsumer<AsesmenIgdBloc, AsesmenIgdState>(
      listener: (context, state) {
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
        return (state.isLoadingGetRencanaTindakLanjut)
            ? Loading.expandedLoading()
            : HeaderContentWidget(
                isENableAdd: true,
                onPressed: () async {
                  dynamic data = await deviceInfo.initPlatformState();

                  if (authState is Authenticated) {
                    // ignore: use_build_context_synchronously
                    context.read<AsesmenIgdBloc>().add(
                        AsesmenIgdEvent.saveRencanaTindakLanjut(
                            prognosis: state.prognosisStr,
                            alasanKonsul: state.alasanKonsulStr,
                            pelayanan: toPelayanan(
                                poliklinik: authState.user.poliklinik),
                            person: toPerson(person: authState.user.person),
                            userID: authState.user.userId,
                            deviceID: "ID - ${data['id']} - ${data['device']}}",
                            noreg: singlePasien.first.noreg,
                            anjuran: state.asuhanTerapiStr,
                            alasanOpname: state.alasanObnameStr,
                            konsulKe: state.dokterSpesialisSelected));
                  }
                },
                title: "Simpan",
                widget: SingleChildScrollView(
                  child: Card(
                    color: ThemeColor.bgColor,
                    shape: RoundedRectangleBorder(
                        side: BorderSide(
                            width: 1.sp, color: ThemeColor.blackColor),
                        borderRadius: BorderRadius.circular(2.sp)),
                    child: Column(
                      children: [
                        TitleWidget.titleContainer(title: "Prognosis"),
                        Padding(
                          padding: EdgeInsets.all(5.sp),
                          child: FormWidget.textArea(
                              maxLines: 15,
                              value: state.prognosisStr,
                              enabled: true,
                              onChanged: (value) {
                                context.read<AsesmenIgdBloc>().add(
                                    AsesmenIgdEvent.prognosisOnchanged(
                                        value: value));
                              }),
                        )
                      ],
                    ),
                  ),
                ),
              );
      },
    );
  }
}
