import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:get/get.dart';
import 'package:hms_app/domain/bloc/dashboard/pasien/pasien_bloc.dart';
import 'package:hms_app/domain/bloc/user/auth/auth_bloc.dart';
import 'package:hms_app/domain/models/devices_info/device_info_model.dart';
import 'package:hms_app/domain/models/meta/meta_model.dart';
import 'package:hms_app/domain/models/users/user_model.dart';
import 'package:hms_app/presentation/component/component.dart';
import 'package:hms_app/presentation/component/res/colors.dart';
import 'package:hms_app/presentation/kebidanan/bloc/kebidanan/kebidanan_bloc.dart';
import 'package:intl/intl.dart';
import 'package:sizer/sizer.dart';

class AddRiwayatKehamilanWidget extends StatefulWidget {
  const AddRiwayatKehamilanWidget({super.key});

  @override
  State<AddRiwayatKehamilanWidget> createState() =>
      _AddRiwayatKehamilanWidgetState();
}

class _AddRiwayatKehamilanWidgetState extends State<AddRiwayatKehamilanWidget> {
  String jenisKelaminValue = "";
  String tahunValue = "";
  late TextEditingController _tempatPersalinan;
  late TextEditingController _umurKehamilan;
  late TextEditingController _jenisPersalinan;
  late TextEditingController _penolong;
  late TextEditingController _nifas;
  late TextEditingController _beratBadan;
  late TextEditingController _keadaanSekarang;
  late TextEditingController _penyulit;

