import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:hms_app/core/api/api_db.dart';
import 'package:hms_app/domain/bloc/dashboard/asesmen_igd/asesmen_igd_bloc.dart';
import 'package:hms_app/domain/bloc/dashboard/pasien/pasien_bloc.dart';
import 'package:hms_app/domain/bloc/user/auth/auth_bloc.dart';
import 'package:hms_app/domain/models/devices_info/device_info_model.dart';
import 'package:hms_app/domain/models/users/user_model.dart';
import 'package:hms_app/presentation/component/shimer/shimer_loading.dart';
import 'package:image_painter/image_painter.dart';
import 'package:path_provider/path_provider.dart';
import 'package:screenshot/screenshot.dart';
import 'package:sizer/sizer.dart';
import 'package:hms_app/presentation/component/component.dart';
import 'package:hms_app/presentation/pages/widget/header_content_widget.dart';
import '../../../../domain/models/meta/meta_model.dart';

class StatusLokalisWidget extends StatefulWidget {
  const StatusLokalisWidget({super.key});

  @override
  State<StatusLokalisWidget> createState() => _StatusLokalisWidgetState();
}

class _StatusLokalisWidgetState extends State<StatusLokalisWidget> {
  final ScrollController _scrollController = ScrollController();
  final imageKey = GlobalKey<ImagePainterState>();
  ScreenshotController screenshotController = ScreenshotController();
  late String selectedValue;
  late String keteranganStr;
  late LokalisModel selectedLokalis;
  double posx = 0;
  List<Widget> images = [];
  double posy = 0;

  // variable posx and posy.
  void onTapDown(BuildContext context, TapDownDetails details) {
    final RenderBox box = context.findRenderObject() as RenderBox;
    final Offset localOffset = box.globalToLocal(details.globalPosition);
    setState(() {
      posx = localOffset.dx;
      posy = localOffset.dy;
    });
  }

