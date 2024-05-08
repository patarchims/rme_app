// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:hms_app/presentation/pages/igd/bloc/resep/resep_bloc.dart';
import 'package:sizer/sizer.dart';
import 'package:hms_app/presentation/component/component.dart';
import 'package:hms_app/presentation/pages/igd/repository/ktaripobat_repository.dart';
import 'package:hms_app/presentation/pages/widget/header_content_widget.dart';

class AddResepObatPasienWidget extends StatefulWidget {
  final KTaripObatModel kTaripObatModel;
  const AddResepObatPasienWidget({
    super.key,
    required this.kTaripObatModel,
  });

  @override
  State<AddResepObatPasienWidget> createState() =>
      _AddResepObatPasienWidgetState();
}

class _AddResepObatPasienWidgetState extends State<AddResepObatPasienWidget> {
  List<String> dosis = [
    "CTH",
    "SDM",
    "TABLET",
    "KAPSUL",
    "BUNGKUS",
    "ML",
    "IV",
    "IMM",
    "TETES-DROP"
  ];
  List<String> aturan = [
    "1 dd 1",
    "2 dd 1",
    "3 dd 1",
    "4 dd 1",
    "1 dd 2",
    "1 dd 3",
    "2 dd 1",
    "2 dd 2",
    "3 dd 2"
  ];
  List<String> racikan = [
    "Racikan 1",
    "Racikan 2",
    "Racikan 3",
    "Racikan 4",
    "Racikan 5",
  ];
  late String _itemDosis;
  late String _itemAturan;
  late String _racikanStr;
  TextEditingController _jumlahObatController = TextEditingController();
  TextEditingController _dosisController = TextEditingController();
  TextEditingController _aturanController = TextEditingController();
  TextEditingController _prescriptioController = TextEditingController();
  TextEditingController _jumlahControllerRacikan = TextEditingController();

