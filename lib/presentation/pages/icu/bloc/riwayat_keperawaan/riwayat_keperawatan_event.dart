part of 'riwayat_keperawatan_bloc.dart';

@immutable
sealed class RiwayatKeperawatanEvent {}

class OnGetPemeriksaanFisikICU extends RiwayatKeperawatanEvent {}

class OnSavePemeriksaanFisikICU extends RiwayatKeperawatanEvent {}
