import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:hms_app/core/api/api_db.dart';
import 'package:hms_app/domain/bloc/dashboard/pasien/pasien_bloc.dart';
import 'package:hms_app/domain/bloc/user/auth/auth_bloc.dart';
import 'package:hms_app/domain/models/users/user_model.dart';
import 'package:hms_app/presentation/component/alert/alert.dart';
import 'package:hms_app/presentation/component/alert/custom_dialog.dart';
import 'package:hms_app/presentation/component/button/selection_button.dart';
import 'package:hms_app/presentation/component/fonts/font_helper.dart';
import 'package:hms_app/presentation/component/res/colors.dart';
import 'package:hms_app/presentation/component/resources/app_config.dart';
import 'package:hms_app/presentation/component/resources/app_constant.dart';
import 'package:hms_app/presentation/route/get_route.dart';
import 'package:sizer/sizer.dart';

import '../../../domain/bloc/app/app_bloc.dart';
import '../../../domain/bloc/content_manager/content_manager_bloc.dart';

class SidebarWidget extends StatelessWidget {
  const SidebarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    // AuthState authState = context.watch<AuthBloc>().state;
    return Container(
      height: Get.height,
      width: 90.sp,
      margin: EdgeInsets.all(4.sp),
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(blurRadius: 25.0, color: Colors.white.withOpacity(0.2)),
          const BoxShadow(
              color: Colors.white12,
              blurRadius: 2,
              blurStyle: BlurStyle.normal,
              offset: Offset.zero),
          const BoxShadow(
              color: Colors.white12,
              blurRadius: 2,
              blurStyle: BlurStyle.normal,
              offset: Offset.zero)
        ],
        gradient: const LinearGradient(colors: [
          AppColors.secondaryColor,
          Color(0xFF143658),
        ], begin: Alignment.topCenter, end: Alignment.bottomCenter),
        borderRadius: BorderRadius.circular(6.sp),
      ),
      child: BlocBuilder<AuthBloc, AuthState>(
        builder: (context, state) {
          if (state is Authenticated) {
            return Column(
              children: [
                SizedBox(height: 12.sp),
                InkWell(
                  onTap: () {
                    CustomDialogWidget.getDialog(
                        widget: Container(
                      height: Get.height / 2,
                      width: Get.width / 2,
                      margin: EdgeInsets.all(12.sp),
                      padding: EdgeInsets.all(15.sp),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(6.sp),
                          image: (state.user.photo != "")
                              ? DecorationImage(
                                  image: NetworkImage(
                                    ApiDb.baseUrlImageUser + state.user.photo,
                                  ),
                                  fit: BoxFit.cover)
                              : DecorationImage(
                                  image: AssetImage(SetApp.logoApp(
                                      appSetup: AppConstant.appSetup)),
                                  fit: BoxFit.cover)),
                    ));
                  },
                  child: Container(
                    height: 35.sp,
                    width: 35.sp,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(6.sp),
                        image: (state.user.photo != "")
                            ? DecorationImage(
                                image: NetworkImage(
                                  ApiDb.baseUrlImageUser + state.user.photo,
                                ),
                                fit: BoxFit.cover)
                            : DecorationImage(
                                image: AssetImage(SetApp.logoApp(
                                    appSetup: AppConstant.appSetup)),
                                fit: BoxFit.cover)),
                  ),
                ),
                SizedBox(height: 6.sp),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8.sp),
                  child: Text(
                    state.user.nama,
                    textAlign: TextAlign.center,
                    style: whiteTextStyle.copyWith(fontSize: 6.sp),
                  ),
                ),
                SizedBox(
                  height: 3.sp,
                ),
                Text(
                  state.user.bagian,
                  textAlign: TextAlign.center,
                  style: whiteTextStyle.copyWith(fontSize: 6.sp),
                ),
                SizedBox(
                  width: Get.width,
                  child: TextButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.black.withOpacity(0.5)),
                    onPressed: () {},
                    child: Text(
                      "${state.user.pelayanan} \n ${toPerson(person: state.user.person).toUpperCase()}",
                      textAlign: TextAlign.center,
                      style: whiteTextStyle.copyWith(fontSize: 6.sp),
                    ),
                  ),
                ),
                SizedBox(
                  height: 2.sp,
                ),
                if (state.user.person == Person.dokter) ...[
                  SizedBox(
                      width: Get.width,
                      child: TextButton(
                        style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(2.sp)),
                            backgroundColor: Colors.black.withOpacity(0.5)),
                        onPressed: () {},
                        child: Text(
                          "Speasialisasi \n ${toSpesialisasiString(spesiliasasi: state.user.spesialisasi)}",
                          textAlign: TextAlign.center,
                          style: whiteTextStyle.copyWith(fontSize: 6.sp),
                        ),
                      )),
                ],
                SizedBox(
                  height: 12.sp,
                ),
                Divider(
                  height: 1.sp,
                  color: Colors.white,
                ),
                SizedBox(
                  height: 6.sp,
                ),
                Expanded(
                  child: ListView(
                    children: [
                      SelectionButton(
                          data: [
                            SelectionButtonData(
                              activeIcon: EvaIcons.grid,
                              icon: EvaIcons.gridOutline,
                              label: "Dashboard",
                            ),
                            SelectionButtonData(
                              activeIcon: EvaIcons.person,
                              icon: EvaIcons.person,
                              label: "Pasien",
                            ),
                          ],
                          onSelected: (index, value) {
                            context.read<ContentManagerBloc>().add(
                                ContentManagerEvent.changeContent(
                                    content: value.label));
                            switch (index) {
                              case 1:
                                context
                                    .read<PasienBloc>()
                                    .add(const PasienEvent.getAntreanPasien());
                                break;
                              case 2:
                                // SERHARUSNYA DI SINI ADALAH FUNGCION UNTUK KELUAR DARI APLIKASI
                                break;
                              default:
                            }
                          }),
                    ],
                  ),
                ),
                SizedBox(
                  height: 12.sp,
                ),
                Container(
                    margin: EdgeInsets.symmetric(horizontal: 5.sp),
                    height: 20.sp,
                    width: Get.width,
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            elevation: 0,
                            backgroundColor: Colors.lightBlue.withOpacity(0.1)),
                        onPressed: () {
                          Alert.logOut(onTap: () {
                            context
                                .read<AuthBloc>()
                                .add(const AuthEvent.signOut());

                            context
                                .read<AppBloc>()
                                .add(const AppEvent.started());

                            Get.offNamed(GetRoutes.login);
                          });
                        },
                        child: Row(
                          children: [
                            const Icon(Icons.exit_to_app),
                            SizedBox(
                              width: 6.sp,
                            ),
                            Text(
                              "Exit",
                              style: whiteTextStyle,
                            )
                          ],
                        ))),
                SizedBox(
                  height: 12.sp,
                ),
              ],
            );
          }
          return Container();
        },
      ),
    );
  }
}
