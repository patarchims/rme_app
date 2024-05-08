import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:hms_app/domain/bloc/dashboard/pasien/pasien_bloc.dart';
import 'package:hms_app/domain/bloc/user/auth/auth_bloc.dart';
import 'package:hms_app/domain/models/devices_info/device_info_model.dart';
import 'package:hms_app/domain/models/meta/meta_model.dart';
import 'package:hms_app/presentation/component/component.dart';
import 'package:hms_app/presentation/component/loading/loading.dart';
import 'package:hms_app/presentation/kebidanan/bloc/diagnosa_kebidanan/diagnosa_kebidanan_bloc.dart';
import 'package:hms_app/presentation/pages/widget/header_content_widget.dart';
import 'package:sizer/sizer.dart';

class AddDiagnosaICD10KebidananWidget extends StatefulWidget {
  const AddDiagnosaICD10KebidananWidget({super.key});

  @override
  State<AddDiagnosaICD10KebidananWidget> createState() =>
      _AddDiagnosaICD10KebidananWidgetState();
}

class _AddDiagnosaICD10KebidananWidgetState
    extends State<AddDiagnosaICD10KebidananWidget> {
  final ScrollController _scrollController = ScrollController();

  late TextEditingController _cariController;
  String valueSearch = "";

  @override
  void initState() {
    _cariController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    // _scrollController.dispose();
    _scrollController.dispose();
    _cariController.clear();
    _cariController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    PasienState pasienState = context.watch<PasienBloc>().state;
    final singlePasien = pasienState.listPasienModel
        .where((element) => element.mrn == pasienState.normSelected);
    AuthState authState = context.watch<AuthBloc>().state;

    return Container(
        width: Get.width - 50.sp,
        height: Get.height - 60.sp,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadiusDirectional.circular(15.sp)),
        child: BlocConsumer<DiagnosaKebidananBloc, DiagnosaKebidananState>(
          listener: (context, state) {
            if (state.status == DiagnosaKebidananStatus.isloadingSaveData) {
              EasyLoading.show(maskType: EasyLoadingMaskType.black);
            }

            if (state.status != DiagnosaKebidananStatus.isloadingSaveData) {
              EasyLoading.dismiss();
            }

            state.saveResult.fold(
                () => null,
                (a) => a.fold(
                    (l) => l.maybeMap(orElse: () {}, failure: (value) {}),
                    (r) => r.maybeMap(
                        orElse: () {},
                        loaded: (value) async {
                          MetaModel meta =
                              MetaModel.fromJson(value.value["metadata"]);
                          context.read<DiagnosaKebidananBloc>().add(
                              OnGetDiagnosaKebidananEvent(
                                  noReg: singlePasien.first.noreg));

                          final shouldPop = await Alert.loaded(context,
                              subTitle: meta.message, title: "Pesan");

                          return shouldPop ?? false;
                        })));
          },
          builder: (context, state) {
            return HeaderContentWidget(
                isENableAdd: true,
                onPressed: () async {
                  dynamic data = await deviceInfo.initPlatformState();
                  // ADD RIWAYAT KEHAMILAN SAVE DATA
                  if (authState is Authenticated) {
                    // ignore: use_build_context_synchronously
                    context.read<DiagnosaKebidananBloc>().add(
                        OnSaveDiagnosaSelectedEvent(
                            noReg: singlePasien.first.noreg,
                            userID: authState.user.userId,
                            deviceID: "ID - ${data['id']} - ${data['device']}",
                            diagnosaList: state.diagnosaKebidanan));
                    Get.back();
                  }
                },
                widget: Stack(
                  children: [
                    Positioned.fill(
                        child: Container(
                      margin: EdgeInsets.only(top: 40.sp),
                      padding: EdgeInsets.symmetric(
                          horizontal: 12.sp, vertical: 5.sp),
                      decoration: const BoxDecoration(color: Colors.white),
                      child: BlocBuilder<DiagnosaKebidananBloc,
                          DiagnosaKebidananState>(
                        builder: (context, state) {
                          if (state.status == DiagnosaKebidananStatus.loading) {
                            return Loading.expandedLoading();
                          }

                          if (state.diagnosaKebidanan.isNotEmpty) {
                            return Scrollbar(
                              thumbVisibility: true,
                              interactive: true,
                              controller: _scrollController, // <
                              child: ListView(
                                controller: _scrollController,
                                children: (state.diagnosaKebidanan.isNotEmpty)
                                    ? state.diagnosaKebidanan
                                        .asMap()
                                        .entries
                                        .where((element) => element
                                            .value.namaDiagnosa
                                            .toLowerCase()
                                            .contains(valueSearch))
                                        .map((e) => Card(
                                              elevation: 1,
                                              color: ThemeColor.softBlue,
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.all(8.0),
                                                child: ListTile(
                                                  trailing: SizedBox(
                                                    height: 25.sp,
                                                    width: 25.sp,
                                                    child: IconButton(
                                                        onPressed: () {
                                                          context
                                                              .read<
                                                                  DiagnosaKebidananBloc>()
                                                              .add(OnSelectedDiagnosaKebidanan(
                                                                  indexDiagnosa:
                                                                      e.key,
                                                                  diagnosa: e
                                                                      .value
                                                                      .copyWith(
                                                                          isSelected: !e
                                                                              .value
                                                                              .isSelected)));
                                                        },
                                                        style: ElevatedButton.styleFrom(
                                                            backgroundColor: (e
                                                                    .value
                                                                    .isSelected)
                                                                ? ThemeColor
                                                                    .greenColor
                                                                : ThemeColor
                                                                    .primaryColor,
                                                            shape: RoundedRectangleBorder(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(2
                                                                            .sp))),
                                                        color: ThemeColor
                                                            .whiteColor,
                                                        icon:
                                                            (e.value.isSelected)
                                                                ? const Icon(
                                                                    FontAwesomeIcons
                                                                        .check,
                                                                    color: Colors
                                                                        .white,
                                                                  )
                                                                : const Icon(
                                                                    FontAwesomeIcons
                                                                        .xmark,
                                                                    color: Colors
                                                                        .white,
                                                                  )),
                                                  ),
                                                  enabled: true,
                                                  title: Text(
                                                    e.value.namaDiagnosa,
                                                    style:
                                                        blackTextStyle.copyWith(
                                                            fontWeight:
                                                                FontWeight
                                                                    .bold),
                                                  ),
                                                ),
                                              ),
                                            ))
                                        .toList()
                                    : [],
                              ),
                            );
                          }
                          return Container();
                        },
                      ),
                    )),
                    Align(
                      alignment: Alignment.topCenter,
                      child: Container(
                        width: Get.width,
                        height: 40.sp,
                        color: ThemeColor.lightGrey,
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: 25.sp, vertical: 5.sp),
                          child: Row(
                            children: [
                              // ======
                              Padding(
                                padding: EdgeInsets.only(right: 4.sp),
                                child: Text("Cari Diagnosa",
                                    style: blackTextStyle.copyWith(
                                        fontSize: 9.sp)),
                              ),

                              // ======
                              Expanded(
                                  child: FormWidget.textForm(
                                      enable: true,
                                      autoFocus: true,
                                      onChanged: (value) {
                                        setState(() {
                                          valueSearch = value;
                                        });
                                      },
                                      controller: _cariController)),

                              Container(
                                padding: EdgeInsets.all(3.sp),
                                width: 35.sp,
                                child: FloatingActionButton(
                                  backgroundColor: ThemeColor.primaryColor,
                                  shape: RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadius.circular(2.sp)),
                                  onPressed: () {},
                                  heroTag: "cari",
                                  child: const Icon(
                                    FontAwesomeIcons.magnifyingGlass,
                                    color: Colors.white,
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ));
          },
        ));
  }
}
