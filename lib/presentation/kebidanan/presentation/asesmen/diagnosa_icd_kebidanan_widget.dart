import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hms_app/presentation/component/component.dart';
import 'package:hms_app/presentation/component/loading/loading.dart';
import 'package:hms_app/presentation/kebidanan/bloc/diagnosa_kebidanan/diagnosa_kebidanan_bloc.dart';
import 'package:hms_app/presentation/kebidanan/presentation/asesmen/add_diagnosa_icd10_kebidanan_widget.dart';
import 'package:hms_app/presentation/kebidanan/presentation/asesmen/on_delete_diagnosa_icd10_kebidanan.dart';
import 'package:sizer/sizer.dart';

class DiagnosaICD10KebidananWidget extends StatelessWidget {
  const DiagnosaICD10KebidananWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: BlocBuilder<DiagnosaKebidananBloc, DiagnosaKebidananState>(
          builder: (context, state) {
            if (state.status == DiagnosaKebidananStatus.isLoadingGetData) {
              return Loading.expandedLoading();
            }

            // return Text(state.diagnosaKebidananResponse.toString());
            return Wrap(
              alignment: WrapAlignment.center,
              crossAxisAlignment: WrapCrossAlignment.start,
              children: (state.diagnosaKebidananResponse.isNotEmpty)
                  ? state.diagnosaKebidananResponse.map((e) {
                      return SizedBox(
                        // height: 35.sp,
                        width: 115.sp,
                        child: Card(
                          color: ThemeColor.primaryColor,
                          elevation: 1,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: ListTile(
                              enabled: true,
                              trailing: SizedBox(
                                height: 15.sp,
                                width: 15.sp,
                                child: FloatingActionButton(
                                  child: const Icon(
                                    FontAwesomeIcons.trash,
                                    color: Colors.white,
                                  ),
                                  onPressed: () {
                                    CustomDialogWidget.getDialog(
                                        widget: OnDeleteDiagnosaKebidanan(
                                            diagnosaKebidananResponse: e));
                                  },
                                ),
                              ),
                              title: Center(
                                child: Text(
                                  e.namaDiagnosa,
                                  textAlign: TextAlign.center,
                                  style: whiteTextStyle,
                                ),
                              ),
                            ),
                          ),
                        ),
                      );
                    }).toList()
                  : [],
            );
          },
        ),
        backgroundColor: ThemeColor.bgColor,
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            // ADD RIWAYAT KEHAMILAN

            context.read<DiagnosaKebidananBloc>().add(OnGetDiagnosaKebidanan());
            CustomDialogWidget.getDialog(
                widget: const AddDiagnosaICD10KebidananWidget());
          },
          child: const Icon(
            FontAwesomeIcons.plus,
            color: Colors.white,
          ),
        ));
  }
}
