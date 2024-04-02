import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:hms_app/domain/bloc/dashboard/pasien/pasien_bloc.dart';
import 'package:hms_app/domain/models/response/detail_pasien_model_response.dart';
import 'package:hms_app/presentation/component/color/color_helper.dart';
import 'package:hms_app/presentation/component/fonts/font_helper.dart';
import 'package:hms_app/presentation/component/shared/input_text.dart';
import 'package:hms_app/presentation/screens/disconect_screenn.dart';
import 'package:hms_app/presentation/screens/emty_page.dart';
import 'package:hms_app/presentation/pages/pasien/loading_shimer_widget.dart';
import 'package:hms_app/presentation/pages/pasien/riwayat_pasien_widget.dart';
import 'package:sizer/sizer.dart';

class DetailPasienPage extends StatelessWidget {
  const DetailPasienPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ThemeColor.bgColor,
      appBar: AppBar(
        backgroundColor: ThemeColor.primaryColor,
        title: Text("Detail Pasien", style: whiteTextStyle),
      ),
      body: SingleChildScrollView(
        child: BlocBuilder<PasienBloc, PasienState>(
          builder: (context, state) {
            if (state.loadingDetailPasien) {
              return const LoadingUserProfileWidget();
            }

            return state.detailPasienResult.fold(
                () => Container(),
                (a) => a.fold(
                      (l) => l.maybeMap(
                        orElse: () => Container(),
                        badResponse: (value) => const Center(
                          child: DisconectWidget(
                              networkResponse: NetworkResponse.badRequest),
                        ),
                        connectionTimeOut: (value) => const Center(
                          child: DisconectWidget(
                              networkResponse: NetworkResponse.timeOut),
                        ),
                        disconectToServer: (value) => const Center(
                          child: DisconectWidget(
                              networkResponse: NetworkResponse.noConnection),
                        ),
                        failure: (value) => const Center(
                          child: DisconectWidget(
                              networkResponse: NetworkResponse.failed),
                        ),
                        noConnection: (value) => const Center(
                          child: DisconectWidget(
                              networkResponse: NetworkResponse.noConnection),
                        ),
                      ),
                      (r) => r.maybeMap(
                          orElse: () => Container(),
                          auAutorized: (e) => Container(),
                          emty: (e) => Container(),
                          loaded: (e) {
                            final pasien = DetailPasienModel.fromMap(
                                e.value["response"]["pasien"]);

                            List<RiwayatPasienModel> riwayatPasien =
                                (e.value['response']["riwayat"] as Iterable)
                                    .map((e) => RiwayatPasienModel.fromMap(e))
                                    .toList();

                            final singlePasien = state.listPasienModel.where(
                                (element) => element.mrn == state.normSelected);

                            return Column(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                Container(
                                  height: 20.sp,
                                  width: Get.width,
                                  padding: EdgeInsets.only(left: 12.sp),
                                  margin:
                                      EdgeInsets.symmetric(horizontal: 8.sp),
                                  decoration: BoxDecoration(
                                      color: ThemeColor.primaryColor,
                                      borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(4.sp),
                                          topRight: Radius.circular(4.sp))),
                                  child: Align(
                                    alignment: Alignment.centerLeft,
                                    child: Text(
                                      "Informasi Pasien Tersebut ! ${singlePasien.first.noreg}",
                                      textAlign: TextAlign.right,
                                      style: whiteTextStyle,
                                    ),
                                  ),
                                ),

                                Row(
                                  children: [
                                    Container(
                                      width: Get.width / 3.2,
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 6.sp, vertical: 4.sp),
                                      margin: EdgeInsets.only(
                                          top: 4.sp, right: 4.sp, left: 4.sp),
                                      decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(4.sp),
                                        color: ThemeColor.primaryColor,
                                      ),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          feld(
                                              title: "Debitur ",
                                              subTitle:
                                                  singlePasien.first.debitur),
                                          SizedBox(height: 2.sp),
                                          Row(
                                            children: [
                                              Expanded(
                                                flex: 1,
                                                child: Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .start,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .center,
                                                      children: [
                                                        Text(
                                                          "M.R.N    ",
                                                          textAlign:
                                                              TextAlign.left,
                                                          style: whiteTextStyle
                                                              .copyWith(
                                                                  fontSize:
                                                                      5.5.sp),
                                                        ),
                                                        SizedBox(width: 30.sp),
                                                        Expanded(
                                                          flex: 1,
                                                          child: SizedBox(
                                                            height: 16.sp,
                                                            child: InputText(
                                                              style: whiteCalibriTextStyle
                                                                  .copyWith(
                                                                      fontSize:
                                                                          7.sp),
                                                              controller:
                                                                  TextEditingController(
                                                                      text: pasien
                                                                          .id),
                                                              labelText: "",
                                                              fillColor: const Color(
                                                                      0xFF18181B)
                                                                  .withOpacity(
                                                                      0.5),
                                                              keyboardType:
                                                                  TextInputType
                                                                      .visiblePassword,
                                                              onChanged:
                                                                  (value) {},
                                                              onSaved: (val) {},
                                                              textInputAction:
                                                                  TextInputAction
                                                                      .done,
                                                              isPassword: false,
                                                              enabled: false,
                                                            ),
                                                          ),
                                                        ),
                                                        SizedBox(width: 2.sp),
                                                      ],
                                                    ),
                                                    SizedBox(height: 2.sp),
                                                    Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .start,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .center,
                                                      children: [
                                                        Text(
                                                          "NO. KTP",
                                                          textAlign:
                                                              TextAlign.left,
                                                          style: whiteTextStyle
                                                              .copyWith(
                                                                  fontSize:
                                                                      5.5.sp),
                                                        ),
                                                        SizedBox(width: 30.sp),
                                                        Expanded(
                                                          flex: 1,
                                                          child: SizedBox(
                                                            height: 16.sp,
                                                            child: InputText(
                                                              controller:
                                                                  TextEditingController(
                                                                      text: pasien
                                                                          .nik),
                                                              style: whiteCalibriTextStyle
                                                                  .copyWith(
                                                                      fontSize:
                                                                          7.sp),
                                                              labelText: "",
                                                              fillColor: const Color(
                                                                      0xFF18181B)
                                                                  .withOpacity(
                                                                      0.5),
                                                              keyboardType:
                                                                  TextInputType
                                                                      .visiblePassword,
                                                              onChanged:
                                                                  (value) {},
                                                              onSaved: (val) {},
                                                              textInputAction:
                                                                  TextInputAction
                                                                      .done,
                                                              isPassword: false,
                                                              enabled: false,
                                                            ),
                                                          ),
                                                        ),
                                                        SizedBox(width: 2.sp),
                                                      ],
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              SizedBox(
                                                height: 16.sp * 2,
                                                width: 50,
                                                child: FloatingActionButton(
                                                  elevation: 0,
                                                  heroTag: "photo",
                                                  onPressed: () {},
                                                  child: ClipOval(
                                                    child: Container(
                                                        height: 15.sp,
                                                        width: 15.sp,
                                                        decoration: BoxDecoration(
                                                            borderRadius: BorderRadius.circular(20.sp),
                                                            image: const DecorationImage(
                                                                // DETAIL IMAGE PASIEN
                                                                // TODO : IMAGE PASIEN
                                                                image: NetworkImage("https://avatars.githubusercontent.com/u/50953777?s=96&v=4"),

                                                                // image: NetworkImage(
                                                                //     "https://vincentcore.co.id/images/default_image.png"),
                                                                fit: BoxFit.cover))),
                                                  ),
                                                ),
                                              )
                                            ],
                                          ),
                                          SizedBox(height: 2.sp),
                                          feld(
                                              title: "NOKA-BPJS",
                                              subTitle: pasien.nokapst),
                                          SizedBox(height: 2.sp),
                                          feld(
                                              title: "Nama Pasien",
                                              subTitle: pasien.nama),
                                          SizedBox(height: 2.sp),
                                          feld(
                                              title: "Tempat Lahir",
                                              subTitle: pasien.tempatlahir),
                                          SizedBox(height: 2.sp),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              Expanded(
                                                flex: 1,
                                                child: Text(
                                                  "Tgl Lahir/Sex",
                                                  textAlign: TextAlign.left,
                                                  style:
                                                      whiteTextStyle.copyWith(
                                                          fontSize: 5.5.sp),
                                                ),
                                              ),
                                              SizedBox(width: 3.sp),
                                              Expanded(
                                                child: SizedBox(
                                                  height: 16.sp,
                                                  child: InputText(
                                                    style: whiteCalibriTextStyle
                                                        .copyWith(
                                                            fontSize: 6.5.sp),
                                                    labelText: "",
                                                    controller:
                                                        TextEditingController(
                                                            text:
                                                                "${pasien.har} ${pasien.bul} ${pasien.tah}"),
                                                    fillColor:
                                                        const Color(0xFF18181B)
                                                            .withOpacity(0.5),
                                                    keyboardType: TextInputType
                                                        .visiblePassword,
                                                    onChanged: (value) {},
                                                    onSaved: (val) {},
                                                    textInputAction:
                                                        TextInputAction.done,
                                                    isPassword: false,
                                                    enabled: false,
                                                  ),
                                                ),
                                              ),
                                              SizedBox(width: 3.sp),
                                              SizedBox(
                                                height: 16.sp,
                                                width: 45.sp,
                                                child: InputText(
                                                  controller:
                                                      TextEditingController(
                                                          text: pasien
                                                              .jeniskelamin),
                                                  style: whiteCalibriTextStyle
                                                      .copyWith(
                                                          fontSize: 6.5.sp),
                                                  labelText: "",
                                                  fillColor:
                                                      const Color(0xFF18181B)
                                                          .withOpacity(0.5),
                                                  keyboardType: TextInputType
                                                      .visiblePassword,
                                                  onChanged: (value) {},
                                                  onSaved: (val) {},
                                                  textInputAction:
                                                      TextInputAction.done,
                                                  isPassword: false,
                                                  enabled: false,
                                                ),
                                              ),
                                            ],
                                          ),
                                          SizedBox(height: 2.sp),
                                          feld(
                                              title: "Umur Hari ini",
                                              subTitle:
                                                  "${pasien.tahun} Tahun ${pasien.bulan} Bulan ${pasien.hari} Hari"),
                                          SizedBox(height: 2.sp),
                                          feld(
                                              title: "Status",
                                              subTitle: pasien.status),
                                          SizedBox(height: 2.sp),
                                          feld(
                                              title: "Agama",
                                              subTitle: pasien.agama),
                                          SizedBox(height: 2.sp),
                                          feld(
                                              title: "Suku",
                                              subTitle: pasien.suku),
                                        ],
                                      ),
                                    ),
                                    Container(
                                      width: Get.width / 3.2,
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 6.sp, vertical: 12.sp),
                                      margin: EdgeInsets.only(
                                        top: 4.sp,
                                        right: 4.sp,
                                      ),
                                      decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(4.sp),
                                        color: ThemeColor.primaryColor,
                                      ),
                                      child: Column(
                                        children: [
                                          SizedBox(height: 4.sp),
                                          feld(
                                              title: "Negara Asal",
                                              subTitle: pasien.negara),
                                          SizedBox(height: 2.sp),
                                          feld(
                                              title: "Provinsi Asal",
                                              subTitle: pasien.provinsi),
                                          SizedBox(height: 2.sp),
                                          feld(
                                              title: "Kabupaten/Kota",
                                              subTitle: pasien.kabupaten),
                                          SizedBox(height: 2.sp),
                                          feld(
                                              title: "Kecamatan",
                                              subTitle: pasien.kecamatan),
                                          SizedBox(height: 2.sp),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              Expanded(
                                                flex: 1,
                                                child: Text(
                                                  "Kelurahan\nRT/RW",
                                                  textAlign: TextAlign.left,
                                                  overflow: TextOverflow.clip,
                                                  style:
                                                      whiteTextStyle.copyWith(
                                                          fontSize: 5.5.sp),
                                                ),
                                              ),
                                              SizedBox(width: 2.sp),
                                              SizedBox(
                                                width: 60.sp,
                                                height: 16.sp,
                                                child: InputText(
                                                  labelText: "",
                                                  style: whiteCalibriTextStyle
                                                      .copyWith(
                                                          fontSize: 6.5.sp),
                                                  controller:
                                                      TextEditingController(
                                                          text:
                                                              pasien.kelurahan),
                                                  fillColor:
                                                      const Color(0xFF18181B)
                                                          .withOpacity(0.5),
                                                  keyboardType: TextInputType
                                                      .visiblePassword,
                                                  onChanged: (value) {},
                                                  onSaved: (val) {},
                                                  textInputAction:
                                                      TextInputAction.done,
                                                  isPassword: false,
                                                  enabled: false,
                                                ),
                                              ),
                                              SizedBox(width: 2.sp),
                                              SizedBox(
                                                height: 16.sp,
                                                width: 40.sp,
                                                child: InputText(
                                                  style: whiteCalibriTextStyle
                                                      .copyWith(
                                                          fontSize: 6.5.sp),
                                                  controller:
                                                      TextEditingController(
                                                          text: pasien.rtrw),
                                                  labelText: "",
                                                  fillColor:
                                                      const Color(0xFF18181B)
                                                          .withOpacity(0.5),
                                                  keyboardType: TextInputType
                                                      .visiblePassword,
                                                  onChanged: (value) {},
                                                  onSaved: (val) {},
                                                  textInputAction:
                                                      TextInputAction.done,
                                                  isPassword: false,
                                                  enabled: false,
                                                ),
                                              ),
                                            ],
                                          ),
                                          SizedBox(height: 2.sp),
                                          feldAlamat(
                                              title: "Alamat Pasien Sesuai KTP",
                                              subTile: pasien.alamat),
                                          SizedBox(height: 2.sp),
                                          feldAlamat(
                                              title:
                                                  "Alamat Tinggal Sesuai Domisili",
                                              subTile: pasien.alamat2),
                                          SizedBox(height: 2.sp),
                                          feld(
                                            title: "No.HP/Telepon",
                                            subTitle: pasien.cpn,
                                          ),
                                          SizedBox(height: 2.sp),
                                          feld(
                                              title: "Pend/Pekerjan",
                                              subTitle: pasien.pendidikan),
                                        ],
                                      ),
                                    ),
                                    Expanded(
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Container(
                                            height: Get.height - 180.sp,
                                            padding: EdgeInsets.symmetric(
                                                horizontal: 4.sp,
                                                vertical: 4.sp),
                                            margin: EdgeInsets.only(
                                              top: 4.sp,
                                              right: 4.sp,
                                            ),
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(4.sp),
                                              color: ThemeColor.primaryColor,
                                            ),
                                            child: (riwayatPasien.isEmpty)
                                                ? EmtyScren(
                                                    size: 50.sp,
                                                    subTitle:
                                                        "Riwayat pasien\ntidak ada",
                                                  )
                                                : RiwayatPasienWidget(
                                                    riwayatPasien:
                                                        riwayatPasien),
                                          ),
                                          Container(
                                            height: Get.height - 220.sp,
                                            padding: EdgeInsets.symmetric(
                                                horizontal: 2.sp,
                                                vertical: 2.sp),
                                            margin: EdgeInsets.only(
                                              top: 4.sp,
                                              right: 4.sp,
                                            ),
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(4.sp),
                                              color: ThemeColor.primaryColor,
                                            ),
                                            child: Card(
                                              color: Colors.transparent,
                                              elevation: 0,
                                              shape:
                                                  const RoundedRectangleBorder(
                                                side: BorderSide(
                                                    color: Colors.white),
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(12)),
                                              ),
                                              child: Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Padding(
                                                    padding: EdgeInsets.only(
                                                        left: 6.sp, top: 3.sp),
                                                    child: Text(
                                                      'Contact Person - Data Penjamin Pasien',
                                                      style:
                                                          whiteCalibriTextStyle
                                                              .copyWith(
                                                                  fontSize:
                                                                      7.sp),
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    height: 6.sp,
                                                  ),
                                                  Padding(
                                                    padding:
                                                        EdgeInsets.symmetric(
                                                      horizontal: 4.sp,
                                                    ),
                                                    child: feld(
                                                        title: "Nama",
                                                        subTitle:
                                                            pasien.cpName),
                                                  ),
                                                  SizedBox(height: 1.sp),
                                                  Padding(
                                                    padding:
                                                        EdgeInsets.symmetric(
                                                            horizontal: 4.sp),
                                                    child: feld(
                                                        title: "Contact Number",
                                                        subTitle:
                                                            pasien.cpNumber),
                                                  ),
                                                  SizedBox(height: 1.sp),
                                                  Padding(
                                                    padding:
                                                        EdgeInsets.symmetric(
                                                            horizontal: 4.sp),
                                                    child: feld(
                                                        title: "Hubungan",
                                                        subTitle:
                                                            pasien.cpRelasi),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 4.sp,
                                ),

                                // NOTE
                                Container(
                                  height: 20.sp,
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 6.sp),
                                  margin:
                                      EdgeInsets.symmetric(horizontal: 8.sp),
                                  decoration: BoxDecoration(
                                      color: ThemeColor.primaryColor,
                                      borderRadius: BorderRadius.only(
                                          bottomLeft: Radius.circular(4.sp),
                                          bottomRight: Radius.circular(4.sp))),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Text(
                                        "DPTJP Tersebut : ${singlePasien.first.namaDokter}",
                                        textAlign: TextAlign.right,
                                        style: whiteTextStyle,
                                      ),
                                      Text(
                                        "Pelayanan : ${singlePasien.first.pelayanan} - ${singlePasien.first.bagian}",
                                        textAlign: TextAlign.right,
                                        style: whiteTextStyle,
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: 4.sp,
                                ),
                              ],
                            );
                          }),
                    ));
          },
        ),
      ),
    );
  }

  Row feld({required String title, String? subTitle}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(
          flex: 1,
          child: Text(
            title,
            textAlign: TextAlign.left,
            style: whiteTextStyle.copyWith(fontSize: 5.5.sp),
          ),
        ),
        SizedBox(
          width: 3.5.sp,
        ),
        Expanded(
          flex: 2,
          child: SizedBox(
            height: 16.sp,
            width: Get.width / 5.2,
            child: InputText(
              style: whiteCalibriTextStyle.copyWith(fontSize: 7.sp),
              controller: TextEditingController(text: subTitle ?? ""),
              labelText: "",
              fillColor: const Color(0xFF18181B).withOpacity(0.5),
              keyboardType: TextInputType.visiblePassword,
              onChanged: (value) {},
              onSaved: (val) {},
              textInputAction: TextInputAction.done,
              isPassword: false,
              enabled: false,
            ),
          ),
        )
      ],
    );
  }

  Row feldAlamat({required String title, String? subTile}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(
          flex: 1,
          child: Text(
            title,
            textAlign: TextAlign.left,
            style: whiteTextStyle.copyWith(fontSize: 5.5.sp),
          ),
        ),
        SizedBox(
          width: 3.sp,
        ),
        Expanded(
          flex: 2,
          child: SizedBox(
            width: Get.width / 5.5,
            child: InputText(
              style: whiteCalibriTextStyle.copyWith(
                fontSize: 7.sp,
                overflow: TextOverflow.ellipsis,
              ),
              controller: TextEditingController(text: subTile ?? ""),
              labelText: "",
              fillColor: const Color(0xFF18181B).withOpacity(0.5),
              keyboardType: TextInputType.visiblePassword,
              onChanged: (value) {},
              onSaved: (val) {},
              textInputAction: TextInputAction.done,
              isPassword: false,
              enabled: false,
            ),
          ),
        )
      ],
    );
  }
}
