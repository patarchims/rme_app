import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hms_app/domain/bloc/dashboard/informasi_medis/informasi_medis_bloc.dart';
import 'package:hms_app/domain/bloc/asesmen/input_diagnosa/input_diagnosa_bloc.dart';
import 'package:hms_app/domain/bloc/asesmen/medis/data_medik/data_medik_bloc.dart';
import 'package:hms_app/domain/bloc/asesmen/medis/intra_oral/intra_oral_bloc.dart';
import 'package:hms_app/presentation/pages/poli_gigi/medis/anamnesa_widget.dart';
import 'package:hms_app/presentation/pages/poli_gigi/medis/data_intra_oral_widget.dart';
import 'package:hms_app/presentation/pages/poli_gigi/medis/data_medik_diperlukan_widget.dart';
import 'package:hms_app/presentation/pages/poli_gigi/medis/diagnosa_sesuai_icd/input_diagnosa.dart';
import 'package:hms_app/presentation/pages/poli_gigi/medis/informasi_medis_gigi_widget.dart';
import 'package:hms_app/presentation/pages/poli_gigi/medis/odontogram_widget.dart';
import '../../../domain/bloc/dashboard/anamnesa/anamnesa_bloc.dart';
import '../../../domain/bloc/dashboard/pasien/pasien_bloc.dart';
import '../../component/component.dart';

class AsesmenMedisGigiContentWidget extends StatefulWidget {
  final List<String> menuAsesmenMedis;
  const AsesmenMedisGigiContentWidget({
    Key? key,
    required this.menuAsesmenMedis,
  }) : super(key: key);

  @override
  State<AsesmenMedisGigiContentWidget> createState() =>
      _AsesmenMedisGigiContentWidgetState();
}

class _AsesmenMedisGigiContentWidgetState
    extends State<AsesmenMedisGigiContentWidget> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PasienBloc, PasienState>(
      builder: (context, state) {
        final singlePasien = state.listPasienModel
            .where((element) => element.mrn == state.normSelected);

        return Expanded(
            child: DefaultTabController(
          length: widget.menuAsesmenMedis.length, // Added
          initialIndex: 0, //A
          child: Scaffold(
            backgroundColor: ThemeColor.bgColor,
            appBar: AppBar(
              backgroundColor: Colors.blue.withOpacity(0.5),
              foregroundColor: Colors.black,
              surfaceTintColor: Colors.black,
              flexibleSpace: SafeArea(
                  child: TabBar(
                labelColor: ThemeColor.primaryColor,
                unselectedLabelColor: Colors.black,
                dividerColor: Colors.white,
                indicatorColor: ThemeColor.primaryColor,
                onTap: (index) {
                  if (index == 0) {
                    context.read<AnamnesaBloc>().add(
                        AnamnesaEvent.getAsesmenAnamnesa(
                            noReg: singlePasien.first.noreg));
                  }
                  if (index == 2) {
                    // LAKUKAN GET INFOMRASI MEDIS
                    if (singlePasien.isNotEmpty) {
                      context.read<PasienBloc>().add(PasienEvent.riwayatPasien(
                          noRM: singlePasien.first.mrn));

                      context.read<InformasiMedisBloc>().add(
                          InformasiMedisEvent.getInformasiMedis(
                              singlePasien.first.noreg.toString(),
                              singlePasien.first.kdBagian.toString()));
                    }
                  }

                  if (index == 3) {
                    if (singlePasien.isNotEmpty) {
                      context
                          .read<InputDiagnosaBloc>()
                          .add(const InputDiagnosaEvent.onGetDiagnosa());

                      context.read<InputDiagnosaBloc>().add(
                          InputDiagnosaEvent.getDiagnosa(
                              noreg: singlePasien.first.noreg));
                    }
                  }
                  if (index == 4) {
                    if (singlePasien.isNotEmpty) {
                      context.read<IntraOralBloc>().add(IntraOralEvent.getData(
                          noReg: singlePasien.first.noreg));
                    }
                  }

                  if (index == 5) {
                    if (singlePasien.isNotEmpty) {
                      context.read<DataMedikBloc>().add(
                          DataMedikEvent.getDataMedik(
                              noreg: singlePasien.first.noreg));
                    }
                  }
                },
                tabs: widget.menuAsesmenMedis
                    .map(
                      (e) => Tab(
                        text: e,
                      ),
                    )
                    .toList(),
              )),
              leading: null,
              elevation: 0,
              automaticallyImplyLeading: false,
            ),
            body: TabBarView(
              children: widget.menuAsesmenMedis.asMap().entries.map(
                (e) {
                  // TAMPILKAN ANAMNESA
                  if (e.key == 0) {
                    // TAMPILKAN ANAMNESA

                    return const AnamnesaWidget();
                  }

                  // TAMPILKAN ODONTOGRAM
                  if (e.key == 1) {
                    return OdontogramWidget();
                  }

                  // TAMPILKAN INFORMASI MEDIS DAN TINDAKAN
                  if (e.key == 2) {
                    return const InformasiMedisWidget();
                  }

                  // TAMPILKAN INPUT DIAGONAS
                  if (e.key == 3) {
                    // PADA INPUT DIAGNOSA
                    // GET DATA DIAGNOSA, UNTUK SUMBER INPUT DATA DIAGNOSA

                    return const InputDignosaWidget(
                      enableEdit: true,
                    );
                  }

                  if (e.key == 4) {
                    return const DataIntraOralWidget();
                  }

                  if (e.key == 5) {
                    return const DataMedikDiperlukanWidget();
                  }

                  return Container();
                },
              ).toList(),
            ),
          ),
        ));
      },
    );
  }
}
