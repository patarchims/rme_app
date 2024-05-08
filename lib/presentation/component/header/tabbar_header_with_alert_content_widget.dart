import 'package:blinking_text/blinking_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hms_app/domain/bloc/dashboard/resiko_jatuh/deteksi_resiko_jatuh/deteksi_resiko_jatuh_bloc.dart';
import 'package:hms_app/presentation/component/component.dart';
import 'package:hms_app/presentation/component/resources/app_constant.dart';
import 'package:lottie/lottie.dart';
import 'package:sizer/sizer.dart';

class TabbarWithAlertContentWidget extends StatelessWidget {
  final List<String> menu;
  final Function(int)? onTap;
  final List<Widget> children;

  const TabbarWithAlertContentWidget({
    super.key,
    required this.menu,
    this.onTap,
    required this.children,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: DefaultTabController(
      animationDuration: const Duration(milliseconds: 10),
      length: menu.length, // Added
      child: BlocBuilder<DeteksiResikoJatuhBloc, DeteksiResikoJatuhState>(
        builder: (context, state) {
          return Stack(
            children: [
              Positioned.fill(
                  child: Container(
                margin: EdgeInsets.only(top: (state.resiko.isShow) ? 25.sp : 0),
                child: Scaffold(
                  backgroundColor: ThemeColor.bgColor,
                  appBar: AppBar(
                    backgroundColor: ThemeColor.bgColor,
                    foregroundColor: Colors.black,
                    surfaceTintColor: Colors.black,
                    flexibleSpace: SafeArea(
                        child: TabBar(
                      labelColor: ThemeColor.primaryColor,
                      unselectedLabelColor: Colors.black,
                      dividerColor: Colors.white,
                      indicatorColor: ThemeColor.primaryColor,
                      onTap: onTap,
                      tabs: menu
                          .map(
                            (e) => Tab(
                              text: e,
                            ),
                          )
                          .toList(),
                    )),
                    leading: null,
                    elevation: 0,
                    automaticallyImplyLeading: false,
                  ),
                  body: TabBarView(children: children),
                ),
              )),

              // DETEKSI RESIKO JATUH
              if (state.resiko.isShow) ...[
                Positioned(
                  top: 0,
                  child: Container(
                    height: 25.sp,
                    width: MediaQuery.of(context).size.width / 1.5,
                    decoration: const BoxDecoration(color: Colors.transparent),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        BlinkText(state.resiko.hasil + state.resiko.tindakan,
                            style: TextStyle(
                                fontSize: 12.sp,
                                fontWeight: FontWeight.bold,
                                color: Colors.redAccent),
                            beginColor: Colors.black,
                            endColor: Colors.redAccent,
                            times: 10,
                            duration: const Duration(seconds: 1)),
                        SizedBox(
                          width: 25.sp,
                        ),
                        Lottie.asset(AppConstant.alertAnimate,
                            height: 20.sp, reverse: true, repeat: true),
                      ],
                    ),
                  ),
                ),
              ],
            ],
          );
        },
      ),
    ));
  }
}
