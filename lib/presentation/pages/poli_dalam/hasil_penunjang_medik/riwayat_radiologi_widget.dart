import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:hms_app/domain/bloc/dashboard/hasil_penunjang/hasil_penunjang_bloc.dart';
import 'package:hms_app/domain/models/response/hasil_radiologi_model.dart';
import 'package:hms_app/presentation/component/component.dart';
import 'package:hms_app/presentation/component/shimer/shimer_loading.dart';
import 'package:hms_app/presentation/screens/emty_page.dart';
import 'package:sizer/sizer.dart';

class RiwayatRadiologiPenmedikWidget extends StatelessWidget {
  const RiwayatRadiologiPenmedikWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HasilPenunjangBloc, HasilPenunjangState>(
      builder: (context, state) {
        if (state.isLoadingRadiologi) {
          return SizedBox(
            width: Get.width,
            height: Get.height,
            child: ShimerLoading.loadingExpandCard(
                baseColor: Colors.white.withOpacity(0.5),
                highLightColor: Colors.lightBlue.withOpacity(0.1)),
          );
        }

        return state.getOrSuccessResultRadiologi.fold(
            () => Container(),
            (a) => a.fold(
                (l) => l.maybeMap(
                      orElse: () {
                        return Container();
                      },
                    ),
                (r) => r.maybeMap(orElse: () {
                      return const Text("Sdf");
                    }, emty: (e) {
                      return EmtyScren(
                          subTitle: "Data Kosong", textStyle: blackTextStyle);
                    }, loaded: (e) {
                      List<RiwayatRadiologiModel> data =
                          (e.value["response"] as Iterable)
                              .map((e) => RiwayatRadiologiModel.fromJson(e))
                              .toList();

                      return SingleChildScrollView(
                        child: Column(
                          children: data
                              .map((e) => Container(
                                    width: Get.width,
                                    decoration: const BoxDecoration(),
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.end,
                                      children: [
                                        Container(
                                          width: Get.width,
                                          decoration: const BoxDecoration(
                                              color: ThemeColor.primaryColor),
                                          padding: const EdgeInsets.all(8.0),
                                          child: Text(
                                            e.judul,
                                            textAlign: TextAlign.end,
                                            style: whiteTextStyle,
                                          ),
                                        ),
                                        SizedBox(
                                          child: Table(
                                            border: TableBorder.all(
                                                color: Colors.black),
                                            children: [
                                              TableRow(children: [
                                                headerTitle(title: "Hasil : ")
                                              ]),
                                            ],
                                          ),
                                        ),
                                        Container(
                                          width: Get.width,
                                          decoration: BoxDecoration(
                                              color: ThemeColor.primaryColor
                                                  .withOpacity(0.3)),
                                          padding: const EdgeInsets.all(8.0),
                                          child: Text(
                                            e.hasil,
                                            textAlign: TextAlign.start,
                                            style: blackTextStyle,
                                          ),
                                        ),
                                        SizedBox(
                                          child: Table(
                                            border: TableBorder.all(
                                                color: Colors.black),
                                            children: [
                                              TableRow(children: [
                                                headerTitle(title: "Uraian : ")
                                              ]),
                                            ],
                                          ),
                                        ),
                                        Container(
                                          width: Get.width,
                                          decoration: BoxDecoration(
                                              color: ThemeColor.primaryColor
                                                  .withOpacity(0.3)),
                                          padding: const EdgeInsets.all(8.0),
                                          child: Text(
                                            e.uraian,
                                            textAlign: TextAlign.start,
                                            style: blackTextStyle,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ))
                              .toList(),
                        ),
                      );
                    })));
      },
    );
  }

  Container headerTitle({required String title}) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 2.sp, horizontal: 2.sp),
      decoration: BoxDecoration(color: Colors.yellow.withOpacity(0.5)),
      child: Text(
        title,
        style: blackTextStyle.copyWith(fontWeight: FontWeight.bold),
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
