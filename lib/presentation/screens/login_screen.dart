import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:hms_app/domain/bloc/dashboard/pasien/pasien_bloc.dart';
import 'package:hms_app/domain/bloc/user/create_user/create_user_bloc.dart';
import 'package:hms_app/domain/bloc/user/sign_in_form/sign_in_form_bloc.dart';
import 'package:hms_app/domain/models/meta/meta_model.dart';
import 'package:hms_app/domain/models/token/token_model.dart';
import 'package:hms_app/domain/models/token/token_pref.dart';
import 'package:hms_app/domain/models/users/user_model.dart';
import 'package:hms_app/presentation/component/res/colors.dart';
import 'package:hms_app/presentation/component/resources/app_config.dart';
import 'package:hms_app/presentation/component/resources/app_constant.dart';
import 'package:hms_app/presentation/component/shared/exc_button.dart';
import 'package:hms_app/presentation/component/shared/input_text.dart';
import 'package:hms_app/presentation/route/get_route.dart';
import 'package:hms_app/presentation/widget/terapi_search_widget.dart';
import 'package:lottie/lottie.dart';
import 'package:sizer/sizer.dart';
import '../../domain/bloc/user/auth/auth_bloc.dart';
import '../component/component.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      bottom: true,
      top: true,
      child: Scaffold(
          body: SingleChildScrollView(
              child: SizedBox(
        width: Get.width,
        height: Get.height,
        child: const Row(
          children: [
            _FormSection(),
            _ImageSection(),
          ],
        ),
      ))),
    );
  }
}

class _FormSection extends StatefulWidget {
  const _FormSection();

  @override
  State<_FormSection> createState() => _FormSectionState();
}

class _FormSectionState extends State<_FormSection> {
  final ScrollController _scrollController = ScrollController();

  final _keyForm = GlobalKey<FormState>();
  final List<String> genderItems = [
    'Male',
    'Female',
  ];

  String? selectedValue;

  late TextEditingController _emailController;
  late TextEditingController _userIDController;
  late TextEditingController _passwordController;
  bool isHidden = false;

