import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hms_app/presentation/component/component.dart';
import 'package:hms_app/presentation/pages/widget/header_content_widget.dart';
import 'package:sizer/sizer.dart';

class SkriningGeriatriWidgetContent extends StatefulWidget {
  const SkriningGeriatriWidgetContent({super.key});

  @override
  State<SkriningGeriatriWidgetContent> createState() =>
      _SkriningGeriatriWidgetContentState();
}

class _SkriningGeriatriWidgetContentState
    extends State<SkriningGeriatriWidgetContent> {
  late bool isHamil;
  late String kehamilan;
  late String selectedSkala;

  @override
  void initState() {
    isHamil = false;
    super.initState();
  }

  @override
  void dispose() {
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
            widget: ListView(
      children: [
        titleContainer(title: "Skrining Geriatri (Silahkan Pilih Yang Sesuai)"),
        SizedBox(
            width: Get.width,
            height: 24.sp,
            child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text("1. Umur",
                    style:
                        blackTextStyle.copyWith(fontWeight: FontWeight.bold)))),
        Row(
          children: umur.asMap().entries.map((e) {
            return Padding(
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
                    e.value,
                    style: blackTextStyle,
                  )
                ],
              ),
            );
          }).toList(),
        ),
        SizedBox(
          width: Get.width,
          height: 24.sp,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              "2. Riwayat Jumlah Penyakit Yang Diderita",
              style: blackTextStyle.copyWith(fontWeight: FontWeight.bold),
            ),
          ),
        ),
        Row(
          children: penyakitYangDiderita.asMap().entries.map((e) {
            return Padding(
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
                    e.value,
                    style: blackTextStyle,
                  )
                ],
              ),
            );
          }).toList(),
        ),
        SizedBox(
          width: Get.width,
          height: 24.sp,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              "3. Keadaan Kesehatan Mental / Kejiwaan",
              style: blackTextStyle.copyWith(fontWeight: FontWeight.bold),
            ),
          ),
        ),
        Wrap(
          children: mental.asMap().entries.map((e) {
            return Padding(
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
                      )),
                  Text(
                    e.value,
                    style: blackTextStyle,
                  )
                ],
              ),
            );
          }).toList(),
        ),
      ],
    )));
  }

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
}

List<String> umur = [
  "< 60 Thn",
  "60 - < 70 Thn",
  ">70 Thn",
];

List<String> penyakitYangDiderita = [
  "Tidak Ada / Tidak Tahu",
  "1 Penyakit",
  "2 Penyakit"
];

List<String> mental = [
  "Tidak Ada Gangguan",
  "Gangguan Ringan / Demensia (Pikun) Ringan",
  "Gangguan Berat / Demensia (Pikun) Berat",
];

List<String> fisik = [
  "Berjalan Tanpa Pendampingan",
  "Harus Di tuntun / Dipapah / Kursi Roda",
  "Tidak Bisa Berjalan / Digendong / Tempat Tidur",
];
