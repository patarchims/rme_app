import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:hms_app/domain/bloc/dashboard/alergi/alergi_bloc.dart';
import 'package:hms_app/domain/bloc/dashboard/pasien/pasien_bloc.dart';
import 'package:hms_app/domain/bloc/user/auth/auth_bloc.dart';
import 'package:hms_app/domain/models/devices_info/device_info_model.dart';
import 'package:hms_app/domain/models/meta/meta_model.dart';
import 'package:hms_app/domain/models/response/alergi/riwayat_alergi_pasien_model.dart';
import 'package:hms_app/domain/models/users/user_model.dart';
import 'package:hms_app/presentation/component/alert/mesage_alert.dart';
import 'package:hms_app/presentation/component/component.dart';
import 'package:hms_app/presentation/component/extenstion/date_helper.dart';
import 'package:hms_app/presentation/component/loading/loading.dart';
import 'package:hms_app/presentation/kebidanan/presentation/asesmen/kebidanan_widget_content.dart';
import 'package:hms_app/presentation/pages/bangsal/bloc/pengkajian_awal_keperawatan/pengkajian_awal_keperawatan_bloc.dart';
import 'package:hms_app/presentation/pages/bangsal/perawat/riwayat_alergi_keperawatan/riwayat_alergi_keperawatan_widget_content.dart';
import 'package:hms_app/presentation/pages/widget/header_content_widget.dart';
import 'package:hms_app/presentation/screens/emty_page.dart';
import 'package:sizer/sizer.dart';

class KeluhanUtamaAnakWidgetPage extends StatefulWidget {
  const KeluhanUtamaAnakWidgetPage({super.key});

  @override
  State<KeluhanUtamaAnakWidgetPage> createState() =>
      _KeluhanUtamaKeperawatanWidgetState();
}

