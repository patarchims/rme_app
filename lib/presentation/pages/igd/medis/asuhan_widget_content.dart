import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:hms_app/domain/bloc/dashboard/asesmen_keperawatan_bidan/asesmen_keperawatan_bidan_bloc.dart';
import 'package:hms_app/domain/models/response/deskripsi_siki_model.dart';
import 'package:hms_app/presentation/component/component.dart';
import 'package:hms_app/presentation/pages/widget/header_content_widget.dart';
import 'package:sizer/sizer.dart';

class AsuhanWidgetContentValue extends StatefulWidget {
  const AsuhanWidgetContentValue({super.key});

  @override
  State<AsuhanWidgetContentValue> createState() => _AsuhanWidgetContentState();
}

class _AsuhanWidgetContentState extends State<AsuhanWidgetContentValue> {
  bool isHidden = false;
  String valueSearch = "";

  late List<Deskripsi> deskripsi;

  @override
  void initState() {
    deskripsi = [];
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return HeaderContentWidget(
        widget: Card(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(4.sp),
          side: const BorderSide(color: Colors.black)),
      color: ThemeColor.bgColor,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Container(
            margin: EdgeInsets.only(right: 15.sp),
            child: Column(
              children: [
                // ====  ==== ====
                SizedBox(
                  height: 100.sp,
                  width: Get.width,
                  child: Card(
                    color: ThemeColor.bgColor,
                    elevation: 1,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(2.sp)),
                    child: ListView(
                      children: deskripsi
                          .map((e) => Card(
                                elevation: 1,
                                color: ThemeColor.primaryColor,
                                child: ListTile(
                                  trailing: FloatingActionButton(
                                    backgroundColor: ThemeColor.whiteColor,
                                    onPressed: () {
                                      setState(() {
                                        deskripsi.remove(e);
                                      });
                                    },
                                    child: const Icon(
                                      FontAwesomeIcons.minus,
                                      color: ThemeColor.primaryColor,
                                    ),
                                  ),
                                  title:
                                      Text(e.deskripsi, style: whiteTextStyle),
                                ),
                              ))
                          .toList(),
                    ),
                  ),
                ),
                // ====
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // ===== ===== //

                    SizedBox(
                      height: 20.sp,
                      width: Get.width - 170.sp,
                      child: FormWidget.textForm(
                          enable: true,
                          onChanged: (value) {
                            // KETIKA DI UBAH
                            if (value != "") {
                              setState(() {
                                valueSearch = value;
                                isHidden = true;
                              });
                            }

                            if (value == "") {
                              setState(() {
                                isHidden = false;
                              });
                            }
                          }),
                    ),

                    SizedBox(width: 10.sp),

                    SizedBox(
                        height: 20.sp,
                        width: 20.sp,
                        child: FloatingActionButton.small(
                          backgroundColor: ThemeColor.primaryColor,
                          onPressed: () {},
                          child: const Icon(FontAwesomeIcons.plus),
                        )),
                  ],
                ),
                // ====
                SizedBox(height: 11.sp),
                if (isHidden) ...[
                  // ================ // ================
                  SizedBox(
                    height: 170.sp,
                    width: Get.width,
                    child: Card(
                      color: ThemeColor.bgColor,
                      shape: RoundedRectangleBorder(
                        side: const BorderSide(color: Colors.black),
                        borderRadius: BorderRadius.circular(2.sp),
                      ),
                      child: BlocBuilder<AsesmenKeperawatanBidanBloc,
                          AsesmenKeperawatanBidanState>(
                        builder: (context, state) {
                          return ListView(
                            children: state.deskripsiSiki
                                .map((e) => Container(
                                      padding: EdgeInsets.all(2.sp),
                                      width: Get.width,
                                      color: ThemeColor.primaryColor,
                                      child: Column(
                                        children: [
                                          Text(e.judul,
                                              textAlign: TextAlign.center,
                                              style: whiteCalibriTextStyle),
                                          // == none
                                          SizedBox(
                                            height: 150.sp,
                                            width: Get.width,
                                            child: ListView(
                                              children: e.deskripsi
                                                  .where((element) => element
                                                      .deskripsi
                                                      .contains(valueSearch))
                                                  .map((e) => Card(
                                                        color:
                                                            ThemeColor.bgColor,
                                                        child: ListTile(
                                                          enabled: true,
                                                          trailing:
                                                              FloatingActionButton(
                                                            onPressed: () {
                                                              // ADD DESKRIPSI
                                                              setState(() {
                                                                final data = deskripsi.where(
                                                                    (element) =>
                                                                        element
                                                                            .id ==
                                                                        e.id);

                                                                log(e.id
                                                                    .toString());

                                                                if (data
                                                                    .isEmpty) {
                                                                  deskripsi
                                                                      .add(e);
                                                                }
                                                              });
                                                            },
                                                            child: const Icon(
                                                                FontAwesomeIcons
                                                                    .plus),
                                                          ),
                                                          title: Text(
                                                            e.deskripsi,
                                                            style:
                                                                blackTextStyle,
                                                          ),
                                                        ),
                                                      ))
                                                  .toList(),
                                            ),
                                          )
                                        ],
                                      ),
                                    ))
                                .toList(),
                          );
                        },
                      ),
                    ),
                  )
                ]
              ],
            ),
          ),
        ),
      ),
    ));
  }
}