  @override
  void initState() {
    super.initState();
    selectedValue = lokalis.first.title;
    selectedLokalis = lokalis.first;
    keteranganStr = "";
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    PasienState pasienState = context.watch<PasienBloc>().state;
    AuthState authState = context.watch<AuthBloc>().state;
    final singlePasien = pasienState.listPasienModel
        .where((element) => element.mrn == pasienState.normSelected);

    return BlocConsumer<AsesmenIgdBloc, AsesmenIgdState>(
      listener: (context, state) {
        // OMK ADALAH

        if (state.isLoadingSaveLokalis) {
          EasyLoading.show(maskType: EasyLoadingMaskType.black);
        }

        if (!state.isLoadingSaveLokalis) {
          EasyLoading.dismiss();
        }

        // DETEKSI SAAT SIMPAN
        state.getStatusLokalisResult.fold(() => null,
            (a) => a.fold((l) => null, (r) => r.maybeMap(orElse: () {})));

        state.saveStatusLokalisResult.fold(
            () => null,
            (a) => a.fold(
                (l) => l.maybeMap(
                      orElse: () {},
                      failure: (e) async {
                        // TAMPILKAN PESAN KESALAHAN
                        final shouldPop = await Alert.warningMessage(context,
                            subTitle: e.meta.message.toString());
                        return shouldPop ?? false;
                      },
                    ),
                (r) => r.maybeMap(
                    orElse: () {},
                    loaded: (e) async {
                      // LOADED
                      MetaModel meta = MetaModel.fromJson(e.value["metadata"]);
                      final shouldPop = await Alert.loaded(context,
                          subTitle: meta.message, title: "Pesan");
                      return shouldPop ?? false;
                    })));
      },
      builder: (context, state) {
        return HeaderContentWidget(
          widget: Scaffold(
            backgroundColor: ThemeColor.whiteColor,
            appBar: AppBar(
              title: Text(
                "Tambahkan Keterangan >>>",
                style: whiteTextStyle,
              ),
              backgroundColor: ThemeColor.primaryColor,
              elevation: 0,
              automaticallyImplyLeading: false,
              actions: [
                Container(
                  padding: EdgeInsets.only(right: 10.sp),
                  child: ElevatedButton(
                      onPressed: () {
                        CustomDialogWidget.getDialog(
                            widget: SizedBox(
                          width: 200.sp,
                          height: 85.sp,
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 5.sp, vertical: 5.sp),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                FormWidget.textArea(
                                    enabled: true,
                                    hinText: "Tambahkan keterangan gambar",
                                    maxLines: 5,
                                    onChanged: (value) {
                                      setState(() {
                                        keteranganStr = value.toString();
                                      });
                                    }),
                                SizedBox(
                                  width: Get.width,
                                  height: 15.sp,
                                  child: ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                          backgroundColor:
                                              ThemeColor.primaryColor,
                                          shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(2.sp))),
                                      onPressed: () {
                                        setState(() {
                                          keteranganStr = "";
                                        });
                                      },
                                      child: Text(
                                        "Clear",
                                        style: whiteTextStyle,
                                      )),
                                )
                              ],
                            ),
                          ),
                        ));
                      },
                      style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(1.sp)),
                          backgroundColor: ThemeColor.dangerColor),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            const Icon(
                              FontAwesomeIcons.noteSticky,
                              color: Colors.white,
                            ),
                            SizedBox(
                              width: 5.sp,
                            ),
                            Text(
                              "Keterangan",
                              style: whiteTextStyle.copyWith(
                                  fontSize: 5.sp, fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      )),
                )
              ],
            ),
            body: Row(
              children: [
                Container(
                  width: 70.sp,
                  height: Get.height,
                  color: ThemeColor.bgColor,
                  padding: EdgeInsets.all(2.sp),
                  child: RawScrollbar(
                    thumbColor: ThemeColor.darkColor,
                    thumbVisibility: true,
                    interactive: true,
                    thickness: 5.sp,
                    controller: _scrollController,
                    trackVisibility: false,
                    radius: Radius.circular(5.sp),
                    child: ListView(
                      controller: _scrollController,
                      scrollDirection: Axis.vertical,
                      children: lokalis
                          .map((e) => Container(
                                padding: EdgeInsets.all(1.sp),
                                height: 50.sp,
                                width: 50.sp,
                                child: ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      elevation: 1.sp,
                                      backgroundColor: ThemeColor.primaryColor,
                                      shape: CircleBorder(
                                        side: BorderSide(
                                          color: (selectedValue == e.title)
                                              ? Colors.white
                                              : Colors.transparent,
                                          style: BorderStyle.solid,
                                          width: 2.sp,
                                        ),
                                      ),
                                    ),
                                    onPressed: () {
                                      if (e.title == "Keterangan") {
                                        CustomDialogWidget.getDialog(
                                            widget: SizedBox(
                                          width: 200.sp,
                                          child: Padding(
                                            padding: EdgeInsets.symmetric(
                                                horizontal: 5.sp,
                                                vertical: 5.sp),
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                FormWidget.textArea(
                                                    enabled: true,
                                                    hinText:
                                                        "Tambahkan keterangan gambar",
                                                    maxLines: 3,
                                                    onChanged: (value) {
                                                      setState(() {
                                                        keteranganStr =
                                                            value.toString();
                                                      });
                                                    }),
                                                SizedBox(
                                                  width: Get.width,
                                                  height: 15.sp,
                                                  child: ElevatedButton(
                                                      onPressed: () {
                                                        setState(() {
                                                          keteranganStr = "";
                                                        });
                                                      },
                                                      child: Text(
                                                        "Clear",
                                                        style: whiteTextStyle,
                                                      )),
                                                )
                                              ],
                                            ),
                                          ),
                                        ));
                                      }
                                      if (e.title == "Reset") {
                                        setState(() {
                                          images.clear();
                                          keteranganStr = "";
                                        });

                                        context.read<AsesmenIgdBloc>().add(
                                            const AsesmenIgdEvent.resetImage());
                                      } else {
                                        setState(() {
                                          selectedValue = e.title;
                                          selectedLokalis = e;
                                        });
                                      }
                                    },
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Container(
                                          height: 15.sp,
                                          width: 15.sp,
                                          margin: EdgeInsets.only(bottom: 1.sp),
                                          decoration: BoxDecoration(
                                              image: DecorationImage(
                                                  image: AssetImage(e.images))),
                                        ),
                                        SizedBox(
                                          width: 40.sp,
                                          child: Text(
                                            e.title,
                                            style: whiteTextStyle.copyWith(
                                                fontSize: 6.sp),
                                            textAlign: TextAlign.center,
                                          ),
                                        )
                                      ],
                                    )),
                              ))
                          .toList(),
                    ),
                  ),
                ),
                if (state.isLoadingGetLokalis) ...[
                  Expanded(child: ShimerLoading.loadingExpandCard())
                ],
                if (!state.isLoadingGetLokalis) ...[
                  Expanded(child: SizedBox(
                    child: LayoutBuilder(
                      builder: (context, constraints) {
                        return GestureDetector(
                          onTapDown: (details) {
                            // Calculate the position of the tap relative to the screen .
                            final RenderBox box =
                                context.findRenderObject() as RenderBox;
                            final Offset tapPosition =
                                box.globalToLocal(details.globalPosition);

                            // Add the image at the tapped position.
                            addImageAtPosition(tapPosition.dx, tapPosition.dy);
                          },
                          child: Screenshot(
                            key: imageKey,
                            controller: screenshotController,
                            child: Stack(
                              children: [
                                // Your background or other Screenshots can go here.
                                SizedBox(
                                    height: Get.height,
                                    width: Get.width,
                                    child: Image.network(
                                      ApiDb.baseUrl + state.imageLokalis,
                                      fit: BoxFit
                                          .fitWidth, // Adjust the fit as needed
                                    )),
                                // Add the images to the stack.
                                ...images,

                                Positioned(
                                  left: 0,
                                  bottom: 0,
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      keteranganStr,
                                      style: blackTextStyle.copyWith(
                                          fontSize: 6.sp),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  )),
                ]
              ],
            ),
          ),
          onPressed: () async {
            // SIMPAN DATA  // loading lokalis // LAKUKAN SIMPAN DATA
            dynamic data = await deviceInfo.initPlatformState();

            final directory = (await getApplicationDocumentsDirectory()).path;

            final images1 = await screenshotController.captureAndSave(directory,
                fileName:
                    "${singlePasien.first.mrn}-${singlePasien.first.noreg}.png");

            if (authState is Authenticated) {
              if (singlePasien.isNotEmpty) {
                log("IMAGES LOG");
                log(images.toString());

                if (images.isNotEmpty) {
                  if (images1 != null) {
                    log("DATA TIDAK KOSONG");
                    // ignore: use_build_context_synchronously
                    context.read<AsesmenIgdBloc>().add(
                        AsesmenIgdEvent.saveStatusLokalis(
                            pelayanan: toPelayanan(
                                poliklinik: authState.user.poliklinik),
                            person: toPerson(person: authState.user.person),
                            userID: authState.user.userId,
                            deviceID: "ID - ${data['id']} - ${data['device']}}",
                            noReg: singlePasien.first.noreg,
                            imageUrl: images1));
                  }
                }

                if (images.isEmpty) {
                  log("DATA KOSONG");
                  // ignore: use_build_context_synchronously
                  final shouldPop = await Alert.warningMessage(context,
                      subTitle: "Tidak ada aksi", title: "Peringatan");
                  return shouldPop ?? false;
                }

                // ignore: use_build_context_synchronously
              }
            }
          },
        );
      },
    );
  }

  void addImageAtPosition(double left, double top) {
    setState(() {
      images.add(
        Positioned(
          left: left,
          top: top,
          child: Image.asset(
            selectedLokalis.images, // Replace with your image path
            width: 10.sp,
            height: 10.sp,
          ),
        ),
      );
    });
  }
}