class _KeluhanUtamaKeperawatanWidgetState
    extends State<KeluhanUtamaAnakWidgetPage> {
  final ScrollController _scrollController = ScrollController();
  late TextEditingController _searchController = TextEditingController();
  late TextEditingController _riwayatPenyakitKeluargaController =
      TextEditingController();
  late TextEditingController _searchMakananController = TextEditingController();
  late TextEditingController _searchLainController = TextEditingController();
  String searchValue = '';
  late Iterable<Alergi> obat = [];
  late Iterable<Alergi> makanan = [];
  late Iterable<Alergi> lain = [];

  @override
  void initState() {
    _searchController = TextEditingController();
    _riwayatPenyakitKeluargaController = TextEditingController();
    _searchMakananController = TextEditingController();
    _searchLainController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _searchController.clear();
    _riwayatPenyakitKeluargaController.clear();
    _searchMakananController.clear();
    _searchLainController.clear();

    _searchLainController.dispose();
    _riwayatPenyakitKeluargaController.dispose();
    _searchController.dispose();
    _searchMakananController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    AuthState authState = context.watch<AuthBloc>().state;
    PasienState pasienState = context.watch<PasienBloc>().state;
    final singlePasien = pasienState.listPasienModel
        .where((element) => element.mrn == pasienState.normSelected);

    return BlocConsumer<PengkajianAwalKeperawatanBloc,
        PengkajianAwalKeperawatanState>(
      listener: (context, state) {
        // READ
        if (state.status ==
            PengkajianAwalKeperawatanStatus.isLoadingSaveAsesmenAnak) {
          EasyLoading.show();
        }

        if (state.status !=
            PengkajianAwalKeperawatanStatus.isLoadingSaveAsesmenAnak) {
          EasyLoading.dismiss();
        }

        state.saveResultAsesmenAnakFailure.fold(
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
                      return shouldPop ?? false;
                    })));
      },
      builder: (context, state) {
        if (state.status ==
            PengkajianAwalKeperawatanStatus.isLoadingGetAsesmenAnak) {
          return HeaderContentWidget(
              isENableAdd: false,
              onPressed: () {},
              widget: Loading.expandedLoading());
        }
        return HeaderContentWidget(
            backgroundColor: ThemeColor.bgColor,
            isENableAdd: true,
            title: "SIMPAN",
            onPressed: () async {
              // SIMPAN DATA
              dynamic data = await deviceInfo.initPlatformState();
              if (authState is Authenticated) {
                // ignore: use_build_context_synchronously
                context.read<PengkajianAwalKeperawatanBloc>().add(
                    OnSaveAssesmenAnakEvent(
                        noReg: singlePasien.first.noreg,
                        noRM: singlePasien.first.mrn,
                        person: toPerson(person: authState.user.person),
                        pelayanan: "Anak",
                        devicesID: "ID-${data['id']}-${data['device']}",
                        dpjp: singlePasien.first.kdDokter,
                        jenpel: state.pengkajianAnak.pengkajianAnak.jenpel,
                        jenpenDetail:
                            state.pengkajianAnak.pengkajianAnak.jenpelDetail,
                        keluhanUtama:
                            state.pengkajianAnak.pengkajianAnak.keluhanUtama,
                        riwayatPenyakitDahulu: state
                            .pengkajianAnak.pengkajianAnak.rwtPenyakitDahulu,
                        riwayatPenyakit:
                            state.pengkajianAnak.pengkajianAnak.rwtPenyakit,
                        tanggal: DateTime.now().toString().substring(0, 10),
                        reaksiAlergi:
                            state.pengkajianAnak.pengkajianAnak.reaksiAlergi));
              }
            },
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
                  child: Container(
                    margin: EdgeInsets.only(right: 15.sp),
                    child: Column(
                      children: [
                        TitleWidget.titleContainer(title: "Jenis Anamnesa"),
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 5.sp),
                          child: Table(
                            border: TableBorder.all(color: ThemeColor.bgColor),
                            columnWidths: const {
                              1: FlexColumnWidth(6),
                              2: FlexColumnWidth(1.2),
                            },
                            children: [
                              TableRow(children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    "Anamnesa",
                                    textAlign: TextAlign.left,
                                    style:
                                        blackTextStyle.copyWith(fontSize: 6.sp),
                                  ),
                                ),
                                Container(
                                  width: Get.width,
                                  decoration:
                                      BoxDecoration(color: ThemeColor.bgColor),
                                  child: Column(
                                    children: [
                                      Wrap(
                                        children: jenisPengkajian
                                            .asMap()
                                            .entries
                                            .map((e) {
                                          if (state.pengkajianAnak
                                                  .pengkajianAnak.jenpel ==
                                              e.value) {
                                            //========///
                                            return TitleWidget.boxChoose(
                                              backgroundColor:
                                                  ThemeColor.greenColor,
                                              onPressed: () {
                                                //=======//
                                                if (e.value ==
                                                    jenisPengkajian[1]) {
                                                  ///=======================///
                                                  context
                                                      .read<
                                                          PengkajianAwalKeperawatanBloc>()
                                                      .add(
                                                          OnChangedDetailJenisAnamnesaAnak(
                                                              value: ""));
                                                }

                                                //====//
                                                context
                                                    .read<
                                                        PengkajianAwalKeperawatanBloc>()
                                                    .add(
                                                        OnChangedJenisAnamnesAnak(
                                                            value: e.value));
                                              },
                                              icon: const Icon(
                                                  FontAwesomeIcons.check,
                                                  color: Colors.white),
                                              title: e.value,
                                            );
                                          }
                                          return TitleWidget.boxChoose(
                                            backgroundColor:
                                                ThemeColor.primaryColor,
                                            onPressed: () {
                                              if (e.value ==
                                                  jenisPengkajian[1]) {
                                                //=======//
                                                context
                                                    .read<
                                                        PengkajianAwalKeperawatanBloc>()
                                                    .add(
                                                        OnChangedDetailJenisAnamnesaAnak(
                                                            value: ""));
                                              }
                                              //====//
                                              context
                                                  .read<
                                                      PengkajianAwalKeperawatanBloc>()
                                                  .add(
                                                      OnChangedJenisAnamnesAnak(
                                                          value: e.value));
                                            },
                                            icon: const Icon(
                                                FontAwesomeIcons.check,
                                                color: Colors.white),
                                            title: e.value,
                                          );
                                        }).toList(),
                                      ),

                                      //====//
                                      if (state.pengkajianAnak.pengkajianAnak
                                              .jenpel ==
                                          jenisPengkajian.last) ...[
                                        Container(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 5.sp, vertical: 2.sp),
                                          width: Get.width / 2.4,
                                          child: SizedBox(
                                            child: FormWidget.textArea(
                                                maxLines: 2,
                                                enabled: true,
                                                value: state
                                                    .pengkajianAnak
                                                    .pengkajianAnak
                                                    .jenpelDetail,
                                                onChanged: (e) {
                                                  context
                                                      .read<
                                                          PengkajianAwalKeperawatanBloc>()
                                                      .add(
                                                          OnChangedDetailJenisAnamnesaAnak(
                                                              value: e));
                                                }),
                                          ),
                                        ),
                                      ]
                                    ],
                                  ),
                                )
                              ]),
                            ],
                          ),
                        ),
                        TitleWidget.titleContainer(title: "Keluhan Utama"),
                        Padding(
                          padding: EdgeInsets.all(5.sp),
                          child: FormWidget.textArea(
                              enabled: true,
                              maxLines: 3,
                              value: state
                                  .pengkajianAnak.pengkajianAnak.keluhanUtama,
                              onChanged: (value) {
                                context
                                    .read<PengkajianAwalKeperawatanBloc>()
                                    .add(OnChangedKeluhanUtamaAnak(
                                        value: value));
                              }),
                        ),
                        TitleWidget.titleContainer(
                            title: "Riwayat Penyakit Sekarang"),

                        Padding(
                            padding: EdgeInsets.all(5.sp),
                            child: FormWidget.textArea(
                                enabled: true,
                                maxLines: 3,
                                value: state
                                    .pengkajianAnak.pengkajianAnak.rwtPenyakit,
                                onChanged: (value) {
                                  context
                                      .read<PengkajianAwalKeperawatanBloc>()
                                      .add(OnChangedRiwayatPenyakitSekarangAnak(
                                          value: value));
                                })),

                        TitleWidget.titleContainer(
                            title: "Riwayat Penyakit Dahulu"),

                        // ===================== //
                        Padding(
                          padding: EdgeInsets.all(5.sp),
                          child: FormWidget.textArea(
                              value: state.pengkajianAnak.pengkajianAnak
                                  .rwtPenyakitDahulu,
                              enabled: true,
                              maxLines: 3,
                              onChanged: (value) {
                                context
                                    .read<PengkajianAwalKeperawatanBloc>()
                                    .add(OnChangedRiwayatPenyakitDahuluAnak(
                                        value: value));
                              }),
                        ),

                        TitleWidget.titleContainer(
                            title: "Riwayat Pengobatan Sebelumnya"),

                        Padding(
                          padding: EdgeInsets.all(3.sp),
                          child: Wrap(
                            alignment: WrapAlignment.start,
                            crossAxisAlignment: WrapCrossAlignment.start,
                            children: (state.pengkajianKeperawatanResponseModel
                                    .riwayatTerdahulu.isNotEmpty)
                                ? state.pengkajianKeperawatanResponseModel
                                    .riwayatTerdahulu
                                    .map((e) => Padding(
                                          padding: EdgeInsets.all(1.sp),
                                          child: Card(
                                            margin: EdgeInsets.all(5.sp),
                                            color: ThemeColor.bgColor,
                                            elevation: 0,
                                            child: Text(
                                              "${tglIndo(e.tglMasuk.toString().substring(0, 10))} - ${e.riwayatSekarang.toString()},",
                                              style: blackTextStyle,
                                            ),
                                          ),
                                        ))
                                    .toList()
                                : [
                                    Container(
                                      height: 35.sp,
                                    )
                                  ],
                          ),
                        ),

                        TitleWidget.titleContainer(
                            title: "Riwayat Penyakit Keluarga"),

                        const SizedBox(height: 10),
                        Container(
                          width: Get.width,
                          height: 20.sp,
                          padding: EdgeInsets.symmetric(horizontal: 5.sp),
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                backgroundColor: ThemeColor.primaryColor,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(5.sp))),
                            child: const Icon(FontAwesomeIcons.plus,
                                color: Colors.white),
                            onPressed: () {
                              CustomDialogWidget.getDialog(
                                  widget: Container(
                                    width: Get.width / 1.5,
                                    height: 65.sp,
                                    decoration: const BoxDecoration(
                                        color: Colors.white),
                                    child: Column(
                                      children: [
                                        TitleWidget.titleContentWidget(
                                            title:
                                                "TAMBAH DATA RIWAYAT PENYAKIT KELUARGA"),
                                        Row(
                                          children: [
                                            Container(
                                                height: 35.sp,
                                                width: Get.width / 2,
                                                padding: EdgeInsets.all(5.sp),
                                                child: FormWidget.textForm(
                                                  controller:
                                                      _riwayatPenyakitKeluargaController,
                                                  validator: (value) {
                                                    if (value!.contains("\n")) {
                                                      Get.back();
                                                    }
                                                    return null;
                                                  },
                                                  enable: true,
                                                )),

                                            //===//
                                            Expanded(
                                              child: Container(
                                                margin: EdgeInsets.all(5.sp),
                                                height: 22.sp,
                                                width: Get.width,
                                                child: IconButton(
                                                    onPressed: () {
                                                      if (authState
                                                          is Authenticated) {
                                                        // ==== //
                                                        context.read<PengkajianAwalKeperawatanBloc>().add(OnSaveRiwayatPenyakitKeluarga(
                                                            tanggal:
                                                                DateTime.now()
                                                                    .toString()
                                                                    .substring(
                                                                        0, 10),
                                                            noRM: singlePasien
                                                                .first.mrn,
                                                            noReg: singlePasien
                                                                .first
                                                                .noAntrean,
                                                            person: toPerson(
                                                                person: authState
                                                                    .user
                                                                    .person),
                                                            penyakitKeluarga:
                                                                _riwayatPenyakitKeluargaController
                                                                    .text,
                                                            userID: authState
                                                                .user.userId));
                                                      }
                                                      Get.back();
                                                      _riwayatPenyakitKeluargaController
                                                          .clear();
                                                    },
                                                    style: ElevatedButton.styleFrom(
                                                        backgroundColor:
                                                            ThemeColor
                                                                .primaryColor,
                                                        shape: RoundedRectangleBorder(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        2.sp))),
                                                    color:
                                                        ThemeColor.whiteColor,
                                                    icon: const Icon(
                                                        FontAwesomeIcons
                                                            .circlePlus)),
                                              ),
                                            )
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                  color: Colors.transparent);
                            },
                          ),
                        ),
                        Container(
                          height: 150.sp,
                          padding: EdgeInsets.all(5.sp),
                          margin: EdgeInsets.all(5.sp),
                          width: Get.width,
                          decoration: BoxDecoration(
                            color: ThemeColor.bgColor,
                            borderRadius:
                                BorderRadius.all(Radius.circular(5.sp)),
                            border: Border.all(color: Colors.black),
                          ),
                          child: Card(
                            elevation: 1,
                            color: ThemeColor.bgColor,
                            child: SizedBox(
                              width: Get.width,
                              child:
                                  (state.pengkajianAnak.riwayatPenyakitKeluarga
                                          .isNotEmpty)
                                      ? Wrap(
                                          children:
                                              state.pengkajianAnak
                                                  .riwayatPenyakitKeluarga
                                                  .map((e) => SizedBox(
                                                        width: 100.sp,
                                                        height: 20.sp,
                                                        child: Card(
                                                          color: ThemeColor
                                                              .darkColor,
                                                          child: ListTile(
                                                              trailing:
                                                                  IconButton(
                                                                onPressed: () {
                                                                  // === //
                                                                  CustomDialogWidget.getDialog(
                                                                      widget: MessageAlert.deleteAlert(
                                                                          mesage: "Apakah Anda yakin menghapus data ${e.alergi} init ?",
                                                                          onPressed: () {
                                                                            //  === DELETE DATA ==== /
                                                                            context.read<AlergiBloc>().add(OnRemovePenyakitKeluargaEvent(
                                                                                nomor: e.nomor,
                                                                                noRm: e.noRm,
                                                                                kelompok: e.kelompok));

                                                                            if (authState
                                                                                is Authenticated) {
                                                                              context.read<PengkajianAwalKeperawatanBloc>().add(OnGetPengkajianAwalKeperawatanEvent(tanggal: DateTime.now().toString().substring(0, 10), noReg: singlePasien.first.noreg, noRM: singlePasien.first.mrn, person: toPerson(person: authState.user.person)));
                                                                            }
                                                                            Get.back();
                                                                          }));
                                                                },
                                                                icon:
                                                                    const Icon(
                                                                  FontAwesomeIcons
                                                                      .circleMinus,
                                                                  color: ThemeColor
                                                                      .dangerColor,
                                                                ),
                                                              ),
                                                              title: Text(
                                                                e.alergi,
                                                                style:
                                                                    whiteTextStyle,
                                                              )),
                                                        ),
                                                      ))
                                                  .toList(),
                                        )
                                      : EmtyScren(
                                          subTitle: "Data kosong",
                                          textStyle: blackTextStyle,
                                        ),
                            ),
                          ),
                        ),
                        SizedBox(height: 5.sp),
                        const RiwayatAlergiKeperawatanContentWidget(),
                        TitleWidget.titleContainer(title: "Reaksi Alergi"),
                        Padding(
                          padding: EdgeInsets.all(5.sp),
                          child: FormWidget.textArea(
                              value: state
                                  .pengkajianAnak.pengkajianAnak.reaksiAlergi,
                              enabled: true,
                              maxLines: 3,
                              onChanged: (value) {
                                context
                                    .read<PengkajianAwalKeperawatanBloc>()
                                    .add(OnChangedReaksiAlergiAnak(
                                        value: value));
                              }),
                        ),
                        SizedBox(height: 10.sp),
                      ],
                    ),
                  ),
                )));
      },
    );
  }
}

