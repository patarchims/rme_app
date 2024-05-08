import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:hms_app/domain/bloc/dashboard/asesmen_igd/asesmen_igd_bloc.dart';
import 'package:hms_app/presentation/component/component.dart';
import 'package:hms_app/presentation/pages/igd/dokter/cari_dokter_widget.dart';
import 'package:hms_app/presentation/pages/widget/header_content_widget.dart';
import 'package:sizer/sizer.dart';

class RencanaPenunangRawatInapDokterWidget extends StatelessWidget {
  const RencanaPenunangRawatInapDokterWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return HeaderContentWidget(
      onPressed: () {},
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
                    TitleWidget.titleContainer(title: "Rencana Penunjang"),
                    SizedBox(
                      width: Get.width,
                      child: FormWidget.textArea(
                        maxLines: 2,
                        value: state.alasanObnameStr,
                        validator: (value) {
                          return value == ''
                              ? "Rencana penunjang tidak boleh kosong"
                              : null;
                        },
                        enabled: true,
                        hinText: "Rencana Penunjang",
                        onChanged: (value) {
                          context.read<AsesmenIgdBloc>().add(
                              AsesmenIgdEvent.alasanObnameOnchanged(
                                  value: value));
                        },
                      ),
                    ),
                    TitleWidget.titleContainer(title: "Penjelasan"),
                    SizedBox(
                      width: Get.width,
                      child: FormWidget.textArea(
                        maxLines: 2,
                        value: state.alasanObnameStr,
                        validator: (value) {
                          return value == ''
                              ? "Penjelasan tidak boleh kosong"
                              : null;
                        },
                        hinText: "Penjelasan ",
                        onChanged: (value) {
                          context.read<AsesmenIgdBloc>().add(
                              AsesmenIgdEvent.alasanObnameOnchanged(
                                  value: value));
                        },
                      ),
                    ),
                    TitleWidget.titleContainer(
                        title: "Konsul Ke dan Alasan Konsul"),
                    SizedBox(
                      width: Get.width,
                      child: FormWidget.textForm(
                        enable: false,
                        value: state.dokterSpesialisSelected,
                        labelText: state.dokterSpesialisSelected,
                      ),
                    ),
                    Container(
                        width: Get.width,
                        height: 25.sp,
                        padding: EdgeInsets.all(2.sp),
                        child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                backgroundColor: ThemeColor.primaryColor,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(4.sp))),
                            onPressed: () {
                              // TAMPILKAN MODAL DOKTER
                              context.read<AsesmenIgdBloc>().add(
                                  const AsesmenIgdEvent.getDokterSpesialis());

                              CustomDialogWidget.getDialog(
                                  widget: Container(
                                    height: 200.sp,
                                    width: 400.sp,
                                    decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(6.sp),
                                        color: Colors.white),
                                    child: const CariDokterSpesialisWidget(),
                                  ),
                                  color: Colors.transparent);
                            },
                            child: const Icon(
                              FontAwesomeIcons.userDoctor,
                              color: Colors.white,
                            ))),
                    TitleWidget.titleContainer(title: "Alasan Konsul"),
                    SizedBox(
                      width: Get.width,
                      child: FormWidget.textArea(
                        maxLines: 2,
                        value: state.alasanObnameStr,
                        validator: (value) {
                          return value == ''
                              ? "Alasan konsul tidak boleh kosong"
                              : null;
                        },
                        hinText: "Alasan Konsul",
                        onChanged: (value) {
                          context.read<AsesmenIgdBloc>().add(
                              AsesmenIgdEvent.alasanObnameOnchanged(
                                  value: value));
                        },
                      ),
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
