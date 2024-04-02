import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:hms_app/presentation/component/color/color_helper.dart';
import 'package:hms_app/presentation/component/loading/loading.dart';
import 'package:hms_app/presentation/pages/icu/bloc/pemeriksaan_fisik_icu/pemeriksaan_fisik_icu_bloc.dart';

class PemeriksaanFisikIcuPageWidget extends StatelessWidget {
  const PemeriksaanFisikIcuPageWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<PemeriksaanFisikIcuBloc, PemeriksaanFisikIcuState>(
      listener: (context, state) {},
      builder: (context, state) {
        if (state.status == PemeriksaanFisikIcuStatus.isLoadingGet) {
          return Scaffold(
            backgroundColor: ThemeColor.transparentColor,
            body: SizedBox(
              width: Get.width,
              height: Get.height,
              child: Loading.expandedLoading(),
            ),
          );
        }

        return Container();
      },
    );
  }
}
