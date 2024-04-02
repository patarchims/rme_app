import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:hms_app/domain/models/meta/meta_model.dart';
import 'package:hms_app/presentation/component/color/color_helper.dart';
import 'package:hms_app/presentation/component/fonts/font_helper.dart';
import 'package:hms_app/presentation/component/form/form_textfield_widget.dart';
import 'package:hms_app/presentation/component/res/colors.dart';
import 'package:sizer/sizer.dart';

class Alert {
  static Widget deleteResponse(
      {required String mesage, required void Function()? onPressed}) {
    return SizedBox(
      height: 100.sp,
      width: 150.sp,
      child: Scaffold(
        backgroundColor: ThemeColor.transparentColor,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text('Pesan',
                textAlign: TextAlign.center,
                style: primaryTextStyle.copyWith(
                    fontSize: 9.sp, color: ThemeColor.primaryColor)),
            Text(
              mesage,
              textAlign: TextAlign.center,
              style: greyTextStyle.copyWith(
                  fontSize: 8.sp, fontWeight: FontWeight.normal),
            ),
            Container(
              color: Colors.transparent,
              margin: EdgeInsets.only(top: 5.sp),
              height: 60,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 25.sp,
                    width: 60.sp,
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: ThemeColor.whiteColor,
                            elevation: 0,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5.sp),
                                side: const BorderSide(
                                    color: ThemeColor.primaryColor,
                                    width: 1,
                                    style: BorderStyle.solid))),
                        onPressed: onPressed,
                        child: Text(
                          "Tidak",
                          style: primaryTextStyle.copyWith(
                              fontWeight: FontWeight.bold,
                              fontSize: 8.sp,
                              color: ThemeColor.primaryColor),
                        )),
                  ),
                  const SizedBox(
                    width: 12,
                  ),
                  SizedBox(
                    height: 25.sp,
                    width: 60.sp,
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            elevation: 0,
                            backgroundColor: ThemeColor.primaryColor,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5),
                                side: const BorderSide(
                                    color: ThemeColor.primaryColor,
                                    width: 1,
                                    style: BorderStyle.solid))),
                        onPressed: () {
                          // context.read<AlergiBloc>().add(OnDeleteAlergi(
                          //     no: alergi.no,
                          //     noRM: singlePasien.first.mrn,
                          //     kelompok: alergi.kelompok,
                          //     insertDttm: alergi.insertDttm));

                          // context.read<AlergiBloc>().add(OnGetAlergiObatEvent(
                          //     noRM: singlePasien.first.mrn,
                          //     noReg: singlePasien.first.noreg));

                          Get.back();
                        },
                        child: Text(
                          "Ya",
                          style: whiteTextStyle.copyWith(
                            fontSize: 8.sp,
                          ),
                        )),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  // ALERT
  static badResponse(BuildContext context) async {
    final shouldPop =
        await Alert.warningMessage(context, subTitle: "Bad Response");
    return shouldPop ?? false;
  }

  static connectionTimeOut(BuildContext context) async {
    final shouldPop =
        await Alert.warningMessage(context, subTitle: "Connection time out");
    return shouldPop ?? false;
  }

  static disconnecToServer(BuildContext context) async {
    final shouldPop =
        await Alert.warningMessage(context, subTitle: "Disconect to server");
    return shouldPop ?? false;
  }

  static noConnection(BuildContext context) async {
    final shouldPop =
        await Alert.warningMessage(context, subTitle: "Tidak ada koneksi");
    return shouldPop ?? false;
  }

  static failure(BuildContext context, String message) async {
    final shouldPop = await Alert.warningMessage(context, subTitle: message);
    return shouldPop ?? false;
  }

  static dangerMessage({MetaModel? meta, String? message, Color? color}) {
    Get.snackbar(
      meta!.code.toString(),
      meta.message.toString(),
      duration: const Duration(seconds: 5),
      colorText: ThemeColor.whiteColor,
      snackStyle: SnackStyle.FLOATING,
      backgroundColor: color ?? const Color(0xFFD9435E).withOpacity(0.9),
      icon: const Center(
        child: Icon(
          CupertinoIcons.exclamationmark_circle_fill,
          color: ThemeColor.whiteColor,
        ),
      ),
      snackPosition: SnackPosition.TOP,
    );
  }

  static succes({String? message, MetaModel? meta}) {
    Get.snackbar(
      meta!.code.toString(),
      meta.message.toString(),
      colorText: ThemeColor.whiteColor,
      backgroundColor: const Color(0xFF198754).withOpacity(0.9),
      icon: const Center(
        child: Icon(
          CupertinoIcons.check_mark_circled_solid,
          color: ThemeColor.whiteColor,
        ),
      ),
      snackPosition: SnackPosition.TOP,
    );
  }

  static Future<bool?> showWarning(BuildContext context,
      {String title = 'Konfirmasi',
      String subTitle =
          "Apakah Anda yakin ingin keluar \ndari aplikasi ini ?"}) async {
    return showDialog<bool>(
        context: context,
        builder: (context) => AlertDialog(
              backgroundColor: Colors.white,
              title: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    textAlign: TextAlign.left,
                    style: primaryTextStyle.copyWith(
                        fontSize: 12.sp,
                        fontWeight: FontWeight.bold,
                        color: AppColors.text),
                  ),
                  SizedBox(
                    height: 6.sp,
                  ),
                  Text(
                    subTitle,
                    textAlign: TextAlign.left,
                    style: greyTextStyle.copyWith(
                        fontSize: 11.sp, fontWeight: FontWeight.normal),
                  ),
                ],
              ),
              content: SizedBox(
                height: 50,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      width: Get.width / 2 - 3.5 * 24,
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              elevation: 0,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(5),
                                  side: const BorderSide(
                                      color: ThemeColor.greenColor,
                                      width: 1,
                                      style: BorderStyle.solid))),
                          onPressed: () => Navigator.pop(context),
                          child: Text(
                            "Tidak",
                            style: primaryTextStyle.copyWith(
                                color: AppColors.primary,
                                fontWeight: FontWeight.bold),
                          )),
                    ),
                    const SizedBox(
                      width: 12,
                    ),
                    SizedBox(
                      width: Get.width / 2 - 3.5 * 24,
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              elevation: 0,
                              backgroundColor: ThemeColor.greenColor,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(5),
                                  side: const BorderSide(
                                      color: ThemeColor.greenColor,
                                      width: 1,
                                      style: BorderStyle.solid))),
                          onPressed: () {
                            if (Platform.isAndroid) {
                              exit(0);
                            } else if (Platform.isIOS) {
                              exit(0);
                            }
                          },
                          child: Text(
                            "Ya",
                            style: whiteTextStyle,
                          )),
                    ),
                  ],
                ),
              ),
            ));
  }

  static Future<bool?> optionRujukan(
      BuildContext context, List<Widget> column) async {
    return showDialog(
        context: context,
        builder: (BuildContext context) => RujukanDialog(
              column: column,
            ));
  }

  static Future<bool?> showWidgetDialog(BuildContext context,
      {required Widget widget}) async {
    return showDialog(
        context: context,
        builder: (BuildContext context) => WidgetDialog(
              widget: widget,
            ));
  }

  static Future<bool?> optionPOPUP(BuildContext context,
      {String title = 'Konfirmasi',
      Function()? onPressed,
      String subTitle =
          "Apakah Anda yakin ingin keluar \ndari aplikasi ini ?"}) async {
    return showDialog<bool>(
        context: context,
        builder: (context) => AlertDialog(
              title: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    textAlign: TextAlign.left,
                    style: primaryTextStyle.copyWith(
                        fontSize: 12.sp,
                        fontWeight: FontWeight.bold,
                        color: ThemeColor.greenColor),
                  ),
                  SizedBox(
                    height: 6.sp,
                  ),
                  Text(
                    subTitle,
                    textAlign: TextAlign.left,
                    style: greyTextStyle.copyWith(
                        fontSize: 11.sp, fontWeight: FontWeight.normal),
                  ),
                ],
              ),
              content: Container(
                color: Colors.transparent,
                height: 50,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      width: Get.width / 2 - 3.5 * 24,
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              elevation: 0,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(5),
                                  side: const BorderSide(
                                      color: ThemeColor.greenColor,
                                      width: 1,
                                      style: BorderStyle.solid))),
                          onPressed: () => Navigator.pop(context),
                          child: Text(
                            "Tidak",
                            style: primaryTextStyle.copyWith(
                                color: ThemeColor.greenColor,
                                fontWeight: FontWeight.bold),
                          )),
                    ),
                    const SizedBox(
                      width: 12,
                    ),
                    SizedBox(
                      width: Get.width / 2 - 3.5 * 24,
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              elevation: 0,
                              backgroundColor: ThemeColor.greenColor,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(5),
                                  side: const BorderSide(
                                      color: ThemeColor.greenColor,
                                      width: 1,
                                      style: BorderStyle.solid))),
                          onPressed: () {
                            if (onPressed != null) {
                              onPressed();
                            }
                          },
                          child: Text(
                            "Ya",
                            style: whiteTextStyle,
                          )),
                    ),
                  ],
                ),
              ),
            ));
  }

  static Future<bool?> warningMessage(BuildContext context,
      {String title = 'Peringatan',
      String subTitle =
          "Silahkan pilih tanggal daftar terlebih dahulu"}) async {
    return showDialog<bool>(
        context: context,
        builder: (context) => AlertDialog(
              backgroundColor: Colors.white,
              title: SizedBox(
                width: Get.width / 2,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      textAlign: TextAlign.left,
                      style: primaryTextStyle.copyWith(
                          fontSize: 12.sp, color: AppColors.text),
                    ),
                    SizedBox(
                      height: 6.sp,
                    ),
                    Text(
                      subTitle,
                      textAlign: TextAlign.left,
                      style: greyTextStyle.copyWith(
                          fontSize: 11.sp, fontWeight: FontWeight.normal),
                    ),
                  ],
                ),
              ),
              content: Container(
                color: Colors.transparent,
                height: 15.sp,
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        elevation: 0,
                        backgroundColor: AppColors.primary,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5),
                            side: const BorderSide(
                                color: AppColors.primary,
                                width: 1,
                                style: BorderStyle.solid))),
                    onPressed: () => Navigator.pop(context),
                    child: Text(
                      "OK",
                      style: whiteTextStyle,
                    )),
              ),
            ));
  }

  static Future<bool?> loaded(BuildContext context,
      {String? title, String? subTitle}) async {
    return showDialog<bool>(
        context: context,
        builder: (context) => AlertDialog(
              backgroundColor: Colors.white,
              title: SizedBox(
                width: Get.width / 2,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title ?? "",
                      textAlign: TextAlign.left,
                      style: primaryTextStyle.copyWith(
                          fontSize: 12.sp, color: AppColors.text),
                    ),
                    SizedBox(
                      height: 6.sp,
                    ),
                    Text(
                      subTitle ?? "",
                      textAlign: TextAlign.left,
                      style: greyTextStyle.copyWith(
                          fontSize: 11.sp, fontWeight: FontWeight.normal),
                    ),
                  ],
                ),
              ),
              content: Container(
                height: 20.sp,
                color: Colors.transparent,
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        elevation: 0,
                        backgroundColor: AppColors.primary,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5),
                            side: const BorderSide(
                                color: AppColors.primary,
                                width: 1,
                                style: BorderStyle.solid))),
                    onPressed: () => Navigator.pop(context),
                    child: Text(
                      "OK",
                      style: whiteTextStyle.copyWith(fontSize: 10.sp),
                    )),
              ),
            ));
  }

  static void singleButton(BuildContext context, String title, String subTitle,
      {Function? onTap}) {
    showDialog(
        context: context,
        builder: (context) => AlertDialog(
              backgroundColor: Theme.of(context).cardColor,
              title: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    title,
                    textAlign: TextAlign.center,
                    style: primaryTextStyle.copyWith(fontSize: 14),
                  ),
                  Text(
                    subTitle,
                    textAlign: TextAlign.center,
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                    style: greyTextStyle.copyWith(
                        fontSize: 12, fontWeight: FontWeight.normal),
                  ),
                ],
              ),
              content: Container(
                color: Theme.of(context).cardColor,
                height: 50,
                child: Center(
                  child: SizedBox(
                    width: Get.width / 2 - 3.5 * 24,
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: ThemeColor.primaryColor),
                        onPressed: () {
                          if (onTap != null) {
                            onTap();
                          } else {
                            // Get.offAll(() => const MustChangePasswordPage());
                          }
                        },
                        child: Text(
                          "Ya",
                          style: whiteTextStyle,
                        )),
                  ),
                ),
              ),
            ));
  }

  static Future<void> logOut({Function? onTap}) async {
    await Get.dialog(
        barrierDismissible: false,
        AlertDialog(
          backgroundColor: Colors.white,
          title: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'Keluar',
                textAlign: TextAlign.center,
                style: primaryTextStyle.copyWith(
                    fontSize: 9.sp, color: ThemeColor.primaryColor),
              ),
              Text(
                'Apakah Anda yakin ingin keluar \ndari aplikasi ini ?',
                textAlign: TextAlign.center,
                style: greyTextStyle.copyWith(
                  fontSize: 8.sp,
                  fontWeight: FontWeight.normal,
                ),
              ),
            ],
          ),
          content: Container(
            decoration: BoxDecoration(
                color: Colors.transparent,
                borderRadius: BorderRadius.circular(2.sp)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  width: Get.width / 4 - 3.5 * 24,
                  height: 20.sp,
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: ThemeColor.whiteColor,
                          elevation: 0,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(2.sp),
                              side: const BorderSide(
                                  color: ThemeColor.primaryColor,
                                  width: 1,
                                  style: BorderStyle.solid))),
                      onPressed: () {
                        Get.back();
                      },
                      child: Text(
                        "Tidak",
                        style: primaryTextStyle.copyWith(
                            fontWeight: FontWeight.bold,
                            fontSize: 8.sp,
                            color: ThemeColor.primaryColor),
                      )),
                ),
                const SizedBox(
                  width: 12,
                ),
                SizedBox(
                  height: 20.sp,
                  width: Get.width / 4 - 3.5 * 24,
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          elevation: 0,
                          backgroundColor: ThemeColor.primaryColor,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(2.sp),
                              side: const BorderSide(
                                  color: ThemeColor.primaryColor,
                                  width: 1,
                                  style: BorderStyle.solid))),
                      onPressed: () {
                        if (onTap != null) {
                          onTap();
                        }
                      },
                      child: Text(
                        "Ya",
                        style: whiteTextStyle.copyWith(
                          fontSize: 8.sp,
                        ),
                      )),
                ),
              ],
            ),
          ),
        ));
  }

  static Future<void> deleteData({Function? onTap, String? pesan}) async {
    await Get.dialog(
        barrierDismissible: false,
        AlertDialog(
          backgroundColor: Colors.white,
          title: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'Pesan',
                textAlign: TextAlign.center,
                style: primaryTextStyle.copyWith(
                    fontSize: 9.sp, color: ThemeColor.primaryColor),
              ),
              Text(
                pesan ?? 'Apakah Anda yakin ingin data ini ?',
                textAlign: TextAlign.center,
                style: greyTextStyle.copyWith(
                  fontSize: 8.sp,
                  fontWeight: FontWeight.normal,
                ),
              ),
            ],
          ),
          content: Container(
            color: Colors.transparent,
            height: 50,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  width: Get.width / 4 - 3.5 * 24,
                  height: 25.sp,
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: ThemeColor.whiteColor,
                          elevation: 0,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5.sp),
                              side: const BorderSide(
                                  color: ThemeColor.primaryColor,
                                  width: 1,
                                  style: BorderStyle.solid))),
                      onPressed: () {
                        Get.back();
                      },
                      child: Text(
                        "Tidak",
                        style: primaryTextStyle.copyWith(
                            fontWeight: FontWeight.bold,
                            fontSize: 8.sp,
                            color: ThemeColor.primaryColor),
                      )),
                ),
                const SizedBox(
                  width: 12,
                ),
                SizedBox(
                  height: 25.sp,
                  width: Get.width / 4 - 3.5 * 24,
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          elevation: 0,
                          backgroundColor: ThemeColor.primaryColor,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5),
                              side: const BorderSide(
                                  color: ThemeColor.primaryColor,
                                  width: 1,
                                  style: BorderStyle.solid))),
                      onPressed: () {
                        if (onTap != null) {
                          onTap();
                        }
                      },
                      child: Text(
                        "Ya",
                        style: whiteTextStyle.copyWith(
                          fontSize: 8.sp,
                        ),
                      )),
                ),
              ],
            ),
          ),
        ));
  }
}

