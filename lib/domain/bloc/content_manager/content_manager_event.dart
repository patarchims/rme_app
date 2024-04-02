part of 'content_manager_bloc.dart';

@freezed
class ContentManagerEvent with _$ContentManagerEvent {
  const factory ContentManagerEvent.started() = _Started;
  const factory ContentManagerEvent.changeContent({required String content}) =
      _ChangeContent;
  const factory ContentManagerEvent.changeMenu({required Menu menu}) =
      _ChangeMenu;
}
