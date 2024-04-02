import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:hms_app/domain/bloc/user/create_user/create_user_bloc.dart';
import 'package:hms_app/presentation/component/component.dart';
import 'package:hms_app/presentation/component/res/colors.dart';
import 'package:hms_app/presentation/component/shared/exc_button.dart';
import 'package:hms_app/presentation/component/shared/input_text.dart';
import 'package:hms_app/presentation/route/get_route.dart';
import 'package:sizer/sizer.dart';

class CreateNewUserV2 extends StatelessWidget {
  const CreateNewUserV2({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      bottom: true,
      top: true,
      child: Scaffold(
        backgroundColor: AppColors.background,
        body: Column(
          children: [
            Expanded(
              child: Row(
                children: [
                  FormCreateUserAccount(),
                  ImageSectionWidget(),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class FormCreateUserAccount extends StatelessWidget {
  const FormCreateUserAccount({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.neutral,
      width: 238.sp,
      height: Get.height,
      child: DefaultTabController(
        length: 2,
        child: Scaffold(
          backgroundColor: ThemeColor.bgColor,
          appBar: AppBar(
            backgroundColor: ThemeColor.primaryColor,
            title:
                Text("Create User VincentCore HIS 23.9", style: whiteTextStyle),
            bottom: TabBar(
              tabs: [
                Tab(
                    icon: Text(
                  "Dokter",
                  style: whiteTextStyle,
                )),
                Tab(
                    icon: Text(
                  "Perawat",
                  style: whiteTextStyle,
                )),
              ],
            ),
          ),
          body: TabBarView(
            children: [
              Container(
                padding: EdgeInsets.all(5.sp),
                child: const FormCreateDokter(),
              ),
              Container(),
            ],
          ),
        ),
      ),
    );
  }
}

class FormCreateDokter extends StatefulWidget {
  const FormCreateDokter({super.key});

  @override
  State<FormCreateDokter> createState() => _FormCreateDokterState();
}

class _FormCreateDokterState extends State<FormCreateDokter> {
  late TextEditingController _searchController;
  final _keyForm = GlobalKey<FormState>();

  @override
  void initState() {
    _searchController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CreateUserBloc, CreateUserState>(
      listener: (context, state) {
        //  implement listener
        if (state.loadingSearchDokter) {
          EasyLoading.show(maskType: EasyLoadingMaskType.black);
        }

        //  implement listener
        if (!state.loadingSearchDokter) {
          EasyLoading.dismiss();
        }

        state.searchDokterfailOrSuccessResult.fold(
            () => null,
            (a) => a.fold(
                (l) => l.maybeMap(
                    orElse: () {},
                    failure: (e) async {
                      log(e.toString());
                      context
                          .read<CreateUserBloc>()
                          .add(const CreateUserEvent.clearUser());
                      final shouldPop = await Alert.warningMessage(context,
                          subTitle: e.meta.message.toString());
                      return shouldPop ?? false;
                    }),
                (r) => r.maybeMap(orElse: () {}, auAutorized: (e) {})));
      },
      builder: (context, state) {
        return Column(
          children: [
            const Align(
                alignment: Alignment.centerLeft,
                child: Text("Cari data Dokter berdasarkan ID dokter",
                    style:
                        TextStyle(fontWeight: FontWeight.w500, fontSize: 16))),
            SizedBox(height: 2.sp),
            Row(
              children: [
                SizedBox(
                  width: 238.sp - 90.sp,
                  height: 25.sp,
                  child: FormWidget.textForm(
                      enable: true,
                      autoFocus: true,
                      controller: _searchController,
                      validator: (value) =>
                          value == '' ? "ID Tidak Boleh Kosong" : null),
                ),
                SizedBox(width: 4.sp),
                Expanded(
                  child: WonsButton(
                    height: 25.sp,
                    width: 348.sp,
                    verticalPadding: 0,
                    color: AppColors.primary,
                    child: const Text(
                      "Cari",
                      style: TextStyle(
                          color: AppColors.neutral,
                          fontWeight: FontWeight.w500,
                          fontSize: 16),
                    ),
                    onPressed: () {
                      context.read<CreateUserBloc>().add(
                          CreateUserEvent.cariDokter(
                              idDokter: _searchController.text));
                      // if (_keyFormRegister.currentState!.validate()) {
                      //   context.read<CreateUserBloc>().add(
                      //       CreateUserEvent.getKaryawan(
                      //           params: _searchController.text));
                      // }
                    },
                  ),
                )
              ],
            ),
            SizedBox(height: 5.sp),
            if (state.pelayanan.isNotEmpty) ...[
              Container(
                margin: EdgeInsets.only(
                  bottom: 6.sp,
                ),
                child: DropdownButtonFormField(
                  dropdownColor: Colors.white,
                  isExpanded: true,
                  value: state.pelayanan[0].kdBagian,
                  items: (state.pelayanan.isNotEmpty)
                      ? state.pelayanan
                          .map((e) => DropdownMenuItem(
                                value: e.kdBagian,
                                child: Text(
                                  e.bagian.toString(),
                                  overflow: TextOverflow.ellipsis,
                                  style: blackTextStyle.copyWith(
                                    fontWeight: FontWeight.normal,
                                  ),
                                ),
                              ))
                          .toList()
                      : [],
                  onChanged: (value) {
                    context.read<CreateUserBloc>().add(
                        CreateUserEvent.changeKodeModul(
                            kodeModul: value.toString()));
                  },
                  decoration: FormWidget.styleDropdown(context),
                  style: blackTextStyle.copyWith(
                    overflow: TextOverflow.ellipsis,
                  ),
                  validator: (value) =>
                      value == null ? "Pilih User Login" : null,
                ),
              ),
            ],
            SizedBox(
              height: 5.sp,
            ),
            const Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "Divisi / Bagian",
                style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16),
              ),
            ),
            SizedBox(
              height: 5.sp,
            ),
            InputText(
              labelText: "_",
              controller: TextEditingController(text: state.userModel.bagian),
              keyboardType: TextInputType.visiblePassword,
              onChanged: (value) {},
              onSaved: (val) {},
              textInputAction: TextInputAction.done,
              isPassword: false,
              enabled: false,
            ),
            SizedBox(
              height: 5.sp,
            ),
            const Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "Nama",
                style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16),
              ),
            ),
            InputText(
              labelText: "_",
              controller: TextEditingController(text: state.userModel.bagian),
              keyboardType: TextInputType.visiblePassword,
              onChanged: (value) {},
              onSaved: (val) {},
              textInputAction: TextInputAction.done,
              isPassword: false,
              enabled: false,
            ),
            SizedBox(
              height: 5.sp,
            ),
            const Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "Alamat",
                style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16),
              ),
            ),
            InputText(
              labelText: "_",
              controller: TextEditingController(text: state.userModel.bagian),
              keyboardType: TextInputType.visiblePassword,
              onChanged: (value) {},
              onSaved: (val) {},
              textInputAction: TextInputAction.done,
              isPassword: false,
              enabled: false,
            ),
            const Spacer(),
            WonsButton(
              height: 25.sp,
              width: Get.width,
              verticalPadding: 0,
              color: AppColors.primary,
              child: const Text(
                "Buat Akun",
                style: TextStyle(
                    color: AppColors.neutral,
                    fontWeight: FontWeight.w500,
                    fontSize: 16),
              ),
              onPressed: () {
                if (_keyForm.currentState!.validate()) {
                  // context.read<CreateUserBloc>().add(
                  //     CreateUserEvent.registerUser(
                  //         nik: state.userModel.nik,
                  //         kodeModul: state.kodeModul,
                  //         password: _passwordController.text));
                }
              },
            ),
            const SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "Already have an account?",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16),
                ),
                TextButton(
                  onPressed: () {
                    // Get.of
                    Get.offAllNamed(GetRoutes.login);
                  },
                  child: const Text(
                    " Log in",
                    style: TextStyle(
                        color: AppColors.primary,
                        fontWeight: FontWeight.w500,
                        fontSize: 16),
                  ),
                )
              ],
            ),
          ],
        );
      },
    );
  }
}
