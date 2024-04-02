import 'package:flutter/material.dart';
import 'package:hms_app/presentation/component/component.dart';
import 'package:hms_app/presentation/pages/widget/header_content_widget.dart';
import 'package:sizer/sizer.dart';

class IntervensiHDWidget extends StatelessWidget {
  const IntervensiHDWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return HeaderContentWidget(
        isENableAdd: true,
        onPressed: () {},
        title: "Simpan",
        widget: SingleChildScrollView(
          child: Column(
            children: [
              TitleWidget.titleContainer(title: "INTERVENSI"),
              SizedBox(height: 15.sp),
              // ====== //
              pilihanBox(title: "Atur posisi pasien nyaman sesuai kebutuhan"),
              pilihanBox(title: "Aukultasi bunyi jantung paru"),
              pilihanBox(title: "Target dialysis : ............."),
              pilihanBox(title: "Kaji kemampuan pasien mengelola cairan"),
              pilihanBox(
                  title:
                      "Kolaborasi : Pemberian O2, Obat, EKG, labortorium, transfusi darah*"),
              pilihanBox(
                  title: "Berikan edukasi program HD dan pengaturan cairan"),
              pilihanBox(
                  title:
                      "Inisasi, monitoring QB, QD, TA, TV, TMP, UFR, UFG, TTV"),
              pilihanBox(
                  title:
                      "Pantau intake output cairan, V. jugularis, edema tungkai/palpebra*"),
              pilihanBox(
                  title:
                      "Observasi ketikdaseimbangan eletrolit : kejang, perut kembung, tonus lemah, nyeri dada"),
              pilihanBox(title: "Timbang BB sebelum dan sesudah HD"),
              pilihanBox(title: "Beri makan porsi kecil dan sering"),
              pilihanBox(
                  title: "Kolaborasi untuk pemberian nutrisi parenteral"),
              pilihanBox(title: "Pertahankan oral higyene"),
              pilihanBox(title: "Terminasi HD sesuai indikasi"),
            ],
          ),
        ));
  }

  Container pilihanBox({required String title}) {
    return Container(
      color: Colors.white,
      padding: EdgeInsets.symmetric(horizontal: 5.sp),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: EdgeInsets.all(2.sp),
            height: 15.sp,
            width: 25.sp,
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(2.sp)),
                backgroundColor: ThemeColor.primaryColor,
                elevation: 1,
              ),
              child: Text(
                "✓",
                style: whiteCalibriTextStyle,
              ),
            ),
          ),
          Expanded(
              child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              title,
              style: blackTextStyle,
            ),
          )),
        ],
      ),
    );
  }
}