class LokalisModel {
  final String title;
  final String images;
  LokalisModel({
    required this.title,
    required this.images,
  });
}

List<LokalisModel> lokalis = [
  LokalisModel(title: "Abrasi", images: "assets/images/lokalis/am.png"),
  LokalisModel(title: "Combustio", images: "assets/images/lokalis/cm.png"),
  LokalisModel(
      title: "Vulnus\nAppertum", images: "assets/images/lokalis/vam.png"),
  LokalisModel(title: "Deformitas", images: "assets/images/lokalis/do.png"),
  LokalisModel(title: "Ulkus", images: "assets/images/lokalis/um.png"),
  LokalisModel(title: "Hematoma", images: "assets/images/lokalis/hm.png"),
  LokalisModel(title: "Nyeri", images: "assets/images/lokalis/nm.png"),
  LokalisModel(title: "Lain-Lain", images: "assets/images/lokalis/lm.png"),
  LokalisModel(title: "Lain-lain1", images: "assets/images/lokalis/l1.png"),
  LokalisModel(title: "Lain-lain2", images: "assets/images/lokalis/l2.png"),
  LokalisModel(title: "Lain-lain3", images: "assets/images/lokalis/l3.png"),
  // LokalisModel(
  //     title: "Keterangan", images: "assets/images/lokalis/keterangan.png"),
  LokalisModel(title: "Reset", images: "assets/images/lokalis/rm.png"),
];
