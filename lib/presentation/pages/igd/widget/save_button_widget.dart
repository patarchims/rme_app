// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import '../../../../domain/bloc/dashboard/pasien/pasien_bloc.dart';
import '../../../component/component.dart';

class SaveButtonWidget extends StatelessWidget {
  final Function()? onSave;
  final Function()? onClear;
  const SaveButtonWidget({
    Key? key,
    this.onSave,
    this.onClear,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    PasienState pasienState = context.watch<PasienBloc>().state;
    final singlePasien = pasienState.listPasienModel
        .where((element) => element.mrn == pasienState.normSelected);

    return Positioned(
      bottom: 0,
      child: Container(
        decoration: BoxDecoration(color: ThemeColor.primaryColor),
        height: 30.sp,
        width: Get.width,
        child: Row(
          children: [
            InkWell(
              onTap: () {},
              child: Container(
                height: 35.sp,
                width: 35.sp,
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.black, width: 1.sp),
                    shape: BoxShape.circle,
                    boxShadow: [],
                    // JENIS KELAMIN SESUAIKAN DENGAN GAMBAR
                    image: DecorationImage(
                        image: AssetImage(
                      (singlePasien.first.jenisKelamin == "Laki-Laki")
                          ? "assets/images/man_pasien.png"
                          : "assets/images/woman_pasien.png",
                    ))),
              ),
            ),
            Expanded(
                child: Card(
              elevation: 0,
              color: Colors.transparent,
              child: ListTile(
                title: Text(
                  singlePasien.first.namaPasien,
                  style: blackTextStyle,
                ),
                subtitle: Text(
                  "${singlePasien.first.noreg} - Debitur : ${singlePasien.first.kdDebitur}",
                  style: blackTextStyle,
                ),
              ),
            )),
            SizedBox(
              width: 50.sp,
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromARGB(255, 21, 26, 36),
                      elevation: 1,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(1.sp))),
                  onPressed: onClear,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Icon(
                        FontAwesomeIcons.rotateLeft,
                        size: 12.sp,
                      ),
                      Text(
                        "Reset",
                        style: whiteTextStyle,
                      )
                    ],
                  )),
            ),
            SizedBox(
              width: 3.sp,
            ),
            SizedBox(
              width: 80.sp,
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      elevation: 1,
                      backgroundColor: ThemeColor.blueColor,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(1.sp))),
                  onPressed: onSave,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Icon(
                        FontAwesomeIcons.floppyDisk,
                        size: 12.sp,
                      ),
                      Text(
                        "Send & Request",
                        style: whiteTextStyle,
                      )
                    ],
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
