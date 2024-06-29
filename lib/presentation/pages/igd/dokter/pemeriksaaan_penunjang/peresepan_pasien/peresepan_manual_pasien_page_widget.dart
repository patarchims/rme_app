import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:hms_app/presentation/component/component.dart';
import 'package:hms_app/presentation/pages/widget/header_content_widget.dart';
import 'package:sizer/sizer.dart';

class PeresepanManualPasienPageWidget extends StatelessWidget {
  const PeresepanManualPasienPageWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return HeaderContentWidget(
      backgroundColor: ThemeColor.primaryColor.withOpacity(0.1),
      isENableAdd: true,
      widget: Container(
          padding: EdgeInsets.all(5.sp),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                    width: Get.width,
                    margin: EdgeInsets.only(
                        left: 7.sp, right: 7.sp, top: 7.sp, bottom: 7.sp),
                    height: 20.sp,
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          elevation: 1,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(1.sp)),
                          backgroundColor: ThemeColor.blackColor,
                        ),
                        onPressed: () {
                          // TAMBAHKAN RESEP
                          // RIWAYAT RESEP
                          // context.read<ResepBloc>().add(OnGetHistoryResepEvent(
                          //     noRM: singlePasien.first.mrn));

                          // CustomDialogWidget.getDialog(
                          //     widget: const RiwayatResepPasienWidget());
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            const Icon(
                              FontAwesomeIcons.pills,
                              color: Colors.white,
                            ),
                            SizedBox(
                              width: 5.sp,
                            ),
                            Text(
                              "Riwayat Resep Manual",
                              style: whiteTextStyle.copyWith(
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ))),
                FormWidget.textArea(
                  maxLines: 16,
                  enabled: true,
                ),
              ],
            ),
          )),
    );
  }
}