class WidgetDialog extends StatelessWidget {
  final Widget widget;
  const WidgetDialog({
    super.key,
    required this.widget,
  });

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.0)),
      elevation: 0.0,
      backgroundColor: Colors.transparent,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 6.sp),
        child: Stack(
          children: [
            widget,
            Positioned(
              right: 0.0,
              child: GestureDetector(
                onTap: () {
                  Navigator.of(context).pop();
                },
                child: const Align(
                  alignment: Alignment.topRight,
                  child: CircleAvatar(
                    radius: 14.0,
                    backgroundColor: Colors.red,
                    child: Icon(
                      Icons.close,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class RujukanDialog extends StatelessWidget {
  final List<Widget> column;

  const RujukanDialog({
    super.key,
    required this.column,
  });

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.0)),
      elevation: 0.0,
      backgroundColor: Colors.transparent,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 6.sp),
        // margin: EdgeInsets.symmetric(horizontal: ),
        // margin: const EdgeInsets.only(left: 0.0,right: 0.0),
        child: SingleChildScrollView(
            child: Stack(
          children: [
            Container(
              margin: const EdgeInsets.only(top: 13.0, right: 8.0),
              decoration: BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.rectangle,
                  borderRadius: BorderRadius.circular(16.0),
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.black26,
                      blurRadius: 0.0,
                      offset: Offset(0.0, 0.0),
                    ),
                  ]),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.all(6.sp),
                    decoration: BoxDecoration(
                        color: ThemeColor.greenColor,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(10.sp),
                            topRight: Radius.circular(10.sp))),
                    child: Center(
                      child: Text(
                        "List Rujukan",
                        style: blackTextStyle.copyWith(
                            fontWeight: FontWeight.bold, color: Colors.white),
                      ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 6.sp),
                  ),
                  Column(
                    children: column,
                  ),
                  SizedBox(
                    height: 16.sp,
                  ),
                ],
              ),
            ),
            Positioned(
              right: 0.0,
              child: GestureDetector(
                onTap: () {
                  Navigator.of(context).pop();
                },
                child: const Align(
                  alignment: Alignment.topRight,
                  child: CircleAvatar(
                    radius: 14.0,
                    backgroundColor: Colors.red,
                    child: Icon(
                      Icons.close,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
          ],
        )),
      ),
    );
  }
}

