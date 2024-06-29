import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:hms_app/domain/bloc/dashboard/asuhan_keperawatan/hasil_asuhan_keperawatan/hasil_asuhan_keperawatan_bloc.dart';
import 'package:hms_app/presentation/component/component.dart';
import 'package:hms_app/presentation/component/loading/loading.dart';
import 'package:sizer/sizer.dart';

class ViewTindakanWidget extends StatefulWidget {
  const ViewTindakanWidget({super.key});

  @override
  State<ViewTindakanWidget> createState() => _ViewTindakanWidgetState();
}

class _ViewTindakanWidgetState extends State<ViewTindakanWidget> {
  final ScrollController _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: Get.width,
      height: Get.height - 140.sp,
      child:
          BlocBuilder<HasilAsuhanKeperawatanBloc, HasilAsuhanKeperawatanState>(
        builder: (context, state) {
          if (state.status == HasilAsuhanStatus.isLoadingGetTindakan) {
            return Loading.expandedLoading();
          }

          return Container(
            margin: EdgeInsets.symmetric(horizontal: 10.sp),
            child: Container(
                decoration: BoxDecoration(color: ThemeColor.bgColor),
                child: (state.listTindakanModel.isNotEmpty)
                    ? RawScrollbar(
                        thumbColor: ThemeColor.darkColor,
                        thumbVisibility: true,
                        interactive: true,
                        thickness: 10.sp,
                        controller: _scrollController,
                        trackVisibility: false,
                        radius: Radius.circular(5.sp),
                        child: SingleChildScrollView(
                          controller: _scrollController,
                          child: Column(
                            children: state.listTindakanModel
                                .asMap()
                                .entries
                                .map(
                                  (e) => Card(
                                      color: ThemeColor.bgColor,
                                      elevation: 1.sp,
                                      shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(2.sp),
                                        side: BorderSide.none,
                                      ),
                                      child: ListTile(
                                          shape: RoundedRectangleBorder(
                                            //<-- SEE HERE
                                            side: const BorderSide(width: 2),
                                            borderRadius:
                                                BorderRadius.circular(2.sp),
                                          ),
                                          leading: CircleAvatar(
                                            backgroundColor:
                                                const Color(0xff6ae792),
                                            child: Text(
                                              (e.key + 1).toString(),
                                              style: blackTextStyle,
                                            ),
                                          ),
                                          title: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                "${e.value.insertDttm.substring(0, 10)}, ${e.value.insertDttm.substring(11, 19)} ",
                                                style: blackTextStyle.copyWith(
                                                  fontWeight: FontWeight.normal,
                                                ),
                                              ),
                                              Text(
                                                e.value.deskripsi,
                                                style: blackTextStyle.copyWith(
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                              Text(
                                                "Nama : ${e.value.perawat.nama}",
                                                style: blackTextStyle.copyWith(
                                                  fontWeight: FontWeight.normal,
                                                ),
                                              ),
                                            ],
                                          ),
                                          trailing: const Icon(Icons.more_vert),
                                          enabled: true)),
                                )
                                .toList(),
                          ),
                        ),
                      )
                    : Container()),
          );
        },
      ),
    );
  }
}
