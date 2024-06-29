part of 'action_cppt_bloc.dart';

@immutable
sealed class ActionCpptEvent {}

class OnGetAction extends ActionCpptEvent {}

class OnSaveAcation extends ActionCpptEvent {}
