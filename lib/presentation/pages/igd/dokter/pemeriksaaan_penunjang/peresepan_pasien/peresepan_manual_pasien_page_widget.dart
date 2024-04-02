import 'package:flutter/material.dart';
import 'package:hms_app/presentation/component/component.dart';
import 'package:hms_app/presentation/pages/widget/header_content_widget.dart';
import 'package:sizer/sizer.dart';

class PeresepanManualPasienPageWidget extends StatelessWidget {
  const PeresepanManualPasienPageWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return HeaderContentWidget(
      backgroundColor: ThemeColor.bgColor,
      isENableAdd: true,
      widget: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.symmetric(horizontal: 5.sp),
              child: FormWidget.textArea(
                  onChanged: (value) {
                    // context
                    //     .read<ResepBloc>()
                    //     .add(OnChangeInformasiResepEvent(value: value));
                  },
                  hinText: "Tambahkan deskripsi Resep Manual",
                  maxLines: 20,
                  value: "state.informasiResep",
                  enabled: true),
            ),
          ],
        ),
      ),
    );
  }
}
