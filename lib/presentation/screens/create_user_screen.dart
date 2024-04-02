import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:hms_app/domain/bloc/user/create_user/create_user_bloc.dart';
import 'package:hms_app/domain/models/meta/meta_model.dart';
import 'package:hms_app/domain/models/users/karyawan_model.dart';
import 'package:hms_app/presentation/component/alert/alert.dart';
import 'package:hms_app/presentation/component/alert/custom_toast.dart';
import 'package:hms_app/presentation/component/fonts/font_helper.dart';
import 'package:hms_app/presentation/component/form/form_textfield_widget.dart';
import 'package:hms_app/presentation/component/res/colors.dart';
import 'package:hms_app/presentation/component/resources/app_constant.dart';
import 'package:hms_app/presentation/component/shared/exc_button.dart';
import 'package:hms_app/presentation/component/shared/input_text.dart';
import 'package:hms_app/presentation/route/get_route.dart';
import 'package:hms_app/presentation/component/image/image_section_widget.dart';
import 'package:sizer/sizer.dart';

class CreateUserPage extends StatelessWidget {
  const CreateUserPage({super.key});

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
                  FormCreateUser(),
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

class FormCreateUser extends StatefulWidget {
  const FormCreateUser({super.key});

  @override
  State<FormCreateUser> createState() => _FormCreateUserState();
}

class _FormCreateUserState extends State<FormCreateUser> {
  late TextEditingController _searchController;
  late TextEditingController _passwordController;

  final _keyForm = GlobalKey<FormState>();
  final _keyFormRegister = GlobalKey<FormState>();

