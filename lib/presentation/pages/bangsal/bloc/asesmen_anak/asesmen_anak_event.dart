part of 'asesmen_anak_bloc.dart';

@immutable
sealed class AsesmenAnakEvent {}

class OnGetAsessmenAnakEvent extends AsesmenAnakEvent {}

class OnSaveAsesmenAnakEvent extends AsesmenAnakEvent {}
