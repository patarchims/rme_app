import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:hms_app/domain/bloc/dashboard/asuhan_keperawatan/deskripsi_luaran_slki/deskripsi_luaran_slki_bloc.dart';
import 'package:hms_app/domain/models/asuhan_keperawatan/deskripsi_luaran_siki_model.dart';
import 'package:hms_app/presentation/component/component.dart';
import 'package:sizer/sizer.dart';

class IntervensiSelectioinContentWidget extends StatefulWidget {
  const IntervensiSelectioinContentWidget({super.key});

  @override
  State<IntervensiSelectioinContentWidget> createState() =>
      _IntervensiSelectioinContentWidgetState();
}

class _IntervensiSelectioinContentWidgetState
    extends State<IntervensiSelectioinContentWidget> {
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
      child: BlocBuilder<DeskripsiLuaranSlkiBloc, DeskripsiLuaranSlkiState>(
        builder: (context, state) {
          return Scaffold(
            backgroundColor: ThemeColor.blueColor.withOpacity(0.2),
            body: Stack(
              children: [
                Positioned.fill(
                    child: Container(
                  decoration: BoxDecoration(color: ThemeColor.bgColor),
                  margin: EdgeInsets.only(top: 45.sp, left: 5.sp, right: 5.sp),
                  child: RawScrollbar(
                    thumbColor: ThemeColor.darkColor,
                    thumbVisibility: true,
                    interactive: true,
                    thickness: 6.sp,
                    controller: _scrollController,
                    trackVisibility: false,
                    radius: Radius.circular(5.sp),
                    child: ListView(
                        controller: _scrollController,
                        children: state.deskripsiLuaranSikiModel.siki
                            .asMap()
                            .entries
                            .map((resiko) => Container(
                                  decoration:
                                      const BoxDecoration(color: Colors.white),
                                  margin: EdgeInsets.only(bottom: 10.sp),
                                  child: Column(
                                    children: [
                                      Container(
                                        padding: EdgeInsets.symmetric(
                                          vertical: 5.sp,
                                        ),
                                        decoration: const BoxDecoration(
                                            color: ThemeColor.greenColor),
                                        child: Center(
                                          child: Text(
                                            resiko.value.judul,
                                            style: whiteTextStyle.copyWith(
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                      ),

                                      titleBox(title: "KOLABOLARASI"),

                                      boxListWidget(resiko,
                                          list: resiko.value.kolaborasi,
                                          kategori: "kolaborasi"),

                                      // NEW CHOOSE
                                      titleBox(title: "OBSERVASI"),

                                      boxListWidget(resiko,
                                          list: resiko.value.observasi,
                                          kategori: "observasi"),

                                      // NEW CHOOSE
                                      titleBox(title: "EDUKASI"),

                                      boxListWidget(resiko,
                                          list: resiko.value.edukasi,
                                          kategori: "edukasi"),

                                      // NEW CHOOSE
                                      titleBox(title: "TERAPEUTIK"),

                                      boxListWidget(resiko,
                                          list: resiko.value.terapetutik,
                                          kategori: "terapetutik"),

                                      //
                                    ],
                                  ),
                                ))
                            .toList()),
                  ),
                )),
                Align(
                  alignment: Alignment.topCenter,
                  child: Container(
                    width: Get.width,
                    height: 40.sp,
                    color: ThemeColor.lightGrey,
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: 25.sp, vertical: 5.sp),
                      child: Row(
                        children: [
                          // ======
                          Padding(
                            padding: EdgeInsets.only(right: 4.sp),
                            child: Text("Cari Intervensi",
                                style: blackTextStyle.copyWith(fontSize: 9.sp)),
                          ),

                          // ======
                          Expanded(
                              child: FormWidget.textForm(
                                  enable: true,
                                  autoFocus: true,
                                  onChanged: (value) {
                                    setState(() {
                                      valueSearch = value;
                                    });
                                  },
                                  controller: _cariController)),

                          Container(
                            padding: EdgeInsets.all(3.sp),
                            width: 35.sp,
                            child: FloatingActionButton(
                              backgroundColor: ThemeColor.primaryColor,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(2.sp)),
                              onPressed: () {
                                //  CARI //
                                // setState(() {
                                //   valueSearch = value;
                                // });
                              },
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
          );
        },
      ),
    );
  }

  SizedBox boxListWidget(MapEntry<int, Siki> resiko,
      {required List<Edukasi> list, required String kategori}) {
    return SizedBox(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.start,
        // ignore: unnecessary_null_comparison
        children: (resiko.value.edukasi != null)
            ? list
                .where((element) => element.deskripsi
                    .toLowerCase()
                    .contains(valueSearch.toLowerCase()))
                .map((sub) => Column(
                      children: [
                        Container(
                          padding: EdgeInsets.all(5.sp),
                          width: Get.width,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                sub.noUrut.toString(),
                                style: blackTextStyle.copyWith(
                                    fontWeight: FontWeight.bold),
                              ),
                              SizedBox(
                                width: 10.sp,
                              ),
                              SizedBox(
                                width: Get.width / 2,
                                child: Text(
                                  sub.deskripsi,
                                  style: blackTextStyle.copyWith(
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                              const Spacer(),
                              SizedBox(
                                height: 15.sp,
                                width: 20.sp,
                                child: ElevatedButton(
                                  onPressed: () {
                                    context.read<DeskripsiLuaranSlkiBloc>().add(
                                        OnSelectionSikiEvent(
                                            indexSIKI: resiko.key,
                                            kategori: kategori,
                                            edukasi: sub.copyWith(
                                                isSelected: !sub.isSelected),
                                            noUrut: sub.noUrut));
                                  },
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: (sub.isSelected)
                                        ? Colors.green
                                        : ThemeColor.primaryColor,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(5.sp),
                                    ),
                                  ),
                                  child: (sub.isSelected)
                                      ? Icon(
                                          FontAwesomeIcons.check,
                                          color: Colors.white,
                                          size: 5.sp,
                                        )
                                      : Icon(
                                          FontAwesomeIcons.minus,
                                          color: Colors.white,
                                          size: 5.sp,
                                        ),
                                ),
                              )
                            ],
                          ),
                        ),
                        const Divider(),
                      ],
                    ))
                .toList()
            : [
                SizedBox(
                  height: 25.sp,
                )
              ],
      ),
    );
  }

  Container titleBox({required String title}) {
    return Container(
      padding: EdgeInsets.symmetric(
        vertical: 5.sp,
      ),
      decoration: BoxDecoration(color: Colors.blue.withOpacity(0.5)),
      child: Center(
        child: Text(
          title,
          style: blackTextStyle.copyWith(fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
