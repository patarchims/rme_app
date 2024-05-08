// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import 'package:hms_app/domain/bloc/dashboard/rincian_informasi/rincian_informasi_bloc.dart';
import 'package:hms_app/presentation/component/color/color_helper.dart';
import 'package:hms_app/presentation/component/fonts/font_helper.dart';
import 'package:hms_app/presentation/component/form/form_textfield_widget.dart';

enum Selection { kerja, banding }

class AKerjaSearchWidget extends StatefulWidget {
  final Selection selection;
  const AKerjaSearchWidget({
    super.key,
    required this.selection,
  });

  @override
  State<AKerjaSearchWidget> createState() => _AKerjaSearchWidgetState();
}

class _AKerjaSearchWidgetState extends State<AKerjaSearchWidget> {
  late TextEditingController _keluhaUtama;
  String valueSearch = "";

  @override
  void initState() {
    _keluhaUtama = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _keluhaUtama.clear();
    _keluhaUtama.dispose();
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
                    controller: _keluhaUtama,
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
                children: (state.diagnosa.isNotEmpty)
                    ? state.diagnosa
                        .where((element) =>
                            element.description.contains(valueSearch))
                        .map((e) => Card(
                              elevation: 0,
                              color: ThemeColor.bgColor,
                              child: ListTile(
                                onTap: () {
                                  // KETIKA DI ONTAP
                                  if (widget.selection == Selection.kerja) {
                                    context.read<RincianInformasiBloc>().add(
                                        RincianInformasiEvent.addAKerjaValue(
                                            value: e.description));
                                  }

                                  if (widget.selection == Selection.banding) {
                                    context.read<RincianInformasiBloc>().add(
                                        RincianInformasiEvent.addBandingValue(
                                            value: e.description));
                                  }

                                  Get.back();
                                },
                                title: Text(
                                  e.description,
                                  style: blackTextStyle.copyWith(
                                      fontWeight: FontWeight.bold),
                                ),
                                subtitle: Text(e.code),
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
