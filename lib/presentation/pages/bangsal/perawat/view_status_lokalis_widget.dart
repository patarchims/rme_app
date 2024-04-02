import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hms_app/core/api/api_db.dart';
import 'package:hms_app/domain/bloc/dashboard/asesmen_igd/asesmen_igd_bloc.dart';

class ViewStatusLokalistIGDWidget extends StatelessWidget {
  const ViewStatusLokalistIGDWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(child: BlocBuilder<AsesmenIgdBloc, AsesmenIgdState>(
      builder: (context, state) {
        return Container(
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: NetworkImage(ApiDb.baseUrl + state.imageLokalis))),
        );
      },
    ));
  }
}
