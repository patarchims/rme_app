import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hms_app/presentation/component/color/color_helper.dart';
import 'package:hms_app/presentation/component/fonts/font_helper.dart';
import 'package:hms_app/presentation/component/shimer/shimer_loading.dart';
import 'package:sizer/sizer.dart';

class LoadingUserProfileWidget extends StatelessWidget {
  const LoadingUserProfileWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Container(
          height: 20.sp,
          width: Get.width,
          padding: EdgeInsets.only(left: 12.sp),
          margin: EdgeInsets.symmetric(horizontal: 8.sp),
          decoration: BoxDecoration(
              color: ThemeColor.primaryColor,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(4.sp),
                  topRight: Radius.circular(4.sp))),
          child: Align(
            alignment: Alignment.centerLeft,
            child: Row(
              children: [
                Text(
                  "Informasi Pasien Tersebut !",
                  textAlign: TextAlign.right,
                  style: whiteTextStyle,
                ),
                SizedBox(
                  width: 5.sp,
                ),
                SizedBox(
                  height: 16.sp,
                  width: Get.width / 5.5,
                  child: ShimerLoading.loadingTextField(),
                )
              ],
            ),
          ),
        ),
        Row(
          children: [
            Container(
              width: Get.width / 3.2,
              padding: EdgeInsets.symmetric(horizontal: 6.sp, vertical: 4.sp),
              margin: EdgeInsets.only(top: 4.sp, right: 4.sp, left: 4.sp),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(4.sp),
                color: ThemeColor.primaryColor,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  feld(
                    title: "Debitur ",
                  ),
                  SizedBox(height: 2.sp),
                  Row(
                    children: [
                      Expanded(
                        flex: 1,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  "M.R.N    ",
                                  textAlign: TextAlign.left,
                                  style:
                                      whiteTextStyle.copyWith(fontSize: 5.5.sp),
                                ),
                                SizedBox(width: 30.sp),
                                Expanded(
                                  flex: 1,
                                  child: SizedBox(
                                    height: 16.sp,
                                    child: ShimerLoading.loadingTextField(),
                                  ),
                                ),
                                SizedBox(width: 2.sp),
                              ],
                            ),
                            SizedBox(height: 2.sp),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  "NO. KTP",
                                  textAlign: TextAlign.left,
                                  style:
                                      whiteTextStyle.copyWith(fontSize: 5.5.sp),
                                ),
                                SizedBox(width: 30.sp),
                                Expanded(
                                  flex: 1,
                                  child: SizedBox(
                                    height: 16.sp,
                                    child: ShimerLoading.loadingTextField(),
                                  ),
                                ),
                                SizedBox(width: 2.sp),
                              ],
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 16.sp * 2,
                        width: 50,
                        child: ShimerLoading.loadingTextField(),
                      )
                    ],
                  ),
                  SizedBox(height: 2.sp),
                  feld(title: "NOKA-BPJS"),
                  SizedBox(height: 2.sp),
                  feld(title: "Nama Pasien"),
                  SizedBox(height: 2.sp),
                  feld(
                    title: "Tempat Lahir",
                  ),
                  SizedBox(height: 2.sp),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Expanded(
                        flex: 1,
                        child: Text(
                          "Tgl Lahir/Sex",
                          textAlign: TextAlign.left,
                          style: whiteTextStyle.copyWith(fontSize: 5.5.sp),
                        ),
                      ),
                      SizedBox(width: 3.sp),
                      Expanded(
                        child: SizedBox(
                          height: 16.sp,
                          child: ShimerLoading.loadingTextField(),
                        ),
                      ),
                      SizedBox(width: 3.sp),
                      SizedBox(
                          height: 16.sp,
                          width: 45.sp,
                          child: ShimerLoading.loadingTextField()),
                    ],
                  ),
                  SizedBox(height: 2.sp),
                  feld(
                    title: "Umur Hari ini",
                  ),
                  SizedBox(height: 2.sp),
                  feld(
                    title: "Status",
                  ),
                  SizedBox(height: 2.sp),
                  feld(
                    title: "Agama",
                  ),
                  SizedBox(height: 2.sp),
                  feld(
                    title: "Suku",
                  ),
                ],
              ),
            ),
            Container(
              width: Get.width / 3.2,
              padding: EdgeInsets.symmetric(horizontal: 6.sp, vertical: 12.sp),
              margin: EdgeInsets.only(
                top: 4.sp,
                right: 4.sp,
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(4.sp),
                color: ThemeColor.primaryColor,
              ),
              child: Column(
                children: [
                  SizedBox(height: 4.sp),
                  feld(
                    title: "Negara Asal",
                  ),
                  SizedBox(height: 2.sp),
                  feld(
                    title: "Provinsi Asal",
                  ),
                  SizedBox(height: 2.sp),
                  feld(
                    title: "Kabupaten/Kota",
                  ),
                  SizedBox(height: 2.sp),
                  feld(
                    title: "Kecamatan",
                  ),
                  SizedBox(height: 2.sp),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Expanded(
                        flex: 1,
                        child: Text(
                          "Kelurahan\nRT/RW",
                          textAlign: TextAlign.left,
                          style: whiteTextStyle.copyWith(fontSize: 5.5.sp),
                        ),
                      ),
                      SizedBox(width: 2.sp),
                      SizedBox(
                        width: 60.sp,
                        height: 16.sp,
                        child: ShimerLoading.loadingTextField(),
                      ),
                      SizedBox(width: 2.sp),
                      SizedBox(
                        height: 16.sp,
                        width: 35.sp,
                        child: ShimerLoading.loadingTextField(),
                      ),
                    ],
                  ),
                  SizedBox(height: 2.sp),
                  feldAlamat(
                    title: "Alamat Pasien Sesuai KTP",
                  ),
                  SizedBox(height: 2.sp),
                  feldAlamat(
                    title: "Alamat Tinggal Sesuai Domisili",
                  ),
                  SizedBox(height: 2.sp),
                  feld(
                    title: "No.HP/Telepon",
                  ),
                  SizedBox(height: 2.sp),
                  feld(
                    title: "Pend/Pekerjan",
                  ),
                ],
              ),
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: Get.height - 180.sp,
                    padding:
                        EdgeInsets.symmetric(horizontal: 4.sp, vertical: 4.sp),
                    margin: EdgeInsets.only(
                      top: 4.sp,
                      right: 4.sp,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4.sp),
                      color: ThemeColor.primaryColor,
                    ),
                    // DETAIL PASIEN
                    child: SizedBox(
                      height: Get.height,
                      width: Get.width,
                      child: ShimerLoading.loadingCard(),
                    ),
                  ),
                  Container(
                    height: Get.height - 220.sp,
                    padding:
                        EdgeInsets.symmetric(horizontal: 2.sp, vertical: 2.sp),
                    margin: EdgeInsets.only(
                      top: 4.sp,
                      right: 4.sp,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4.sp),
                      color: ThemeColor.primaryColor,
                    ),
                    child: Card(
                      color: Colors.transparent,
                      elevation: 0,
                      shape: const RoundedRectangleBorder(
                        side: BorderSide(color: Colors.white),
                        borderRadius: BorderRadius.all(Radius.circular(12)),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(left: 6.sp, top: 3.sp),
                            child: Text(
                              'Contact Person - Data Penjamin Pasien',
                              style: whiteCalibriTextStyle.copyWith(
                                  fontSize: 7.sp),
                            ),
                          ),
                          SizedBox(
                            height: 6.sp,
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(
                              horizontal: 4.sp,
                            ),
                            child: feld(
                              title: "Nama",
                            ),
                          ),
                          SizedBox(height: 1.sp),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 4.sp),
                            child: feld(
                              title: "Contact Number",
                            ),
                          ),
                          SizedBox(height: 1.sp),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 4.sp),
                            child: feld(
                              title: "Hubungan",
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        SizedBox(
          height: 4.sp,
        ),

        // NOTE
        Container(
          height: 20.sp,
          padding: EdgeInsets.symmetric(horizontal: 6.sp),
          margin: EdgeInsets.symmetric(horizontal: 8.sp),
          decoration: BoxDecoration(
              color: ThemeColor.primaryColor,
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(4.sp),
                  bottomRight: Radius.circular(4.sp))),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                "DPTJP Tersebut : ",
                textAlign: TextAlign.right,
                style: whiteTextStyle,
              ),
              SizedBox(
                height: 16.sp,
                width: Get.width / 5.5,
                child: ShimerLoading.loadingTextField(),
              ),
              Text(
                "Pelayanan : ",
                textAlign: TextAlign.right,
                style: whiteTextStyle,
              ),
              SizedBox(
                height: 16.sp,
                width: Get.width / 5.5,
                child: ShimerLoading.loadingTextField(),
              )
            ],
          ),
        ),
        SizedBox(
          height: 4.sp,
        ),
      ],
    );
  }
}

Row feld({required String title}) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      Expanded(
        child: Text(
          title,
          textAlign: TextAlign.left,
          style: whiteTextStyle.copyWith(fontSize: 5.5.sp),
        ),
      ),
      SizedBox(
        width: 12.sp,
      ),
      SizedBox(
        height: 16.sp,
        width: Get.width / 5.5,
        child: ShimerLoading.loadingTextField(),
      )
    ],
  );
}

Row feldAlamat({required String title}) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      Expanded(
        child: Text(
          title,
          textAlign: TextAlign.left,
          style: whiteTextStyle.copyWith(fontSize: 5.5.sp),
        ),
      ),
      SizedBox(
          height: 23.sp,
          width: Get.width / 5.5,
          child: ShimerLoading.loadingTextField())
    ],
  );
}
