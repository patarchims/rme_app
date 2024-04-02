part of 'content_manager_bloc.dart';

@freezed
class ContentManagerState with _$ContentManagerState {
  const factory ContentManagerState({
    required Menu menu,
    required String content,
  }) = _ContentManagerState;

  factory ContentManagerState.initial() => const ContentManagerState(
      menu: Menu.dashboard, content: Content.dasboard);
}
