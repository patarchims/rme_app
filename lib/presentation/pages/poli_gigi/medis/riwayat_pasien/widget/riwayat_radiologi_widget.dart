import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:hms_app/domain/bloc/dashboard/pasien/pasien_bloc.dart';
import 'package:hms_app/presentation/component/component.dart';
import 'package:sizer/sizer.dart';

class RiwayatRadiologiWidget extends StatelessWidget {
  final String tanggal;
  const RiwayatRadiologiWidget({
    Key? key,
    required this.tanggal,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PasienBloc, PasienState>(
      builder: (context, state) {
        final singleRiwayat = state.detailProfilPasienModel
            .where((element) => element.tanggal == tanggal);

        return Container(
            color: Colors.white,
            width: Get.width,
            padding: EdgeInsets.all(6.sp),
            child: SingleChildScrollView(
              child: Column(
                children: singleRiwayat.first.detailPenmed
                    .map((e) => Container(
                          width: Get.width,
                          decoration: const BoxDecoration(),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Container(
                                width: Get.width,
                                decoration: const BoxDecoration(
                                    color: ThemeColor.primaryColor),
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  "DPJP : ${e.namaDokter}\nAsal Pelayanan : ${e.bagian}\nCT Scan : ${e.noPenmed}",
                                  textAlign: TextAlign.end,
                                  style: whiteTextStyle,
                                ),
                              ),
                              SizedBox(
                                child: Table(
                                  border: TableBorder.all(color: Colors.black),
                                  children: [
                                    TableRow(children: [
                                      headerTitle(title: "Pemeriksaan"),
                                      headerTitle(title: "Uraian"),
                                      headerTitle(title: "Hasil"),
                                      headerTitle(title: "Catatan"),
                                    ]),
                                  ],
                                ),
                              ),
                              SizedBox(
                                child: Table(
                                  border: TableBorder.all(),
                                  children: e.detailPenmed2.map((e) {
                                    return TableRow(children: [
                                      textBox(title: e.deskripsi),
                                      textBox(title: e.uraian),
                                      textBox(title: e.hasil),
                                      textBox(title: e.catatan),
                                    ]);
                                  }).toList(),
                                ),
                              ),
                            ],
                          ),
                        ))
                    .toList(),
              ),
            ));
      },
    );
  }

  Container headerTitle({required String title}) {
    return Container(
      decoration:
          BoxDecoration(color: ThemeColor.primaryColor.withOpacity(0.5)),
      child: Center(
        child: Text(
          title,
          style: blackTextStyle.copyWith(fontWeight: FontWeight.bold),
        ),
      ),
    );
  }

  Padding textBox({required String title}) {
    return Padding(
      padding: EdgeInsets.all(2.sp),
      child: Text(
        title,
        style: blackTextStyle,
      ),
    );
  }
}