List<String> obats = [
  "ADANT DISPO",
  "FASTRO",
  "FORIFEK",
  "ABBOCATH",
  "ABILIFY",
  "ANTRAIN ",
  "ACETENSA",
  "ACETRAM",
  "ACID CITRAT",
  "ACILAZ(F)",
  "ACITRAL",
  "ACRAN",
  "ACRYLIC / GR",
  "ACTAZOLAM",
  "AUGMENTIN",
  "ACTONEL",
  "ACTRAPID INJ",
  "ACYCLOVIR",
  "ACYCLOVIR ZALF",
  "ADALAT  ",
  "ACCU CHEK LANCET PRO UNO ",
  "ASERING",
  "ADALAT",
  "ADONA",
  "AMINOSTERIL INFANT",
  "AERIUS",
  "AERIUS",
  "ACT TB",
  "AFUCID CREAM",
  "AGRAVAN",
  "AIR FLOW SENSOR YP 100",
  "AKILEN",
  "AKRINOR",
  "ALBENDAZOLE",
  "ALBOTHIL",
  "DIALAB ALBUMIN",
  "ALCO",
  "ALDISA",
  "ALINAMIN",
  "ALKACIDE",
  "DIALAB ALKALI PHOSPAT",
  "ALKAZYME",
  "ALKOHOL",
  "ALLORIS",
  "ALPRAZOLAM",
  "ALPENTIN",
  "ALPRAZOLAM 1 MG",
  "DIALAB SGPT/ALT ",
  "AMARYL",
  "AMBROXOL",
  "AMBROXOL",
  "AMINEFRON",
  "AMINOPHILLIN",
  "AMINORAL",
  "AMITRIPHYLINE ",
  "AMLODIPINE",
  "AMOXAN",
  "AMOXICILIN",
  "ANALSIK",
  "ANBACIN ",
  "AZIWIN",
  "AZIWIN",
  "ANGIOTEN   ",
  "AQUA GALON",
  "AQUA 1/2 GALON",
  "ANTASIDA DOEN",
  "ANTASIDA DOEN",
  "APIDRA SOLOSTAR INJ",
  "ANTISTATIC HEAD H.RUSCH ADULT",
  "ANTOMICAL FECEMASK RUSCH",
  "APIALYS 100ML",
  "APIALYS DROPS",
  "APRON X-RAY SINGLE",
  "AQUA PRO ",
  "AQUACEL",
  "AQUADEST",
  "ALOCLAIR PLUS GEL 8ML",
  "AQUADESTILATA 1000 ML",
  "ARCALION  ",
  "ARCOXIA",
  "ARDI",
  "ARCERIN MR  ",
  "ARMSLING (L,M,S)",
  "ARTEM INJ",
  "ARTERI KLEM",
  "ARTERI KOCHER LURUS 14 CM",
  "ARTOFLAM ",
  "ARTRODAR ",
  "MEFENAMAT",
  "ASCARDIA",
  "ACCES DOORS CUFF FOR INCUBATOR",
  "ASPAR K ",
  "ASPILETS ",
  "DIALAB",
  "ASTHIN",
  "ASTIKA ",
  "ATAROC",
  "ATORVASTATIN ",
  "AMINOFUSIN",
  "AZ",
  "ATOFAR",
  "ATORVASTATIN",
  "AUTOCLAVE",
  "AVELOX",
  "AZITHROMYCIN",
  "AZTRIN",
  "ACCU CHEK",
  "AVAMYS SPRAY",
  "ASTO LATEX",
  "AQUA MARIS BABY DROPS 15ML",
  "ASIFIT ",
  "AMINOFLUID ",
  "ASEPTIC  ",
  "AKILEN EYE DROPS",
  "ADSON-BABY",
  "ANTALGIN",
  "ARCOXIA",
  "ABBOTIC",
  "ALAT PEMBUAT KAPSUL",
  "ALLIS",
  "ADSON ELEVATOR",
  "ADSON RETR",
  "ABBOCATH",
  "ACTOS",
  "ALPHA TOUCH WITH SPIROTRAC VIT",
  "ADAPTER ",
  "ADAPTER LIGHT SOURCE OLYMPUS FOR FIBER OPTIC LIGHT CABLE LS.10.1003",
  "AVODART",
  "CALADINE LOTION",
  "NEUROSANBE INJ ",
  "AMINOLEBAN INF",
  "PAN AMIN G 500ML INF",
  "DIUVAR INJ",
  "VALIUM 10MG INJ",
  "RECOLFAR",
  "ACID SALYCIL",
  "PROZA",
  "ARICEPT 5MG @28",
  "CARBAZOCHROM INJ",
  "CDR EFF",
  "CHILLER GLASSPOOR NGUR601GD REFRIGE",
  "CRYOTUBE 1.8 ML@500",
  "CDR",
  "ASAM TRANEXSAMATJ ",
  "APTOR ",
  "ADENIN INJ",
  "ANDANTOL GEL",
  "ARKINE",
  "AMPICILIN ",
  "AMPICILIN  GR INJ",
  "AMPICILIN SULBACTAM  INJ",
  "ARKAVIT C",
  "AMADIAB",
  "ANVOMER B6",
  "AMARYL ",
  "AVOGIN",
  "AUTOMATIC STREECHER AMBULANCE YDC 3",
  "AMINOFUSIN HEPAR(AHEP)",
  "ALLERON",
  "APROVEL",
  "AQUACEL",
  "ANALTRAM ",
  "A.T.S U",
  "AXTAN",
  "ANKLE SUPPORT",
  "ANTISTATIC HEAD H.RUSCH ANAK",
  "CPAP SYSTEM",
  "AMIODARON INJ",
  "ACLASTA",
  "ARICEPT",
  "CADUET ",
  "CAPROLI",
  "CAPRI C 500",
  "ABILIFY MAINTENA INJ",
  "ABIXA 10MG",
  "ANTITEN",
  "AGDA (I-STATG3+CARTDGE)",
  "ALBUNORM 25 % INF",
  "ALCOCLIN HAND HYGIENE",
  "ALMEN ",
  "ALKOHOL 70% (100ML)",
  "AMIKACIN 500 MG INJ",
  "ANHISAN INJ",
  "ANOXI",
  "APETIC",
  "APETIC FORTE",
  "APRON PLASTIK ",
  "TIPS PIPETTES  ARKAY",
  "ARM COVER",
  "VITAMIN ",
  "ASTHIN B-OND 4MG ",
  "AVIGAN ",
  "AZITHROMYCIN INJ 500 MG",
  "AQUA MARIS DAILY NASAL SPRAY",
  "AMITEN ML INF",
  "DIUTENSI INJ",
  "REPIMIDE ",
  "ANDALAN 3 ML INJ",
  "APD SET(kacamata,baju,sarung tangan,sepatu@1)",
  "REBAMAX ",
  "ANTI-SYPHILIS CASSETTE",
  "ANTI-HCV \"25 CARD INTEC @40",
  "BASIC DRESSING",
  "BATERAI ECG MEDIANA YM412I",
  "BERZYMPLEX ",
  "BREATHING SET VENTILATOR (INFANT)",
  "BELT PJ 1854",
  "BETADIN VAGINA 100ML",
  "BISOLVON",
  "BETADINE GARGLE  ",
  "BETADINE FEMININE HYGIENE",
  "BROAD PLATE DCP 4.5MM 10 HOLE",
  "BOTOL KOSONG 50ML",
  "BENODON INJ",
  "BETADINE 5 GR",
  "BALON AMBU 3 LTR SILICON",
  "BREAST PUMP YOUNG2",
  "BREATHING SET ADULT",
  "BREATHY TTS HIDUNG",
  "BRUSH FOR LAPAROSCOPY P09316",
  "BISOLVON INJ ",
  "BACTRAZ INJ",
  "BUSCOPAN INJ ",
  "BLOOD SET (T) @50",
  "BAJU BAYI @12",
  "BATUGIN ELIXIR B 300ML",
  "BECLOV INJ @5",
  "BROADCED HOSPITAL PACK ",
  "BUFEC FORTE",
  "BUFEC",
  "BUSMIN",
  "BULI-BULI PANAS",
  "BIOSYN CM 966 NO. 1",
  "BIOSYN 3-0 SM 693",
  "BRAINAC ",
  "BRAINAC O-DIS ",
  "BRAXIDIN ",
  "BUDENOFALK @50",
  "BURNAZIN 500GR",
  "BUSCOPAN PLUS ",
  "BAQUINOR FORTE @20",
  "BAQUINOR 250MG @20",
  "BENZIDINE TES(HEMOSPOT)",
  "BECOMBION LYSINE SEVENSEAS",
  "BECOMBION ",
  "BETAHISTIN ",
  "BETAHISTIN HYDROCLORIDE 24MG ",
  "BIOCEF 1GR INJ",
  "BIOCREAM",
  "BIOPLACENTON",
  "BIOSANBE ",
  "BIOTHICOL",
  "BIOTHYCOL FORTE",
  "BETASERC",
  "BIOTHYCOL",
  "BIOXON INJ",
  "BIOZIM INJ",
  "BISOLVON ELIXIR",
  "BISOPROLOL 5MG",
  "BLOPRES",
  "BOTOL DOT PIGEON 120ML",
  "BAK INSTRUMEN",
  "BETA",
  "BERRY VISION ",
  "BALON TENSI METER",
  "BARIUM SULFAT (MICROBAR)/GRAM",
  "BETASERC",
  "BILIRUBIN",
  "BETADIN GARGLE",
  "BLOOD ROLLER MIXER OM",
  "BENOCETAM ",
  "HEPATITIS B IMMUNOGLUBOLIN",
  "BIOTHYCOL 250 MG",
  "BL 640 HFR",
  "BEVITA",
  "BATUGIN ELIXIR B 120ML",
  "BRAINVIT",
  "BRICASMA",
  "BIOGESIC",
  "BECEFORT",
  "BLENDER OBAT",
  "BAQUINOR TETES MATA",
  "BOTOL DOT YOUNG YOUNG 140 ML",
  "BATANG PENGADUK",
  "BOTOL DOT DODO 125ML",
  "BIOLYSIN",
  "BACKHAUS TOWEL CLAMP 15.0CM",
  "BABCOCK BABY GRASP FCPS 16CM",
  "BONE HOLD CLAMP 22CM",
  "BONE LEVER 25MM 27CM",
  "BRALIN 1000 MG INJ @5",
  "BORRAGINOL N SUP ",
  "BOWIE DICK SIMULATION TEST",
  "PATIENT MONITOR MEC 1000 MINDRAY",
  "BEDAK CAMPUR",
  "BOLA LAMPU HALOGEN OPTICAL",
  "BLOODSTOP 5X5 CM BS-10",
  "BED (MATTRAS DECUBITUS DELUXE L/V )",
  "LABELING(BLUE LABEL WITH INDICATOR FOR STEAM",
  "BAYCUTEN N SALP 5GR",
  "BENOSON N 5GR ",
  "BREAST PUMP BABY ELECTRIC LT 868",
  "BENOCETAM",
  "BROAD",
  "BENZOLAC CL",
  "XYLOCAIN SPRAY 10% ",
  "BROAD",
  "BRILINTA 90MG @56",
  "BATTERYING PUMP 06LL538 TERUMO",
  "BOLA LAMPU OPTICAL P400",
  "BIPOLAR INSERT LARGE GRASPER 34 CM",
  "BROAD PLATE DCP 12 HOLE",
  "BROAD PLATE DCP 13 HOLE",
  "BROAD PLATE DCP 16 HOLE",
  "BORRAGINOL-S OINT",
  "BORRAGINOL S SUP",
  "BUFECT ",
  "BRUSH T-SCRUB",
  "BRUSHES CLEANING WITH YLON BRISTLES MIS 7 MM9316",
  "BRUSHES CLEANING WITH YLON BRISTLES MIS10 MM 9315 ",
  "BEPANTHEN SALEP BAYI",
  "BISOLVON EXTRA 60CC",
  "BISOLVON EXTRA 120ML",
  "BENADRYL 50ML",
  "BENZATIN BENZIL PENISSILLIN 1.2 JT",
  "BETADINE GARGLE  240 ML",
  "BROAD PLATE DCP 4.5MM 9 HOLE",
  "BROAD PLATE DCP 4.5MM 11 HOLE",
  "BACTESYN 750MG INJ",
  "BACTESYN 1.5GR INJ",
  "BERIPLAST P.COMBISET 1 ML INJ",
  "BROADCED 1GR INJ",
  "BANTIF CHILD 60 ML",
  "BIO SAFE-CAB TYPE-A2 900",
  "BIO-STRATH",
  "BISOPROLOL 2.5MG",
  "BARIUM SULFAT @ 5 kg",
  "BUNASCAN SPINAL 0.5PCT HEAVY 4 ML",
  "BAROLE",
  "",
  "BIOLYSIN",
  "BRACKET BED PASIEN NYLON ONEMED",
  "BACTODERM 5GR ZALF",
  "BACTODERM 10GR ZALF",
  "BIPOLAR HIP PROSTHESIS",
  "BROAD PLATE DCP 4.5MM 13 HOLE",
  "BECKMAN DXH",
  "BIOLECTRA",
  "BAYCIDE",
  "BACTESYN",
  "BAMGETOL",
  "BIO-STRATH",
  "BEARBRANDRTD MILK",
  "BACTIGRAS",
  "BAJU COVERALL",
  "HAZMAT APD 75 GSM ",
  "BABY OIL JHONSON 125ML",
  "BUBBLE SET CPAP+AIR-O2MIXER FISHE",
  "BOX YELLOW TIPS ",
  "BOX BLUE TIPS ",
  "BOX WHITE TIPS ",
  "BAK INSTRUMEN 23CMX6CM",
  "BORRAGINOL-N OINT",
  "BURNAZIN PLUS 25GR",
  "BALON EKG +BESI ORIGINAL",
  "BATERAI MONITOR MEDIANA YM 6000",
  "BECOM C.",
  "BECOM-ZET ",
  "BED ANGIN (DECUBITUS BED AIR)",
  "BED PEN STAINLES STELL",
  "BED EMERGENCY HCB 02C ACARE",
  "BED SIDE CABINET",
  "BEDHEAD SINGLE",
  "BEDHEAD",
  "BEDSIDE CABINET ACARE CB 9000",
  "BROAD PLATE DCP 4.5MM 7 HOLE",
  "BENACOL 100ML",
  "BENACOL EXPECT ",
  "BROAD PLATE DCP 4.5MM 5HOLE",
  "BENOSON G CREAM",
  "BENOSON 5 GR",
  "BENOSON N 15 GR",
  "BENZATIN BENZIL PENISSILLIN 2.4 JT",
  "BENZIDINE TEST(COLO SCREN LAB PACK)",
  "BEROTEC 0.1MG INHALER ",
  "BETASON N CREAM",
  "BETADINE  /CC",
  "BETADIN SOL 60CC",
  "BETADIN SOL 15CC",
  "BETAMETASON ZALF",
  "BIBAG",
  "BICARBONAS",
  "BICROLID",
  "BIO ATP ",
  "BIOCURLIV ",
  "BIOCAL-95 ",
  "BIOPROM INJ",
  "BIOSAN ",
  "BIOTHICOL FORTE",
  "BISMECON JELLY",
  "BACITRACIN POLYMYXIN B",
  "BLEDSTOP  ",
  "BLEDSTOP INJ ",
  "BLESIFEN",
  "BLOOD",
  "BLOCAND ",
  "BOLA",
  "BONE WAX",
  "BRALIFEX PLUS ED",
  "BREATHING SIRKUIT",
  "BRICASMA 100ML",
  "BROAD",
  "BRUSH",
  "BUFECT 400",
  "BURNAZIN CREAM 35GR",
  "BUSCOPAN @ 100",
  "BENTO BOX",
  "CHANNA ",
  "CABLE SP02 EXT MEDIANA / NELCOR",
  "COVERAM 5/10 ",
  "COVERAM 5/5 ",
  "CALCIT 0.25  ",
  "CALCIUM LACTAT 500",
  "CALDECE",
  "CALMOR ",
  "COBAZIM 1000",
  "CABLE EKG MEDIANA",
  "CANDERIN",
  "CANDERI ",
  "CANDESARTAN",
  "CANDESARTAN ",
  "CANESTEN",
  "CANULA",
  "CITAZ ",
  "CABLE TEMPERATUR MONITOR",
  "CAPTOPRIL",
  "FOSMICYN 1 GR INJ",
  "CALNIC PLUS",
  "CLINOLEIC",
  "CAPTOPRIL",
  "CARMED",
  "CARDISAN @50",
  "CARDISAN",
  "CABLE INTERFACE CONNECTOR ORIGINAL",
  "CABLE 5 LEAD SET GRABBER IEC (PHIL)",
  "CODIKAF ",
  "CERVICAL COLLAR",
  "CERVIX SET",
  "CETINAL ",
  "CETIRIZINE",
  "CETIRIZINE",
  "CHLORAMFECORT H",
  "DIALAB CHOLESTEROL",
  "CHONDRO-PA",
  "CHROMALUX",
  "CIDEZYME 5 LTR",
  "CILOSTAZOLE",
  "CINOLON CREAM 10 GR",
  "CINOLON. N 10GR",
  "CINULA ",
  "CIPROFLOXACIN ",
  "CIPROFLOXACIN INF",
  "CITICOLIN INJ",
  "CITICOLINE",
  "CITICOLINE INJ 250 MG /AMP",
  "CK CONTROL",
  "CK MB",
  "CK NAC",
  "CLANEKSI 1GR INJ 6 S",
  "CLANEKSI F",
  "CLAST 0,5MG ",
  "CLAVICLE BRACE",
  "CLEAN CHEM",
  "CLEANSING ENEMA SET",
  "CORTISON INJ",
  "CLINDAMYCIN 150MG ",
  "CLINDAMYCIN 300MG",
  "CHAMPHORA SPIRITUS",
  "CENDO FLOXA ",
  "CARBAMAZEPIN",
  "CLOBAZAM 10MG ",
  "CLONIDIN ",
  "CLOPIDOGREL 75",
  "CO-AMOXICLAV 625 MG ",
  "CO",
  "CO-DIOVAN 80 MG",
  "CODEIN 10MG",
  "CODIPRONT",
  "CODIPRONT C.EXP",
  "CODIPRONT EXP",
  "CODIPRONT",
  "CODITAM 100 S",
  "COLERGIS.",
  "COLISTINE 250.000 IU",
  "COLLACURE 50x50 @5",
  "COLOSTOMY BAG NO 3 ONEMED",
  "COLOSTOMY BAG PHOENIX ",
  "COLSANCETIN 250 ",
  "COLSANCETINE 0,5% ED",
  "COLSANCETINE INJ 10/BOX",
  "COLSANCETINE",
  "COM BETADINE PAKAI TUTUP",
  "COMBIVENT 2.5 ML NEB@20",
  "COMBIVENT INHALER",
  "COMBUR 10 UX",
  "CABLE COMPATIBLE ECG PHILIPS",
  "COMINOX (STERICLIN350 MM XM PLASTIK)",
  "POUCHES STERILE 7,5CMM PLASTIK",
  "POUCHES STERILE 25CMM",
  "COMINOX {UTK STERIL INSTRUMENT }",
  "POUCHES STRECLIN FLAT 10M",
  "POUCHHES STRECLIN FLAT 15M",
  "COMINOX(STERICLIN GST 38X8CM-2VPSPGS38)PLASTIK",
  "POUCHES STERILE 40CMM",
  "COMINOX(STRECLIN20)",
  "COMMODE CHAIR FS 894/896",
  "COMTUSI 60 ML",
  "CONCOR 2,5 ",
  "CONCOR 5MG ",
  "CONDOM CATH.",
  "CONECTOR IRIGATOR",
  "CONNECTING 2 FUNNEL",
  "CONNECTING TUBE WITH YH 2 FUNNEL",
  "CONNECTOR TUBE",
  "COPPER T ",
  "COPPER T LIBI SAFE LOAD",
  "CORDARONE ",
  "CORDARONE ",
  "CORSEL ",
  "CORSET {LUMBAR SACRO SUPPORT }",
  "CORTIDEX 0,5MG ",
  "CONSTANTIA DROPS",
  "COTTON BUDS",
  "COUNTERPAIN 30GR",
  "CPG 75MG ",
  "CRAVIT 750 MG 150 ML @12",
  "DIALAB CREATININE 400 TEST",
  "CRESTOR",
  "CROME ",
  "CUFF HOSE FOR MEDIANA COLIN OMRON",
  "CUP SAMPLE SERUM",
  "CURCUMA ",
  "CURCUMA PLUS LYSINE",
  "CURCUMA FORCE @120",
  "CURLIV",
  "CURLIV PLUS 120 ML",
  "CURLIV PLUS ",
  "CURCUMA @120",
  "CURVIT",
  "CUTICELL",
  "CUTISOFT HAND SCRUB 5 LTR",
  "CUTISORB STERIL  10X10",
  "CUTISORB STERILE 10X20",
  "CUVETE RACK C",
  "CUVETE SEGMENTS RACK P400 15\"S",
  "CYGEST 400 MG PESSARY",
  "CILOPEC",
  "CURCUMA TANPA KEMASAN @500",
  "CLOPEDIN 2ML INJ ",
  "CLONEX INJ ",
  "CONTROL ELECTROLYT LEVEL 1",
  "CEFSPAN",
  "CENDO TOBROSON",
  "CONTROL BGE QUALITY LEVEL 2 (5AMP/SET)",
  "CONTROL ELECTROLYT LEVEL 3",
  "CARTRIDGE 25 PK (AGDA)",
  "CORMEGA SOFT",
  "CLEANING SOLUTION",
  "CLANEKSI",
  "KONDOM SUTRA",
  "CURVIT CL",
  "COLISTINE 1500000",
  "COLCHICINE ",
  "COBAZYM 3000",
  "CERINI DROPS",
  "CUSHING FLAT DRILL 14MM DIA",
  "DEMARTEL CONDF/ WIRE SAWSFLEX",
  "HOOK HANDLE F/ WIRE SAWS",
  "DAVIS VASCULAR SPATULA 245MM",
  "SCHMIEDEN-TAYLOR DURA SCIS",
  "YASARGIL TUMOR FCPS SERR 3M2",
  "YASARGIL MICRO SCISSORS STR",
  "DERMACOID KRIM",
  "CEFSPAN 100MG ",
  "COMBANTRIN 250 MG",
  "CUTTER WIRE LARGE L 220MM",
  "CENDO NONCORT TTM",
  "CENDO ",
  "CABLE",
  "CABLE SP02 SENSOR WRAP NEONT OXY 9 ONEMED",
  "CENDO VITROLENTA ED",
  "COTRIMOXAZOL(GITRI)",
  "CIMETIDENE",
  "COHISTAN",
  "CURCUMA PLUS 120ML",
  "COMINOX BESAR",
  "CETADOP INJ ",
  "CEREMAX IV 50ML INF",
  "CARPIATON 100MG",
  "COMAFUSIN HEPAR",
  "CALADIN POWDER 60GR",
  "CRINONE APLICATOR 8% VAG GEL",
  "CALSIRO",
  "CYCLOPEM INJ",
  "CENDO FENICOL EYE OINT",
  "CALCI GLUCONAS INJ @24",
  "CAMELUX/BIJI ",
  "CETIRIZIN DROPS",
  "CLAMIXIN",
  "CHLORAMFENICOL TTM",
  "CLINIMIX 1 LTR INF",
  "CELESTAMIN 30ML",
  "CAPSUL NO.3 (K)",
  "CAPSUL NO.00",
  "CAPSUL NO.1",
  "CAPSUL NO.2",
  "CAPSUL NO.0",
  "CURVIT 120ML ",
  "CODEIN 20MG",
  "CYSTONE",
  "CLAMIXIN",
  "CEFIM 1 GR INJ",
  "CELESTAMIN",
  "CORTAMIN",
  "CO2",
  "CCOPE RETR D/E 18CM",
  "CUPANOL",
  "CHLORAMPENICOL(HOLIMICETINE)",
  "CARDIO ASPIRIN",
  "CHLORAMPENICOL 250MG",
  "CAMERA HEAD OLYMPUS (PERBAIKAN) OTV-S7",
  "COMBANTRIN 125 MG",
  "CRAVOX 750 INF",
  "CRAVOX",
  "CEFEPIME 1 GR INJ",
  "CLOGIN",
  "CEFAZOLIN 1GR INJ",
  "CEPTIK",
  "CENTRIFUGE 8 HOLE -EB HETTICH GERMANY",
  "CEPTIK 100MG",
  "COTRIMOXAZOLE",
  "COXIRON 90MG",
  "COBRA PLATE 8 HOLE",
  "COBRA HEAD PLATE 4.5MM 6+8 HOLE",
  "COPE RETR D/E 18CM",
  "COOLEY SUCT TUBE 8MM 36CM",
  "COOLEY SUCT TUBE 8MM 37CM",
  "CHARRIERE AMPUTATING SAW 35CM :77.05.61",
  "CHARRIERE AMPUTATING SAW 35CM :77.05.62",
  "CHARRIERE AMPUTATING SAW 35CM :77.05.68",
  "COMBO KATETERISASI 18",
  "CURETES SM NO 8",
  "CALORTUSIN 60CC",
  "COMBO PACK NO 18 ",
  "COMBO PACK NO 20",
  "COMBO PACK NO 22",
  "COMBO PACK NO 24 + SPALK",
  "COMBO KATETERISASI  NO 16",
  "CEFACEF 100 MG ",
  "CEFACEF MG ",
  "CHLORAMFENICOL 2% SALF",
  "CELESTAMIN",
  "CLAVAMOX",
  "CURVIT",
  "CLABAT",
  "CLABAT 500 MG",
  "CLABAT FORTE",
  "CORALAN 5 mg @56",
  "CALTRON  @50",
  "CAL-95",
  "CALO",
  "DIALAB DIACAL",
  "CAT GUT CHROMIC NO 1 DW 565 SI",
  "CANDEPRESS 16 MG",
  "CANDEPRESS 8 MG",
  "CANDEFION 16 MG",
  "CAT GUT CHROMIC NO 0 (534S)",
  "CEFILA 100 MG ",
  "CEFILA",
  "CENDO XYTROL ED BOTOL",
  "CERVICAL COLLAR CHILD M",
  "CELEMEK(SHORT) PLASTIK",
  "CINAM INJ",
  "CINOLON. N 5GR",
  "CLIAD @50",
  "CLOTAIRE ",
  "CONTOUR PLUS",
  "COLERGIS ",
  "BLANKET CHEST ACCESS FULL 30000            ",
  "BLOOD PLATELET SET (TROMBOSIT SET)    ",
  "CONCOR 10MG ",
  "CRAVIT 750 MG ",
  "DIALAB WASHING SOLUTION 2X100ML",
  "CROSS TIP SHAFT DIA 1.5MM",
  "COTEN LICAPS 100MG ",
  "COMPYRANTEL 250 MG",
  "CALADIN LOTION 60 ML",
  "CALSET ANTI-SARS-COV-2S",
  "CYSTISTAT 40MG / 50ML",
  "CAMELON 8 MG",
  "CAPSINAT",
  "CVC 2 LUMEN 7 FR X 20 CM AGB",
  "CARDUO KAPLET  ",
  "CEPTIK ",
  "CLAVAMOX",
  "CALIBRATOR ",
  "CALIBRANT FLUID PACK CP100 ",
  "CANDEFAR 16 MG",
  "CALSIVAS 5MG",
  "CALSIVAS 10MG",
  "CANDEFAR 8 MG",
  "DIALAB EXTRA WASH BASIC",
  "CROSS TIP SHAFT DIA 2.0MM",
  "CVC 2 LUMEN 4 FR X 20 CM AGB",
  "CICA CARE 12X6CM",
  "CEFOPERAZONE INJ @2",
  "CEFOBACTAM INJ",
  "CK",
  "CRIPSA ",
  "DRILL BIT DIA  3.5X125 MM(QUICK COUPLING END)",
  "DAKTARIN ORAL GEL",
  "DRILL BIT MINI DIA 1.5X100MM@5",
  "DEBOSTIN 10MG ",
  "DAMABEN ",
  "D-VIT FT  ",
  "DRAMAMIN",
  "DURACARE 3-0 (FS018)",
  "D-VIT",
  "DESDIN",
  "DARYANT-TULLE (IH)",
  "DECK GLAS",
  "DECUBAL CREAM 20 GR",
  "DEFLAMAT CR 100 MG @20",
  "DEGRADE ",
  "DEGIROL",
  "DEHAF @6",
  "DEHIDRALYTE",
  "DELTA DRY 10CMX2,4 M (4 INCI)",
  "DELTA DRY 5CM X 2,4 M",
  "DELTA DRY 7,5CMX2,4 M (3 INCI)",
  "DELTA LITE BLUE 3 INCI(7,5X3,6)",
  "DELTA LITE CONFORMABLE 5 INCHI",
  "DEPAKENE",
  "DEPAKOTE 250 ",
  "DEPROTEINIZER CP",
  "DERMADES 10GR CREAM",
  "DESMANOL /CC",
  "DESDERMAN PURE GEL 1 LTR",
  "DESMANOL 5 LTR",
  "DIAFORMIN XR",
  "DEVLOVER",
  "DEXAMETHASON 0,5MG  ",
  "DEXTROSE 5% + 1/4NS @20",
  "DEXTROSE 2.5% / NACL 0,45% (LARUTAN 2A)",
  "DEXTRAN L.INF ( OTSUTRANS L)",
  "DEXTROSE 10% @20",
  "DEXTROSE 40% @120",
  "DEXTROSE 5%",
  "DHF",
  "DHF NS 1 / TEST",
  "DIAFORM NEO",
  "DIAGLIME 4 MG",
  "DIALON 100MG",
  "DIALYSER HIGH FLIX",
  "RENACARE DIALYZER L 16",
  "DIAPES LF GAMMA BLS517G",
  "DIAMICRON",
  "DIBECASIN E.DROP",
  "DICYNONE INJ @6",
  "DIFLOXIN ",
  "DIFLOXIN INF 100 ML",
  "DIFLUCAN 150",
  "DIFLUCA",
  "DILTIAZEM 30 ",
  "DETRUSITOL ",
  "DETTOL CAIR 95ML ",
  "DIRUI REAGENT",
  "DIRUI REAGENT H 11",
  "DISFLATYL ",
  "DISPOSABLE PRODE PD 100",
  "DISPOSAFE SAFETY",
  "DIVASK ",
  "DIVASK 5 MG ",
  "DIVENS PLUS",
  "DOLONES CREAM",
  "DOLO-NEUROBION ",
  "DOMERIL  SIRUP 120ML",
  "DOMERYL 60 ML",
  "DOME",
  "DOMPERIDON ",
  "DOPLER POCKET BISTOS BT LCD",
  "DORBIGOT ",
  "DRESS FCPS 16 CM TYPE 06",
  "DRESSING JAR 8X10",
  "DEXTAMINE",
  "DULCOLAX SUP. P. 6 S",
  "DULCOLAX SUPP @50",
  "DULCOLAX S",
  "DUODERM GEL 15 GR",
  "DUODERM GEL 30 GR",
  "DUPHASTON 20 S",
  "DISPOSIBLE FACE MASK CHILD SIZE 3",
  "DURASENSOR ADULT DIGIT",
  "DUROGESIC 12,5 TEMPEL @5",
  "DUROGESIC 25 TEMPEL @5",
  "DUVADILAN 50 S",
  "DUVADILAN INJ 6/BOX",
  "DANSERA",
  "DIRUI REAGENTH 11",
  "DEPTH GAUGE LARGE FOR 4.5 & 6.5MM",
  "DEPTH GAUGE SMALL FOR 2.7 & 3.5 MM",
  "DEPOPROGESTIN(ANDALAN) INJ",
  "DILANTIN",
  "DOPAC INJ",
  "DAMABEN",
  "DULCOLACTOL",
  "DULOXTA TABLET",
  "DERMATIX ULTRA GEL",
  "DIPITENZ INJ",
  "DUROLANE INJ 3ML",
  "DECAIN 4ML INJ",
  "DIGOXIN GENERIK ",
  "DIGOXIN SANDOZ ",
  "ARIXTRA 2.5 MG INJ",
  "MECOBALAMINE 500 MG INJ",
  "IMBOOST @50",
  "ABBOCATH 16",
  "ALOCLAIR PLUS ORAL RINSE",
  "ALOCLAIR PLUS SPRAY",
  "DIAZEPAM 2 MG",
  "DRESS FCPS 20.0CM STAND ",
  "DRESS FCPS 18.5CM STAND ",
  "DOYEN RETR/SPECULUM 35X85MM 24CM",
  "DOYEN RETR/SPECULUM 35X85MM 24CM 235432",
  "DUROTIP SCISSORS CVD ON FLAT BC231R",
  "DEXTAMINE",
  "DIAMICRON MR 60MG",
  "DARYA ZINK DROPS ",
  "DEFIBRILATOR FULL AUTO SVO-B0848",
  "DEXKETOPROFEN 25MG/ML INJ",
  "DOXYCICLIN 100MG",
  "AZOL",
  "PLATE RECONSTRUCTION STRAIGHT 3.5MM 4 HOLE",
  "DUODART",
  "DOBUTAMINE HCL INJ 50 MG / ML",
  "DEBOSTIN 20MG ",
  "DAILY D3 1000 IU TABLET",
  "DAKTARIN 5GR",
  "DOPAMET 250MG",
  "DIGENTA CREEM",
  "DERMOVEL 10GR ZALF",
  "DISPOSIBLE FACE MASK",
  "DIAPET NR ",
  "DEXTROSE 5% 100 ML",
  "DERMAKEL KIDS SALEP",
  "DERMOVEL 5 GR CREAM",
  "DRILL BIT DIA 3.2X130MM@5",
  "DRILL BIT DIA 4.5X130MM@5",
  "DRILL BIT DIA 2.7 X130MM@5",
  "PLATE RECONSTRUCTION STRAIGHT 3.5MM 9 HOLE",
  "DOBUJECT INJ 50 MG /ML",
  "DOLPHIN DISSECTING & Grasping Forcep ",
  "DOCARE W.GOLVES TISSUE",
  "DIVITI PFS2.5MG/0.5ML INJ",
  "DI",
  "DIBECASIN INJ",
  "DARYAZINC",
  "DESOLEX CREAM",
  "DESOLEX N CREAM",
  "DESOXIMETASONE 0.25 CREAM 15GR",
  "DAKTARIN DIAPER 10GR",
  "DOTRAMOL ",
  "DESIVIR ",
  "DESINFECTAN",
  "D1K  KAP",
  "DELLADRYL/RECODRYL INJ 15ML",
  "DEPAKOTE ER ",
  "DIALIFER INJ",
  "DIACONT",
  "DIACAL",
  "DIAPES LFS.DRY BLS514SD(ANAK)",
  "DUTASTERIDE 0.5MG",
  "DILUENT UNIVERSAL 2",
  "DIPHENHYDRAMYNE 10MG/ML INJ",
  "DECADRYL",
  "ALOCLAIR PLUS MOUTHWASH",
  "DIAZEPAM RT 10MG",
  "PLATE RECONSTRUCTION STRAIGHT 3.5MM 10 HOLE",
  "ECG 12 CHANEL MEDIANA YM 412I",
  "ECG BULB COMPLETE MEDIANA",
  "ECG CABLE 5 CHANNEL MEDIAN +TRUNK C",
  "EFLAGEN 50 MG@50",
  "EVOTHYL 100",
  "EVOTHYL 300MG",
  "ENZIMTEN ",
  "EPEXOL",
  "VACSIN EUVAX B 0.5 ML INJ",
  "EKG CREAM FUKUDA",
  "EKG PAPER 110 X 30",
  "ELKANA CL EMULSI 120 ML",
  "EMEGRAN 1MG/ML INJ @5",
  "EMEGRAN 3 MG/ML INJ @5",
  "ELKANA",
  "ELOCON CREAM 10 GR",
  "ELOCON CREAM 5 GR",
  "ELSAZYM ANAK",
  "EMERGENCY STRETCHER",
  "EMERSION OIL 250 MG",
  "EMERSION OIL 100ML OM",
  "EXOCID INJ",
  "ENCEPHABOL ",
  "ENDOTRACEA NO 2.5",
  "ENCEPHABOL",
  "ENDOTRACEA 4.5 ",
  "ENDOTRACHEA  5 ",
  "ENDOTRACHEA NON KING KING NO 7",
  "ENDOTRACHEA 4 ",
  "ENDOTRACHEAL 6,0 PORTEX ",
  "ENDOTRACHEAL 6.5 ",
  "ENDOZIME TRIPLE PLUS /4000 ML",
  "ERLAMICETINE EAR DROP (TELINGA)",
  "EOSIN 2 % 500 ML",
  "EPERISON ",
  "EPEXOL",
  "EPINEfrin INJ ",
  "EPOTrex -NP0 IU @6",
  "EPOTrex-NP.4000 IU @6",
  "EPP R PLUS 1000UL",
  "EPP R PLUS 30-300 UL",
  "EPrex PROTECS0 IU @6",
  "EPrex PROTECS 4000 IU @6",
  "ERLAMICETIN EYE DROP",
  "ERYSANBE",
  "ERICFIL",
  "ESILGAN 1MG ",
  "ESILGAN ",
  "ETHAMBUTOL ",
  "ESOFERR INJ",
  "EUPHYLIN RET 250 MG",
  "EUTHYROX 100",
  "EUTHYROX 50",
  "EXAMINATION BED STAINLES",
  "EXAMINATION LAMP OMEGA",
  "EXAMINATION LAMP L751 GEA ",
  "EXFORGE 10/160 @28",
  "EXFORGE 5/160MG @28",
  "EXFORGE 5/80 @28",
  "ALAT MEMINDAHKAN PATIEN(EAZY MOVE)",
  "EXTENTION TUBE @50",
  "EYE CARE (BABY EYE MASK)",
  "EYEVIT",
  "EZYGARD FORTE ",
  "EZYGARD",
  "EPISAN",
  "EOSIN 2% 500ML",
  "ENDOTRACHEAL 6,0 NON KINGKING",
  "ENDOTRACHEAL 6,5 NON KINGKING",
  "ETHYL CLORIDE",
  "ERLAMICETINE ZALF MATA",
  "ESPERSON 0.25 % 5 GR",
  "VACSIN EUVAX B 1 ML INJ",
  "EYEVIT",
  "ENDOTRACEA",
  "EDORISAN",
  "ENGERIX ",
  "OESTROGE",
  "ENERVON",
  "EDOTIN",
];

List<String> makanans = [
  "Telur",
  "Hidangan Laut",
  "Kacang-Kacangan",
  "Susu Sapi",
  "Telur",
  "Udang",
];
