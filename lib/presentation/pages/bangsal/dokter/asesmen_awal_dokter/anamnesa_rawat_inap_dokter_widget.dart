// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import 'package:hms_app/domain/bloc/dashboard/asesmen_igd/asesmen_igd_bloc.dart';
import 'package:hms_app/presentation/component/component.dart';
import 'package:hms_app/presentation/pages/widget/header_content_widget.dart';

class AnamnesaRawatInapDokterWidget extends StatelessWidget {
  final bool enableEdit;
  const AnamnesaRawatInapDokterWidget({
    super.key,
    required this.enableEdit,
  });

  @override
  Widget build(BuildContext context) {
    return HeaderContentWidget(
      onPressed: (enableEdit) ? () {} : null,
      title: "Simpan",
      widget: BlocConsumer<AsesmenIgdBloc, AsesmenIgdState>(
        listener: (context, state) {},
        builder: (context, state) {
          return SingleChildScrollView(
            child: SizedBox(
              width: Get.width,
              child: Card(
                color: ThemeColor.bgColor,
                shape: RoundedRectangleBorder(
                    side: BorderSide(
                      width: 1.sp,
                      color: ThemeColor.blackColor,
                    ),
                    borderRadius: BorderRadius.circular(2.sp)),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TitleWidget.titleContainer(title: "Keluhan Utama"),
                    Padding(
                      padding: EdgeInsets.all(3.sp),
                      child: FormWidget.textArea(
                        value: state.keluhanUtamaStr,
                        enabled: enableEdit,
                        onChanged: (value) {
                          context.read<AsesmenIgdBloc>().add(
                              AsesmenIgdEvent.keluhanUtamaOnchanged(
                                  value: value));
                        },
                        maxLines: 5,
                        hinText: "Keluhan Utama",
                      ),
                    ),
                    TitleWidget.titleContainer(title: "Telaah"),
                    Padding(
                      padding: EdgeInsets.all(3.sp),
                      child: FormWidget.textArea(
                          enabled: enableEdit,
                          value: state.telaahStr,
                          onChanged: (value) {
                            context.read<AsesmenIgdBloc>().add(
                                AsesmenIgdEvent.telaahOnchanged(value: value));
                          },
                          maxLines: 5,
                          hinText: "Telaah"),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
