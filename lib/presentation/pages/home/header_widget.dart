import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:hms_app/domain/bloc/content_manager/content_manager_bloc.dart';
import 'package:hms_app/domain/bloc/user/auth/auth_bloc.dart';
import 'package:hms_app/presentation/component/fonts/font_helper.dart';
import 'package:hms_app/presentation/component/res/colors.dart';
import 'package:sizer/sizer.dart';

class HeaderWidget extends StatelessWidget {
  const HeaderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    AuthState authState = context.watch<AuthBloc>().state;
    return Container(
      width: Get.width,
      padding: EdgeInsets.all(6.sp),
      decoration: const BoxDecoration(color: AppColors.secondaryColor),
      child: BlocBuilder<ContentManagerBloc, ContentManagerState>(
        builder: (context, state) {
          if (authState is Authenticated) {
            return Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "${authState.user.bagian} : ${state.content}",
                textAlign: TextAlign.left,
                style: whiteTextStyle.copyWith(fontSize: 10.sp),
              ),
            );
          }
          return Container();
        },
      ),
    );
  }
}
