import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hms_app/domain/bloc/theme/theme_bloc.dart';

typedef ThemeModeBuilder = Widget Function(ThemeMode themeMode);

class ThemeBuilder extends StatelessWidget {
  const ThemeBuilder({
    super.key,
    required this.builder,
  });

  final ThemeModeBuilder builder;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeBloc, ThemeState>(
      builder: (_, state) => builder(state.themeMode),
    );
  }
}
