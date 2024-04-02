import 'package:flutter/material.dart';
import 'package:hms_app/presentation/pages/igd/medis/asesmen_keperawatan_bidan_content_widget.dart';

class AsuhanKeperawatanContentWidget extends StatelessWidget {
  const AsuhanKeperawatanContentWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const AsesmenKeperawatanBidanContentWidget(
      menu: ["Menu", "Statu", "Dua"],
    );
  }
}
