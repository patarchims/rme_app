import 'package:flutter/material.dart';
import 'package:hms_app/presentation/component/component.dart';
import 'package:hms_app/presentation/pages/widget/header_content_widget.dart';
import 'package:sizer/sizer.dart';

class TindakLanjutPerinaPageWidget extends StatefulWidget {
  const TindakLanjutPerinaPageWidget({super.key});

  @override
  State<TindakLanjutPerinaPageWidget> createState() =>
      _TindakLanjutPerinaPageWidgetState();
}

class _TindakLanjutPerinaPageWidgetState
    extends State<TindakLanjutPerinaPageWidget> {
  final ScrollController _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return HeaderContentWidget(
        widget: RawScrollbar(
      thumbColor: ThemeColor.darkColor,
      thumbVisibility: true,
      interactive: true,
      thickness: 10.sp,
      controller: _scrollController,
      trackVisibility: false,
      radius: Radius.circular(5.sp),
      child: SingleChildScrollView(
        controller: _scrollController,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TitleWidget.titleContainer(title: "Rencana Tindak Lanjut"),
            Padding(
              padding: EdgeInsets.all(3.sp),
              child: FormWidget.textArea(
                enabled: true,
                // value: state.pemeriksaanFisikBangsalModel.dada,
                onChanged: (value) {
                  // context
                  //     .read<PemeriksaanFisikBloc>()
                  //     .add(PemeriksaanFisikEvent.dadaOnchanged(value: value));
                },
                maxLines: 3,
              ),
            ),
            TitleWidget.titleContainer(title: "Kontrol Ulang"),
            Padding(
              padding: EdgeInsets.all(3.sp),
              child: FormWidget.textArea(
                enabled: true,
                // value: state.pemeriksaanFisikBangsalModel.dada,
                onChanged: (value) {
                  // context
                  //     .read<PemeriksaanFisikBloc>()
                  //     .add(PemeriksaanFisikEvent.dadaOnchanged(value: value));
                },
                maxLines: 3,
              ),
            ),
            TitleWidget.titleContainer(title: "Opname"),
            Padding(
              padding: EdgeInsets.all(3.sp),
              child: FormWidget.textArea(
                enabled: true,
                // value: state.pemeriksaanFisikBangsalModel.dada,
                onChanged: (value) {
                  // context
                  //     .read<PemeriksaanFisikBloc>()
                  //     .add(PemeriksaanFisikEvent.dadaOnchanged(value: value));
                },
                maxLines: 3,
              ),
            ),
            TitleWidget.titleContainer(title: "Konsul/Rujuk Ke"),
            Padding(
              padding: EdgeInsets.all(3.sp),
              child: FormWidget.textArea(
                enabled: true,
                // value: state.pemeriksaanFisikBangsalModel.dada,
                onChanged: (value) {
                  // context
                  //     .read<PemeriksaanFisikBloc>()
                  //     .add(PemeriksaanFisikEvent.dadaOnchanged(value: value));
                },
                maxLines: 3,
              ),
            ),
          ],
        ),
      ),
    ));
  }
}
