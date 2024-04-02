import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hms_app/domain/bloc/dashboard/pemeriksaan_fisik/pemeriksaan_fisik_bloc.dart';
import 'package:hms_app/presentation/component/loading/loading.dart';
import 'package:hms_app/presentation/pages/bangsal/perawat/asesmen_awal/pemeriksaan_fisik_igd_widget.dart';

class PemeriksaanFisikContentWidget extends StatelessWidget {
  const PemeriksaanFisikContentWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PemeriksaanFisikBloc, PemeriksaanFisikState>(
      builder: (context, state) {
        return (state.isLoadingGetPemeriksaanFisikBangsal)
            ? Loading.expandedLoading()
            : const PemeriksaanFisikIGDContentWidgetView();
      },
    );
  }
}
