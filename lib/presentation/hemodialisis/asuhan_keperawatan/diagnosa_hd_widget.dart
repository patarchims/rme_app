import 'package:flutter/material.dart';
import 'package:hms_app/presentation/component/component.dart';
import 'package:hms_app/presentation/pages/widget/header_content_widget.dart';
import 'package:sizer/sizer.dart';

class DiagnosaHDWidget extends StatelessWidget {
  const DiagnosaHDWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return HeaderContentWidget(
        isENableAdd: true,
        onPressed: () {},
        title: "Simpan",
        widget: SingleChildScrollView(
          child: Column(
            children: [
              TitleWidget.titleContainer(title: "DIAGNOSA KEPERAWATAN"),
              SizedBox(height: 15.sp),
              // ====== //
              Container(
                color: Colors.white,
                padding: EdgeInsets.symmetric(horizontal: 5.sp),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: EdgeInsets.all(2.sp),
                      height: 25.sp,
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
                        "1. Resiko tinggi / Aktual Gangguan * keseimbangan cairan, elektrolit lebih kurang* b/d : \n▣Ketidakmampuan ginjal mengeluarkan cairan/elektrolit*\n▣Ketidakpatuhan mengitukut program HD\n▣Pengeluaran dialysis tidak adekuat",
                        style: blackTextStyle,
                      ),
                    )),
                  ],
                ),
              ),
              Container(
                color: Colors.white,
                padding: EdgeInsets.symmetric(horizontal: 5.sp),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: EdgeInsets.all(2.sp),
                      height: 25.sp,
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
                        "2. Gangguan pola nafas b/d hiperventilasi, hipoventilasi dan overload. Karakteristik \n▣Sesak napas, RR meningkat, ronchi (+)\n▣Hb menurun, tachycardia",
                        style: blackTextStyle,
                      ),
                    )),
                  ],
                ),
              ),
              Container(
                color: Colors.white,
                padding: EdgeInsets.symmetric(horizontal: 5.sp),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: EdgeInsets.all(2.sp),
                      height: 25.sp,
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
                        "3. Gangguan perfusi jaringan perifer b/d berkurangnya suplai Oksigen ke kapiler. Karakteristik : \n▣Keringan dingin, pusing, takikardi, Hipotensi*\n▣Sesak napas, Hb turun*",
                        style: blackTextStyle,
                      ),
                    )),
                  ],
                ),
              ),
              Container(
                color: Colors.white,
                padding: EdgeInsets.symmetric(horizontal: 5.sp),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: EdgeInsets.all(2.sp),
                      height: 25.sp,
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
                        "4. Gangguan pemenuhan nutrisi kurang dari kebutuhan tubu b/d anoreksia. Kareakteristik : \n▣Mual, muntah* \n▣BB turun 10% atau lebih dari BB kering \n▣Intake makan kurang dari porsi yang disediakan\n▣Kadar Hb, protein, albumin, globulin rendah",
                        style: blackTextStyle,
                      ),
                    )),
                  ],
                ),
              ),
              Container(
                color: Colors.white,
                padding: EdgeInsets.symmetric(horizontal: 5.sp),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: EdgeInsets.all(2.sp),
                      height: 25.sp,
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
                        "5. Gangguan Rasa nyaman : nyeri",
                        style: blackTextStyle,
                      ),
                    )),
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}
