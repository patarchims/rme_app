import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:hms_app/domain/bloc/dashboard/asuhan_keperawatan/selection_siki/selection_siki_bloc.dart';
import 'package:hms_app/presentation/component/component.dart';
import 'package:hms_app/presentation/pages/widget/header_content_widget.dart';
import 'package:sizer/sizer.dart';

class DeskripsiSikiContentWidget extends StatelessWidget {
  const DeskripsiSikiContentWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SelectionSikiBloc, SelectionSikiState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        return HeaderContentWidget(
            widget: SingleChildScrollView(
          child: Container(
            width: Get.width,
            decoration: const BoxDecoration(),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: state.deskripsi
                    .asMap()
                    .entries
                    .map((resiko) => Column(
                          children: [
                            Container(
                              padding: EdgeInsets.symmetric(
                                vertical: 5.sp,
                              ),
                              decoration: BoxDecoration(
                                  color: Colors.grey.withOpacity(0.5)),
                              child: Center(
                                child: Text(
                                  resiko.value.judul,
                                  style: blackTextStyle.copyWith(
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),

                            Container(
                              padding: EdgeInsets.symmetric(
                                vertical: 5.sp,
                              ),
                              decoration: BoxDecoration(
                                  color: Colors.blue.withOpacity(0.5)),
                              child: Center(
                                child: Text(
                                  "KOLABOLARASI",
                                  style: blackTextStyle.copyWith(
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),

                            SizedBox(
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: (resiko.value.edukasi != null)
                                    ? resiko.value.kolaborasi!
                                        .asMap()
                                        .entries
                                        .map((sub) => Column(
                                              children: [
                                                Container(
                                                  padding: EdgeInsets.all(5.sp),
                                                  width: Get.width,
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.start,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Text(
                                                        sub.value.noUrut
                                                            .toString(),
                                                        style: blackTextStyle
                                                            .copyWith(
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold),
                                                      ),
                                                      SizedBox(
                                                        width: 10.sp,
                                                      ),
                                                      Text(
                                                        sub.value.deskripsi,
                                                        style: blackTextStyle
                                                            .copyWith(
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold),
                                                      ),
                                                      const Spacer(),
                                                      SizedBox(
                                                        height: 15.sp,
                                                        width: 20.sp,
                                                        child: ElevatedButton(
                                                          onPressed: () {
                                                            context.read<SelectionSikiBloc>().add(OnCheclistResikoJatuh(
                                                                sikiIndex:
                                                                    resiko.key,
                                                                katergori:
                                                                    "Kolaborasi",
                                                                deskripsiIndex:
                                                                    sub.key,
                                                                deskripsi: sub
                                                                    .value
                                                                    .copyWith(
                                                                        isSelected: !sub
                                                                            .value
                                                                            .isSelected)));
                                                          },
                                                          style: ElevatedButton
                                                              .styleFrom(
                                                            backgroundColor: (sub
                                                                    .value
                                                                    .isSelected)
                                                                ? Colors.green
                                                                : ThemeColor
                                                                    .primaryColor,
                                                            shape:
                                                                RoundedRectangleBorder(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          5.sp),
                                                            ),
                                                          ),
                                                          child: (sub.value
                                                                  .isSelected)
                                                              ? Icon(
                                                                  FontAwesomeIcons
                                                                      .check,
                                                                  color: Colors
                                                                      .white,
                                                                  size: 5.sp,
                                                                )
                                                              : Icon(
                                                                  FontAwesomeIcons
                                                                      .minus,
                                                                  color: Colors
                                                                      .white,
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
                            ),

                            // NEW CHOOSE
                            Container(
                              padding: EdgeInsets.symmetric(
                                vertical: 5.sp,
                              ),
                              decoration: BoxDecoration(
                                  color: Colors.blue.withOpacity(0.5)),
                              child: Center(
                                child: Text(
                                  "OBSERVASI",
                                  style: blackTextStyle.copyWith(
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                            SizedBox(
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: (resiko.value.observasi != null)
                                    ? resiko.value.observasi!
                                        .asMap()
                                        .entries
                                        .map((sub) => Column(
                                              children: [
                                                Container(
                                                  padding: EdgeInsets.all(5.sp),
                                                  width: Get.width,
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.start,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Text(
                                                        sub.value.noUrut
                                                            .toString(),
                                                        style: blackTextStyle
                                                            .copyWith(
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold),
                                                      ),
                                                      SizedBox(
                                                        width: 10.sp,
                                                      ),
                                                      SizedBox(
                                                        width: Get.width / 2,
                                                        child: Text(
                                                          sub.value.deskripsi,
                                                          style: blackTextStyle
                                                              .copyWith(
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold),
                                                        ),
                                                      ),
                                                      const Spacer(),
                                                      SizedBox(
                                                        height: 15.sp,
                                                        width: 20.sp,
                                                        child: ElevatedButton(
                                                          onPressed: () {
                                                            context.read<SelectionSikiBloc>().add(OnCheclistResikoJatuh(
                                                                sikiIndex:
                                                                    resiko.key,
                                                                katergori:
                                                                    "Observasi",
                                                                deskripsiIndex:
                                                                    sub.key,
                                                                deskripsi: sub
                                                                    .value
                                                                    .copyWith(
                                                                        isSelected: !sub
                                                                            .value
                                                                            .isSelected)));
                                                          },
                                                          style: ElevatedButton
                                                              .styleFrom(
                                                            backgroundColor: (sub
                                                                    .value
                                                                    .isSelected)
                                                                ? Colors.green
                                                                : ThemeColor
                                                                    .primaryColor,
                                                            shape:
                                                                RoundedRectangleBorder(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          5.sp),
                                                            ),
                                                          ),
                                                          child: (sub.value
                                                                  .isSelected)
                                                              ? Icon(
                                                                  FontAwesomeIcons
                                                                      .check,
                                                                  color: Colors
                                                                      .white,
                                                                  size: 5.sp,
                                                                )
                                                              : Icon(
                                                                  FontAwesomeIcons
                                                                      .minus,
                                                                  color: Colors
                                                                      .white,
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
                                    : [],
                              ),
                            ),

                            // NEW CHOOSE
                            Container(
                              padding: EdgeInsets.symmetric(
                                vertical: 5.sp,
                              ),
                              decoration: BoxDecoration(
                                  color: Colors.blue.withOpacity(0.5)),
                              child: Center(
                                child: Text(
                                  "EDUKASI",
                                  style: blackTextStyle.copyWith(
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                            SizedBox(
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: (resiko.value.edukasi != null)
                                    ? resiko.value.edukasi!
                                        .asMap()
                                        .entries
                                        .map((sub) => Column(
                                              children: [
                                                Container(
                                                  padding: EdgeInsets.all(5.sp),
                                                  width: Get.width,
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.start,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Text(
                                                        sub.value.noUrut
                                                            .toString(),
                                                        style: blackTextStyle
                                                            .copyWith(
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold),
                                                      ),
                                                      SizedBox(
                                                        width: 10.sp,
                                                      ),
                                                      SizedBox(
                                                        width: Get.width / 2,
                                                        child: Text(
                                                          sub.value.deskripsi,
                                                          style: blackTextStyle
                                                              .copyWith(
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold),
                                                        ),
                                                      ),
                                                      const Spacer(),
                                                      SizedBox(
                                                        height: 15.sp,
                                                        width: 20.sp,
                                                        child: ElevatedButton(
                                                          onPressed: () {
                                                            context.read<SelectionSikiBloc>().add(OnCheclistResikoJatuh(
                                                                sikiIndex:
                                                                    resiko.key,
                                                                katergori:
                                                                    "Edukasi",
                                                                deskripsiIndex:
                                                                    sub.key,
                                                                deskripsi: sub
                                                                    .value
                                                                    .copyWith(
                                                                        isSelected: !sub
                                                                            .value
                                                                            .isSelected)));
                                                          },
                                                          style: ElevatedButton
                                                              .styleFrom(
                                                            backgroundColor: (sub
                                                                    .value
                                                                    .isSelected)
                                                                ? Colors.green
                                                                : ThemeColor
                                                                    .primaryColor,
                                                            shape:
                                                                RoundedRectangleBorder(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          5.sp),
                                                            ),
                                                          ),
                                                          child: (sub.value
                                                                  .isSelected)
                                                              ? Icon(
                                                                  FontAwesomeIcons
                                                                      .check,
                                                                  color: Colors
                                                                      .white,
                                                                  size: 5.sp,
                                                                )
                                                              : Icon(
                                                                  FontAwesomeIcons
                                                                      .minus,
                                                                  color: Colors
                                                                      .white,
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
                                    : [],
                              ),
                            ),

                            // TERAPEUTIK

                            // NEW CHOOSE
                            Container(
                              padding: EdgeInsets.symmetric(
                                vertical: 5.sp,
                              ),
                              decoration: BoxDecoration(
                                  color: Colors.blue.withOpacity(0.5)),
                              child: Center(
                                child: Text(
                                  "TERAPEUTIK",
                                  style: blackTextStyle.copyWith(
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                            SizedBox(
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: (resiko.value.terapetutik != null)
                                    ? resiko.value.terapetutik!
                                        .asMap()
                                        .entries
                                        .map((sub) => Column(
                                              children: [
                                                Container(
                                                  padding: EdgeInsets.all(5.sp),
                                                  width: Get.width,
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.start,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Text(
                                                        sub.value.noUrut
                                                            .toString(),
                                                        style: blackTextStyle
                                                            .copyWith(
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold),
                                                      ),
                                                      SizedBox(
                                                        width: 10.sp,
                                                      ),
                                                      SizedBox(
                                                        width: Get.width / 2,
                                                        child: Text(
                                                          sub.value.deskripsi,
                                                          style: blackTextStyle
                                                              .copyWith(
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold),
                                                        ),
                                                      ),
                                                      const Spacer(),
                                                      SizedBox(
                                                        height: 15.sp,
                                                        width: 20.sp,
                                                        child: ElevatedButton(
                                                          onPressed: () {
                                                            context.read<SelectionSikiBloc>().add(OnCheclistResikoJatuh(
                                                                sikiIndex:
                                                                    resiko.key,
                                                                katergori:
                                                                    "Terapeutik",
                                                                deskripsiIndex:
                                                                    sub.key,
                                                                deskripsi: sub
                                                                    .value
                                                                    .copyWith(
                                                                        isSelected: !sub
                                                                            .value
                                                                            .isSelected)));
                                                            // context.read<ResikoJatuhBloc>().add(OnCheckIntervensiResikoJatuh(
                                                            //     faktorIndex:
                                                            //         resiko
                                                            //             .key,
                                                            //     resikoJatuhIndex:
                                                            //         sub.key,
                                                            //     resikoJatuh: sub
                                                            //         .value
                                                            //         .copyWith(
                                                            //             isEnable:
                                                            //                 !sub.value.isEnable)));
                                                          },
                                                          style: ElevatedButton
                                                              .styleFrom(
                                                            backgroundColor: (sub
                                                                    .value
                                                                    .isSelected)
                                                                ? Colors.green
                                                                : ThemeColor
                                                                    .primaryColor,
                                                            shape:
                                                                RoundedRectangleBorder(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          5.sp),
                                                            ),
                                                          ),
                                                          child: (sub.value
                                                                  .isSelected)
                                                              ? Icon(
                                                                  FontAwesomeIcons
                                                                      .check,
                                                                  color: Colors
                                                                      .white,
                                                                  size: 5.sp,
                                                                )
                                                              : Icon(
                                                                  FontAwesomeIcons
                                                                      .minus,
                                                                  color: Colors
                                                                      .white,
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
                                    : [],
                              ),
                            ),
                          ],
                        ))
                    .toList()),
          ),
        ));
      },
    );
  }
}
