import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:hms_app/domain/bloc/dashboard/pasien/pasien_bloc.dart';
import 'package:hms_app/presentation/component/component.dart';
import 'package:sizer/sizer.dart';

class RiwayatLaborWidget extends StatelessWidget {
  final String tanggal;
  const RiwayatLaborWidget({
    Key? key,
    required this.tanggal,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PasienBloc, PasienState>(
      builder: (context, state) {
        // ====================== || ==================== \\
        final singleRiwayat = state.detailProfilPasienModel
            .where((element) => element.tanggal == tanggal);

        return Container(
            color: Colors.white,
            width: Get.width,
            padding: EdgeInsets.all(6.sp),
            child: SingleChildScrollView(
              child: Column(
                children: singleRiwayat.first.detailLabor
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
                                  "DPJP : ${e.dpjp}\nAsal Pelayanan : ${e.asalPelayanan}\nNomor Lab : ${e.nomorLab}",
                                  textAlign: TextAlign.end,
                                  style: whiteTextStyle,
                                ),
                              ),
                              Container(
                                  width: Get.width,
                                  decoration: BoxDecoration(
                                      color: Colors.green.withOpacity(0.5)),
                                  padding: EdgeInsets.all(2.sp),
                                  child: Text(
                                    e.kelompok,
                                    style: blackTextStyle.copyWith(
                                        fontWeight: FontWeight.bold),
                                  )),
                              SizedBox(
                                child: Table(
                                  border: TableBorder.all(color: Colors.black),
                                  children: [
                                    TableRow(children: [
                                      headerTitle(title: "Deskripsi"),
                                      headerTitle(title: "Satuan"),
                                      headerTitle(title: "Normal"),
                                      headerTitle(title: "Hasil"),
                                    ]),
                                  ],
                                ),
                              ),
                              SizedBox(
                                child: Table(
                                  border: TableBorder.all(),
                                  children: e.lab.map((e) {
                                    return TableRow(children: [
                                      textBox(title: e.deskripsi),
                                      textBox(title: e.satuan),
                                      textBox(title: e.normal),
                                      textBox(title: e.hasil),
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
      padding: EdgeInsets.symmetric(vertical: 2.sp),
      decoration: BoxDecoration(color: Colors.yellow.withOpacity(0.5)),
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
