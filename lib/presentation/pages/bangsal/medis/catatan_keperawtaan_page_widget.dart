import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hms_app/presentation/component/component.dart';
import 'package:hms_app/presentation/component/extenstion/date_helper.dart';
import 'package:hms_app/presentation/component/loading/loading.dart';
import 'package:hms_app/presentation/pages/bangsal/bloc/cppt_sbar_bangsal/cppt_sbar_bangsal_bloc.dart';
import 'package:hms_app/presentation/pages/bangsal/medis/tambah_catatan_keperawatan_widget.dart';
import 'package:hms_app/presentation/pages/widget/header_content_widget.dart';
import 'package:sizer/sizer.dart';
import 'package:table_desk/table_desk.dart';

class CatatanKeperawatanPageWidget extends StatelessWidget {
  const CatatanKeperawatanPageWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CpptSbarBangsalBloc, CpptSbarBangsalState>(
      listener: (context, state) {},
      builder: (context, state) {
        if (state.status == CPPTSbarBangsalStatus.isLoadingGet) {
          return HeaderContentWidget(
            backgroundColor: ThemeColor.bgColor,
            title: "TAMBAH",
            widget: Loading.expandedLoading(),
          );
        }
        return HeaderContentWidget(
            backgroundColor: ThemeColor.bgColor,
            isENableAdd: true,
            onPressed: () {
              CustomDialogWidget.getDialog(
                  widget: const TambahCatatanKeperawatanWidget(),
                  color: ThemeColor.blueColor);
            },
            title: "TAMBAH",
            widget: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(height: 10.sp),
                  Container(
                    color: Colors.white,
                    padding: EdgeInsets.symmetric(horizontal: 5.sp),
                    child: TableDesk(
                      shape: const RoundedRectangleBorder(
                        side: BorderSide(color: Colors.black, width: 1),
                      ),
                      child: TableDeskRow(
                        border: const BorderSide(width: 1, color: Colors.black),
                        gaps: [
                          TableGap.width(150),
                          TableGap.weight(),
                          TableGap.width(200),
                        ],
                        children: [
                          Container(
                            color: Colors.white,
                            child: Padding(
                              padding: const EdgeInsets.all(8),
                              child: Center(
                                child: Text(
                                  "Tgl/Jam",
                                  style: blackTextStyle.copyWith(
                                      fontWeight: FontWeight.bold),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ),
                          ),
                          Container(
                            color: Colors.white,
                            child: Padding(
                              padding: const EdgeInsets.all(8),
                              child: Center(
                                child: Text(
                                  "Catatan Keperawatan",
                                  style: blackTextStyle.copyWith(
                                      fontWeight: FontWeight.bold),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ),
                          ),
                          Container(
                            color: Colors.white,
                            child: Padding(
                              padding: const EdgeInsets.all(8),
                              child: Center(
                                child: Text(
                                  "Nama Perawat",
                                  style: blackTextStyle.copyWith(
                                      fontWeight: FontWeight.bold),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  ...(state.catatanKeperawatan.isNotEmpty)
                      ? state.catatanKeperawatan
                          .asMap()
                          .entries
                          .map(
                            (e) => Container(
                              color: Colors.white,
                              padding: EdgeInsets.symmetric(horizontal: 5.sp),
                              child: TableDesk(
                                shape: const RoundedRectangleBorder(
                                  side:
                                      BorderSide(color: Colors.black, width: 1),
                                ),
                                child: TableDeskRow(
                                  border: const BorderSide(
                                      width: 1, color: Colors.black),
                                  gaps: [
                                    TableGap.width(150),
                                    TableGap.weight(),
                                    TableGap.width(200),
                                  ],
                                  children: [
                                    Container(
                                      color: Colors.white,
                                      child: Padding(
                                        padding: const EdgeInsets.all(8),
                                        child: Center(
                                          child: Text(
                                            "Tgl : ${tglIndo(e.value.insertDttm.substring(0, 10))} / Jam : ${e.value.insertDttm.substring(11, 19)}",
                                            style: blackTextStyle.copyWith(
                                                fontSize: 5.sp),
                                            textAlign: TextAlign.center,
                                          ),
                                        ),
                                      ),
                                    ),
                                    Container(
                                      color: Colors.white,
                                      child: Padding(
                                        padding: const EdgeInsets.all(8),
                                        child: Center(
                                          child: Text(
                                            e.value.catatan,
                                            style: blackTextStyle.copyWith(
                                                fontSize: 5.sp),
                                            textAlign: TextAlign.center,
                                          ),
                                        ),
                                      ),
                                    ),
                                    Container(
                                      color: Colors.white,
                                      child: Padding(
                                        padding: const EdgeInsets.all(8),
                                        child: Center(
                                          child: Text(
                                            e.value.karyawan.nama,
                                            style: blackTextStyle.copyWith(
                                                fontSize: 5.sp),
                                            textAlign: TextAlign.center,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          )
                          .toList()
                      : []
                ],
              ),
            ));
      },
    );
  }
}
