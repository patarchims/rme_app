import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:hms_app/presentation/component/component.dart';
import 'package:sizer/sizer.dart';
import 'package:table_desk/table_desk.dart';

class TitleWidget {
  static Row judul({required String title, String? subTitle}) {
    return Row(
      children: [
        SizedBox(
          child: Text(
            title,
            style: blackTextStyle.copyWith(fontSize: 6.sp),
          ),
        ),
        SizedBox(
          child: Text(
            "            : ${subTitle.toString()}",
            style: blackTextStyle.copyWith(fontSize: 6.sp),
          ),
        )
      ],
    );
  }

  static TableRow boxTitle({
    required String judul1,
    required String judul2,
  }) {
    return TableRow(children: [
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(
          judul1,
          textAlign: TextAlign.left,
          style: blackTextStyle.copyWith(fontSize: 6.sp),
        ),
      ),
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(
          ": $judul2",
          textAlign: TextAlign.left,
          style: blackTextStyle.copyWith(fontSize: 6.sp),
        ),
      ),
    ]);
  }

  static Container titleText(
      {required String title, required String subTitle}) {
    return Container(
      color: Colors.white,
      padding: EdgeInsets.symmetric(horizontal: 5.sp),
      child: TableDesk(
        shape: const RoundedRectangleBorder(
          side: BorderSide(color: Colors.white, width: 1),
        ),
        child: TableDeskRow(
          border: const BorderSide(width: 1, color: Colors.white),
          gaps: [
            TableGap.width(150),
            TableGap.width(10),
            TableGap.weight(),
          ],
          children: [
            Container(
                color: Colors.white,
                child: Text(
                  title,
                  style: blackTextStyle.copyWith(fontSize: 5.sp),
                )),
            Container(
              color: Colors.white,
              child: Text(
                ":",
                style: blackTextStyle.copyWith(fontSize: 5.sp),
              ),
            ),
            Container(
              color: Colors.white,
              child: Text(
                subTitle,
                style: blackTextStyle.copyWith(fontSize: 5.sp),
              ),
            )
          ],
        ),
      ),
    );
  }

  static Container titleContainer({
    required String title,
  }) {
    return Container(
      width: Get.width,
      height: 20.sp,
      decoration: BoxDecoration(
        color: ThemeColor.blueColor.withOpacity(0.5),
      ),
      child: Center(
        child: Text(
          title,
          style: blackTextStyle.copyWith(
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  static Container headerTitle({required String title, Color? color}) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 3.sp, horizontal: 3.sp),
      decoration: BoxDecoration(color: color ?? Colors.yellow.withOpacity(0.5)),
      child: Center(
        child: Text(
          title,
          style: blackTextStyle.copyWith(
              fontWeight: FontWeight.bold, fontSize: 5.sp),
        ),
      ),
    );
  }

  static Container contentTitle({required String title, Color? color}) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 2.sp, horizontal: 2.sp),
      decoration: BoxDecoration(color: color ?? Colors.white.withOpacity(0.5)),
      child: Center(
        child: Text(
          title,
          style: blackTextStyle.copyWith(fontSize: 4.sp),
        ),
      ),
    );
  }

  //=====//
  static Container isChecklist({
    required bool check,
  }) {
    return Container(
      decoration:
          BoxDecoration(color: ThemeColor.primaryColor.withOpacity(0.2)),
      child: (check)
          ? Padding(
              padding: const EdgeInsets.all(8.0),
              child: Icon(FontAwesomeIcons.check,
                  size: 10.sp, color: ThemeColor.greenColor.withOpacity(0.5)),
            )
          : Padding(
              padding: const EdgeInsets.all(8.0),
              child: Icon(FontAwesomeIcons.minus,
                  size: 10.sp, color: ThemeColor.blackColor),
            ),
    );
  }

  static Container headerTitleNoPadding({required String title, Color? color}) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 2.sp),
      decoration: BoxDecoration(color: color ?? Colors.yellow.withOpacity(0.5)),
      child: Center(
        child: Text(
          title,
          style: blackTextStyle.copyWith(fontWeight: FontWeight.bold),
        ),
      ),
    );
  }

  static Container headerTitleLeft(
      {required String title, Color? color, TextStyle? blackTextStyle}) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 2.sp, horizontal: 5.sp),
      decoration: BoxDecoration(color: color ?? Colors.yellow.withOpacity(0.5)),
      child: Text(
        title,
        textAlign: TextAlign.left,
        style: blackTextStyle ?? blackTextStyle,
      ),
    );
  }

  static Container contentButtonWidget({required Widget button}) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 2.sp),
      decoration:
          BoxDecoration(color: ThemeColor.primaryColor.withOpacity(0.2)),
      child: Center(
        child: button,
      ),
    );
  }

  static Container deskripsiContainer({
    required String title,
    required String title2,
  }) {
    return Container(
      width: Get.width,
      decoration: BoxDecoration(
        color: ThemeColor.blueColor.withOpacity(0.2),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Divider(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Text(
              title,
              style: blackTextStyle.copyWith(fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(
            width: Get.width / 2,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Text(
                title2,
                style: blackTextStyle,
              ),
            ),
          ),
          const Divider(),
        ],
      ),
    );
  }

  static Container titleContainerAsuhanKeperawatan({
    required String title,
    required String title2,
  }) {
    return Container(
      width: Get.width,
      decoration: const BoxDecoration(color: Color(0xFFB0CF94)),
      child: Column(
        children: [
          const Divider(),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  title,
                  style: blackTextStyle.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  title2,
                  style: blackTextStyle.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          const Divider(),
        ],
      ),
    );
  }

  static Container titleContentWidget({
    required String title,
  }) {
    return Container(
      width: Get.width,
      padding: EdgeInsets.all(3.sp),
      decoration: const BoxDecoration(color: ThemeColor.primaryColor),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(title,
                    style: blackTextStyle.copyWith(
                        fontWeight: FontWeight.bold, color: Colors.white)),
              ],
            ),
          ),
        ],
      ),
    );
  }

  static Card boxChoose(
      {required void Function()? onPressed,
      Color? backgroundColor,
      double? width,
      required Widget icon,
      required String title}) {
    return Card(
        color: ThemeColor.blueColor,
        child: Container(
          padding: EdgeInsets.all(3.sp),
          width: width ?? 100.sp,
          child: Center(
            child: ListTile(
              leading: SizedBox(
                  height: 20.sp,
                  child: ElevatedButton(
                    onPressed: onPressed,
                    style: ElevatedButton.styleFrom(
                        backgroundColor: backgroundColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(2.sp),
                        )),
                    child: icon,
                  )),
              title: Text(
                title,
                style: whiteTextStyle.copyWith(fontSize: 6.sp),
              ),
            ),
          ),
        ));
  }

  static Padding boxPemeriksaanFisik({
    required String title,
    String? value,
    bool? enabled,
    dynamic Function(String)? onChanged,
  }) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 55.sp,
            child: Text(
              title,
              textAlign: TextAlign.left,
              style: blackTextStyle,
            ),
          ),
          Expanded(
            child: SizedBox(
              child: FormWidget.textArea(
                  enabled: enabled ?? true,
                  value: value,
                  onChanged: onChanged,
                  maxLines: 2,
                  hinText: ""),
            ),
          )
        ],
      ),
    );
  }

  static Padding boxPemeriksaanFisikSugestion({
    required String title,
    double? width,
    double? padding,
    required Widget widget,
  }) {
    return Padding(
      padding: EdgeInsets.all(padding ?? 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: width ?? 55.sp,
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                title,
                textAlign: TextAlign.left,
                style: blackTextStyle.copyWith(fontSize: 6.sp),
              ),
            ),
          ),
          Expanded(
            child: widget,
          )
        ],
      ),
    );
  }

  static Padding boxVitalSign({
    required String title,
    required String subTitle,
    double? width,
    required Widget widget,
  }) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            padding: EdgeInsets.all(3.sp),
            width: width ?? 55.sp,
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                title,
                textAlign: TextAlign.left,
                style: blackTextStyle.copyWith(fontSize: 4.5.sp),
              ),
            ),
          ),
          Expanded(
            child: widget,
          ),
          Container(
            padding: EdgeInsets.all(3.sp),
            width: 25.sp,
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                subTitle,
                textAlign: TextAlign.left,
                style: blackTextStyle.copyWith(fontSize: 4.5.sp),
              ),
            ),
          ),
        ],
      ),
    );
  }

  static Container headerLeftTitle({required String title, Color? color}) {
    return Container(
      height: 15.sp,
      padding: EdgeInsets.symmetric(vertical: 2.sp, horizontal: 2.sp),
      decoration: BoxDecoration(color: color ?? ThemeColor.darkGreyColor),
      child: Text(
        title,
        textAlign: TextAlign.left,
        style: blackTextStyle.copyWith(
            fontWeight: FontWeight.bold, fontSize: 4.sp),
      ),
    );
  }

  static Container headerCenterTitle2({required String title, Color? color}) {
    return Container(
      height: 25.sp,
      padding: EdgeInsets.symmetric(vertical: 2.sp, horizontal: 2.sp),
      decoration: BoxDecoration(color: color ?? ThemeColor.darkGreyColor),
      child: Center(
        child: Text(
          title,
          style: blackTextStyle.copyWith(
              fontWeight: FontWeight.bold, fontSize: 4.sp),
        ),
      ),
    );
  }

  static Container emtyTitle() {
    return Container(
      height: 215.sp,
      padding: EdgeInsets.symmetric(vertical: 2.sp, horizontal: 2.sp),
      decoration: const BoxDecoration(color: Colors.white),
    );
  }

  static Padding centerTextBox({required String title}) {
    return Padding(
      padding: EdgeInsets.all(2.sp),
      child: Text(
        title,
        textAlign: TextAlign.center,
        style: blackTextStyle.copyWith(fontSize: 5.sp),
      ),
    );
  }

  static Padding centerTextBoxBold({required String title}) {
    return Padding(
      padding: EdgeInsets.all(2.sp),
      child: Text(
        title,
        textAlign: TextAlign.center,
        style: blackTextStyle.copyWith(
            fontSize: 7.sp, fontWeight: FontWeight.bold),
      ),
    );
  }

  static Padding boldText({required String title}) {
    return Padding(
      padding: EdgeInsets.all(2.sp),
      child: Text(
        title,
        textAlign: TextAlign.left,
        style: blackTextStyle.copyWith(
            fontSize: 5.sp, fontWeight: FontWeight.bold),
      ),
    );
  }

  static Container pemeriksaanFisik({
    required String title,
    required String value,
  }) {
    return Container(
      color: Colors.white,
      padding: EdgeInsets.symmetric(horizontal: 5.sp),
      child: TableDesk(
        shape: const RoundedRectangleBorder(
          side: BorderSide(color: Colors.white, width: 1),
        ),
        child: TableDeskRow(
          border: const BorderSide(width: 1, color: Colors.white),
          gaps: [
            TableGap.width(300),
            TableGap.weight(),
          ],
          children: [
            Container(
              padding: EdgeInsets.all(2.sp),
              decoration: const BoxDecoration(color: Colors.white),
              child: Text(
                title,
                textAlign: TextAlign.left,
                style: blackTextStyle.copyWith(fontSize: 5.sp),
              ),
            ),
            Container(
              padding: EdgeInsets.all(2.sp),
              color: Colors.white,
              child: Text(
                ": $value",
                style: blackTextStyle.copyWith(fontSize: 5.sp),
              ),
            ),
          ],
        ),
      ),
    );
  }

  static Container centerButtonBox(
      {required String title,
      required void Function()? onPressed,
      Color? backgroundColor}) {
    return Container(
      height: 20.sp,
      padding: EdgeInsets.all(1.sp),
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(2.sp)),
              backgroundColor: backgroundColor ?? ThemeColor.primaryColor),
          onPressed: onPressed,
          child: Padding(
            padding: EdgeInsets.all(2.sp),
            child: Text(
              title,
              textAlign: TextAlign.center,
              style: whiteTextStyle.copyWith(fontSize: 5.sp),
            ),
          )),
    );
  }

  static Padding textBox({required String title}) {
    return Padding(
      padding: EdgeInsets.all(2.sp),
      child: Text(
        title,
        style: blackTextStyle.copyWith(fontSize: 5.sp),
      ),
    );
  }

  static Padding widgetBox({required Widget widget}) {
    return Padding(
      padding: EdgeInsets.all(2.sp),
      child: widget,
    );
  }

  static Row boxKeperawatan({
    required String title,
    double? width,
    required Widget widget,
  }) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: width ?? 55.sp,
          child: Align(
            alignment: Alignment.centerLeft,
            child: Text(
              title,
              textAlign: TextAlign.left,
              style: blackTextStyle.copyWith(fontSize: 5.sp),
            ),
          ),
        ),
        Expanded(
          child: widget,
        )
      ],
    );
  }

  static Container formBox(
      {required String title,
      required String subTitle,
      bool? enable,
      String? textValue,
      String? value,
      String? labelText,
      dynamic Function(String)? onChanged}) {
    return Container(
      width: Get.width,
      padding: EdgeInsets.symmetric(horizontal: 12.sp, vertical: 4.sp),
      child: Row(
        children: [
          SizedBox(
            width: 70.sp,
            child: Text(
              title,
              style: (labelText != null)
                  ? blackTextStyle.copyWith(fontWeight: FontWeight.bold)
                  : blackTextStyle.copyWith(),
            ),
          ),
          Expanded(
              child: FormWidget.textForm(
            onChanged: onChanged,
            labelText: labelText,
            value: value,
            enable: enable ?? true,
          )),
          SizedBox(
            width: 5.sp,
          ),
          SizedBox(
            width: 25.sp,
            child: Text(
              subTitle,
              style: blackTextStyle.copyWith(fontSize: 6.sp),
            ),
          ),
        ],
      ),
    );
  }
}
