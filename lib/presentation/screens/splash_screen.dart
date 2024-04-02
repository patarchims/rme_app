import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:hms_app/domain/bloc/app/app_bloc.dart';
import 'package:hms_app/domain/bloc/user/auth/auth_bloc.dart';
import 'package:hms_app/presentation/component/color/color_helper.dart';
import 'package:hms_app/presentation/component/fonts/font_helper.dart';
import 'package:hms_app/presentation/component/resources/app_config.dart';
import 'package:hms_app/presentation/component/resources/app_constant.dart';
import 'package:hms_app/presentation/route/get_route.dart';
import 'package:sizer/sizer.dart';

class SplashScreenPage extends StatefulWidget {
  const SplashScreenPage({super.key});

  @override
  State<SplashScreenPage> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreenPage>
    with TickerProviderStateMixin {
  late AnimationController controller;
  bool determinate = false;

  @override
  void initState() {
    controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    )..addListener(() {
        setState(() {});
      });
    controller.repeat();
    context.read<AppBloc>().add(const AppEvent.started());
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<AppBloc, AppState>(
      listener: (context, state) {
        state.maybeMap(
          orElse: () {
            log("OR ELSE");
            Future.delayed(const Duration(seconds: 3), () {
              Get.toNamed(GetRoutes.disconectScreen);
            });
          },
          badResponse: (e) {
            log("BAD RESPONSE");
            Future.delayed(const Duration(seconds: 3), () {
              Get.toNamed(GetRoutes.disconectScreen);
            });
          },
          connectionTimeOut: (e) {
            log("CONNECTION TIME OUT");
            // TAMPILKAN CONNECTION TIME OUT
            Future.delayed(const Duration(seconds: 3), () {
              Get.toNamed(GetRoutes.disconectScreen);
            });
          },
          failure: (e) {
            log("FAILURE ${e.toString()}");
            Future.delayed(const Duration(seconds: 3), () {
              Get.toNamed(GetRoutes.login);
            });
          },
          initial: (e) {
            Future.delayed(const Duration(seconds: 3), () {
              Get.toNamed(GetRoutes.login);
            });
          },
          runMainPage: (e) {
            context.read<AuthBloc>().add(AuthEvent.addUser(userModel: e.user));
            // GOTO DASHBOARD
            Future.delayed(const Duration(seconds: 3), () {
              Get.toNamed(GetRoutes.homePage);
            });
          },
          updateNow: (e) async {
            // GOTO UPATE NOW
            Future.delayed(const Duration(seconds: 3), () {});
          },
          runOnBoarding: (e) {
            // GO TO UPDATE NOW PAGE
            Future.delayed(const Duration(seconds: 3), () {
              // todo go to oNBOARDING PAGE
              // Get.toNamed(GetRoutes.login);
              Get.toNamed(GetRoutes.onBoardingPage);
            });
          },
          noToken: (e) {
            log("NO TOKEN USER");
            Future.delayed(const Duration(seconds: 3), () {
              // tODO GO TO LOGIN PAGE
              Get.toNamed(GetRoutes.login);
            });
          },
        );
      },
      child: Scaffold(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        body: Container(
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(AppConstant.splashScreenImage),
                  fit: BoxFit.cover)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(SetApp.appLogo(appSetup: AppConstant.appSetup),
                  height: 80.sp),
              SizedBox(height: 12.sp),
              Text(
                "Electronic Medical\nRecord System",
                style: whiteFredokaTextStyle.copyWith(fontSize: 18.sp),
                textAlign: TextAlign.center,
              ),
              Text(
                "Version 29.2",
                style: whiteFredokaTextStyle.copyWith(fontSize: 10.sp),
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: 42.sp,
              ),
              Container(
                padding: EdgeInsets.all(1.sp),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(2.sp))),
                height: 10.sp,
                width: Get.width,
                child: LinearProgressIndicator(
                  backgroundColor: ThemeColor.bgColor,
                  color: ThemeColor.darkBlueColor,
                  value: controller.value,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
