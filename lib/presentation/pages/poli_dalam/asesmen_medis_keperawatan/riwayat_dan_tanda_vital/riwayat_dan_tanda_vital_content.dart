import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hms_app/presentation/component/component.dart';
import 'package:hms_app/presentation/pages/poli_dalam/asesmen_medis_keperawatan/riwayat_penyakit_terdahulu_tabel/riwayat_penyakit_terdahulu_table_content.dart';
import 'package:hms_app/presentation/pages/widget/header_content_widget.dart';
import 'package:sizer/sizer.dart';

class RiwayatDanTandaVitalContent extends StatefulWidget {
  const RiwayatDanTandaVitalContent({super.key});

  @override
  State<RiwayatDanTandaVitalContent> createState() =>
      _RiwayatDanTandaVitalContentState();
}

class _RiwayatDanTandaVitalContentState
    extends State<RiwayatDanTandaVitalContent> {
  late TextEditingController _riwayatPenyakitSekarangController;
  late TextEditingController _tekananDarahController = TextEditingController();
  late String pelayananValue;
  late String kehamilan;
  late bool isHamil;

  @override
  void initState() {
    isHamil = false;
    pelayananValue = "";
    kehamilan = "";
    _riwayatPenyakitSekarangController = TextEditingController();
    _tekananDarahController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _riwayatPenyakitSekarangController.clear();
    _tekananDarahController.clear();

    _tekananDarahController.dispose();
    _riwayatPenyakitSekarangController.dispose();
    super.dispose();
  }

  void setKehamilan() {
    if (isHamil) {
      setState(() {
        kehamilan = "Hamil";
      });
    }

    if (!isHamil) {
      setState(() {
        kehamilan = " ";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: HeaderContentWidget(
      onPressed: () {},
      widget: ListView(
        children: [
          //============================ RIWAYAT DAN TANDA VITAL ============================= //
          Container(
            height: Get.height / 2,
            width: Get.width,
            decoration: const BoxDecoration(color: Colors.amber),
            child: const RiwayatPenyakitTerdahuluTableContent(),
          ),

          textForm(
              title: "Riwayat Penyakit Sekarang",
              controller: _riwayatPenyakitSekarangController),

          titleContainer(title: "Jenis Pelayanan"),

          Container(
            width: Get.width,
            padding: EdgeInsets.all(4.sp),
            child: Wrap(
              crossAxisAlignment: WrapCrossAlignment.center,
              children: jenisPelayanan
                  .map((e) => SizedBox(
                        width: 95.sp,
                        height: 25.sp,
                        child: Card(
                          color: ThemeColor.lightGrey,
                          elevation: 1.sp,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(2.sp)),
                          child: Center(
                            child: RadioListTile(
                                selected: true,
                                activeColor: const Color(0xFF293074),
                                selectedTileColor: ThemeColor.bgColor,
                                title: Text(
                                  e,
                                  style: blackCalibriTextStyle.copyWith(
                                      fontSize: 10.sp),
                                  maxLines: 3,
                                  textAlign: TextAlign.start,
                                  softWrap: true,
                                  overflow: TextOverflow.ellipsis,
                                ),
                                value: e,
                                groupValue: pelayananValue,
                                onChanged: (value) {
                                  setState(() {
                                    pelayananValue = value.toString();
                                  });
                                }),
                          ),
                        ),
                      ))
                  .toList(),
            ),
          ),

          titleContainer(title: "Tanda Vital"),

          Row(
            children: [
              SizedBox(
                width: Get.width / 2.5,
                child: Column(
                  children: [
                    formBox(
                        title: "Tekanan Darah",
                        subTitle: "mmHg",
                        controller: _tekananDarahController),
                    formBox(
                        title: "Nadi",
                        subTitle: "x/mnt",
                        controller: _tekananDarahController),
                    formBox(
                        title: "Suhu",
                        subTitle: "*C",
                        controller: _tekananDarahController),
                  ],
                ),
              ),
              Expanded(
                child: SizedBox(
                  child: Column(
                    children: [
                      formBox(
                          title: "Pernapasan",
                          subTitle: "x/mnt",
                          controller: _tekananDarahController),
                      formBox(
                          title: "Tinggi Badan",
                          subTitle: "kg",
                          controller: _tekananDarahController),
                      formBox(
                          title: "Tinggi Badan",
                          subTitle: "cm",
                          controller: _tekananDarahController),
                    ],
                  ),
                ),
              ),
            ],
          ),

          // ============================== //
          Row(
            children: [
              Padding(
                padding: EdgeInsets.all(8.sp),
                child: Row(
                  children: [
                    SizedBox(
                      height: 10.sp,
                      child: Checkbox(
                        activeColor: ThemeColor.primaryColor,
                        checkColor: Colors.white,
                        value: isHamil,
                        onChanged: (value) {
                          setState(() {
                            isHamil = !isHamil;
                          });

                          setKehamilan();
                        },
                      ),
                    ),
                    Text(
                      "Wus",
                      style: blackTextStyle,
                    )
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.all(8.sp),
                child: Row(
                  children: [
                    SizedBox(
                      height: 10.sp,
                      child: Checkbox(
                        activeColor: ThemeColor.primaryColor,
                        checkColor: Colors.white,
                        value: isHamil,
                        onChanged: (value) {
                          setState(() {
                            isHamil = !isHamil;
                          });

                          setKehamilan();
                        },
                      ),
                    ),
                    Text(
                      "Hamil",
                      style: blackTextStyle,
                    )
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.all(8.sp),
                child: Row(
                  children: [
                    SizedBox(
                      height: 10.sp,
                      child: Checkbox(
                        activeColor: ThemeColor.primaryColor,
                        checkColor: Colors.white,
                        value: isHamil,
                        onChanged: (value) {
                          setState(() {
                            isHamil = !isHamil;
                          });

                          setKehamilan();
                        },
                      ),
                    ),
                    Text(
                      "Menyusui",
                      style: blackTextStyle,
                    )
                  ],
                ),
              ),
            ],
          ),

          textForm(
              title: "Haid Terakhir",
              controller: _riwayatPenyakitSekarangController),

          SizedBox(height: 25.sp),
        ],
      ),
    ));
  }
}

Container formBox(
    {required String title,
    required String subTitle,
    String? labelText,
    TextEditingController? controller}) {
  return Container(
    width: Get.width,
    padding: EdgeInsets.symmetric(horizontal: 12.sp, vertical: 4.sp),
    child: Row(
      children: [
        SizedBox(
          width: 70.sp,
          child: Text(
            title,
            style: (labelText != null)
                ? blackTextStyle.copyWith(fontWeight: FontWeight.bold)
                : blackTextStyle,
          ),
        ),
        Expanded(
            child: FormWidget.textForm(
          labelText: labelText,
          controller: controller,
          enable: true,
        )),
        SizedBox(
          width: 5.sp,
        ),
        SizedBox(
          width: 25.sp,
          child: Text(
            subTitle,
            style: blackTextStyle,
          ),
        ),
      ],
    ),
  );
}

Row textForm({required String title, TextEditingController? controller}) {
  return Row(
    children: [
      Container(
        padding: EdgeInsets.all(2.sp),
        width: Get.width / 2.sp,
        child: Text(
          title,
          style: blackTextStyle,
        ),
      ),
      Expanded(
        child: Container(
          width: Get.width / 3,
          height: 25.sp,
          padding: EdgeInsets.only(right: 5.sp),
          child: FormWidget.textArea(maxLines: 2, controller: controller),
        ),
      )
    ],
  );
}

List<String> jenisPelayanan = [
  "Preventif",
  "Kuratif",
  "Palatif",
  "Rehabilitatif"
];

Container titleContainer({required String title}) {
  return Container(
    width: Get.width,
    height: 20.sp,
    decoration: BoxDecoration(
      color: ThemeColor.blueColor.withOpacity(0.5),
      borderRadius: BorderRadius.only(
          topLeft: Radius.circular(2.sp), topRight: Radius.circular(2.sp)),
    ),
    child: Center(
      child: Text(
        title,
        style: blackTextStyle.copyWith(
          fontWeight: FontWeight.bold,
        ),
      ),
    ),
  );
}
