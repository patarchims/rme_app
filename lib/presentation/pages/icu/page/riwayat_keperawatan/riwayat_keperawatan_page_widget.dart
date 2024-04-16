import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hms_app/domain/bloc/dashboard/pasien/pasien_bloc.dart';
import 'package:hms_app/domain/bloc/user/auth/auth_bloc.dart';
import 'package:hms_app/presentation/component/component.dart';
import 'package:hms_app/presentation/pages/widget/header_content_widget.dart';

class RiwayatKeperawatanIntensivePageWidget extends StatefulWidget {
  const RiwayatKeperawatanIntensivePageWidget({super.key});

  @override
  State<RiwayatKeperawatanIntensivePageWidget> createState() =>
      _RiwayatKeperawatanPageWidgetState();
}

class _RiwayatKeperawatanPageWidgetState
    extends State<RiwayatKeperawatanIntensivePageWidget> {
  final ScrollController _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    AuthState authState = context.watch<AuthBloc>().state;
    PasienState pasienState = context.watch<PasienBloc>().state;
    final singlePasien = pasienState.listPasienModel
        .where((element) => element.mrn == pasienState.normSelected);

    return HeaderContentWidget(
        widget: RawScrollbar(
      thumbColor: ThemeColor.darkColor,
      thumbVisibility: true,
      interactive: true,
      thickness: 10.sp,
      controller: _scrollController,
      trackVisibility: false,
      radius: Radius.circular(5.sp),
      child: const SingleChildScrollView(
        child: Column(
          children: [
            //====//
          ],
        ),
      ),
    ));
  }
}
