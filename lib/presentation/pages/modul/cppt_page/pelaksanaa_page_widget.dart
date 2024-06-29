import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:hms_app/domain/bloc/dashboard/pasien/pasien_bloc.dart';
import 'package:hms_app/domain/bloc/report/report_bloc.dart';
import 'package:hms_app/domain/bloc/user/auth/auth_bloc.dart';
import 'package:hms_app/presentation/component/color/color_helper.dart';
import 'package:hms_app/presentation/component/loading/loading.dart';
import 'package:sizer/sizer.dart';

class PelakanaanPageWidget extends StatefulWidget {
  const PelakanaanPageWidget({super.key});

  @override
  State<PelakanaanPageWidget> createState() => _PelakanaanPageWidgetState();
}

class _PelakanaanPageWidgetState extends State<PelakanaanPageWidget> {
  @override
  Widget build(BuildContext context) {
    PasienState pasienState = context.watch<PasienBloc>().state;
    final singlePasien = pasienState.listPasienModel
        .where((element) => element.mrn == pasienState.normSelected);
    AuthState authState = context.watch<AuthBloc>().state;

    return BlocBuilder<ReportBloc, ReportState>(
      builder: (context, state) {
        if (state.status == ReportStatus.loadingReportCPPTPasien) {
          return Scaffold(
            backgroundColor: ThemeColor.transparentColor,
            body: Loading.expandedLoading(),
          );
        }

        if (state.status == ReportStatus.loadedReportCPPTPasien) {
          return Scaffold(
            backgroundColor: ThemeColor.transparentColor,
            body: Container(
              width: Get.width,
              height: Get.height,
              margin: EdgeInsets.all(2.sp),
              decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(
                    color: Colors.black,
                    width: 1,
                    style: BorderStyle.solid,
                  )),
            ),
          );
        }
        return Container();
      },
    );
  }
}