class CustomDialog extends StatelessWidget {
  final String value;
  final String alasanPembatalan;
  final Function(String)? onChanged;
  final Function()? onPressed;

  const CustomDialog({
    Key? key,
    required this.value,
    required this.alasanPembatalan,
    this.onChanged,
    this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.0)),
      elevation: 0.0,
      backgroundColor: Colors.transparent,
      child: dialogContent(context,
          value: value,
          alasanPembatalan: alasanPembatalan,
          onChanged: onChanged,
          onPressed: onPressed),
    );
  }

  Widget dialogContent(BuildContext context,
      {required String value,
      required String alasanPembatalan,
      Function(String)? onChanged,
      Function()? onPressed}) {
    return Container(
      margin: const EdgeInsets.only(left: 0.0, right: 0.0),
      child: SingleChildScrollView(
        child: Stack(
          children: <Widget>[
            Container(
              padding: const EdgeInsets.only(
                top: 18.0,
              ),
              margin: const EdgeInsets.only(top: 13.0, right: 8.0),
              decoration: BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.rectangle,
                  borderRadius: BorderRadius.circular(16.0),
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.black26,
                      blurRadius: 0.0,
                      offset: Offset(0.0, 0.0),
                    ),
                  ]),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  SizedBox(
                    height: 12.sp,
                  ),
                  Center(
                    child: Text(
                      "Pembatalan Antrean",
                      style:
                          blackTextStyle.copyWith(fontWeight: FontWeight.bold),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 6.sp),
                  ),
                  const SizedBox(height: 24.0),
                  Container(
                      margin: EdgeInsets.only(left: 16.sp),
                      child: Text(
                        "Kode Booking",
                        style: whiteTextStyle.copyWith(
                            fontWeight: FontWeight.bold,
                            color: ThemeColor.greenColor),
                      )),
                  Container(
                    margin: EdgeInsets.only(bottom: 12.sp, top: 2.sp),
                    padding: EdgeInsets.symmetric(horizontal: 12.sp),
                    child: FormWidget.textForm(enable: true, value: value),
                  ),
                  Container(
                      margin: EdgeInsets.only(left: 16.sp),
                      child: Text(
                        "Alasan Pembatalan",
                        style: whiteTextStyle.copyWith(
                            fontWeight: FontWeight.bold,
                            color: ThemeColor.greenColor),
                      )),
                  Container(
                    margin: EdgeInsets.only(bottom: 12.sp, top: 2.sp),
                    padding: EdgeInsets.symmetric(horizontal: 12.sp),
                    child: FormWidget.textForm(
                        enable: true,
                        onChanged: onChanged,
                        value: alasanPembatalan),
                  ),
                  Center(
                    child: SizedBox(
                      width: Get.width / 3.2,
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            elevation: 2.sp,
                            shape: RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(6.sp)),
                            ),
                            backgroundColor: ThemeColor.dangerColor,
                          ),
                          onPressed: onPressed,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              FaIcon(FontAwesomeIcons.xmark,
                                  color: Colors.white, size: 12.sp),
                              SizedBox(
                                width: 3.sp,
                              ),
                              Text(
                                "Batalkan",
                                style: whiteTextStyle,
                              ),
                            ],
                          )),
                    ),
                  ),
                  SizedBox(
                    height: 16.sp,
                  ),
                ],
              ),
            ),
            Positioned(
              right: 0.0,
              child: GestureDetector(
                onTap: () {
                  Navigator.of(context).pop();
                },
                child: const Align(
                  alignment: Alignment.topRight,
                  child: CircleAvatar(
                    radius: 14.0,
                    backgroundColor: Colors.red,
                    child: Icon(
                      Icons.close,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
