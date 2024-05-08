import 'dart:developer';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:hms_app/domain/bloc/dashboard/pasien/pasien_bloc.dart';
import 'package:hms_app/domain/bloc/asesmen/medis/odontogram/odontogram_bloc.dart';
import 'package:hms_app/domain/models/gigi/assets_gigi_model.dart';
import 'package:hms_app/domain/models/meta/meta_model.dart';
import 'package:hms_app/presentation/component/alert/custom_dialog.dart';
import 'package:hms_app/presentation/component/color/color_helper.dart';
import 'package:hms_app/presentation/component/form/form_textfield_widget.dart';
import 'package:hms_app/presentation/component/res/colors.dart';
import 'package:hms_app/presentation/pages/poli_gigi/medis/box_gigi_disable_widget.dart';
import 'package:hms_app/presentation/pages/poli_gigi/medis/box_gigi_widget.dart';
import 'package:hms_app/presentation/pages/widget/header_content_widget.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:image_painter/image_painter.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:screenshot/screenshot.dart';
import 'package:sizer/sizer.dart';

import 'package:hms_app/domain/models/gigi/gigi_model.dart';
import 'package:hms_app/domain/models/odontogram/odontogram_model.dart';
import 'package:hms_app/presentation/component/alert/alert.dart';
import 'package:hms_app/presentation/component/fonts/font_helper.dart';

class OdontogramWidget extends StatefulWidget {
  const OdontogramWidget({
    super.key,
  });

  @override
  State<OdontogramWidget> createState() => _OdontogramWidgetState();
}

class _OdontogramWidgetState extends State<OdontogramWidget> {
  final imageKey = GlobalKey<ImagePainterState>();
  ScreenshotController screenshotController = ScreenshotController();
  late List<OdontogramModel> odontogramList;
  late TextEditingController _valueController;
  late String seletedItem = "";
  KategoriGigi? kategoriGigi = KategoriGigi.dewasa;
  String ondogram = "";
  late List<String> value;
  int selectedNumber = listGigiModelUser.first.numberGigi;
  int? valueKategori = 1;
  String selectedImage = "01";

  void capcureImage() async {
    final images = await screenshotController.capture();
    if (images != null) {
      saveImages(images);
    }
  }

  Future<String> saveImages(Uint8List bytes) async {
    await [Permission.storage].request();

    final time = DateTime.now()
        .toIso8601String()
        .replaceAll('.', '-')
        .replaceAll(':', '-');

    final name = 'image_$time';

    final result = await ImageGallerySaver.saveImage(bytes, name: name);

    log("RESULT ${result['filePath']}$name");

    return result['filePath'];
  }

  @override
  void initState() {
    odontogramList = [];
    _valueController = TextEditingController();
    value = [];
    super.initState();
  }

  @override
  void dispose() {
    _valueController.dispose();
    super.dispose();
  }

  void addItemToList({required String items}) {
    setState(() {
      value.add(items);
      _valueController.clear();
    });
  }

  void clear() {
    _valueController.clear();
    value = [];
  }

  void removeList({required String items}) {
    setState(() {
      value.removeWhere((item) => item == items);
    });
  }

  void validasiList({required String items}) {
    int result = value.indexWhere((element) => element == items);
    if (result == -1) {
      addItemToList(items: items);
    } else {
      setState(() {
        Alert.failure(context, "Data sudah di entry");
      });
    }
  }

  void addOntogram({required OdontogramModel odontogramModel}) {
    setState(() {
      odontogramList.add(odontogramModel);
      _valueController.clear();
    });
  }

  void removeOntogram({required OdontogramModel odontogramModel}) {
    setState(() {
      odontogramList.removeWhere((item) => item == odontogramModel);
    });
  }

