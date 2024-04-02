import 'package:flutter/material.dart';
import 'package:hms_app/presentation/component/component.dart';
import 'package:hms_app/presentation/pages/widget/header_content_widget.dart';
import 'package:sizer/sizer.dart';

class TujuanHDContentWidget extends StatelessWidget {
  const TujuanHDContentWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return HeaderContentWidget(
        isENableAdd: true,
        onPressed: () {},
        title: "Simpan",
        widget: SingleChildScrollView(
          child: Column(
            children: [
              TitleWidget.titleContainer(title: "TUJUAN"),
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
                        "Tidak ada : Sesak, edema, rinchi, efusi pleura, distensi vena jugularis, acites*",
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
                        "TTV, Elektrolit dan Albumin dalam batas normal*",
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
                        "Target UF sesuai rencana*",
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
                        "Intake dan Output cairan sesuai yang diharapkan*",
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
                        "Nyeri dada, kejang, pusing tidak ada**",
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
                        "Gambaran EKG normal*",
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
                        "Hb dalam batas toleransi*",
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
                        "Peningkatan asupan makanan",
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
                        "BB normal",
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
