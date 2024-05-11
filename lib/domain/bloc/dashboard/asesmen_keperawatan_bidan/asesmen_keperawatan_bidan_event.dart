part of 'asesmen_keperawatan_bidan_bloc.dart';

@freezed
class AsesmenKeperawatanBidanEvent with _$AsesmenKeperawatanBidanEvent {
  const factory AsesmenKeperawatanBidanEvent.started() = _Started;

  // ON EMTY DIAGNOSA KEPERAWATAN
  const factory AsesmenKeperawatanBidanEvent.emty() = _Emty;

  // GET ASUHAN
  const factory AsesmenKeperawatanBidanEvent.getDeskripsiAsuhan(
      {required String siki}) = _GetDeskripsiAsuhan;

  // ASUHAN KEPERAWATAN
  const factory AsesmenKeperawatanBidanEvent.selectionDeskripsi(
      {required bool seleted}) = _SelectionDeskripsi;

  // ASUHAN KEPERAWATAN
  const factory AsesmenKeperawatanBidanEvent.getAsuhanKeperawatanNew(
      {required String noReg}) = _GetAsuhanKeperawatanNew;

  const factory AsesmenKeperawatanBidanEvent.getAsesmenKeperawatan(
      {required String noReg}) = GetAsesmenKeperawatan;

  const factory AsesmenKeperawatanBidanEvent.saveAsesmenKeperawatan(
      {required AsesmenKeperawatanBidanModel
          asesmenKeperawatanBidanModel}) = SaveAsesmenKeperawatan;

  // ===== INTERVENSI SELECTION
  const factory AsesmenKeperawatanBidanEvent.isDiagnosaAvailable(
      {required bool isDiagnosa}) = _IsDiagnosaAvailable;

  const factory AsesmenKeperawatanBidanEvent.copyWriteIntervensi(
      {required Slki slki}) = _CopyWriteIntervensi;

  // ===
  const factory AsesmenKeperawatanBidanEvent.getAsuhanKeperawatan(
      {required String value}) = _GetAsuhanKeperawatan;

  // ===== INTERVENSI SELECTION
  const factory AsesmenKeperawatanBidanEvent.selectIntervensi(
      {required List<IntervensiSelectionModel>
          listIntervensiSelectionModel}) = _SelectIntervensi;

  // ===== PILIH INTERVENSI
  const factory AsesmenKeperawatanBidanEvent.pilihIntervensi(
      {required Slki slki, required String number}) = _PilihIntervensi;

  // ===== ADD INTERVESI MODEL
  const factory AsesmenKeperawatanBidanEvent.addIntervensiModel(
      {required List<IntervensiModel> intervensi}) = _AddIntervensiModel;

  const factory AsesmenKeperawatanBidanEvent.clearIntervensi() =
      _ClearIntervensi;

  const factory AsesmenKeperawatanBidanEvent.cariSIKI(
      {required String sikiSelected}) = _CariSIKI;

  // SIKI SELECTION
  const factory AsesmenKeperawatanBidanEvent.selectionSIKI(
      {required SikiModel sikiModel}) = _SelectionSIKI;

  const factory AsesmenKeperawatanBidanEvent.selectSDKI(
      {required SDKIModel sdkiModel}) = _SelectSDKI;

  const factory AsesmenKeperawatanBidanEvent.pilihDiagnosa(
          {required PilihDiagnosaKeperawatan pilihDiagnosaKeperawatan}) =
      _PilihDiagnosa;

  const factory AsesmenKeperawatanBidanEvent.selectedKeluaran(
      {required String value}) = _SelectedKeluaran;

  const factory AsesmenKeperawatanBidanEvent.cariIntervensi(
      {required String value}) = _CariIntervensi;

  const factory AsesmenKeperawatanBidanEvent.cariSDKI({required String value}) =
      _CariSDKI;
  const factory AsesmenKeperawatanBidanEvent.getData({required String noReg}) =
      _GetData;
  const factory AsesmenKeperawatanBidanEvent.saveData(
      {required AsesmenKeperawatanBidanModel
          asesmenKeperawatanBidanModel}) = _SaveData;

  const factory AsesmenKeperawatanBidanEvent.saveAsuhanKeperawatan(
      {required String noReg}) = _SaveAsuhanKeperawatan;
}