  @override
  void initState() {
    _searchController = TextEditingController();
    _passwordController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _searchController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void clear() {
    _passwordController.clear();
    _searchController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CreateUserBloc, CreateUserState>(
      listener: (context, state) {
        if (state.loading) {
          EasyLoading.show(maskType: EasyLoadingMaskType.black);
        }

        if (!state.loading) {
          EasyLoading.dismiss();
        }

        // REGISTER SUCCESS OF FAIL
        state.registerFailureOrSuccess.fold(
            () => null,
            (a) => a.fold(
                (l) => l.maybeMap(
                      orElse: () {},
                      badResponse: (e) async {
                        Alert.badResponse(context);
                      },
                      connectionTimeOut: (e) async {
                        Alert.connectionTimeOut(context);
                      },
                      disconectToServer: (e) async {
                        Alert.disconnecToServer(context);
                      },
                      noConnection: (e) async {
                        Alert.noConnection(context);
                      },
                      unProccessable: (e) async {
                        final error = List<String>.from(
                            e.value["response"]["errors"].map((x) => x));
                        final meta = MetaModel.fromJson(e.value["metadata"]);

                        final shouldPop = await Alert.warningMessage(context,
                            subTitle: error.toString(),
                            title: meta.message.toString());
                        return shouldPop ?? false;
                      },
                      failure: (e) async {
                        // TAMPILKAN PESAN KESALAHAN
                        final shouldPop = await Alert.warningMessage(context,
                            subTitle: e.meta.message.toString());
                        return shouldPop ?? false;
                      },
                    ),
                (r) => r.maybeMap(
                    orElse: () {},
                    loaded: (e) {
                      final meta = MetaModel.fromJson(e.value["metadata"]);
                      CustomToast.successToast(
                          "Success", meta.message.toString());
                      Future.delayed(
                        const Duration(seconds: 1),
                        () {
                          //  todo goto login page
                          Get.toNamed(GetRoutes.login);
                        },
                      );
                    })));

        // FAIL OR SUCCESS RESULT
        state.failOrSuccessResult.fold(
            () => null,
            (a) => a.fold(
                (l) => l.maybeMap(
                      orElse: () {},
                      badResponse: (e) async {
                        Alert.badResponse(context);
                        context
                            .read<CreateUserBloc>()
                            .add(const CreateUserEvent.clearUser());
                      },
                      connectionTimeOut: (e) async {
                        Alert.connectionTimeOut(context);
                        context
                            .read<CreateUserBloc>()
                            .add(const CreateUserEvent.clearUser());
                      },
                      disconectToServer: (e) async {
                        Alert.disconnecToServer(context);
                        context
                            .read<CreateUserBloc>()
                            .add(const CreateUserEvent.clearUser());
                      },
                      noConnection: (e) async {
                        Alert.noConnection(context);
                        context
                            .read<CreateUserBloc>()
                            .add(const CreateUserEvent.clearUser());
                      },
                      unProccessable: (e) async {
                        final error = List<String>.from(
                            e.value["response"]["errors"].map((x) => x));
                        final meta = MetaModel.fromJson(e.value["metadata"]);

                        final shouldPop = await Alert.warningMessage(context,
                            subTitle: error.toString(),
                            title: meta.message.toString());
                        return shouldPop ?? false;
                      },
                      failure: (e) async {
                        // TAMPILKAN PESAN KESALAHAN
                        log(e.toString());
                        context
                            .read<CreateUserBloc>()
                            .add(const CreateUserEvent.clearUser());
                        final shouldPop = await Alert.warningMessage(context,
                            subTitle: e.meta.message.toString());
                        return shouldPop ?? false;
                      },
                    ),
                (r) => r.maybeMap(
                    orElse: () {},
                    loaded: (e) async {
                      // ==============
                      final user = KaryawanModel.fromMap(e.value["response"]);

                      context
                          .read<CreateUserBloc>()
                          .add(CreateUserEvent.addUser(userModel: user));

                      //================
                    })));
      },
      builder: (context, state) {
        return Container(
          color: AppColors.neutral,
          width: 238.sp,
          height: Get.height,
          child: SingleChildScrollView(
            child: Container(
              color: AppColors.neutral,
              padding: const EdgeInsets.symmetric(horizontal: 50),
              child: Form(
                key: _keyForm,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.asset(AppConstant.iconsLogo,
                        height: 55.sp, width: 90),
                    const SizedBox(height: 12),
                    Center(
                      child: Text("Create User\nVincentCore HIS 23.9",
                          textAlign: TextAlign.center,
                          style: blackTextStyle.copyWith(
                              fontWeight: FontWeight.bold)),
                    ),
                    SizedBox(height: 20.sp),
                    const Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Cari user yang sudah terdaftar di data karyawan Rumah Sakit",
                        style: TextStyle(
                            fontWeight: FontWeight.w500, fontSize: 16),
                      ),
                    ),
                    const SizedBox(height: 9),
                    Row(
                      children: [
                        Form(
                          key: _keyFormRegister,
                          child: SizedBox(
                            width: 238.sp - 90.sp,
                            child: InputText(
                              labelText: "127206xxx",
                              controller: _searchController,
                              keyboardType: TextInputType.visiblePassword,
                              onChanged: (value) {},
                              onSaved: (val) {},
                              textInputAction: TextInputAction.done,
                              isPassword: false,
                              enabled: true,
                              validator: (value) =>
                                  value == '' ? "NIK Tidak Boleh Kosong" : null,
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 4.sp,
                        ),
                        Expanded(
                          child: WonsButton(
                            height: 50,
                            width: 348,
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
                              if (_keyFormRegister.currentState!.validate()) {
                                context.read<CreateUserBloc>().add(
                                    CreateUserEvent.getKaryawan(
                                        params: _searchController.text));
                              }
                            },
                          ),
                        )
                      ],
                    ),
                    SizedBox(height: 5.sp),
                    const Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "NIK & Nomor Induk",
                        style: TextStyle(
                            fontWeight: FontWeight.w500, fontSize: 16),
                      ),
                    ),
                    const SizedBox(height: 9),
                    Row(
                      children: [
                        SizedBox(
                          width: 238.sp - 100.sp,
                          child: InputText(
                            controller: TextEditingController(
                                text: state.userModel.nik),
                            labelText: "",
                            keyboardType: TextInputType.visiblePassword,
                            onChanged: (value) {},
                            onSaved: (val) {},
                            textInputAction: TextInputAction.done,
                            isPassword: false,
                            enabled: false,
                          ),
                        ),
                        SizedBox(
                          width: 4.sp,
                        ),
                        Expanded(
                          child: InputText(
                            controller: TextEditingController(
                                text: state.userModel.idKaryawan),
                            labelText: "",
                            keyboardType: TextInputType.visiblePassword,
                            onChanged: (value) {},
                            onSaved: (val) {},
                            textInputAction: TextInputAction.done,
                            isPassword: false,
                            enabled: false,
                            validator: (value) =>
                                value == '' ? "Tidak boleh kosong" : null,
                          ),
                        )
                      ],
                    ),
                    SizedBox(height: 5.sp),
                    const Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Divisi / Bagian",
                        style: TextStyle(
                            fontWeight: FontWeight.w500, fontSize: 16),
                      ),
                    ),
                    InputText(
                      labelText: "_",
                      controller:
                          TextEditingController(text: state.userModel.bagian),
                      keyboardType: TextInputType.visiblePassword,
                      onChanged: (value) {},
                      onSaved: (val) {},
                      textInputAction: TextInputAction.done,
                      isPassword: false,
                      enabled: false,
                    ),
                    SizedBox(height: 5.sp),
                    const Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Nama & Tanggal Masuk",
                        style: TextStyle(
                            fontWeight: FontWeight.w500, fontSize: 16),
                      ),
                    ),
                    const SizedBox(height: 9),
                    Row(
                      children: [
                        SizedBox(
                          width: 238.sp - 100.sp,
                          child: InputText(
                            labelText: "_",
                            controller: TextEditingController(
                                text: state.userModel.nama),
                            keyboardType: TextInputType.visiblePassword,
                            onChanged: (value) {},
                            onSaved: (val) {},
                            textInputAction: TextInputAction.done,
                            isPassword: false,
                            enabled: false,
                          ),
                        ),
                        SizedBox(
                          width: 5.sp,
                        ),
                        Expanded(
                            child: InputText(
                          labelText: "_",
                          controller: TextEditingController(
                              text: (state.userModel.tglMasuk) != "-"
                                  ? state.userModel.tglMasuk.substring(0, 10)
                                  : "-"),
                          keyboardType: TextInputType.visiblePassword,
                          onChanged: (value) {},
                          onSaved: (val) {},
                          textInputAction: TextInputAction.done,
                          isPassword: false,
                          enabled: false,
                        ))
                      ],
                    ),
                    SizedBox(height: 5.sp),
                    const Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Nomor Handphone",
                        style: TextStyle(
                            fontWeight: FontWeight.w500, fontSize: 16),
                      ),
                    ),
                    const SizedBox(height: 9),
                    InputText(
                      controller:
                          TextEditingController(text: state.userModel.hp),
                      labelText: "_",
                      keyboardType: TextInputType.visiblePassword,
                      onChanged: (value) {},
                      onSaved: (val) {},
                      textInputAction: TextInputAction.done,
                      isPassword: false,
                      enabled: false,
                    ),
                    SizedBox(height: 5.sp),
                    const Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Pilih User Login",
                        style: TextStyle(
                            fontWeight: FontWeight.w500, fontSize: 16),
                      ),
                    ),
                    const SizedBox(height: 9),
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
                    SizedBox(height: 5.sp),
                    const Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Email Address",
                        style: TextStyle(
                            fontWeight: FontWeight.w500, fontSize: 16),
                      ),
                    ),
                    const SizedBox(height: 9),
                    InputText(
                      controller:
                          TextEditingController(text: state.userModel.email),
                      labelText: "-",
                      keyboardType: TextInputType.visiblePassword,
                      onChanged: (value) {},
                      onSaved: (val) {},
                      textInputAction: TextInputAction.done,
                      isPassword: false,
                      enabled: false,
                    ),
                    SizedBox(height: 5.sp),
                    const Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Password",
                        style: TextStyle(
                            fontWeight: FontWeight.w500, fontSize: 16),
                      ),
                    ),
                    const SizedBox(height: 9),
                    InputText(
                      labelText: "*",
                      controller: _passwordController,
                      keyboardType: TextInputType.text,
                      onChanged: (value) {},
                      onSaved: (val) {},
                      textInputAction: TextInputAction.done,
                      isPassword: true,
                      validator: (value) =>
                          value == '' ? "Tidak boleh kosong" : null,
                      enabled: true,
                    ),
                    const SizedBox(height: 40),
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
                          context.read<CreateUserBloc>().add(
                              CreateUserEvent.registerUser(
                                  nik: state.userModel.nik,
                                  kodeModul: state.kodeModul,
                                  password: _passwordController.text));
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
                          style: TextStyle(
                              fontWeight: FontWeight.w500, fontSize: 16),
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
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