  @override
  Widget build(BuildContext context) {
    // CHEK APAKAH DEWASA ATAU REMAJA
    // DAPATKAN DATA DEWASA ATAU REMAJA DARI STATE PASIEN
    PasienState pasienState = context.watch<PasienBloc>().state;

    final singlePasien = pasienState.listPasienModel
        .where((element) => element.mrn == pasienState.normSelected);

    if (singlePasien.first.usia >= 17) {
      setState(() {
        kategoriGigi = KategoriGigi.dewasa;
      });
    } else {
      setState(() {
        kategoriGigi = KategoriGigi.remaja;
      });
    }

    List<GigiModel> dewasaAtas =
        listGigiModelUser.where((element) => element.numberGigi <= 28).toList();
    List<GigiModel> remajaAtas = listGigiModelUser
        .where(
            (element) => element.numberGigi <= 65 && element.numberGigi >= 51)
        .toList();
    List<GigiModel> remajaBawah = listGigiModelUser
        .where(
            (element) => element.numberGigi <= 85 && element.numberGigi >= 71)
        .toList();
    List<GigiModel> dewasaBawah = listGigiModelUser
        .where((element) => element.numberGigi <= 48 && element.numberGigi > 30)
        .toList();

    return BlocConsumer<OdontogramBloc, OdontogramState>(
      listener: (context, state) {
        if (state.isLoading) {
          EasyLoading.show(maskType: EasyLoadingMaskType.black);
        }

        if (!state.isLoading) {
          EasyLoading.dismiss();
        }

        // STATE RESULT
        state.saveResult.fold(
            () => null,
            (a) => a.fold(
                (l) => l.maybeMap(
                    orElse: () {},
                    failure: (e) async {
                      final shouldPop = await Alert.loaded(context,
                          subTitle: e.meta.message, title: "Pesan");
                      return shouldPop ?? false;
                    }),
                (r) => r.maybeMap(
                    orElse: () {},
                    loaded: (value) async {
                      // UPLOAD BERHASIL
                      MetaModel meta =
                          MetaModel.fromJson(value.value["metadata"]);
                      final shouldPop = await Alert.loaded(context,
                          subTitle: meta.message, title: "Pesan");
                      return shouldPop ?? false;
                    })));
      },
      builder: (context, state) {
        PasienState pasienState = context.watch<PasienBloc>().state;

        final singlePasien = pasienState.listPasienModel
            .where((element) => element.mrn == pasienState.normSelected);

        return HeaderContentWidget(
            onPressed: () async {
              context
                  .read<OdontogramBloc>()
                  .add(const OdontogramEvent.startLoading());

              final directory = (await getApplicationDocumentsDirectory()).path;

              final images = await screenshotController.captureAndSave(
                  directory,
                  fileName: "odontogram-${singlePasien.first.mrn}.jpg");

              if (images != null) {
                // ignore: use_build_context_synchronously
                context
                    .read<OdontogramBloc>()
                    .add(OdontogramEvent.saveOdontogram(
                      imageUrl: images,
                      norReg: singlePasien.first.noreg,
                    ));
              }
            },
            widget: SingleChildScrollView(
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    headerWidget(),

                    // START SCREEN SHOOT
                    Screenshot(
                      key: imageKey,
                      controller: screenshotController,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          // TAMPILKAN GIGI DISINI
                          // GIGI PERTAMA
                          if (kategoriGigi == KategoriGigi.dewasa) ...[
                            Container(
                                color: Colors.white,
                                child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: dewasaAtas
                                        .map((gigi) => ButtonOdontogramWidget(
                                              ontogramList: odontogramList,
                                              gigiModel: gigi,
                                              onTap: (valu) {
                                                // TAMPILKAN POP UP PILIHAN GIGI
                                                setState(() {
                                                  selectedImage = valu;
                                                  selectedNumber =
                                                      gigi.numberGigi;
                                                });

                                                log(gigi.toString());

                                                List<AssetsGigiModel>
                                                    newListAssestGigiModel =
                                                    listAssestGigiModel
                                                        .where((element) =>
                                                            element.kategori ==
                                                            gigi.kategori)
                                                        .toList();

                                                CustomDialogWidget.getDialog(
                                                    widget: modalBoxWidget(
                                                        newListAssestGigiModel,
                                                        onPressed: () {
                                                      if (_valueController
                                                              .text ==
                                                          "") {
                                                        setState(() {
                                                          Alert.failure(context,
                                                              "Keterangan tidak boleh kosong");
                                                        });
                                                      } else {
                                                        // VALIDASI TERLEBIH DAHULU
                                                        // SIMPAN ODONTOGRAM

                                                        addOntogram(
                                                            odontogramModel: OdontogramModel(
                                                                number:
                                                                    selectedNumber,
                                                                imageUrl:
                                                                    selectedImage,
                                                                keterangan:
                                                                    _valueController
                                                                        .text));

                                                        Navigator.of(context)
                                                            .pop();
                                                      }
                                                    }),
                                                    color: Colors.white);
                                              },
                                            ))
                                        .toList())),
                          ],
                          if (kategoriGigi == KategoriGigi.remaja) ...[
                            Container(
                                color: Colors.white,
                                child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: dewasaAtas
                                        .map((gigi) => BoxGigiDisableWidget(
                                              ontogramList: odontogramList,
                                              gigiModel: gigi,
                                            ))
                                        .toList())),
                          ],
                          if (kategoriGigi == KategoriGigi.dewasa) ...[
                            Container(
                                color: Colors.white,
                                child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: remajaAtas
                                        .map((gigi) => BoxGigiDisableWidget(
                                              ontogramList: odontogramList,
                                              gigiModel: gigi,
                                            ))
                                        .toList())),
                          ],
                          if (kategoriGigi == KategoriGigi.dewasa) ...[
                            Container(
                                color: Colors.white,
                                child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: remajaBawah
                                        .map((gigi) => BoxGigiDisableWidget(
                                              ontogramList: odontogramList,
                                              gigiModel: gigi,
                                            ))
                                        .toList())),
                          ],
                          if (kategoriGigi == KategoriGigi.remaja) ...[
                            Container(
                                color: Colors.white,
                                child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: remajaAtas
                                        .map((gigi) => ButtonOdontogramWidget(
                                              ontogramList: odontogramList,
                                              gigiModel: gigi,
                                              onTap: (valu) {
                                                // TAMPILKAN POP UP PILIHAN GIGI
                                                setState(() {
                                                  selectedImage = valu;
                                                  selectedNumber =
                                                      gigi.numberGigi;
                                                });

                                                List<AssetsGigiModel>
                                                    newListAssestGigiModel =
                                                    listAssestGigiModel
                                                        .where((element) =>
                                                            element.kategori ==
                                                            gigi.kategori)
                                                        .toList();

                                                CustomDialogWidget.getDialog(
                                                    widget: modalBoxWidget(
                                                        newListAssestGigiModel,
                                                        onPressed: () {
                                                      if (_valueController
                                                              .text ==
                                                          "") {
                                                        setState(() {
                                                          Alert.failure(context,
                                                              "Keterangan tidak boleh kosong");
                                                        });
                                                      } else {
                                                        // VALIDASI TERLEBIH DAHULU
                                                        // SIMPAN ODONTOGRAM

                                                        log("Select Image $selectedImage");
                                                        log("Select Number $selectedNumber");

                                                        addOntogram(
                                                            odontogramModel: OdontogramModel(
                                                                number:
                                                                    selectedNumber,
                                                                imageUrl:
                                                                    selectedImage,
                                                                keterangan:
                                                                    _valueController
                                                                        .text));

                                                        Navigator.of(context)
                                                            .pop();
                                                      }
                                                    }),
                                                    color: Colors.white);
                                              },
                                            ))
                                        .toList())),
                          ],
                          if (kategoriGigi == KategoriGigi.remaja) ...[
                            Container(
                                color: Colors.white,
                                child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: remajaBawah
                                        .map((gigi) => ButtonOdontogramWidget(
                                              ontogramList: odontogramList,
                                              gigiModel: gigi,
                                              onTap: (valu) {
                                                // TAMPILKAN POP UP PILIHAN GIGI
                                                setState(() {
                                                  selectedImage = valu;
                                                  selectedNumber =
                                                      gigi.numberGigi;
                                                });

                                                List<AssetsGigiModel>
                                                    newListAssestGigiModel =
                                                    listAssestGigiModel
                                                        .where((element) =>
                                                            element.kategori ==
                                                            gigi.kategori)
                                                        .toList();

                                                CustomDialogWidget.getDialog(
                                                    widget: modalBoxWidget(
                                                        newListAssestGigiModel,
                                                        onPressed: () {
                                                      if (_valueController
                                                              .text ==
                                                          "") {
                                                        setState(() {
                                                          Alert.failure(context,
                                                              "Keterangan tidak boleh kosong");
                                                        });
                                                      } else {
                                                        // VALIDASI TERLEBIH DAHULU
                                                        // SIMPAN ODONTOGRAM

                                                        addOntogram(
                                                            odontogramModel: OdontogramModel(
                                                                number:
                                                                    selectedNumber,
                                                                imageUrl:
                                                                    selectedImage,
                                                                keterangan:
                                                                    _valueController
                                                                        .text));

                                                        Navigator.of(context)
                                                            .pop();
                                                      }
                                                    }),
                                                    color: Colors.white);
                                              },
                                            ))
                                        .toList())),
                          ],
                          if (kategoriGigi == KategoriGigi.dewasa) ...[
                            Container(
                                color: Colors.white,
                                child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: dewasaBawah
                                        .map((gigi) => ButtonOdontogramWidget(
                                              ontogramList: odontogramList,
                                              gigiModel: gigi,
                                              onTap: (valu) {
                                                setState(() {
                                                  // TAMPILKAN POP UP PILIHAN GIGI
                                                  // seletedItem = valueNumber;
                                                  selectedImage = valu;
                                                  selectedNumber =
                                                      gigi.numberGigi;
                                                });

                                                List<AssetsGigiModel>
                                                    newListAssestGigiModel =
                                                    listAssestGigiModel
                                                        .where((element) =>
                                                            element.kategori ==
                                                            gigi.kategori)
                                                        .toList();

                                                CustomDialogWidget.getDialog(
                                                    widget: modalBoxWidget(
                                                        newListAssestGigiModel,
                                                        onPressed: () {
                                                      if (_valueController
                                                              .text ==
                                                          "") {
                                                        setState(() {
                                                          Alert.failure(context,
                                                              "Keterangan tidak boleh kosong");
                                                        });
                                                      } else {
                                                        // VALIDASI TERLEBIH DAHULU
                                                        // SIMPAN ODONTOGRAM

                                                        addOntogram(
                                                            odontogramModel: OdontogramModel(
                                                                number:
                                                                    selectedNumber,
                                                                imageUrl:
                                                                    seletedItem,
                                                                keterangan:
                                                                    _valueController
                                                                        .text));

                                                        Navigator.of(context)
                                                            .pop();
                                                      }
                                                    }),
                                                    color: Colors.white);
                                              },
                                            ))
                                        .toList())),
                          ],
                          if (kategoriGigi == KategoriGigi.remaja) ...[
                            Container(
                                color: Colors.white,
                                child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: dewasaBawah
                                        .map((gigi) => BoxGigiDisableWidget(
                                              ontogramList: odontogramList,
                                              gigiModel: gigi,
                                            ))
                                        .toList())),
                          ],
                        ],
                      ),
                    ),

                    // TAMPILKAN BOX KETERANGAN YANG DIINPUT
                    SizedBox(
                      height: 100.sp,
                      width: Get.width,
                      child: Card(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(2.sp)),
                        child: (odontogramList.isNotEmpty)
                            ? Wrap(
                                children: odontogramList
                                    .map((e) => Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: TextButton(
                                              style: ElevatedButton.styleFrom(
                                                  elevation: 1.sp,
                                                  backgroundColor: AppColors
                                                      .colorPurple
                                                      .withOpacity(0.8)),
                                              onPressed: () {
                                                removeOntogram(
                                                    odontogramModel: e);
                                                log(e.toString());
                                              },
                                              child: SizedBox(
                                                height: 25.sp,
                                                width: 75.sp,
                                                child: Padding(
                                                  padding: EdgeInsets.all(2.sp),
                                                  child: Row(
                                                    children: [
                                                      Text(
                                                        e.number.toString(),
                                                        style:
                                                            whiteCalibriTextStyle,
                                                      ),
                                                      Container(
                                                        height: 25.sp,
                                                        width: 25.sp,
                                                        margin: EdgeInsets.all(
                                                            2.sp),
                                                        decoration: BoxDecoration(
                                                            border: Border.all(
                                                                width:
                                                                    // ignore: unrelated_type_equality_checks
                                                                    (seletedItem == e) ? 3.sp : 0,
                                                                // ignore: unrelated_type_equality_checks
                                                                color: (seletedItem == e) ? Colors.green : Colors.transparent),
                                                            image: DecorationImage(image: AssetImage("assets/odon/${e.imageUrl}.png"))),
                                                      ),
                                                      SizedBox(
                                                        width: 30.sp,
                                                        child: Text(
                                                          e.keterangan,
                                                          overflow: TextOverflow
                                                              .ellipsis,
                                                          maxLines: 1,
                                                          style:
                                                              whiteCalibriTextStyle
                                                                  .copyWith(
                                                                      fontSize:
                                                                          8.sp),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              )),
                                        ))
                                    .toList())
                            : Container(),
                      ),
                    )
                  ]),
              //   )
            ));
      },
    );
  }

  Container headerWidget() {
    return Container(
      width: Get.width,
      decoration: BoxDecoration(
        color: const Color(0xFF293074).withOpacity(0.2),
      ),
      child: Wrap(
        alignment: WrapAlignment.center,
        crossAxisAlignment: WrapCrossAlignment.center,
        children: [
          SizedBox(
            width: 100.sp,
            child: Text(
              "KATEGORI  :",
              style: blackCalibriTextStyle.copyWith(fontSize: 9.sp),
            ),
          ),
          SizedBox(
            width: 80.sp,
            child: RadioListTile(
              title: Text(
                "DEWASA",
                style: blackCalibriTextStyle,
              ),
              value: KategoriGigi.dewasa,
              activeColor: Colors.black,
              groupValue: kategoriGigi,
              onChanged: (value) {
                setState(() {
                  kategoriGigi = value;
                });
              },
            ),
          ),
          SizedBox(
            width: 80.sp,
            child: RadioListTile(
              title: Text(
                "REMAJA",
                style: blackCalibriTextStyle,
              ),
              value: KategoriGigi.remaja,
              activeColor: Colors.black,
              groupValue: kategoriGigi,
              onChanged: (value) {
                setState(() {
                  kategoriGigi = value;
                });
              },
            ),
          ),
        ],
      ),
    );
  }

  StatefulBuilder modalBoxWidget(List<AssetsGigiModel> newListAssestGigiModel,
      {required void Function()? onPressed}) {
    return StatefulBuilder(
      builder: (BuildContext context, void Function(void Function()) setState) {
        return SizedBox(
          width: Get.width / 2,
          child: Column(
            children: [
              Container(
                padding:
                    EdgeInsets.symmetric(horizontal: 12.sp, vertical: 12.sp),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(2.sp),
                    color: Colors.white),
                child: Wrap(
                  children: newListAssestGigiModel
                      .map((e) => InkWell(
                            onTap: () {
                              setState(() {
                                selectedImage = e.imgAssets;
                              });

                              // log(ondogram.toString());
                              // log(selectedImage);
                              // log(selectedNumber.toString());
                            },
                            child: Container(
                              height: 25.sp,
                              width: 25.sp,
                              margin: EdgeInsets.all(2.sp),
                              decoration: BoxDecoration(
                                  border: Border.all(
                                      width: (selectedImage == e.imgAssets)
                                          ? 3.sp
                                          : 0,
                                      color: (selectedImage == e.imgAssets)
                                          ? Colors.green
                                          : Colors.transparent),
                                  image: DecorationImage(
                                      image: AssetImage(
                                          "assets/odon/${e.imgAssets}.png"))),
                            ),
                          ))
                      .toList(),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(8.sp),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: 40.sp,
                      child: DropdownButtonFormField(
                        dropdownColor: Colors.white,
                        isExpanded: true,
                        value: selectedNumber,
                        items: listGigiModelUser
                            .map((e) => DropdownMenuItem(
                                  value: e.numberGigi,
                                  child: Text(
                                    e.numberGigi.toString(),
                                    overflow: TextOverflow.ellipsis,
                                    style: blackTextStyle.copyWith(
                                        fontWeight: FontWeight.w100,
                                        fontSize: 6.sp),
                                  ),
                                ))
                            .toList(),
                        onChanged: (value) {
                          setState(() {
                            ondogram = value.toString();
                            selectedNumber = value as int;
                          });
                        },
                        decoration: FormWidget.styleDropdown(context),
                        style: blackTextStyle.copyWith(
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ),
                    SizedBox(width: 5.sp),
                    SizedBox(
                        width: 150.sp,
                        child: FormWidget.textForm(
                            controller: _valueController, enable: true)),
                    SizedBox(width: 15.sp),
                    Expanded(
                      child: SizedBox(
                        height: 25.sp,
                        child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                backgroundColor: ThemeColor.primaryColor,
                                elevation: 0,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(2.sp))),
                            onPressed: onPressed,
                            child: const FaIcon(FontAwesomeIcons.circlePlus)),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

List<String> ondontogram = [
  "11 [51]",
  "12 [52]",
  "13 [53]",
  "14 [54]",
  "15 [55]",
  "16",
  "17",
  "18",
  "21 [61]",
  "22 [62]",
  "23 [63]",
  "24 [64]",
  "25 [65]",
  "26",
  "27"
];
