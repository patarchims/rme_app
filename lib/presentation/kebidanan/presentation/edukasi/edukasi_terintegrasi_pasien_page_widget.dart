import 'package:flutter/material.dart';
import 'package:hms_app/presentation/component/component.dart';
import 'package:hms_app/presentation/pages/widget/header_content_widget.dart';
import 'package:sizer/sizer.dart';

class EdukasiTerintegrasiPageWidget extends StatefulWidget {
  const EdukasiTerintegrasiPageWidget({super.key});

  @override
  State<EdukasiTerintegrasiPageWidget> createState() =>
      _EdukasiTerintegrasiPageWidgetState();
}

class _EdukasiTerintegrasiPageWidgetState
    extends State<EdukasiTerintegrasiPageWidget> {
  final ScrollController _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: HeaderContentWidget(
          backgroundColor: ThemeColor.bgColor,
          isENableAdd: true,
          onPressed: () {},
          title: "Tambah",
          widget: RawScrollbar(
              thumbColor: ThemeColor.darkColor,
              thumbVisibility: true,
              interactive: true,
              thickness: 10.sp,
              controller: _scrollController,
              trackVisibility: false,
              radius: Radius.circular(5.sp),
              child: SingleChildScrollView(
                controller: _scrollController,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 5.sp,
                      ),
                      Text(
                        "Pasien telah diberi informasi sebagai beriku :",
                        style: blackTextStyle,
                      ),
                      SizedBox(
                        child: Table(
                          border: TableBorder.all(color: Colors.black),
                          children: [
                            TableRow(children: [
                              TitleWidget.headerTitleLeft(
                                  color: ThemeColor.bgColor,
                                  blackTextStyle:
                                      blackTextStyle.copyWith(fontSize: 5.sp),
                                  title: "Tanggal\nJam"),
                              TitleWidget.headerTitleLeft(
                                  color: ThemeColor.bgColor,
                                  blackTextStyle:
                                      blackTextStyle.copyWith(fontSize: 5.sp),
                                  title: "Informasi/Edukasi yang di berikan"),
                              TitleWidget.headerTitleLeft(
                                  color: ThemeColor.bgColor,
                                  blackTextStyle:
                                      blackTextStyle.copyWith(fontSize: 5.sp),
                                  title: "Metode"),
                              TitleWidget.headerTitleLeft(
                                  color: ThemeColor.bgColor,
                                  blackTextStyle:
                                      blackTextStyle.copyWith(fontSize: 5.sp),
                                  title: "Pemberian\nInformasi"),
                              TitleWidget.headerTitleLeft(
                                  color: ThemeColor.bgColor,
                                  blackTextStyle:
                                      blackTextStyle.copyWith(fontSize: 5.sp),
                                  title: "Penerima Informasi"),
                              TitleWidget.headerTitleLeft(
                                  color: ThemeColor.bgColor,
                                  blackTextStyle:
                                      blackTextStyle.copyWith(fontSize: 5.sp),
                                  title: "Evaluasi")
                            ])
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ))),
    );
  }
}
