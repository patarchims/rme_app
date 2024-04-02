import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:hms_app/domain/bloc/app/app_bloc.dart';

import 'package:hms_app/presentation/component/fonts/font_helper.dart';
import 'package:hms_app/presentation/component/res/colors.dart';
import 'package:hms_app/presentation/component/resources/app_constant.dart';
import 'package:hms_app/presentation/component/shared/exc_button.dart';
import 'package:hms_app/presentation/route/get_route.dart';
import 'package:sizer/sizer.dart';

enum NetworkResponse { badRequest, noConnection, timeOut, failed }

class DisconectWidget extends StatelessWidget {
  final NetworkResponse networkResponse;

  const DisconectWidget({
    super.key,
    required this.networkResponse,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        (networkResponse == NetworkResponse.badRequest)
            ? SvgPicture.asset(
                AppConstant.badRequestSVG,
                width: Get.width / 2,
                height: Get.height / 2,
              )
            : (networkResponse == NetworkResponse.badRequest)
                ? SvgPicture.asset(
                    AppConstant.noConnectionSVG,
                    width: Get.width / 2,
                    height: Get.height / 2,
                  )
                : (networkResponse == NetworkResponse.failed)
                    ? SvgPicture.asset(
                        AppConstant.failedSVG,
                        width: Get.width / 2,
                        height: Get.height / 2,
                      )
                    : (networkResponse == NetworkResponse.timeOut)
                        ? SvgPicture.asset(
                            AppConstant.timeOutSVG,
                            width: Get.width / 2,
                            height: Get.height / 2,
                          )
                        : SvgPicture.asset(
                            AppConstant.noConnectionSVG,
                            width: Get.width / 2,
                            height: Get.height / 2,
                          ),
        Text(
          (networkResponse == NetworkResponse.badRequest)
              ? "Error\n400 (Bad Request)"
              : (networkResponse == NetworkResponse.noConnection)
                  ? "Error\n Tidak ada koneksi internet"
                  : (networkResponse == NetworkResponse.failed)
                      ? "Gagal mendapatkan data"
                      : "Tidak terhubung ke server",
          textAlign: TextAlign.center,
          style: whiteFredokaTextStyle.copyWith(color: Colors.black),
        ),
        SizedBox(
          height: 12.sp,
        ),
        if (networkResponse == NetworkResponse.noConnection) ...[
          WonsButton(
            height: 50,
            width: 348,
            verticalPadding: 0,
            color: AppColors.primary,
            child: const Text(
              "Try Again",
              style: TextStyle(
                  color: AppColors.neutral,
                  fontWeight: FontWeight.w500,
                  fontSize: 16),
            ),
            onPressed: () {
              context.read<AppBloc>().add(const AppEvent.started());
              // GOTO SPLASH PAGE
              Get.offAllNamed(GetRoutes.splashPage);
            },
          ),
        ],
      ],
    );
  }
}
