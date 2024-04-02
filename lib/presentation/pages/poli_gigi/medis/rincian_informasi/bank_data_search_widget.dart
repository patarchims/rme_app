// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:hms_app/domain/bloc/dashboard/rincian_informasi/rincian_informasi_bloc.dart';
import '../../../../component/component.dart';

enum Kategori {
  dasarDiagnosa,
  indikasiTindakan,
  tataCara,
  tujuanTindakan,
  risikoKomplikasi,
  gigiPrognosis,
  alternatifRisiko,
  tidakDilakukanTindakan,
  lainLain
}

class BankDataSearhWidget extends StatefulWidget {
  final Kategori kategori;
  const BankDataSearhWidget({
    Key? key,
    required this.kategori,
  }) : super(key: key);

  @override
  State<BankDataSearhWidget> createState() => _BankDataSearhWidgetState();
}

class _BankDataSearhWidgetState extends State<BankDataSearhWidget> {
  late TextEditingController _searchEditingController;
  String valueSearch = "";

  @override
  void initState() {
    _searchEditingController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _searchEditingController.clear();
    _searchEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: SizedBox(
                height: 25.sp,
                child: FormWidget.textForm(
                    controller: _searchEditingController,
                    enable: true,
                    onChanged: (val) {
                      setState(() {
                        valueSearch = val;
                      });
                    }),
              ),
            ),
            SizedBox(
              width: 5.sp,
            ),
          ],
        ),
        SizedBox(
          height: 6.sp,
        ),
        BlocConsumer<RincianInformasiBloc, RincianInformasiState>(
          listener: (context, state) {
            if (state.isLoading) {
              EasyLoading.show();
            }
            if (!state.isLoading) {
              EasyLoading.dismiss();
            }
          },
          builder: (context, state) {
            return Expanded(
                child: SizedBox(
              child: ListView(
                children: (state.bankData.isNotEmpty)
                    ? state.bankData
                        .where((element) =>
                            element.deskripsi.contains(valueSearch))
                        .map((e) => Card(
                              elevation: 0,
                              color: ThemeColor.bgColor,
                              child: ListTile(
                                onTap: () {
                                  // KETIKA DI ONTAP
                                  if (widget.kategori ==
                                      Kategori.dasarDiagnosa) {
                                    context.read<RincianInformasiBloc>().add(
                                        RincianInformasiEvent.addDasarDiagnosis(
                                            value: e.deskripsi));
                                  }

                                  if (widget.kategori ==
                                      Kategori.indikasiTindakan) {
                                    context.read<RincianInformasiBloc>().add(
                                        RincianInformasiEvent
                                            .addIndikasiTindakan(
                                                value: e.deskripsi));
                                  }

                                  if (widget.kategori ==
                                      Kategori.tujuanTindakan) {
                                    context.read<RincianInformasiBloc>().add(
                                        RincianInformasiEvent.addTujuanTindakan(
                                            value: e.deskripsi));
                                  }

                                  if (widget.kategori == Kategori.tataCara) {
                                    context.read<RincianInformasiBloc>().add(
                                        RincianInformasiEvent.addTataCara(
                                            value: e.deskripsi));
                                  }
                                  if (widget.kategori ==
                                      Kategori.risikoKomplikasi) {
                                    context.read<RincianInformasiBloc>().add(
                                        RincianInformasiEvent
                                            .addRisikoDanKompilasi(
                                                value: e.deskripsi));
                                  }
                                  if (widget.kategori ==
                                      Kategori.gigiPrognosis) {
                                    context.read<RincianInformasiBloc>().add(
                                        RincianInformasiEvent.addPrognosis(
                                            value: e.deskripsi));
                                  }
                                  if (widget.kategori ==
                                      Kategori.alternatifRisiko) {
                                    context.read<RincianInformasiBloc>().add(
                                        RincianInformasiEvent.addAlternatif(
                                            value: e.deskripsi));
                                  }
                                  if (widget.kategori ==
                                      Kategori.tidakDilakukanTindakan) {
                                    context.read<RincianInformasiBloc>().add(
                                        RincianInformasiEvent
                                            .tidakDilakukanTindakan(
                                                value: e.deskripsi));
                                  }
                                  if (widget.kategori == Kategori.lainLain) {
                                    context.read<RincianInformasiBloc>().add(
                                        RincianInformasiEvent.lainLain(
                                            value: e.deskripsi));
                                  }

                                  Get.back();
                                },
                                title: Text(
                                  e.deskripsi,
                                  style: blackTextStyle.copyWith(
                                      fontWeight: FontWeight.bold),
                                ),
                                subtitle: Text(e.kdBagian),
                                trailing: IconButton(
                                    onPressed: () {},
                                    icon: const Icon(
                                      Icons.add,
                                      color: Colors.black,
                                    )),
                              ),
                            ))
                        .toList()
                    : [
                        Container(),
                      ],
              ),
            ));
          },
        ),
      ],
    );
  }
}
