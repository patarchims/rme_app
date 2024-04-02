import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hms_app/presentation/component/color/color_helper.dart';
import 'package:hms_app/presentation/component/component.dart';
import 'package:hms_app/presentation/pages/widget/header_content_widget.dart';
import 'package:sizer/sizer.dart';

class SkalaFlakWidgetContent extends StatefulWidget {
  const SkalaFlakWidgetContent({super.key});

  @override
  State<SkalaFlakWidgetContent> createState() => _SkalaFlakWidgetContentState();
}

class _SkalaFlakWidgetContentState extends State<SkalaFlakWidgetContent> {
  double _currentWajah = 0;
  double _currentKaki = 0;
  double _currentAktifitas = 0;
  double _currentMenangis = 0;
  double _currentBersuara = 0;
  late String selectedSkala;

  @override
  void initState() {
    selectedSkala = skala[0];
    super.initState();
  }

  String toSkalaTriase({required double skalaTriase}) {
    switch (skalaTriase) {
      case 1:
        return "KETERANGAN : Resusitasi\nRESPONSE TIME: SEGERA";
      case 2:
        return "KETERANGAN : Emergency/Gawat Darurat\nRESPONSE TIME: 10 Menit";
      case 3:
        return "KETERANGAN : Urgent/Darurat\nRESPONSE TIME: 30 Menit";
      case 4:
        return "KETERANGAN : Semi Darurat\nRESPONSE TIME: 60 Menit";
      default:
        return "KETERANGAN : Tidak Darurat\nRESPONSE TIME: 120 Menit";
    }
  }

  double toSkalaFlacc({required String selectedSkala}) {
    if (selectedSkala == skala[0]) {
      return _currentWajah;
    }
    if (selectedSkala == skala[1]) {
      return _currentKaki;
    }
    if (selectedSkala == skala[2]) {
      return _currentAktifitas;
    }

    if (selectedSkala == skala[3]) {
      return _currentMenangis;
    } else {
      return _currentBersuara;
    }
  }

  void setValueFlacc({required double value}) {
    if (selectedSkala == skala[0]) {
      setState(() {
        _currentWajah = value;
      });
    }
    if (selectedSkala == skala[1]) {
      setState(() {
        _currentKaki = value;
      });
    }
    if (selectedSkala == skala[2]) {
      setState(() {
        _currentAktifitas = value;
      });
    }

    if (selectedSkala == skala[3]) {
      setState(() {
        _currentMenangis = value;
      });
    } else {
      setState(() {
        _currentBersuara = value;
      });
    }
  }

  String toLabel() {
    if (selectedSkala == skala[0]) {
      return _currentWajah.round().toString();
    }
    if (selectedSkala == skala[1]) {
      return _currentKaki.round().toString();
    }
    if (selectedSkala == skala[2]) {
      return _currentAktifitas.round().toString();
    }

    if (selectedSkala == skala[3]) {
      return _currentMenangis.round().toString();
    } else {
      return _currentBersuara.round().toString();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: HeaderContentWidget(
            widget: ListView(
      children: [
        // ==================================  //
        titleContainer(title: "Skala FLACC (Anak < 6 Tahun)"),

        Container(
          padding: EdgeInsets.all(5.sp),
          child: Row(
            children: [
              Container(
                padding: EdgeInsets.only(left: 5.sp),
                width: Get.width / 5,
                child: Column(
                  children: [
                    Container(
                        margin: EdgeInsets.only(
                          bottom: 6.sp,
                        ),
                        child: DropdownButtonFormField(
                          dropdownColor: Colors.white,
                          isExpanded: true,
                          focusColor: Colors.black,
                          value: skala.first,
                          items: skala
                              .map((e) => DropdownMenuItem(
                                    value: e,
                                    child: Text(e.toString(),
                                        overflow: TextOverflow.ellipsis,
                                        style: blackTextStyle.copyWith(
                                          fontWeight: FontWeight.normal,
                                        )),
                                  ))
                              .toList(),
                          onChanged: (e) {
                            setState(() {
                              selectedSkala = e.toString();
                            });

                            // SET JUMLAH
                          },
                          decoration: FormWidget.styleDropdown(context),
                          style: blackTextStyle.copyWith(
                              overflow: TextOverflow.ellipsis),
                        ))
                  ],
                ),
              ),

              /// ===
              Expanded(
                  child: SizedBox(
                child: Slider(
                  activeColor: ThemeColor.primaryColor,
                  value: toSkalaFlacc(selectedSkala: selectedSkala),
                  max: 2,
                  divisions: 2,
                  label: toLabel(),
                  onChanged: (double value) {
                    setValueFlacc(value: value);
                  },
                ),
              )),
            ],
          ),
        ),

        if (selectedSkala == skala[0]) ...[
          Center(
            child: Text(
              (_currentWajah == 0)
                  ? "Tersenyum/Tidak Ada Ekspresi Khusus"
                  : (_currentWajah == 1)
                      ? "Terkadang Menangis/Menarik Diri"
                      : (_currentWajah == 2)
                          ? "Sering Menggertakan Dagu Dan Mengatupkan Rahang"
                          : "",
              textAlign: TextAlign.center,
              style: blackTextStyle.copyWith(fontWeight: FontWeight.bold),
            ),
          ),
        ],

        if (selectedSkala == skala[1]) ...[
          Center(
            child: Text(
              (_currentKaki == 0)
                  ? "Gerakan Normal/Relaksasi"
                  : (_currentKaki == 1)
                      ? "Tidak Tenang/Tegang"
                      : (_currentKaki == 2)
                          ? "Kaki Dibuatkan Menendang/Menarik Diri"
                          : "",
              textAlign: TextAlign.center,
              style: blackTextStyle.copyWith(fontWeight: FontWeight.bold),
            ),
          ),
        ],
        if (selectedSkala == skala[2]) ...[
          Center(
            child: Text(
              (_currentAktifitas == 0)
                  ? "Tidur, Posisi Normal / Relaksasi"
                  : (_currentAktifitas == 1)
                      ? "Gerakan Menggeliat, Berguling, Kaku"
                      : (_currentAktifitas == 2)
                          ? "Melengkungkan Punggung / Kaku / Menghentak"
                          : "",
              textAlign: TextAlign.center,
              style: blackTextStyle.copyWith(fontWeight: FontWeight.bold),
            ),
          ),
        ],
        if (selectedSkala == skala[3]) ...[
          Center(
            child: Text(
              (_currentMenangis == 0)
                  ? "Tidak Menangis (Bangun Tidur)"
                  : (_currentMenangis == 1)
                      ? "Mengerang, Merengek-rengek"
                      : (_currentMenangis == 2)
                          ? "Menangis  Terus Menerus, Terhisak, Menjerit"
                          : "",
              textAlign: TextAlign.center,
              style: blackTextStyle.copyWith(fontWeight: FontWeight.bold),
            ),
          ),
        ],
        if (selectedSkala == skala[4]) ...[
          Center(
            child: Text(
              (_currentBersuara == 0)
                  ? "Bersuara Normal / Tenang"
                  : (_currentBersuara == 1)
                      ? "Tenang Bila Dipeluk, Digendong Atau Diajak Bicara"
                      : (_currentBersuara == 2)
                          ? "Sulit Menenangkan"
                          : "",
              textAlign: TextAlign.center,
              style: blackTextStyle.copyWith(fontWeight: FontWeight.bold),
            ),
          ),
        ],

        SizedBox(height: 25.sp)
      ],
    )));
  }
}

List<String> skala = ["Wajah", "Kaki", "Aktifitas", "Menangis", "Bersuara"];

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
