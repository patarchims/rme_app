import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:hms_app/domain/bloc/dashboard/pasien/pasien_bloc.dart';
import 'package:hms_app/presentation/pages/igd/widget/labor_content_widget.dart';
import 'package:hms_app/presentation/route/get_route.dart';
import 'package:sizer/sizer.dart';
import '../../../../domain/bloc/dashboard/asesmen_igd/asesmen_igd_bloc.dart';
import '../../../component/component.dart';

class CariLaborWidget extends StatefulWidget {
  const CariLaborWidget({super.key});

  @override
  State<CariLaborWidget> createState() => _CariLaborWidgetState();
}

class _CariLaborWidgetState extends State<CariLaborWidget> {
  late TextEditingController _cariController;
  String valueSearch = "";

  @override
  void initState() {
    _cariController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _cariController.clear();
    _cariController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    PasienState pasienState = context.watch<PasienBloc>().state;
    final singlePasien = pasienState.listPasienModel
        .where((element) => element.mrn == pasienState.normSelected);

    return Scaffold(
      backgroundColor: ThemeColor.bgColor,
      appBar: AppBar(
        backgroundColor: ThemeColor.primaryColor,
        title: Text(
          "Plan - Rencana Pasien Ke Laboratorium (Kirim Data Ke Pemeriksaan Laboratorium) !!!",
          style: whiteTextStyle,
        ),
      ),
      body: BlocConsumer<AsesmenIgdBloc, AsesmenIgdState>(
        listener: (context, state) {},
        builder: (context, state) {
          return Stack(
            children: [
              Positioned.fill(
                  child: Column(
                children: [
                  Container(
                    padding:
                        EdgeInsets.symmetric(vertical: 5.sp, horizontal: 5.sp),
                    width: Get.width,
                    child: FormWidget.textForm(
                        enable: true,
                        labelText: "Cari kelompok pemeriksaan",
                        controller: _cariController,
                        onChanged: (value) {
                          setState(() {
                            valueSearch = value;
                          });
                        }),
                  ),
                  SizedBox(
                    height: Get.height - 90.sp,
                    width: Get.width,
                    child: Row(
                      children: [
                        SizedBox(
                          width: Get.width / 2.2,
                          height: Get.height,
                          child: Container(
                            padding: EdgeInsets.all(5.sp),
                            child: ListView(
                              children: (state.kProcedure.isNotEmpty)
                                  ? state.kProcedure
                                      .where((element) => element.nameGrup
                                          .contains(valueSearch))
                                      .map((e) => Card(
                                            child: ListTile(
                                              title: Text(
                                                e.nameGrup,
                                                style: whiteTextStyle,
                                              ),
                                              subtitle: Text(
                                                e.kel,
                                                style: whiteTextStyle,
                                              ),
                                              enabled: true,
                                              trailing: FloatingActionButton(
                                                onPressed: () {},
                                                child: const Icon(
                                                    FontAwesomeIcons.check),
                                              ),
                                            ),
                                          ))
                                      .toList()
                                  : [],
                            ),
                          ),
                        ),
                        Expanded(
                            child: Container(
                          color: ThemeColor.primaryColor,
                          child: const LaborContentWidget(),
                        ))
                      ],
                    ),
                  ),
                ],
              )),
              Positioned(
                bottom: 0,
                child: Container(
                  decoration:
                      const BoxDecoration(color: ThemeColor.primaryColor),
                  height: 30.sp,
                  width: Get.width,
                  padding: EdgeInsets.only(left: 10.sp, right: 30.sp),
                  child: Row(
                    children: [
                      InkWell(
                        onTap: () {
                          // TAMPILKAN DETAIL PASIEN
                          context.read<PasienBloc>().add(
                              PasienEvent.getDetailPasien(
                                  noRM: singlePasien.first.mrn));

                          // TODO GO to detail pasien page
                          Get.toNamed(GetRoutes.detailPasienPage);
                        },
                        child: Container(
                          height: 35.sp,
                          width: 35.sp,
                          decoration: BoxDecoration(
                              border:
                                  Border.all(color: Colors.black, width: 1.sp),
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
                            singlePasien.first.noreg,
                            style: blackTextStyle,
                          ),
                        ),
                      )),
                      SizedBox(
                        width: 50.sp,
                        child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                backgroundColor: ThemeColor.blueColor,
                                elevation: 1,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(1.sp))),
                            onPressed: () {},
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
                            onPressed: () {},
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
              ),
            ],
          );
        },
      ),
    );
  }
}
