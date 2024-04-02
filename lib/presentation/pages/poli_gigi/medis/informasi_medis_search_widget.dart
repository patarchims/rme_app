import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:hms_app/presentation/component/form/form_textfield_widget.dart';
import 'package:sizer/sizer.dart';
import 'package:hms_app/presentation/component/color/color_helper.dart';
import 'package:hms_app/presentation/component/fonts/font_helper.dart';

import '../../../../../../domain/bloc/dashboard/informasi_medis/informasi_medis_bloc.dart';

class InformasiMedisSearchWidget extends StatefulWidget {
  const InformasiMedisSearchWidget({
    Key? key,
  }) : super(key: key);

  @override
  State<InformasiMedisSearchWidget> createState() =>
      _RiwayatSekarangSearchWidgetState();
}

class _RiwayatSekarangSearchWidgetState
    extends State<InformasiMedisSearchWidget> {
  late TextEditingController _textController;
  String valueSearch = "";

  @override
  void initState() {
    _textController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _textController.clear();
    _textController.dispose();
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
                    controller: _textController,
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
        BlocConsumer<InformasiMedisBloc, InformasiMedisState>(
          listener: (context, state) {
            log(state.toString());
            if (state.isLoading) {
              EasyLoading.show();
            }
            if (!state.isLoading) {
              EasyLoading.dismiss();
            }
          },
          builder: (context, state) {
            log(state.toString());
            return Expanded(
                child: Container(
              child: ListView(
                children: (state.masalahMedis.isNotEmpty)
                    ? state.masalahMedis
                        .where((element) =>
                            element.deskripsi.contains(valueSearch))
                        .map((e) => Card(
                              elevation: 0,
                              color: ThemeColor.bgColor,
                              child: ListTile(
                                onTap: () {
                                  // KETIKA DI ONTAP
                                  context.read<InformasiMedisBloc>().add(
                                      InformasiMedisEvent.selectedMasalahMedis(
                                          value: e.deskripsi));

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
                                    icon: Icon(
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
