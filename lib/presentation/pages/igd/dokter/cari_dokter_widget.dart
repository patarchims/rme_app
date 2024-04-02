import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:hms_app/domain/bloc/dashboard/asesmen_igd/asesmen_igd_bloc.dart';
import 'package:sizer/sizer.dart';
import '../../../component/component.dart';

class CariDokterSpesialisWidget extends StatefulWidget {
  const CariDokterSpesialisWidget({super.key});

  @override
  State<CariDokterSpesialisWidget> createState() =>
      _CariDokterSpesialisWidgetState();
}

class _CariDokterSpesialisWidgetState extends State<CariDokterSpesialisWidget> {
  late TextEditingController _cariController;
  final ScrollController _scrollController = ScrollController();
  String valueSearch = "";

  @override
  void dispose() {
    _cariController.clear();
    _cariController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    _cariController = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ThemeColor.bgColor,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: ThemeColor.primaryColor,
        title: Text(
          "Dokter DPJP - Yang Bertangung Jawab Atas Pasien Bersangkutan (Wajib Diisi)!!",
          style: whiteTextStyle,
        ),
      ),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.only(top: 5.sp, left: 5.sp, right: 5.sp),
            width: Get.width,
            child: FormWidget.textForm(
                enable: true,
                labelText: "Cari nama dokter",
                controller: _cariController,
                onChanged: (value) {
                  setState(() {
                    valueSearch = value;
                  });
                }),
          ),
          BlocBuilder<AsesmenIgdBloc, AsesmenIgdState>(
            builder: (context, state) {
              log("DOKTER SPESILIS ${state.isSuccessSpesialis}");
              log("DOKTER SPESILIS ${state.failMessageSpesialis}");

              if (state.isSuccessSpesialis) {
                return Container(
                  padding: EdgeInsets.symmetric(horizontal: 5.sp),
                  height: Get.height - 140.sp,
                  width: Get.width,
                  child: RawScrollbar(
                    thumbColor: ThemeColor.darkColor,
                    thumbVisibility: true,
                    interactive: true,
                    thickness: 10.sp,
                    controller: _scrollController,
                    trackVisibility: false,
                    radius: Radius.circular(5.sp),
                    child: ListView(
                      controller: _scrollController,
                      children: state.dokterSpesialis
                          .where((element) => element.nama
                              .toLowerCase()
                              .contains(valueSearch.toLowerCase()))
                          .map((e) => Card(
                                color: ThemeColor.primaryColor,
                                elevation: 1.sp,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(2.sp),
                                ),
                                child: ListTile(
                                  onTap: () {
                                    // PILIH DOKTER
                                    context.read<AsesmenIgdBloc>().add(
                                        AsesmenIgdEvent.selectedDokter(
                                            dokter: "${e.idk}-${e.nama}"));
                                    Navigator.pop(context);
                                  },
                                  title: Text(
                                    e.nama,
                                    style: whiteTextStyle.copyWith(
                                        fontWeight: FontWeight.bold),
                                  ),
                                  subtitle: Text(
                                    " ${e.idk}-${e.spesialis} ",
                                    style: whiteCalibriTextStyle,
                                  ),
                                  trailing: const InkWell(
                                    child: Icon(
                                      FontAwesomeIcons.circleRight,
                                      color: Colors.white,
                                    ),
                                  ),
                                  leading: const Icon(
                                    FontAwesomeIcons.userDoctor,
                                    color: Colors.white,
                                  ),
                                ),
                              ))
                          .toList(),
                    ),
                  ),
                );
              }

              if (!state.isSuccessSpesialis) {
                return SizedBox(
                  height: Get.height - 165.sp,
                  width: Get.width,
                  child: Center(
                    child: Text(
                      state.failMessageSpesialis,
                      style: blackTextStyle,
                    ),
                  ),
                );
              }

              return Container();
            },
          )
        ],
      ),
    );
  }
}
