import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

import 'menu.dart';

part 'content_manager_event.dart';
part 'content_manager_state.dart';
part 'content_manager_bloc.freezed.dart';

@injectable
class ContentManagerBloc
    extends Bloc<ContentManagerEvent, ContentManagerState> {
  ContentManagerBloc() : super(ContentManagerState.initial()) {
    on<ContentManagerEvent>((event, emit) => _onEventChanged(event, emit));
  }

  Future<void> _onEventChanged(
      ContentManagerEvent event, Emitter<ContentManagerState> emit) async {
    event.maybeMap(
        orElse: () {},
        changeMenu: (e) {
          emit(state.copyWith(menu: e.menu));
        },
        changeContent: (e) {
          emit(state.copyWith(content: e.content));
        });
  }
}