  @override
  void initState() {
    jenisKelaminValue = jenisKelamin.first;
    tahunValue = DateTime.now().year.toString();
    _tempatPersalinan = TextEditingController();
    _umurKehamilan = TextEditingController();
    _jenisPersalinan = TextEditingController();
    _penolong = TextEditingController();
    _nifas = TextEditingController();
    _beratBadan = TextEditingController();
    _keadaanSekarang = TextEditingController();
    _penyulit = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _tempatPersalinan.dispose();
    _umurKehamilan.dispose();
    _jenisPersalinan.dispose();
    _penolong.dispose();
    _nifas.dispose();
    _beratBadan.dispose();
    _keadaanSekarang.dispose();
    _penyulit.dispose();
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
        if (state.kebidananStatus ==
            KebidananStatus.isLoadingRiwayatKebidanan) {
          EasyLoading.show(maskType: EasyLoadingMaskType.black);
        }
        if (state.kebidananStatus !=
            KebidananStatus.isLoadingRiwayatKebidanan) {
          EasyLoading.dismiss();
        }

        state.saveRiwayatKebidananResult.fold(
            () => null,
            (a) => a.fold(
                (l) => null,
                (r) => r.maybeMap(
                    orElse: () {},
                    loaded: (value) async {
                      MetaModel meta =
                          MetaModel.fromJson(value.value["metadata"]);

                      final shouldPop = await Alert.loaded(context,
                          subTitle: meta.message, title: "Pesan");

                      return shouldPop ?? false;
                    })));
      },
      builder: (context, state) {
        return Container(
          width: Get.width - 50.sp,
          height: Get.height - 50.sp,
          decoration: const BoxDecoration(
            color: Colors.white,
          ),
          child: Scaffold(
            appBar: AppBar(
              automaticallyImplyLeading: false,
              backgroundColor: ThemeColor.primaryColor,
              title: Text(
                "Tambah Data Riwayat Kehamilan",
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
                  // TEKAN SIMPAN DATA

                  if (authState is Authenticated) {
                    dynamic data = await deviceInfo.initPlatformState();

                    // ignore: use_build_context_synchronously
                    context.read<KebidananBloc>().add(
                        OnSaveRiwayatKehamilanBidan(
                            pelayanan: toPelayanan(
                                poliklinik: authState.user.poliklinik),
                            deviceID: "ID-${data['id']}-${data['device']}",
                            tahun: tahunValue,
                            tempat: _tempatPersalinan.text,
                            noReg: singlePasien.first.noreg,
                            umur: _umurKehamilan.text,
                            jenisPersalinan: _jenisPersalinan.text,
                            penolong: _penolong.text,
                            penyulit: _penyulit.text,
                            nifas: _nifas.text,
                            jenisKelamin: jenisKelaminValue,
                            beratBadan: _beratBadan.text,
                            keadaanSekarang: _keadaanSekarang.text));

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
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      width: Get.width / 2.3,
                      decoration:
                          BoxDecoration(color: ThemeColor.transparentColor),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          TitleWidget.headerTitle(title: "Tahun Persalinan"),
                          Container(
                            padding: EdgeInsets.all(5.sp),
                            color: Colors.white,
                            child: FormBuilderDateTimePicker(
                              format: DateFormat('yyyy'),
                              name: 'date',
                              inputType: InputType.date,
                              initialDate: DateTime.now(),
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                labelText: 'Tahun Persalinan',
                                enabled: true,
                                fillColor: ThemeColor.bgColor,
                              ),
                              onChanged: (value) {
                                setState(() {
                                  tahunValue = value.toString();
                                });
                              },
                              initialTime: const TimeOfDay(hour: 8, minute: 0),
                              initialValue: DateTime.now(),
                              enabled: true,
                            ),
                          ),
                          TitleWidget.headerTitle(
                            title: "Tempat Bersalin",
                          ),
                          FormWidget.textArea(
                              enabled: true,
                              maxLines: 3,
                              controller: _tempatPersalinan),
                          TitleWidget.headerTitle(title: "Umur Kehamilan"),
                          FormWidget.numberForm(
                              enable: true, controller: _umurKehamilan),
                          TitleWidget.headerTitle(title: "Jenis Persalinan"),
                          FormWidget.textForm(
                              enable: true, controller: _jenisPersalinan),
                          TitleWidget.headerTitle(
                            title: "Penolong",
                          ),
                          FormWidget.textForm(
                              enable: true, controller: _penolong),
                        ],
                      ),
                    ),
                    Container(
                      width: Get.width / 2.3,
                      decoration:
                          BoxDecoration(color: ThemeColor.transparentColor),
                      child: Column(
                        children: [
                          TitleWidget.headerTitle(title: "Penyulit"),
                          FormWidget.textForm(
                              enable: true, controller: _penyulit),
                          TitleWidget.headerTitle(title: "Nifas"),
                          FormWidget.numberForm(
                              enable: true, controller: _nifas),
                          TitleWidget.headerTitle(title: "Jenis Kelamin"),
                          Container(
                            padding: EdgeInsets.all(5.sp),
                            color: Colors.white,
                            child: FormBuilderDropdown(
                              key: UniqueKey(),
                              initialValue: jenisKelaminValue == ""
                                  ? jenisKelamin.first
                                  : jenisKelaminValue,
                              style: blackTextStyle,
                              decoration: InputDecoration(
                                  suffix: IconButton(
                                    icon: const Icon(Icons.close),
                                    onPressed: () {
                                      // _formKey.currentState!.fields['gender']
                                      //     ?.reset();
                                    },
                                  ),
                                  hintText: 'Pilih Jenis Kelamin',
                                  hintStyle: blackTextStyle),
                              items: jenisKelamin
                                  .map((gender) => DropdownMenuItem(
                                        alignment: AlignmentDirectional.center,
                                        value: gender,
                                        child: Text(gender),
                                      ))
                                  .toList(),
                              name: 'jeniskelamin',
                              onChanged: (value) {
                                setState(() {
                                  jenisKelaminValue = value.toString();
                                });
                              },
                              enabled: true,
                            ),
                          ),
                          TitleWidget.headerTitle(
                            title: "Berat Badan",
                          ),
                          FormWidget.numberForm(
                              enable: true, controller: _beratBadan),
                          TitleWidget.headerTitle(title: "Keadaan Sekarang"),
                          FormWidget.textForm(
                              enable: true, controller: _keadaanSekarang),
                        ],
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

List<String> jenisKelamin = ["Laki-laki", "Perempuan"];
