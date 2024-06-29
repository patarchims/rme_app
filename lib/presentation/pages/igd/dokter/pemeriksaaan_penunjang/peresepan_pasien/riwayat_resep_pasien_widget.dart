import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:hms_app/presentation/component/component.dart';
import 'package:hms_app/presentation/component/loading/loading.dart';
import 'package:hms_app/presentation/pages/igd/bloc/resep/resep_bloc.dart';
import 'package:hms_app/presentation/screens/emty_page.dart';
import 'package:sizer/sizer.dart';

class RiwayatResepPasienWidget extends StatefulWidget {
  const RiwayatResepPasienWidget({super.key});

  @override
  State<RiwayatResepPasienWidget> createState() =>
      _RiwayatResepPasienWidgetState();
}

class _RiwayatResepPasienWidgetState extends State<RiwayatResepPasienWidget> {
  final ScrollController _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: Get.height / 2,
      width: Get.width / 1.5,
      decoration: const BoxDecoration(
        color: ThemeColor.whiteColor,
      ),
      child: Scaffold(
        backgroundColor: ThemeColor.bgColor,
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: ThemeColor.primaryColor,
          title: Text(
            "Riwayat Resep",
            style: whiteTextStyle,
          ),
        ),
        body: RawScrollbar(
            thumbColor: ThemeColor.darkColor,
            thumbVisibility: true,
            interactive: true,
            thickness: 10.sp,
            controller: _scrollController,
            radius: Radius.circular(5.sp),
            trackVisibility: false,
            child: SingleChildScrollView(
              child: BlocBuilder<ResepBloc, ResepState>(
                builder: (context, state) {
                  if (state.status == ResepStatus.isLoadingGetHistoryResep) {
                    return Loading.expandedLoading();
                  }

                  if (state.status == ResepStatus.loaded) {
                    return Container(
                      margin: EdgeInsets.all(5.sp),
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: (state.historyResep.isEmpty)
                              ? [
                                  EmtyScren(
                                    subTitle: 'Data kosong',
                                    textStyle: blackTextStyle,
                                  ),
                                ]
                              : state.historyResep
                                  .asMap()
                                  .entries
                                  .map(
                                    (his) => Container(
                                      margin: EdgeInsets.only(
                                          top: 1.sp, right: 15.sp),
                                      decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(2.sp),
                                        color: ThemeColor.primaryColor,
                                      ),
                                      child: ListTile(
                                        enabled: true,
                                        style: ListTileStyle.list,
                                        trailing: IconButton(
                                            onPressed: () {},
                                            icon: const Icon(
                                              FontAwesomeIcons.check,
                                              color: ThemeColor.blueColor,
                                            )),
                                        title: Text(
                                          "${his.value.namaObat}\nJumlah ${his.value.jumlah}\nSatuan ${his.value.satuan}\nDosis${his.value.dosis}, ",
                                          style: blackTextStyle,
                                        ),
                                      ),
                                    ),
                                  )
                                  .toList()),
                    );
                  }

                  return Container();
                },
              ),
            )),
      ),
    );
  }
}
