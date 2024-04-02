import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:hms_app/domain/bloc/dashboard/anamnesa/anamnesa_bloc.dart';
import 'package:hms_app/presentation/component/form/form_textfield_widget.dart';
import 'package:sizer/sizer.dart';
import 'package:hms_app/presentation/component/color/color_helper.dart';
import 'package:hms_app/presentation/component/fonts/font_helper.dart';

class AnamnesaSearchWidget extends StatefulWidget {
  const AnamnesaSearchWidget({
    Key? key,
  }) : super(key: key);

  @override
  State<AnamnesaSearchWidget> createState() => _AnamnesaSearchWidgetState();
}

class _AnamnesaSearchWidgetState extends State<AnamnesaSearchWidget> {
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
        BlocConsumer<AnamnesaBloc, AnamnesaState>(
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
                children: (state.keluhanUtama.isNotEmpty)
                    ? state.keluhanUtama
                        .where((element) =>
                            element.deskripsi.contains(valueSearch))
                        .map((e) => Card(
                              elevation: 0,
                              color: ThemeColor.bgColor,
                              child: ListTile(
                                onTap: () {
                                  // KETIKA DI ONTAP
                                  context.read<AnamnesaBloc>().add(
                                      AnamnesaEvent.selectKeluhanUtama(
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