  @override
  void initState() {
    _itemDosis = dosis.first;
    _itemAturan = aturan.first;
    _racikanStr = racikan.first;
    _aturanController = TextEditingController();
    _jumlahObatController = TextEditingController();
    _dosisController = TextEditingController();
    _aturanController = TextEditingController();
    _prescriptioController = TextEditingController();
    _jumlahControllerRacikan = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _aturanController.clear();
    _jumlahObatController.clear();
    _jumlahControllerRacikan.clear();
    _dosisController.clear();
    _aturanController.clear();
    _prescriptioController.clear();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: Get.height - 60.sp,
      width: Get.width - 100.sp,
      color: Colors.white,
      child: HeaderContentWidget(
        backgroundColor: ThemeColor.bgColor,
        isENableAdd: true,
        title: "Tambah",
        onPressed: () async {
          if (_jumlahObatController.text == "") {
            final shouldPop = await Alert.warningMessage(context,
                subTitle: "JUMLAH OBAT HARUS DIISI", title: "PESAN");

            return shouldPop ?? false;
          } else {
            double jumlah = double.parse(_jumlahObatController.text.toString());
            double saldo =
                double.parse(widget.kTaripObatModel.saldo.toString());

            log(jumlah.toString());
            log(saldo.toString());
            // ===== //
            // CEK APAKAH JUMLAH MELEBIHI SALDO
            if (jumlah > saldo) {
              final shouldPop = await Alert.warningMessage(context,
                  subTitle:
                      "JUMLAH ITEM ${widget.kTaripObatModel.namaObat} YANG ANDA INPUTKAN MELEBIHI STOK PERSEDIAAN YANG ADA!",
                  title: "MELEBIHI ASO");

              return shouldPop ?? false;
            } else {
              context.read<ResepBloc>().add(OnAddResepObatEvent(
                      obat: widget.kTaripObatModel.copyWith(
                    aturan: _itemAturan,
                    dosis: _itemDosis,
                    jumlah: int.parse(_jumlahObatController.text),
                    prescriptio: _prescriptioController.text,
                    flag: _racikanStr,
                  )));

              final shouldPop = await Alert.warningMessage(context,
                  subTitle: "Obat berhasil ditambahkan", title: "Pesan");

              Get.back();
              return shouldPop ?? false;
            }
          }
        },
        widget: Padding(
          padding: EdgeInsets.only(
            top: 10.sp,
            right: 20.sp,
            left: 10.sp,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                margin: EdgeInsets.only(bottom: 5.sp),
                child: Text(
                  "Obat: ${widget.kTaripObatModel.namaObat}        Satuan :${widget.kTaripObatModel.satuan}         Saldo : ${widget.kTaripObatModel.saldo}",
                  textAlign: TextAlign.center,
                  style: blackTextStyle.copyWith(
                      fontWeight: FontWeight.bold, fontSize: 8.sp),
                ),
              ),
              Container(
                margin: EdgeInsets.only(bottom: 5.sp),
                child: Row(
                  children: [
                    SizedBox(
                      width: 50.sp,
                      child: Text(
                        "Jumlah Obat",
                        style: blackTextStyle,
                      ),
                    ),
                    Text(
                      ":  ",
                      style: blackTextStyle,
                    ),
                    Expanded(
                        child: FormWidget.textForm(
                            enable: true, controller: _jumlahObatController))
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(bottom: 5.sp),
                child: Row(
                  children: [
                    SizedBox(
                      width: 50.sp,
                      child: Text(
                        "Dosis",
                        style: blackTextStyle,
                      ),
                    ),
                    Text(
                      ":  ",
                      style: blackTextStyle,
                    ),
                    Expanded(
                      child: ButtonTheme(
                        alignedDropdown: true,
                        child: DropdownButton(
                          dropdownColor: ThemeColor.bgColor,
                          hint: Text(
                            'Pilih Dosis',
                            style: blackTextStyle.copyWith(
                                fontWeight: FontWeight.bold),
                          ),
                          value: _itemDosis,
                          onChanged: (newValue) {
                            setState(() {
                              _itemDosis = newValue.toString();
                            });
                          },
                          items: dosis.map((location) {
                            return DropdownMenuItem(
                              value: location,
                              child: Text(
                                location,
                                style: blackTextStyle.copyWith(
                                    fontWeight: FontWeight.bold),
                              ),
                            );
                          }).toList(),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(bottom: 5.sp),
                child: Row(
                  children: [
                    SizedBox(
                      width: 50.sp,
                      child: Text(
                        "Aturan",
                        style: blackTextStyle,
                      ),
                    ),
                    Text(
                      ":  ",
                      style: blackTextStyle,
                    ),
                    Expanded(
                      child: ButtonTheme(
                        alignedDropdown: true,
                        child: DropdownButton(
                          dropdownColor: ThemeColor.bgColor,
                          hint: Text(
                            'Pilih Dosis',
                            style: blackTextStyle.copyWith(
                                fontWeight: FontWeight.bold),
                          ),
                          value: _itemAturan,
                          onChanged: (newValue) {
                            setState(() {
                              _itemAturan = newValue.toString();
                            });
                          },
                          items: aturan.map((location) {
                            return DropdownMenuItem(
                              value: location,
                              child: Text(
                                location,
                                style: blackTextStyle.copyWith(
                                    fontWeight: FontWeight.bold),
                              ),
                            );
                          }).toList(),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(bottom: 5.sp),
                child: Row(
                  children: [
                    SizedBox(
                      width: 50.sp,
                      child: Text(
                        "Prescriptio",
                        style: blackTextStyle,
                      ),
                    ),
                    Text(
                      ":  ",
                      style: blackTextStyle,
                    ),
                    Expanded(
                        child: FormWidget.textForm(
                            enable: true, controller: _prescriptioController))
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(bottom: 5.sp),
                child: Row(
                  children: [
                    SizedBox(
                      width: 50.sp,
                      child: Text(
                        "Jumlah Racikan",
                        style: blackTextStyle,
                      ),
                    ),
                    Text(
                      ":  ",
                      style: blackTextStyle,
                    ),
                    Expanded(
                        child: FormWidget.textForm(
                            enable: true, controller: _jumlahControllerRacikan))
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(bottom: 5.sp),
                child: Row(
                  children: [
                    SizedBox(
                      width: 50.sp,
                      child: Text(
                        "Flag",
                        style: blackTextStyle,
                      ),
                    ),
                    Text(
                      ":  ",
                      style: blackTextStyle,
                    ),
                    Expanded(
                      child: ButtonTheme(
                        alignedDropdown: true,
                        child: DropdownButton(
                          dropdownColor: ThemeColor.bgColor,
                          hint: Text(
                            'Pilih Racikan',
                            style: blackTextStyle.copyWith(
                                fontWeight: FontWeight.bold),
                          ),
                          value: _racikanStr,
                          onChanged: (newValue) {
                            setState(() {
                              _racikanStr = newValue.toString();
                            });
                          },
                          items: racikan.map((location) {
                            return DropdownMenuItem(
                              value: location,
                              child: Text(
                                location,
                                style: blackTextStyle.copyWith(
                                    fontWeight: FontWeight.bold),
                              ),
                            );
                          }).toList(),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
