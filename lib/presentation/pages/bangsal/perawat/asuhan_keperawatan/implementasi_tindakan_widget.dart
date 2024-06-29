// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:hms_app/domain/models/meta/meta_model.dart';
import 'package:sizer/sizer.dart';

import 'package:hms_app/domain/bloc/dashboard/asuhan_keperawatan/hasil_asuhan_keperawatan/hasil_asuhan_keperawatan_bloc.dart';
import 'package:hms_app/presentation/component/component.dart';

class ImplementasiTindakanWidget extends StatefulWidget {
  final String noDaskep;

  const ImplementasiTindakanWidget({
    super.key,
    required this.noDaskep,
  });

  @override
  State<ImplementasiTindakanWidget> createState() =>
      _ImplementasiTindakanWidgetState();
}

class _ImplementasiTindakanWidgetState
    extends State<ImplementasiTindakanWidget> {
  late TextEditingController _actionController;

  @override
  void initState() {
    _actionController = TextEditingController();

    super.initState();
  }

  @override
  void dispose() {
    _actionController.clear();
    _actionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HasilAsuhanKeperawatanBloc,
        HasilAsuhanKeperawatanState>(
      listener: (context, state) {
        state.onSaveActionKeperawatan.fold(
            () => null,
            (a) => a.fold(
                (l) => l.maybeMap(
                    orElse: () {},
                    failure: (e) async {
                      // FAILURE
                      if (e.meta.code == 201) {
                        final shouldPop = await Alert.warningMessage(context,
                            subTitle: e.meta.message.toString(),
                            title: "Peringatan");
                        return shouldPop ?? false;
                      }
                    }),
                (r) => r.maybeMap(
                    orElse: () {},
                    loaded: (e) async {
                      MetaModel meta = MetaModel.fromJson(e.value["metadata"]);
                      final shouldPop = await Alert.loaded(context,
                          subTitle: meta.message, title: "Pesan");
                      Get.back();
                      return shouldPop ?? false;
                    })));
      },
      builder: (context, state) {
        return Container(
          width: Get.width,
          height: Get.height - 140.sp,
          decoration: const BoxDecoration(color: Colors.white),
          child: Scaffold(
            backgroundColor: ThemeColor.bgColor,
            appBar: AppBar(
              automaticallyImplyLeading: false,
              title: Text(
                "ACTION",
                style: whiteTextStyle,
              ),
            ),
            body: Column(
              children: [
                Padding(
                  padding: EdgeInsets.all(5.sp),
                  child: FormWidget.textArea(
                      enabled: true,
                      maxLines: 10,
                      controller: _actionController),
                ),
                Container(
                  width: Get.width,
                  padding: EdgeInsets.only(right: 5.sp, left: 5.sp),
                  child: Table(
                    columnWidths: const {},
                    border: TableBorder.all(color: Colors.black),
                    children: [
                      TableRow(children: [
                        SizedBox(
                          height: 20.sp,
                          child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(2.sp)),
                                backgroundColor: ThemeColor.primaryColor,
                              ),
                              onPressed: () {
                                context
                                    .read<HasilAsuhanKeperawatanBloc>()
                                    .add(OnSaveActionKeperawatan(
                                      noAskep: widget.noDaskep,
                                      deskripsi: _actionController.text,
                                    ));
                              },
                              child: Text(
                                "SIMPAN",
                                style: whiteTextStyle,
                              )),
                        )
                      ])
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
