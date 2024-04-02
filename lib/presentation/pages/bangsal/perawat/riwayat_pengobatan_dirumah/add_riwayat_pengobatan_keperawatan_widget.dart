import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:get/get.dart';
import 'package:hms_app/domain/bloc/dashboard/pasien/pasien_bloc.dart';
import 'package:hms_app/domain/bloc/user/auth/auth_bloc.dart';
import 'package:hms_app/domain/models/devices_info/device_info_model.dart';
import 'package:hms_app/domain/models/meta/meta_model.dart';
import 'package:hms_app/presentation/component/component.dart';
import 'package:hms_app/presentation/component/res/colors.dart';
import 'package:hms_app/presentation/kebidanan/bloc/kebidanan/kebidanan_bloc.dart';
import 'package:intl/intl.dart';
import 'package:sizer/sizer.dart';

class AddRiwayatPengobatanKeperawatanWidget extends StatefulWidget {
  const AddRiwayatPengobatanKeperawatanWidget({super.key});

  @override
  State<AddRiwayatPengobatanKeperawatanWidget> createState() =>
      _AddRiwayatPengobatanWidgetState();
}

class _AddRiwayatPengobatanWidgetState
    extends State<AddRiwayatPengobatanKeperawatanWidget> {
  late TextEditingController _namaObatController;
  late TextEditingController _dosisController;
  late TextEditingController _caraPemberianController;
  late TextEditingController _frekuensiController;
  String waktu = "";

  @override
  void initState() {
    _namaObatController = TextEditingController();
    _dosisController = TextEditingController();
    _caraPemberianController = TextEditingController();
    _frekuensiController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _namaObatController.clear();
    _dosisController.clear();
    _caraPemberianController.clear();
    _frekuensiController.clear();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    PasienState pasienState = context.watch<PasienBloc>().state;
    final singlePasien = pasienState.listPasienModel
        .where((element) => element.mrn == pasienState.normSelected);

    AuthState authState = context.watch<AuthBloc>().state;

    return BlocConsumer<KebidananBloc, KebidananState>(
      listener: (context, state) {
        if (state.kebidananStatus == KebidananStatus.loading) {
          EasyLoading.show(maskType: EasyLoadingMaskType.black);
        }

        if (state.kebidananStatus != KebidananStatus.loading) {
          EasyLoading.dismiss();
        }

        state.saveResult.fold(
            () => null,
            (a) => a.fold(
                (l) => null,
                (r) => r.maybeMap(
                      orElse: () {},
                      loaded: (value) async {
                        // LOADED
                        context.read<KebidananBloc>().add(
                            OnGetRiwayatPengobatanDirumah(
                                noReg: singlePasien.first.noreg));
                        MetaModel meta =
                            MetaModel.fromJson(value.value["metadata"]);
                        final shouldPop = await Alert.loaded(context,
                            subTitle: meta.message, title: "Pesan");
                        return shouldPop ?? false;
                      },
                    )));
      },
      builder: (context, state) {
        return Container(
          height: Get.height - 50.sp,
          width: Get.width - 50.sp,
          decoration: const BoxDecoration(
            color: Colors.white,
          ),
          child: Scaffold(
            appBar: AppBar(
              automaticallyImplyLeading: false,
              backgroundColor: ThemeColor.primaryColor,
              title: Text(
                "Tambah Riwayat Pengobatan Dirumah",
                style: whiteTextStyle,
              ),
            ),
            floatingActionButton: SizedBox(
              width: 50.sp,
              child: FloatingActionButton(
                elevation: 0,
                backgroundColor: AppColors.accent.withOpacity(0.4),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(2.sp)),
                onPressed: () async {
                  // TEKAN
                  // LAKUKAN SIMPAN DATA
                  if (authState is Authenticated) {
                    dynamic data = await deviceInfo.initPlatformState();

                    // ignore: use_build_context_synchronously
                    context.read<KebidananBloc>().add(
                        OnSaveRiwayatPengobatanDirumah(
                            noReg: singlePasien.first.noreg,
                            deviceID: "ID - ${data['id']} - ${data['device']}}",
                            userID: authState.user.userId,
                            namaObat: _namaObatController.text,
                            dosis: _dosisController.text,
                            caraPemberian: _caraPemberianController.text,
                            frekuensi: _frekuensiController.text,
                            waktuPemberian: waktu));

                    Get.back();
                  }
                },
                heroTag: "btn2",
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Icon(
                      Icons.save,
                      color: Colors.white,
                    ),
                    Text(
                      "SIMPAN",
                      style: whiteTextStyle,
                    )
                  ],
                ),
              ),
            ),
            backgroundColor: ThemeColor.bgColor,
            body: SingleChildScrollView(
              child: Container(
                decoration: BoxDecoration(color: ThemeColor.bgColor),
                child: Column(
                  children: [
                    TitleWidget.titleContainer(title: "Nama Obat"),
                    Padding(
                      padding: EdgeInsets.all(5.sp),
                      child: FormWidget.textForm(
                        controller: _namaObatController,
                        enable: true,
                      ),
                    ),
                    TitleWidget.titleContainer(title: "Dosis"),
                    Padding(
                      padding: EdgeInsets.all(5.sp),
                      child: FormWidget.textForm(
                        controller: _dosisController,
                        enable: true,
                      ),
                    ),
                    TitleWidget.titleContainer(title: "Cara Pemberian"),
                    Padding(
                      padding: EdgeInsets.all(5.sp),
                      child: FormWidget.textForm(
                        controller: _caraPemberianController,
                        enable: true,
                      ),
                    ),
                    TitleWidget.titleContainer(title: "Frekuensi"),
                    Padding(
                      padding: EdgeInsets.all(5.sp),
                      child: FormWidget.textForm(
                        controller: _frekuensiController,
                        enable: true,
                      ),
                    ),
                    TitleWidget.titleContainer(
                        title: "Waktu Terakhir Pemberian"),
                    Container(
                      padding: EdgeInsets.all(5.sp),
                      color: Colors.white,
                      child: FormBuilderDateTimePicker(
                        format: DateFormat('dd/MM/yyyy'),
                        name: 'date',
                        inputType: InputType.date,
                        initialDate: DateTime.now(),
                        decoration: InputDecoration(
                          labelText: 'Waktu Terakhir Pemberian',
                          enabled: true,
                          fillColor: ThemeColor.bgColor,
                        ),
                        onChanged: (value) {
                          setState(() {
                            waktu = value.toString();
                          });
                        },
                        initialTime: const TimeOfDay(hour: 8, minute: 0),
                        initialValue: DateTime.now(),
                        enabled: true,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
