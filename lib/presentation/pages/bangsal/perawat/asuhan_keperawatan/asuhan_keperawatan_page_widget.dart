import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hms_app/domain/bloc/dashboard/asesmen_keperawatan_bidan/asesmen_keperawatan_bidan_bloc.dart';
import 'package:hms_app/presentation/pages/bangsal/perawat/asuhan_keperawatan/deskripsi_luaran_slki_content_widget.dart';
import 'package:hms_app/presentation/pages/bangsal/perawat/asuhan_keperawatan/deskripsi_siki_content_widget.dart';
import 'package:hms_app/presentation/pages/igd/keperawatan/masalah_keperawatan_page_widget.dart';
import 'package:hms_app/presentation/pages/igd/keperawatan/selesai_diagnosa_widget.dart';

class AsuhanKeperawatanPageWidget extends StatelessWidget {
  const AsuhanKeperawatanPageWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AsesmenKeperawatanBidanBloc,
        AsesmenKeperawatanBidanState>(
      listener: (context, state) {},
      builder: (context, state) {
        // ====== //
        if (state.pilihDiagnosaKeperawatan ==
            PilihDiagnosaKeperawatan.diagnosa) {
          return const MasalahKeperawatanWidget();
        }
        if (state.pilihDiagnosaKeperawatan ==
            PilihDiagnosaKeperawatan.selesai) {
          return const SelesaiDiagnosaWidget();
        }

        if (state.pilihDiagnosaKeperawatan ==
            PilihDiagnosaKeperawatan.keluaran) {
          return const DeskripsiLuaranSlkiContentWidget();
        }

        if (state.pilihDiagnosaKeperawatan ==
            PilihDiagnosaKeperawatan.intervensi) {
          return const DeskripsiSikiContentWidget();
        }

        return Container();
      },
    );
  }
}