  @override
  void initState() {
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
    _userIDController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    clear();
    _emailController.dispose();
    _scrollController.dispose();
    _userIDController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void clear() {
    _emailController.clear();
    _userIDController.clear();
    _passwordController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<SignInFormBloc, SignInFormState>(
      listener: (context, state) {
        // TAMPILKAN LOADING
        if (state.loading) {
          EasyLoading.show(maskType: EasyLoadingMaskType.black);
        }

        // TUTUP LOADING
        if (!state.loading) {
          EasyLoading.dismiss();
        }

        state.failOrSuccessResult.fold(
            () => null,
            (a) => a.fold(
                (l) => l.maybeMap(
                    orElse: () {},
                    // TAMPILKAN KESALAHAN BAD RESPONSE
                    badResponse: (e) async {
                      Alert.badResponse(context);
                    },
                    // TAMPILKAN KESALAH TIME OUT CONNECTION
                    connectionTimeOut: (e) async {
                      Alert.connectionTimeOut(context);
                    },

                    // TAMPILKAN KESALAHAN DISCONECT TO SERVER
                    disconectToServer: (e) async {
                      Alert.disconnecToServer(context);
                    },

                    // TAMPILKAN KESALAHAN NO CONNECTION TO SERVER
                    noConnection: (e) async {
                      Alert.noConnection(context);
                    },
                    // TAMPILKAN KESALAHAN TIDAK DAPAT DI PROCESS
                    unProccessable: (e) async {
                      log("ERROR  Tidak dapat di proses $e");
                      final error = List<String>.from(
                          e.value["response"]["errors"].map((x) => x));
                      final meta = MetaModel.fromJson(e.value["metadata"]);

                      final shouldPop = await Alert.warningMessage(context,
                          subTitle: error.toString(),
                          title: meta.message.toString());
                      return shouldPop ?? false;
                    },
                    // TAMPILKAN KESALAHAN LOGIN GAGAL, BERUPA PASSWORD SALAH, EMAIL TIDAK DI TEMUKAN DAN LAIN SEBAGAINYA
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
                      final meta = MetaModel.fromJson(e.value["metadata"]);
                      final user = UserModel.fromMap(e.value["response"]);

                      // SIMPAN TOKEN USER
                      TokenModel tokens = TokenModel(
                          token: user.token, refreshToken: user.refreshToken);

                      await TokenPref.saveToken(token: tokens);

                      CustomToast.successToast(
                          "Success", meta.message.toString());

                      // ignore: use_build_context_synchronously
                      context
                          .read<AuthBloc>()
                          .add(AuthEvent.addUser(userModel: user));

                      Future.delayed(const Duration(seconds: 1), () {
                        // GO TO PAGE DASHBOARD
                        context
                            .read<PasienBloc>()
                            .add(const PasienEvent.getAntreanPasien());
                        Get.offAllNamed(GetRoutes.homePage);
                      });
                    },
                    auAutorized: (e) {
                      Future.delayed(const Duration(seconds: 1), () {
                        Get.offAllNamed(GetRoutes.validationUserPage);
                      });
                    })));

        // ==
      },
      child: BlocBuilder<SignInFormBloc, SignInFormState>(
        builder: (context, state) {
          return Container(
            color: AppColors.neutral,
            height: Get.height,
            width: 208.sp,
            padding: const EdgeInsets.symmetric(horizontal: 50),
            child: Form(
              key: _keyForm,
              child: Scrollbar(
                thumbVisibility: true,
                interactive: true,
                thickness: 5.sp,
                trackVisibility: false,
                scrollbarOrientation: ScrollbarOrientation.right,
                controller: _scrollController,
                child: ListView(
                  controller: _scrollController,
                  children: [
                    SizedBox(
                      height: 25.sp,
                    ),
                    SizedBox(
                      height: 55.sp,
                      child: Image.asset(
                          SetApp.logoApp(appSetup: AppConstant.appSetup)),
                    ),
                    const SizedBox(height: 30),
                    Text(
                      "Login System",
                      style: blackDayOneTextStyle.copyWith(
                          fontWeight: FontWeight.bold,
                          color: ThemeColor.primaryColor),
                    ),
                    const SizedBox(height: 41),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Pilih User Login",
                        style: blackTextStyle.copyWith(fontSize: 6.sp),
                      ),
                    ),
                    const SizedBox(height: 9),
                    BlocBuilder<CreateUserBloc, CreateUserState>(
                      builder: (context, state) {
                        if (state.pelayanan.isNotEmpty) {
                          return Container(
                            height: 25.sp,
                            decoration: const BoxDecoration(
                                color: ThemeColor.whiteColor),
                            margin: EdgeInsets.only(
                              bottom: 6.sp,
                            ),
                            width: Get.width,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Expanded(
                                    child: DecoratedBox(
                                  decoration: ShapeDecoration(
                                      color: ThemeColor.bgColor,
                                      shape: RoundedRectangleBorder(
                                        side: BorderSide(
                                          width: 1.0,
                                          style: BorderStyle.solid,
                                          color: ThemeColor.bgColor,
                                        ),
                                      )),
                                  child: DropdownButtonFormField(
                                    hint: Text(
                                      'Pilih Bagian',
                                      style: blackTextStyle,
                                    ),
                                    validator: (value) {
                                      if (value == null) {
                                        return 'Pilih Bagian';
                                      }
                                      return null;
                                    },
                                    isExpanded: true,
                                    decoration: InputDecoration(
                                      enabledBorder: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(5.sp),
                                        borderSide: const BorderSide(
                                            color: Colors.black, width: 1),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(5.sp),
                                        borderSide: const BorderSide(
                                            color: Colors.black, width: 1),
                                      ),
                                    ),
                                    value: (state.selectedValue == "")
                                        ? state.pelayanan[0].kdBagian
                                        : state.selectedValue,
                                    items: (state.pelayanan.isNotEmpty)
                                        ? state.pelayanan
                                            .map((e) => DropdownMenuItem(
                                                  value: e.kdBagian,
                                                  child: Padding(
                                                    padding:
                                                        EdgeInsets.symmetric(
                                                            horizontal: 8.sp),
                                                    child: Text(
                                                      e.bagian.toString(),
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                      style: blackTextStyle
                                                          .copyWith(
                                                        fontSize: 6.sp,
                                                        fontWeight:
                                                            FontWeight.normal,
                                                      ),
                                                    ),
                                                  ),
                                                ))
                                            .toList()
                                        : [],
                                    onChanged: (value) {
                                      // TAMBAHKAN SELECTED USER PADA STATE
                                      context.read<SignInFormBloc>().add(
                                          SignInFormEvent.selectedUserLogin(
                                              selectedUser: value.toString()));
                                    },
                                    style: blackTextStyle.copyWith(
                                        overflow: TextOverflow.ellipsis),
                                  ),
                                )),

                                // ======================
                                Container(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 2.sp),
                                    height: 21.sp,
                                    width: 35.sp,
                                    child: ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                            backgroundColor: Colors.black,
                                            shape: RoundedRectangleBorder(
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(2.sp)))),
                                        onPressed: () {
                                          // ====================== //
                                          CustomDialogWidget.getDialog(
                                              widget: Container(
                                                padding: EdgeInsets.all(12.sp),
                                                height: 200.sp,
                                                width: 400.sp,
                                                decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            6.sp),
                                                    color: Colors.white),
                                                child:
                                                    const LoginSearchWidget(),
                                              ),
                                              color: Colors.transparent);

                                          // =========================== //
                                        },
                                        child: const Icon(
                                          Icons.search,
                                          color: Colors.white,
                                        )))
                              ],
                            ),
                          );
                        }
                        return Container();
                      },
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "User ID",
                        style: blackTextStyle.copyWith(fontSize: 6.sp),
                      ),
                    ),
                    const SizedBox(height: 9),
                    InputText(
                      controller: _userIDController,
                      labelText: "",
                      style: blackTextStyle,
                      keyboardType: TextInputType.visiblePassword,
                      onChanged: (value) {},
                      onSaved: (val) {},
                      textInputAction: TextInputAction.done,
                      isPassword: false,
                      enabled: true,
                      validator: (value) =>
                          value == '' ? "Tidak boleh kosong" : null,
                    ),
                    const SizedBox(height: 20),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text("Password",
                          style: blackTextStyle.copyWith(fontSize: 6.sp)),
                    ),
                    const SizedBox(height: 9),
                    InputText(
                      controller: _passwordController,
                      labelText: "",
                      style: blackTextStyle,
                      keyboardType: TextInputType.visiblePassword,
                      onChanged: (value) {},
                      onSaved: (val) {},
                      textInputAction: TextInputAction.done,
                      isPassword: state.isHiddenPassword,
                      enabled: true,
                      suffixIcon: visibilityToggle(() {
                        context.read<SignInFormBloc>().add(
                            SignInFormEvent.isHiddenPassword(
                                isHidden: !state.isHiddenPassword));
                      }, state.isHiddenPassword),
                    ),
                    const SizedBox(height: 25),
                    const SizedBox(height: 40),
                    WonsButton(
                      height: 25.sp,
                      width: Get.width,
                      verticalPadding: 0,
                      color: AppColors.primary,
                      child: Text(
                        "Log in",
                        style: whiteTextStyle,
                      ),
                      onPressed: () {
                        if (_keyForm.currentState!.validate()) {
                          context.read<SignInFormBloc>().add(
                              SignInFormEvent.sigInWithUserIdAndPassword(
                                  userID: _userIDController.text,
                                  password: _passwordController.text,
                                  kodeModul: state.selectedUser));
                        }
                      },
                    ),
                    const SizedBox(height: 30),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  togglePasswordVisibility(SignInFormState state) {}
}

class _ImageSection extends StatelessWidget {
  const _ImageSection();

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        decoration: const BoxDecoration(color: ThemeColor.blueColor),
        child: Center(
          child: Lottie.asset(AppConstant.loginAnimate,
              height: Get.height, reverse: true, repeat: true),
        ),
      ),
    );
  }
}
