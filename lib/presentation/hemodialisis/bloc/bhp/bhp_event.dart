// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'bhp_bloc.dart';

@immutable
sealed class BhpEvent {}

class OnGetBHPHD extends BhpEvent {
  final String noReg;
  OnGetBHPHD({
    required this.noReg,
  });
}

class OnChanged1A extends BhpEvent {
  final bool selection;
  OnChanged1A({
    required this.selection,
  });
}

class OnChanged1B extends BhpEvent {
  final bool selection;
  OnChanged1B({
    required this.selection,
  });
}

class Onchanged1C extends BhpEvent {
  final bool selection;
  Onchanged1C({
    required this.selection,
  });
}

class OnChanged2A extends BhpEvent {
  final bool selection;
  OnChanged2A({
    required this.selection,
  });
}

class OnChanged2B extends BhpEvent {
  final bool selection;
  OnChanged2B({
    required this.selection,
  });
}

class Onchanged3 extends BhpEvent {
  final bool selection;
  Onchanged3({
    required this.selection,
  });
}

class Onchanged4 extends BhpEvent {
  final bool selection;
  Onchanged4({
    required this.selection,
  });
}

class Onchanged5 extends BhpEvent {
  final bool selection;
  Onchanged5({
    required this.selection,
  });
}

class Onchanged6 extends BhpEvent {
  final bool selection;
  Onchanged6({
    required this.selection,
  });
}
