import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:hms_app/presentation/component/component.dart';
import 'package:hms_app/presentation/pages/igd/bloc/resep/resep_bloc.dart';
import 'package:hms_app/presentation/pages/igd/dokter/pemeriksaaan_penunjang/peresepan_pasien/add_resep_obat_pasien.dart';
import 'package:sizer/sizer.dart';

class TambahResepObatWidget extends StatefulWidget {
  const TambahResepObatWidget({super.key});

  @override
  State<TambahResepObatWidget> createState() => _TambahResepObatWidgetState();
}

class _TambahResepObatWidgetState extends State<TambahResepObatWidget> {
  final ScrollController _scrollController = ScrollController();
  late TextEditingController _cariController;
  String valueSearch = "";

  @override
  void initState() {
    _cariController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    _cariController.clear();
    _cariController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: Get.height - 25.sp,
      width: Get.width,
      decoration: const BoxDecoration(color: Colors.white),
      child: Scaffold(
        backgroundColor: ThemeColor.blueColor.withOpacity(0.2),
        body: Stack(
          children: [
            Positioned.fill(
                child: BlocConsumer<ResepBloc, ResepState>(
              listener: (context, state) {},
              builder: (context, state) {
                return Container(
                  decoration: BoxDecoration(color: ThemeColor.transparentColor),
                  margin: EdgeInsets.only(top: 45.sp, left: 5.sp, right: 5.sp),
                  child: Scrollbar(
                    thumbVisibility: true,
                    interactive: true,
                    controller: _scrollController,
                    child: ListView(
                        controller: _scrollController,
                        children: state.ktaripObat
                            .where((element) => element.namaObat
                                .toLowerCase()
                                .contains(valueSearch))
                            .map((resiko) => Container(
                                  decoration:
                                      const BoxDecoration(color: Colors.white),
                                  margin: EdgeInsets.only(
                                    bottom: 2.sp,
                                  ),
                                  child: InkWell(
                                    onTap: () {
                                      CustomDialogWidget.getDialog(
                                          widget: AddResepObatPasienWidget(
                                        kTaripObatModel: resiko,
                                      ));
                                    },
                                    child: ListTile(
                                      trailing: SizedBox(
                                        height: 55.sp,
                                        child: FloatingActionButton(
                                            backgroundColor:
                                                ThemeColor.primaryColor,
                                            child: Icon(
                                              FontAwesomeIcons.circleArrowRight,
                                              color: ThemeColor.whiteColor,
                                              size: 12.sp,
                                            ),
                                            onPressed: () {
                                              CustomDialogWidget.getDialog(
                                                  widget:
                                                      AddResepObatPasienWidget(
                                                kTaripObatModel: resiko,
                                              ));
                                            }),
                                      ),
                                      enabled: true,
                                      title: Text(
                                        "Kode : ${resiko.kodeObat}\nNama Obat : ${resiko.namaObat}\nSatuan : ${resiko.satuan}\nSaldo : ${resiko.saldo}",
                                        style: blackTextStyle,
                                      ),
                                    ),
                                  ),
                                ))
                            .toList()),
                  ),
                );
              },
            )),
            Align(
              alignment: Alignment.topCenter,
              child: Container(
                width: Get.width,
                height: 40.sp,
                color: ThemeColor.lightGrey,
                child: Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 25.sp, vertical: 5.sp),
                  child: Row(
                    children: [
                      // ======
                      Padding(
                          padding: EdgeInsets.only(right: 4.sp),
                          child: Text("Cari Resep",
                              style: blackTextStyle.copyWith(fontSize: 9.sp))),

                      // ======
                      Expanded(
                          child: FormWidget.textForm(
                              enable: true,
                              autoFocus: true,
                              onChanged: (value) {
                                setState(() {
                                  valueSearch = value.toLowerCase();
                                });
                              },
                              controller: _cariController)),

                      Container(
                        padding: EdgeInsets.all(3.sp),
                        width: 35.sp,
                        height: 25.sp,
                        child: FloatingActionButton(
                          backgroundColor: ThemeColor.primaryColor,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(2.sp)),
                          onPressed: () {},
                          heroTag: "cari",
                          child: const Icon(
                            FontAwesomeIcons.magnifyingGlass,
                            color: Colors.white,
                          ),
                        ),
                      )
                    ],
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
