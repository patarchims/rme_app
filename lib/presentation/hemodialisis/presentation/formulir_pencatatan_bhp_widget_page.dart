import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:hms_app/presentation/component/component.dart';
import 'package:hms_app/presentation/component/loading/loading.dart';
import 'package:hms_app/presentation/hemodialisis/bloc/bhp/bhp_bloc.dart';
import 'package:hms_app/presentation/pages/widget/header_content_widget.dart';
import 'package:sizer/sizer.dart';

class PencatatanBHPReUseDializerWidgetPage extends StatefulWidget {
  const PencatatanBHPReUseDializerWidgetPage({super.key});

  @override
  State<PencatatanBHPReUseDializerWidgetPage> createState() =>
      _PencatatanBHPReUseDializerWidgetPageState();
}

class _PencatatanBHPReUseDializerWidgetPageState
    extends State<PencatatanBHPReUseDializerWidgetPage> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BhpBloc, BhpState>(
      builder: (context, state) {
        if (state.status == BHPStatus.loading) {
          return HeaderContentWidget(
            isENableAdd: false,
            onPressed: null,
            widget: Loading.circleLoading(),
          );
        }

        if (state.status == BHPStatus.loaded) {
          return HeaderContentWidget(
            isENableAdd: true,
            title: "Simpan",
            onPressed: () {},
            widget: SingleChildScrollView(
              child: Column(
                children: [
                  TitleWidget.titleContainer(
                      title: "PENCATATAN BHP (RE-USE) DIALIZER RS HARAPAN"),
                  Container(),
                  SizedBox(
                    child: Column(children: [
                      SizedBox(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              padding: EdgeInsets.all(5.sp),
                              width: Get.width,
                              height: 20.sp,
                              decoration: BoxDecoration(
                                color: ThemeColor.yellowColor.withOpacity(0.5),
                              ),
                              child: Text(
                                "Alat single use yang akan digunakan kembali harus dinilai oleh user (operator) apakah memenuhi syarat :",
                                textAlign: TextAlign.start,
                                style: blackTextStyle.copyWith(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            SizedBox(
                              child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceAround,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Container(
                                              width: Get.width / 2,
                                              padding: EdgeInsets.all(5.sp),
                                              child: Text(
                                                "a. Tidak berubah bentuk",
                                                style: blackTextStyle,
                                              ),
                                            ),
                                            Container(
                                              margin: EdgeInsets.all(2.sp),
                                              height: 15.sp,
                                              width: 20.sp,
                                              child: ElevatedButton(
                                                onPressed: () {
                                                  context.read<BhpBloc>().add(
                                                      OnChanged1A(
                                                          selection: !state
                                                              .bhpHaemodalisaModel
                                                              .item1A));
                                                },
                                                style: ElevatedButton.styleFrom(
                                                  backgroundColor: (state
                                                          .bhpHaemodalisaModel
                                                          .item1A)
                                                      ? Colors.green
                                                      : ThemeColor.primaryColor,
                                                  shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            5.sp),
                                                  ),
                                                ),
                                                child: (state
                                                        .bhpHaemodalisaModel
                                                        .item1A)
                                                    ? const Icon(
                                                        FontAwesomeIcons.check,
                                                        color: Colors.white,
                                                      )
                                                    : const Icon(
                                                        FontAwesomeIcons.minus,
                                                        color: Colors.white,
                                                      ),
                                              ),
                                            )
                                          ],
                                        ),
                                        const Divider()
                                      ],
                                    )
                                  ]),
                            ),
                            SizedBox(
                              child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceAround,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Container(
                                              width: Get.width / 2,
                                              padding: EdgeInsets.all(5.sp),
                                              child: Text(
                                                "b. Tidak berubah warna",
                                                style: blackTextStyle,
                                              ),
                                            ),
                                            Container(
                                              margin: EdgeInsets.all(2.sp),
                                              height: 15.sp,
                                              width: 20.sp,
                                              child: ElevatedButton(
                                                onPressed: () {
                                                  context.read<BhpBloc>().add(
                                                      OnChanged1B(
                                                          selection: !state
                                                              .bhpHaemodalisaModel
                                                              .item1B));
                                                },
                                                style: ElevatedButton.styleFrom(
                                                  backgroundColor: (state
                                                          .bhpHaemodalisaModel
                                                          .item1B)
                                                      ? Colors.green
                                                      : ThemeColor.primaryColor,
                                                  shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            5.sp),
                                                  ),
                                                ),
                                                child: (state
                                                        .bhpHaemodalisaModel
                                                        .item1B)
                                                    ? const Icon(
                                                        FontAwesomeIcons.check,
                                                        color: Colors.white,
                                                      )
                                                    : const Icon(
                                                        FontAwesomeIcons.minus,
                                                        color: Colors.white,
                                                      ),
                                              ),
                                            )
                                          ],
                                        ),
                                        const Divider()
                                      ],
                                    )
                                  ]),
                            ),
                            SizedBox(
                              child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceAround,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Container(
                                              width: Get.width / 2,
                                              padding: EdgeInsets.all(5.sp),
                                              child: Text(
                                                "c. Tidak cacat dan mudah digunakan kembali",
                                                style: blackTextStyle,
                                              ),
                                            ),
                                            Container(
                                              margin: EdgeInsets.all(2.sp),
                                              height: 15.sp,
                                              width: 20.sp,
                                              child: ElevatedButton(
                                                onPressed: () {
                                                  context.read<BhpBloc>().add(
                                                      Onchanged1C(
                                                          selection: !state
                                                              .bhpHaemodalisaModel
                                                              .item1C));
                                                },
                                                style: ElevatedButton.styleFrom(
                                                  backgroundColor: (state
                                                          .bhpHaemodalisaModel
                                                          .item1C)
                                                      ? Colors.green
                                                      : ThemeColor.primaryColor,
                                                  shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            5.sp),
                                                  ),
                                                ),
                                                child: (state
                                                        .bhpHaemodalisaModel
                                                        .item1C)
                                                    ? const Icon(
                                                        FontAwesomeIcons.check,
                                                        color: Colors.white,
                                                      )
                                                    : const Icon(
                                                        FontAwesomeIcons.minus,
                                                        color: Colors.white,
                                                      ),
                                              ),
                                            )
                                          ],
                                        ),
                                        const Divider()
                                      ],
                                    )
                                  ]),
                            ),
                            Container(
                              padding: EdgeInsets.all(5.sp),
                              width: Get.width,
                              height: 20.sp,
                              decoration: BoxDecoration(
                                color: ThemeColor.yellowColor.withOpacity(0.5),
                              ),
                              child: Text(
                                "Melakukan uji test Formance Dializer :",
                                textAlign: TextAlign.start,
                                style: blackTextStyle.copyWith(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            SizedBox(
                              child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceAround,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Container(
                                              width: Get.width / 2,
                                              padding: EdgeInsets.all(5.sp),
                                              child: Text(
                                                "a. > 80 - 100 ml volume cairan (layak pakai)",
                                                style: blackTextStyle,
                                              ),
                                            ),
                                            Container(
                                              margin: EdgeInsets.all(2.sp),
                                              height: 15.sp,
                                              width: 20.sp,
                                              child: ElevatedButton(
                                                onPressed: () {
                                                  context.read<BhpBloc>().add(
                                                      OnChanged2A(
                                                          selection: !state
                                                              .bhpHaemodalisaModel
                                                              .item2A));
                                                },
                                                style: ElevatedButton.styleFrom(
                                                  backgroundColor: (state
                                                          .bhpHaemodalisaModel
                                                          .item2A)
                                                      ? Colors.green
                                                      : ThemeColor.primaryColor,
                                                  shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            5.sp),
                                                  ),
                                                ),
                                                child: (state
                                                        .bhpHaemodalisaModel
                                                        .item2A)
                                                    ? const Icon(
                                                        FontAwesomeIcons.check,
                                                        color: Colors.white,
                                                      )
                                                    : const Icon(
                                                        FontAwesomeIcons.minus,
                                                        color: Colors.white,
                                                      ),
                                              ),
                                            )
                                          ],
                                        ),
                                        const Divider()
                                      ],
                                    )
                                  ]),
                            ),
                            SizedBox(
                              child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceAround,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Container(
                                              width: Get.width / 2,
                                              padding: EdgeInsets.all(5.sp),
                                              child: Text(
                                                "b. < 80 ml volume cairan (tidak layak pakai)",
                                                style: blackTextStyle,
                                              ),
                                            ),
                                            Container(
                                              margin: EdgeInsets.all(2.sp),
                                              height: 15.sp,
                                              width: 20.sp,
                                              child: ElevatedButton(
                                                onPressed: () {
                                                  context.read<BhpBloc>().add(
                                                      OnChanged2B(
                                                          selection: !state
                                                              .bhpHaemodalisaModel
                                                              .item2B));
                                                },
                                                style: ElevatedButton.styleFrom(
                                                  backgroundColor: (state
                                                          .bhpHaemodalisaModel
                                                          .item2B)
                                                      ? Colors.green
                                                      : ThemeColor.primaryColor,
                                                  shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            5.sp),
                                                  ),
                                                ),
                                                child: (state
                                                        .bhpHaemodalisaModel
                                                        .item2B)
                                                    ? const Icon(
                                                        FontAwesomeIcons.check,
                                                        color: Colors.white,
                                                      )
                                                    : const Icon(
                                                        FontAwesomeIcons.minus,
                                                        color: Colors.white,
                                                      ),
                                              ),
                                            )
                                          ],
                                        ),
                                        const Divider()
                                      ],
                                    )
                                  ]),
                            ),
                            Container(
                              width: Get.width,
                              height: 20.sp,
                              decoration: BoxDecoration(
                                color: ThemeColor.yellowColor.withOpacity(0.5),
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      "Proses dekontaminasi, pembersihan, pengemasan, pelebelan sesuai SPO",
                                      textAlign: TextAlign.start,
                                      style: blackTextStyle.copyWith(
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                  const Spacer(),
                                  Container(
                                    margin: EdgeInsets.all(2.sp),
                                    height: 15.sp,
                                    width: 20.sp,
                                    child: ElevatedButton(
                                      onPressed: () {
                                        context.read<BhpBloc>().add(Onchanged3(
                                            selection: !state
                                                .bhpHaemodalisaModel.item3));
                                      },
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor:
                                            (state.bhpHaemodalisaModel.item3)
                                                ? Colors.green
                                                : ThemeColor.primaryColor,
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(5.sp),
                                        ),
                                      ),
                                      child: (state.bhpHaemodalisaModel.item3)
                                          ? const Icon(
                                              FontAwesomeIcons.check,
                                              color: Colors.white,
                                            )
                                          : const Icon(
                                              FontAwesomeIcons.minus,
                                              color: Colors.white,
                                            ),
                                    ),
                                  ),
                                  SizedBox(width: 30.sp)
                                ],
                              ),
                            ),
                            const Divider(),
                            Container(
                              width: Get.width,
                              decoration: BoxDecoration(
                                color: ThemeColor.yellowColor.withOpacity(0.5),
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Container(
                                    width: Get.width - 300.sp,
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      "Dalam kemasan harus dicantumkan catatan penggunaann alat yang bersisi : Nama pasien, Kode Re use I, II, III dst,, tanggal dialakukan dekontaminasi, nama petugas melakukan dekontaminasi ",
                                      textAlign: TextAlign.start,
                                      style: blackTextStyle.copyWith(
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                  const Spacer(),
                                  Container(
                                    margin: EdgeInsets.all(2.sp),
                                    height: 15.sp,
                                    width: 20.sp,
                                    child: ElevatedButton(
                                      onPressed: () {
                                        context.read<BhpBloc>().add(Onchanged4(
                                            selection: !state
                                                .bhpHaemodalisaModel.item4));
                                      },
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor:
                                            (state.bhpHaemodalisaModel.item4)
                                                ? Colors.green
                                                : ThemeColor.primaryColor,
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(5.sp),
                                        ),
                                      ),
                                      child: (state.bhpHaemodalisaModel.item4)
                                          ? const Icon(
                                              FontAwesomeIcons.check,
                                              color: Colors.white,
                                            )
                                          : const Icon(
                                              FontAwesomeIcons.minus,
                                              color: Colors.white,
                                            ),
                                    ),
                                  ),
                                  SizedBox(width: 30.sp)
                                ],
                              ),
                            ),
                            const Divider(),
                            Container(
                              width: Get.width,
                              decoration: BoxDecoration(
                                color: ThemeColor.yellowColor.withOpacity(0.5),
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Container(
                                    width: Get.width - 300.sp,
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      "Alat single use- re -use harus disimpan didalam lemari dyalizer ",
                                      textAlign: TextAlign.start,
                                      style: blackTextStyle.copyWith(
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                  const Spacer(),
                                  Container(
                                    margin: EdgeInsets.all(2.sp),
                                    height: 15.sp,
                                    width: 20.sp,
                                    child: ElevatedButton(
                                      onPressed: () {
                                        context.read<BhpBloc>().add(Onchanged5(
                                            selection: !state
                                                .bhpHaemodalisaModel.item5));
                                      },
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor:
                                            (state.bhpHaemodalisaModel.item5)
                                                ? Colors.green
                                                : ThemeColor.primaryColor,
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(5.sp),
                                        ),
                                      ),
                                      child: (state.bhpHaemodalisaModel.item5)
                                          ? const Icon(
                                              FontAwesomeIcons.check,
                                              color: Colors.white,
                                            )
                                          : const Icon(
                                              FontAwesomeIcons.minus,
                                              color: Colors.white,
                                            ),
                                    ),
                                  ),
                                  SizedBox(width: 30.sp)
                                ],
                              ),
                            ),
                            const Divider(),
                            Container(
                              width: Get.width,
                              decoration: BoxDecoration(
                                color: ThemeColor.yellowColor.withOpacity(0.5),
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Container(
                                    width: Get.width - 300.sp,
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      "Dilakukan pencatatan untuk evaluasi ",
                                      textAlign: TextAlign.start,
                                      style: blackTextStyle.copyWith(
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                  const Spacer(),
                                  Container(
                                    margin: EdgeInsets.all(2.sp),
                                    height: 15.sp,
                                    width: 20.sp,
                                    child: ElevatedButton(
                                      onPressed: () {
                                        context.read<BhpBloc>().add(Onchanged6(
                                            selection: !state
                                                .bhpHaemodalisaModel.item6));
                                      },
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor:
                                            (state.bhpHaemodalisaModel.item6)
                                                ? Colors.green
                                                : ThemeColor.primaryColor,
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(5.sp),
                                        ),
                                      ),
                                      child: (state.bhpHaemodalisaModel.item6)
                                          ? const Icon(
                                              FontAwesomeIcons.check,
                                              color: Colors.white,
                                            )
                                          : const Icon(
                                              FontAwesomeIcons.minus,
                                              color: Colors.white,
                                            ),
                                    ),
                                  ),
                                  SizedBox(width: 30.sp)
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ]),
                  ),
                  SizedBox(
                    height: 20.sp,
                  ),
                ],
              ),
            ),
          );
        }

        return HeaderContentWidget(
          isENableAdd: true,
          title: "Simpan",
          onPressed: () {},
          widget: SingleChildScrollView(
            child: Column(
              children: [
                TitleWidget.titleContainer(
                    title: "PENCATATAN BHP (RE-USE) DIALIZER RS HARAPAN"),
                Container(),
                SizedBox(
                  child: Column(children: [
                    SizedBox(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            padding: EdgeInsets.all(5.sp),
                            width: Get.width,
                            height: 20.sp,
                            decoration: BoxDecoration(
                              color: ThemeColor.yellowColor.withOpacity(0.5),
                            ),
                            child: Text(
                              "Alat single use yang akan digunakan kembali harus dinilai oleh user (operator) apakah memenuhi syarat :",
                              textAlign: TextAlign.start,
                              style: blackTextStyle.copyWith(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          SizedBox(
                            child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceAround,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Container(
                                            width: Get.width / 2,
                                            padding: EdgeInsets.all(5.sp),
                                            child: Text(
                                              "a. Tidak berubah bentuk",
                                              style: blackTextStyle,
                                            ),
                                          ),
                                          Container(
                                            margin: EdgeInsets.all(2.sp),
                                            height: 15.sp,
                                            width: 20.sp,
                                            child: ElevatedButton(
                                              onPressed: () {},
                                              style: ElevatedButton.styleFrom(
                                                backgroundColor:
                                                    ThemeColor.primaryColor,
                                                shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          5.sp),
                                                ),
                                              ),
                                              child: Text(
                                                "",
                                                style: whiteTextStyle,
                                              ),
                                            ),
                                          )
                                        ],
                                      ),
                                      const Divider()
                                    ],
                                  )
                                ]),
                          ),
                          SizedBox(
                            child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceAround,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Container(
                                            width: Get.width / 2,
                                            padding: EdgeInsets.all(5.sp),
                                            child: Text(
                                              "b. Tidak berubah warna",
                                              style: blackTextStyle,
                                            ),
                                          ),
                                          Container(
                                            margin: EdgeInsets.all(2.sp),
                                            height: 15.sp,
                                            width: 20.sp,
                                            child: ElevatedButton(
                                              onPressed: () {},
                                              style: ElevatedButton.styleFrom(
                                                backgroundColor:
                                                    ThemeColor.primaryColor,
                                                shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          5.sp),
                                                ),
                                              ),
                                              child: Text(
                                                "",
                                                style: whiteTextStyle,
                                              ),
                                            ),
                                          )
                                        ],
                                      ),
                                      const Divider()
                                    ],
                                  )
                                ]),
                          ),
                          SizedBox(
                            child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceAround,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Container(
                                            width: Get.width / 2,
                                            padding: EdgeInsets.all(5.sp),
                                            child: Text(
                                              "c. Tidak cacat dan mudah digunakan kembali",
                                              style: blackTextStyle,
                                            ),
                                          ),
                                          Container(
                                            margin: EdgeInsets.all(2.sp),
                                            height: 15.sp,
                                            width: 20.sp,
                                            child: ElevatedButton(
                                              onPressed: () {},
                                              style: ElevatedButton.styleFrom(
                                                backgroundColor:
                                                    ThemeColor.primaryColor,
                                                shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          5.sp),
                                                ),
                                              ),
                                              child: Text(
                                                "",
                                                style: whiteTextStyle,
                                              ),
                                            ),
                                          )
                                        ],
                                      ),
                                      const Divider()
                                    ],
                                  )
                                ]),
                          ),
                          Container(
                            padding: EdgeInsets.all(5.sp),
                            width: Get.width,
                            height: 20.sp,
                            decoration: BoxDecoration(
                              color: ThemeColor.yellowColor.withOpacity(0.5),
                            ),
                            child: Text(
                              "Melakukan uji test Formance Dializer :",
                              textAlign: TextAlign.start,
                              style: blackTextStyle.copyWith(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          SizedBox(
                            child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceAround,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Container(
                                            width: Get.width / 2,
                                            padding: EdgeInsets.all(5.sp),
                                            child: Text(
                                              "a. > 80 - 100 ml volume cairan (layak pakai)",
                                              style: blackTextStyle,
                                            ),
                                          ),
                                          Container(
                                            margin: EdgeInsets.all(2.sp),
                                            height: 15.sp,
                                            width: 20.sp,
                                            child: ElevatedButton(
                                              onPressed: () {},
                                              style: ElevatedButton.styleFrom(
                                                backgroundColor:
                                                    ThemeColor.primaryColor,
                                                shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          5.sp),
                                                ),
                                              ),
                                              child: Text(
                                                "",
                                                style: whiteTextStyle,
                                              ),
                                            ),
                                          )
                                        ],
                                      ),
                                      const Divider()
                                    ],
                                  )
                                ]),
                          ),
                          SizedBox(
                            child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceAround,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Container(
                                            width: Get.width / 2,
                                            padding: EdgeInsets.all(5.sp),
                                            child: Text(
                                              "b. < 80 ml volume cairan (tidak layak pakai)",
                                              style: blackTextStyle,
                                            ),
                                          ),
                                          Container(
                                            margin: EdgeInsets.all(2.sp),
                                            height: 15.sp,
                                            width: 20.sp,
                                            child: ElevatedButton(
                                              onPressed: () {},
                                              style: ElevatedButton.styleFrom(
                                                backgroundColor:
                                                    ThemeColor.primaryColor,
                                                shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          5.sp),
                                                ),
                                              ),
                                              child: Text(
                                                "",
                                                style: whiteTextStyle,
                                              ),
                                            ),
                                          )
                                        ],
                                      ),
                                      const Divider()
                                    ],
                                  )
                                ]),
                          ),
                          Container(
                            width: Get.width,
                            height: 20.sp,
                            decoration: BoxDecoration(
                              color: ThemeColor.yellowColor.withOpacity(0.5),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    "Proses dekontaminasi, pembersihan, pengemasan, pelebelan sesuai SPO",
                                    textAlign: TextAlign.start,
                                    style: blackTextStyle.copyWith(
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                const Spacer(),
                                Container(
                                  margin: EdgeInsets.all(2.sp),
                                  height: 15.sp,
                                  width: 20.sp,
                                  child: ElevatedButton(
                                    onPressed: () {},
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: ThemeColor.primaryColor,
                                      shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(5.sp),
                                      ),
                                    ),
                                    child: Text(
                                      "",
                                      style: whiteTextStyle,
                                    ),
                                  ),
                                ),
                                SizedBox(width: 30.sp)
                              ],
                            ),
                          ),
                          const Divider(),
                          Container(
                            width: Get.width,
                            decoration: BoxDecoration(
                              color: ThemeColor.yellowColor.withOpacity(0.5),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Container(
                                  width: Get.width - 300.sp,
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    "Dalam kemasan harus dicantumkan catatan penggunaann alat yang bersisi : Nama pasien, Kode Re use I, II, III dst,, tanggal dialakukan dekontaminasi, nama petugas melakukan dekontaminasi ",
                                    textAlign: TextAlign.start,
                                    style: blackTextStyle.copyWith(
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                const Spacer(),
                                Container(
                                  margin: EdgeInsets.all(2.sp),
                                  height: 15.sp,
                                  width: 20.sp,
                                  child: ElevatedButton(
                                    onPressed: () {},
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: ThemeColor.primaryColor,
                                      shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(5.sp),
                                      ),
                                    ),
                                    child: Text(
                                      "",
                                      style: whiteTextStyle,
                                    ),
                                  ),
                                ),
                                SizedBox(width: 30.sp)
                              ],
                            ),
                          ),
                          const Divider(),
                          Container(
                            width: Get.width,
                            decoration: BoxDecoration(
                              color: ThemeColor.yellowColor.withOpacity(0.5),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Container(
                                  width: Get.width - 300.sp,
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    "Alat single use- re -use harus disimpan didalam lemari dyalizer ",
                                    textAlign: TextAlign.start,
                                    style: blackTextStyle.copyWith(
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                const Spacer(),
                                Container(
                                  margin: EdgeInsets.all(2.sp),
                                  height: 15.sp,
                                  width: 20.sp,
                                  child: ElevatedButton(
                                    onPressed: () {},
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: ThemeColor.primaryColor,
                                      shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(5.sp),
                                      ),
                                    ),
                                    child: Text(
                                      "",
                                      style: whiteTextStyle,
                                    ),
                                  ),
                                ),
                                SizedBox(width: 30.sp)
                              ],
                            ),
                          ),
                          const Divider(),
                          Container(
                            width: Get.width,
                            decoration: BoxDecoration(
                              color: ThemeColor.yellowColor.withOpacity(0.5),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Container(
                                  width: Get.width - 300.sp,
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    "Dilakukan pencatatan untuk evaluasi ",
                                    textAlign: TextAlign.start,
                                    style: blackTextStyle.copyWith(
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                const Spacer(),
                                Container(
                                  margin: EdgeInsets.all(2.sp),
                                  height: 15.sp,
                                  width: 20.sp,
                                  child: ElevatedButton(
                                    onPressed: () {},
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: ThemeColor.primaryColor,
                                      shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(5.sp),
                                      ),
                                    ),
                                    child: Text(
                                      "",
                                      style: whiteTextStyle,
                                    ),
                                  ),
                                ),
                                SizedBox(width: 30.sp)
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ]),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
