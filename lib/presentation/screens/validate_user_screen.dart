import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:hms_app/domain/bloc/user/auth/auth_bloc.dart';
import 'package:hms_app/domain/bloc/user/create_user/create_user_bloc.dart';
import 'package:hms_app/domain/models/meta/meta_model.dart';
import 'package:hms_app/domain/models/token/token_model.dart';
import 'package:hms_app/domain/models/users/user_model.dart';
import 'package:hms_app/presentation/component/alert/alert.dart';
import 'package:hms_app/presentation/component/alert/custom_toast.dart';
import 'package:hms_app/presentation/component/fonts/font_helper.dart';
import 'package:hms_app/presentation/component/res/colors.dart';
import 'package:hms_app/presentation/component/shared/exc_button.dart';
import 'package:hms_app/presentation/component/image/image_section_widget.dart';
import 'package:hms_app/presentation/route/get_route.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:sizer/sizer.dart';
import '../../domain/models/token/token_pref.dart';
import '../component/resources/app_constant.dart';

class ValidateUserPage extends StatelessWidget {
  const ValidateUserPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      bottom: true,
      top: true,
      child: Scaffold(
        backgroundColor: AppColors.background,
        body: SingleChildScrollView(
          child: SizedBox(
            width: Get.width,
            height: Get.height,
            child: Row(
              children: [
                const _ValidateUserForm(),
                ImageSectionWidget(imageString: AppConstant.fingerPrint),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _ValidateUserForm extends StatefulWidget {
  const _ValidateUserForm();

  @override
  State<_ValidateUserForm> createState() => _ValidateUserFormState();
}

class _ValidateUserFormState extends State<_ValidateUserForm> {
  late TextEditingController _kodeController;

  @override
  void initState() {
    _kodeController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _kodeController.clear();
    _kodeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CreateUserBloc, CreateUserState>(
      listener: (context, state) {
        state.verifyrFailureOrSuccess.fold(
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
                      final user = UserModel.fromMap(e.value["response"]);
                      // JIKA DATA DITEMUKAN, SIMPAN DI DATANASE LOCAL
                      // SIMPAN TOKEN USER
                      TokenModel tokens = TokenModel(
                          token: user.token, refreshToken: user.refreshToken);
                      TokenPref.saveToken(token: tokens);
                      CustomToast.successToast(
                          "Success", meta.message.toString());
                      context
                          .read<AuthBloc>()
                          .add(AuthEvent.addUser(userModel: user));

                      Future.delayed(const Duration(seconds: 1), () {
                        // todo dASHBOARD PAGE
                        Get.toNamed(GetRoutes.homePage);
                      });
                    })));
      },
      builder: (context, state) {
        return Container(
          color: AppColors.neutral,
          width: 288.sp,
          child: Column(
            children: [
              SizedBox(
                height: 12.sp,
              ),
              SvgPicture.asset(
                "assets/svg/logo.svg",
                width: 90,
                height: 55.5,
              ),
              const SizedBox(height: 30),
              Text(
                "Aktivasi Akun",
                style: greyTextStyle,
              ),
              SizedBox(height: 30.sp),
              // if (state.sendOtpResponse != null) ...[
              const SizedBox(height: 30),
              Text(
                "Kode verifikasi berhasil dikirim ke  email Anda",
                textAlign: TextAlign.center,
                style: greyTextStyle.copyWith(fontSize: 8.sp),
              ),
              SizedBox(height: 10.sp),
              // ],
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 12.sp),
                child: PinCodeTextField(
                  appContext: context,
                  length: 8,
                  obscureText: false,
                  animationType: AnimationType.fade,
                  pinTheme: PinTheme(
                    selectedFillColor: const Color(0xFF8CB88B),
                    activeColor: const Color(0xFF89B587),
                    selectedColor: const Color(0xFF89B587),
                    shape: PinCodeFieldShape.box,
                    borderRadius: BorderRadius.circular(5),
                    fieldHeight: 35.sp,
                    fieldWidth: 30.sp,
                    activeFillColor: Colors.transparent,
                  ),
                  animationDuration: const Duration(milliseconds: 300),
                  backgroundColor: Colors.transparent,
                  enableActiveFill: false,
                  onCompleted: (value) {
                    // context
                    //     .read<RegisterFormBloc>()
                    //     .add(RegisterFormEvent.addKodeOTP(kodeOTP: value));
                  },
                  onChanged: (value) {
                    setState(() {
                      _kodeController.text = value;
                    });
                  },
                  beforeTextPaste: (text) {
                    return true;
                  },
                ),
              ),
              SizedBox(
                height: 20.sp,
              ),

              SizedBox(height: 12.sp),
              if (_kodeController.text.length > 5) ...[
                WonsButton(
                  width: 158.sp,
                  height: 22.sp,
                  verticalPadding: 0,
                  color: AppColors.primary,
                  child: const Text(
                    "Verifikasi Akun",
                    style: TextStyle(
                        color: AppColors.neutral,
                        fontWeight: FontWeight.w500,
                        fontSize: 16),
                  ),
                  onPressed: () {
                    context.read<CreateUserBloc>().add(
                        CreateUserEvent.verifikasiAkun(
                            kodeActivasi: _kodeController.text));
                  },
                ),
              ],
            ],
          ),
        );
      },
    );
  }
}
