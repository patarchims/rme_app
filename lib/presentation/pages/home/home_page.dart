import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:hms_app/domain/bloc/content_manager/content_manager_bloc.dart';
import 'package:hms_app/domain/bloc/content_manager/menu.dart';
import 'package:hms_app/domain/bloc/user/auth/auth_bloc.dart';
import 'package:hms_app/presentation/component/component.dart';
import 'package:hms_app/presentation/component/res/colors.dart';
import 'package:hms_app/presentation/pages/home/dashboard_widget.dart';
import 'package:hms_app/presentation/pages/home/sidebar_widget.dart';
import 'package:hms_app/presentation/pages/pasien/pasien_content_widget.dart';
import 'package:sizer/sizer.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    AuthState authState = context.watch<AuthBloc>().state;

    return Scaffold(
        backgroundColor: ThemeColor.bgColor,
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: ThemeColor.primaryColor,
          title: BlocBuilder<ContentManagerBloc, ContentManagerState>(
            builder: (context, state) {
              if (authState is Authenticated) {
                return Text(
                  "${authState.user.bagian} : ${state.content}",
                  textAlign: TextAlign.left,
                  style: whiteTextStyle.copyWith(
                      fontSize: 12.sp, fontWeight: FontWeight.bold),
                );
              }
              return Container();
            },
          ),
        ),
        body: SizedBox(
          height: Get.height,
          width: Get.width,
          child: Row(
            children: [
              // SIDEBAR
              const SidebarWidget(),

              Expanded(
                  child: Container(
                padding: EdgeInsets.all(4.sp),
                margin: EdgeInsets.only(top: 4.sp, right: 4.sp, bottom: 4.sp),
                decoration: BoxDecoration(
                    gradient: const LinearGradient(colors: [
                      AppColors.secondaryColor,
                      Color(0xFF143658),
                    ], begin: Alignment.topCenter, end: Alignment.bottomCenter),
                    borderRadius: BorderRadius.circular(6.sp),
                    color: AppColors.secondaryColor),
                child: BlocBuilder<ContentManagerBloc, ContentManagerState>(
                  builder: (context, state) {
                    switch (state.content) {
                      // Todo Tampilkan WIdget
                      case Content.pasien:
                        return const PasienContentWidget();
                      default:
                        return const DashboardWidget();
                    }
                  },
                ),
              ))
            ],
          ),
        ));
  }
}
