import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hms_app/presentation/component/component.dart';
import 'package:hms_app/presentation/hemodialisis/asesmen_keperawatan/tambah_implementasi_keperawatan_widget.dart';

class ImplementasiKeperawatanPageWidget extends StatelessWidget {
  const ImplementasiKeperawatanPageWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ThemeColor.transparentColor,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // TAMBAHKAN DATA
          CustomDialogWidget.getDialog(
              widget: const AddImplementasiKeperawatanWidget(),
              color: Colors.transparent);
        },
        backgroundColor: ThemeColor.primaryColor,
        child: const Icon(
          FontAwesomeIcons.plus,
          color: Colors.white,
        ),
      ),
      body: const SingleChildScrollView(
        child: Column(
          children: [],
        ),
      ),
    );
  }
}
