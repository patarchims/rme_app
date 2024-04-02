// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'deskripsi_luaran_slki_bloc.dart';

@immutable
sealed class DeskripsiLuaranSlkiEvent {}

class OnGetDeskripsiLuaranSikiEvent extends DeskripsiLuaranSlkiEvent {
  final String diagnosa;
  OnGetDeskripsiLuaranSikiEvent({required this.diagnosa});
}

class OnSaveDataEvent extends DeskripsiLuaranSlkiEvent {
  final String deviceID;
  final String pelayanan;
  final String noReg;
  final String person;
  OnSaveDataEvent({
    required this.deviceID,
    required this.pelayanan,
    required this.noReg,
    required this.person,
  });
}

class OnSelectionWaktuEvent extends DeskripsiLuaranSlkiEvent {
  final String jam;
  final int indexSLKI;
  final Kategori kategori;
  final KriteriaSlki kriteriaSlki;
  final int indexKriteriaSlki;
  OnSelectionWaktuEvent({
    required this.jam,
    required this.indexSLKI,
    required this.kategori,
    required this.kriteriaSlki,
    required this.indexKriteriaSlki,
  });
}

class OnSelectionTargetEvent extends DeskripsiLuaranSlkiEvent {
  final int target;
  final int indexSLKI;
  final Kategori kategori;
  final KriteriaSlki kriteriaSlki;
  final int indexKriteriaSlki;

  OnSelectionTargetEvent({
    required this.target,
    required this.indexSLKI,
    required this.kategori,
    required this.kriteriaSlki,
    required this.indexKriteriaSlki,
  });
}

class OnSelectionSikiEvent extends DeskripsiLuaranSlkiEvent {
  final int indexSIKI;
  final String kategori;
  final Edukasi edukasi;
  final int noUrut;

  OnSelectionSikiEvent({
    required this.indexSIKI,
    required this.kategori,
    required this.edukasi,
    required this.noUrut,
  });
}

class OnSelectedSLKIEvent extends DeskripsiLuaranSlkiEvent {
  final int indexSLKI;
  final Kategori kategori;
  final KriteriaSlki kriteriaSlki;
  final int indexKriteriaSlki;

  OnSelectedSLKIEvent({
    required this.indexSLKI,
    required this.kategori,
    required this.kriteriaSlki,
    required this.indexKriteriaSlki,
  });
}
