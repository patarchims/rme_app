import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:hms_app/domain/bloc/dashboard/pasien/pasien_bloc.dart';
import 'package:hms_app/domain/bloc/user/auth/auth_bloc.dart';
import 'package:hms_app/domain/models/devices_info/device_info_model.dart';
import 'package:hms_app/domain/models/users/user_model.dart';
import 'package:sizer/sizer.dart';
import 'package:hms_app/presentation/component/color/color_helper.dart';
import 'package:hms_app/presentation/component/fonts/font_helper.dart';
import 'package:hms_app/presentation/component/form/form_textfield_widget.dart';
import '../../../../../domain/bloc/asesmen/input_diagnosa/input_diagnosa_bloc.dart';

class DiagnosaICDSearchWidget extends StatefulWidget {
  final int indexInput;
  const DiagnosaICDSearchWidget({
    super.key,
    required this.indexInput,
  });

  @override
  State<DiagnosaICDSearchWidget> createState() =>
      _DiagnosaICDSearchWidgetState();
}

class _DiagnosaICDSearchWidgetState extends State<DiagnosaICDSearchWidget> {
  late TextEditingController _searchController;
  String valueSearch = "";

  @override
  void initState() {
    _searchController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _searchController.clear();
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    PasienState pasienState = context.watch<PasienBloc>().state;
    AuthState authState = context.watch<AuthBloc>().state;

    final singlePasien = pasienState.listPasienModel
        .where((element) => element.mrn == pasienState.normSelected);

    return BlocBuilder<InputDiagnosaBloc, InputDiagnosaState>(
      builder: (context, state) {
        return Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  child: SizedBox(
                    height: 25.sp,
                    child: FormWidget.textForm(
                        controller: _searchController,
                        enable: true,
                        onChanged: (val) {
                          setState(() {
                            valueSearch = val;
                          });
                        }),
                  ),
                ),
                SizedBox(
                  width: 5.sp,
                ),
              ],
            ),
            SizedBox(
              height: 6.sp,
            ),
            BlocConsumer<InputDiagnosaBloc, InputDiagnosaState>(
              listener: (context, state) {},
              builder: (context, state) {
                return Expanded(
                    child: SizedBox(
                  child: ListView(
                    children: (state.diagnosaICD.isNotEmpty)
                        ? state.diagnosaICD
                            .where(
                              (element) =>
                                  element.code
                                      .toLowerCase()
                                      .contains(valueSearch.toLowerCase()) ||
                                  element.code2
                                      .toLowerCase()
                                      .contains(valueSearch.toLowerCase()) ||
                                  element.description
                                      .toLowerCase()
                                      .contains(valueSearch.toLowerCase()),
                            )
                            .map((e) => Card(
                                  elevation: 0,
                                  color: ThemeColor.bgColor,
                                  child: ListTile(
                                    onTap: () async {
                                      if (state.diagnosa.isEmpty) {
                                        dynamic data = await deviceInfo
                                            .initPlatformState();
                                        // SIMPAN DATA PRIMARI
                                        // TODO: PENAMBAHAN USER DEVICES

                                        if (authState is Authenticated) {
                                          if (authState.user.person ==
                                              Person.dokter) {
                                            // ignore: use_build_context_synchronously
                                            context.read<InputDiagnosaBloc>().add(
                                                InputDiagnosaEvent.saveDiagnosa(
                                                    deviceID:
                                                        "ID - ${data['id']} - ${data['device']}}",
                                                    pelayanan: toPelayanan(
                                                        poliklinik: authState
                                                            .user.poliklinik),
                                                    person: toPerson(
                                                        person: authState
                                                            .user.person),
                                                    userID:
                                                        authState.user.userId,
                                                    noreg: singlePasien
                                                        .first.noreg,
                                                    code: e.code2,
                                                    type: "primer",
                                                    table: "P"));
                                          }
                                          if (authState.user.person ==
                                                  Person.nonDokter ||
                                              authState.user.person ==
                                                  Person.perawat) {
                                            // ignore: use_build_context_synchronously
                                            context.read<InputDiagnosaBloc>().add(
                                                InputDiagnosaEvent.saveDiagnosa(
                                                    deviceID:
                                                        "ID - ${data['id']} - ${data['device']}}",
                                                    pelayanan: toPelayanan(
                                                        poliklinik: authState
                                                            .user.poliklinik),
                                                    person: toPerson(
                                                        person: authState
                                                            .user.person),
                                                    userID:
                                                        authState.user.userId,
                                                    noreg: singlePasien
                                                        .first.noreg,
                                                    code: e.code2,
                                                    type: "primer",
                                                    table: "P"));
                                          }
                                        }
                                      }

                                      if (state.diagnosa.isNotEmpty) {
                                        // SIMPAN
                                        var data = state.diagnosa.where(
                                            (element) =>
                                                element.type == "primer");

                                        int lengData = state.diagnosa.length;

                                        if (data.isNotEmpty) {
                                          dynamic data = await deviceInfo
                                              .initPlatformState();

                                          if (authState is Authenticated) {
                                            if (authState.user.person ==
                                                Person.dokter) {
                                              // ignore: use_build_context_synchronously
                                              context.read<InputDiagnosaBloc>().add(
                                                  InputDiagnosaEvent.saveDiagnosa(
                                                      deviceID:
                                                          "ID - ${data['id']} - ${data['device']}}",
                                                      pelayanan: toPelayanan(
                                                          poliklinik: authState
                                                              .user.poliklinik),
                                                      person: toPerson(
                                                          person: authState
                                                              .user.person),
                                                      userID:
                                                          authState.user.userId,
                                                      noreg: singlePasien
                                                          .first.noreg,
                                                      code: e.code2,
                                                      type: "sekunder",
                                                      table: "S$lengData"));
                                            }

                                            if (authState.user.person ==
                                                Person.nonDokter) {
                                              // ignore: use_build_context_synchronously
                                              context.read<InputDiagnosaBloc>().add(
                                                  InputDiagnosaEvent.saveDiagnosa(
                                                      deviceID:
                                                          "ID - ${data['id']} - ${data['device']}}",
                                                      pelayanan: toPelayanan(
                                                          poliklinik: authState
                                                              .user.poliklinik),
                                                      person: toPerson(
                                                          person: authState
                                                              .user.person),
                                                      userID:
                                                          authState.user.userId,
                                                      noreg: singlePasien
                                                          .first.noreg,
                                                      code: e.code2,
                                                      type: "sekunder",
                                                      table: "S$lengData"));
                                            }
                                          }
                                          // SIMPAN DATA
                                        }
                                      }

                                      Get.back();
                                    },
                                    title: Text(
                                      e.description,
                                      style: blackTextStyle.copyWith(
                                          fontWeight: FontWeight.bold),
                                    ),
                                    subtitle: Text(
                                      e.code2,
                                      style: blackTextStyle,
                                    ),
                                    trailing: IconButton(
                                        onPressed: () async {
                                          if (state.diagnosa.isEmpty) {
                                            dynamic data = await deviceInfo
                                                .initPlatformState();
                                            // SIMPAN DATA PRIMARI
                                            // TODO: PENAMBAHAN USER DEVICES

                                            if (authState is Authenticated) {
                                              if (authState.user.person ==
                                                  Person.dokter) {
                                                // ignore: use_build_context_synchronously
                                                context
                                                    .read<InputDiagnosaBloc>()
                                                    .add(InputDiagnosaEvent.saveDiagnosa(
                                                        deviceID:
                                                            "ID - ${data['id']} - ${data['device']}}",
                                                        pelayanan: toPelayanan(
                                                            poliklinik: authState
                                                                .user
                                                                .poliklinik),
                                                        person: toPerson(
                                                            person: authState
                                                                .user.person),
                                                        userID: authState
                                                            .user.userId,
                                                        noreg: singlePasien
                                                            .first.noreg,
                                                        code: e.code2,
                                                        type: "primer",
                                                        table: "P"));
                                              }
                                              if (authState.user.person ==
                                                      Person.nonDokter ||
                                                  authState.user.person ==
                                                      Person.perawat) {
                                                // ignore: use_build_context_synchronously
                                                context
                                                    .read<InputDiagnosaBloc>()
                                                    .add(InputDiagnosaEvent.saveDiagnosa(
                                                        deviceID:
                                                            "ID - ${data['id']} - ${data['device']}}",
                                                        pelayanan: toPelayanan(
                                                            poliklinik: authState
                                                                .user
                                                                .poliklinik),
                                                        person: toPerson(
                                                            person: authState
                                                                .user.person),
                                                        userID: authState
                                                            .user.userId,
                                                        noreg: singlePasien
                                                            .first.noreg,
                                                        code: e.code2,
                                                        type: "primer",
                                                        table: "P"));
                                              }
                                            }
                                          }

                                          if (state.diagnosa.isNotEmpty) {
                                            // SIMPAN
                                            var data = state.diagnosa.where(
                                                (element) =>
                                                    element.type == "primer");

                                            int lengData =
                                                state.diagnosa.length;

                                            if (data.isNotEmpty) {
                                              dynamic data = await deviceInfo
                                                  .initPlatformState();

                                              if (authState is Authenticated) {
                                                if (authState.user.person ==
                                                    Person.dokter) {
                                                  // ignore: use_build_context_synchronously
                                                  context
                                                      .read<InputDiagnosaBloc>()
                                                      .add(InputDiagnosaEvent.saveDiagnosa(
                                                          deviceID:
                                                              "ID - ${data['id']} - ${data['device']}}",
                                                          pelayanan: toPelayanan(
                                                              poliklinik: authState
                                                                  .user
                                                                  .poliklinik),
                                                          person: toPerson(
                                                              person: authState
                                                                  .user.person),
                                                          userID: authState
                                                              .user.userId,
                                                          noreg: singlePasien
                                                              .first.noreg,
                                                          code: e.code2,
                                                          type: "sekunder",
                                                          table: "S$lengData"));
                                                }

                                                if (authState.user.person ==
                                                    Person.nonDokter) {
                                                  // ignore: use_build_context_synchronously
                                                  context
                                                      .read<InputDiagnosaBloc>()
                                                      .add(InputDiagnosaEvent.saveDiagnosa(
                                                          deviceID:
                                                              "ID - ${data['id']} - ${data['device']}}",
                                                          pelayanan: toPelayanan(
                                                              poliklinik: authState
                                                                  .user
                                                                  .poliklinik),
                                                          person: toPerson(
                                                              person: authState
                                                                  .user.person),
                                                          userID: authState
                                                              .user.userId,
                                                          noreg: singlePasien
                                                              .first.noreg,
                                                          code: e.code2,
                                                          type: "sekunder",
                                                          table: "S$lengData"));
                                                }
                                              }
                                              // SIMPAN DATA
                                            }
                                          }

                                          Get.back();
                                        },
                                        icon: Icon(
                                          Icons.add,
                                          size: 14.sp,
                                          color: ThemeColor.primaryColor,
                                        )),
                                  ),
                                ))
                            .toList()
                        : [
                            Container(),
                          ],
                  ),
                ));
              },
            ),
          ],
        );
      },
    );
  }
}
