import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:hms_app/presentation/component/component.dart';
import 'package:hms_app/presentation/component/loading/loading.dart';
import 'package:hms_app/presentation/perina/bloc/analisa/analisa_bloc.dart';
import 'package:sizer/sizer.dart';

class CariDiagnosaKeperawatanWidget extends StatefulWidget {
  const CariDiagnosaKeperawatanWidget({super.key});

  @override
  State<CariDiagnosaKeperawatanWidget> createState() =>
      _CariDiagnosaKeperawatanWidgetState();
}

class _CariDiagnosaKeperawatanWidgetState
    extends State<CariDiagnosaKeperawatanWidget> {
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
    // _scrollController.dispose();
    _scrollController.dispose();
    _cariController.clear();
    _cariController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // PasienState pasienState = context.watch<PasienBloc>().state;
    // final singlePasien = pasienState.listPasienModel
    //     .where((element) => element.mrn == pasienState.normSelected);
    // AuthState authState = context.watch<AuthBloc>().state;

    return Container(
        width: Get.width / 1.5,
        height: 155.sp,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadiusDirectional.circular(15.sp)),
        child: BlocConsumer<AnalisaBloc, AnalisaState>(
          listener: (context, state) {},
          builder: (context, state) {
            return Scaffold(
              backgroundColor: ThemeColor.bgColor,
              body: Stack(
                children: [
                  Positioned.fill(
                      child: Container(
                    margin: EdgeInsets.only(top: 40.sp),
                    padding:
                        EdgeInsets.symmetric(horizontal: 5.sp, vertical: 5.sp),
                    decoration: const BoxDecoration(color: Colors.white),
                    child: BlocBuilder<AnalisaBloc, AnalisaState>(
                      builder: (context, state) {
                        if (state.status == AnalisaStatus.loading) {
                          return Loading.expandedLoading();
                        }

                        if (state.diagnosaKeperawatanModel.isNotEmpty) {
                          return Scrollbar(
                            thumbVisibility: true,
                            interactive: true,
                            controller: _scrollController, // <
                            child: ListView(
                              controller: _scrollController,
                              children: (state
                                      .diagnosaKeperawatanModel.isNotEmpty)
                                  ? state.diagnosaKeperawatanModel
                                      .asMap()
                                      .entries
                                      .where((element) => element.value.judul
                                          .toLowerCase()
                                          .contains(valueSearch))
                                      .map((e) => Card(
                                            elevation: 1,
                                            color: ThemeColor.softBlue,
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: ListTile(
                                                trailing: SizedBox(
                                                  height: 25.sp,
                                                  width: 25.sp,
                                                  child: IconButton(
                                                      onPressed: () {
                                                        //  ADD TO SELECTED LIST
                                                        context
                                                            .read<AnalisaBloc>()
                                                            .add(OnAddDiagnosaKeperawatan(
                                                                diagnosa:
                                                                    e.value));

                                                        Get.back();
                                                      },
                                                      style: ElevatedButton.styleFrom(
                                                          backgroundColor:
                                                              ThemeColor
                                                                  .primaryColor,
                                                          shape: RoundedRectangleBorder(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(2
                                                                          .sp))),
                                                      color:
                                                          ThemeColor.whiteColor,
                                                      icon: const Icon(
                                                        FontAwesomeIcons
                                                            .circleArrowRight,
                                                        color: Colors.white,
                                                      )),
                                                ),
                                                enabled: true,
                                                title: Text(
                                                  "${e.value.kode} -${e.value.judul}",
                                                  style:
                                                      blackTextStyle.copyWith(
                                                          fontSize: 6.sp,
                                                          fontWeight:
                                                              FontWeight.bold),
                                                ),
                                              ),
                                            ),
                                          ))
                                      .toList()
                                  : [],
                            ),
                          );
                        }
                        return Container();
                      },
                    ),
                  )),
                  Align(
                    alignment: Alignment.topCenter,
                    child: Container(
                      width: Get.width,
                      color: ThemeColor.lightGrey,
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: 25.sp, vertical: 5.sp),
                        child: Row(
                          children: [
                            // ======
                            Padding(
                              padding: EdgeInsets.only(right: 4.sp),
                              child: Text("Cari Diagnosa",
                                  style:
                                      blackTextStyle.copyWith(fontSize: 6.sp)),
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
            );
          },
        ));
  }
}
