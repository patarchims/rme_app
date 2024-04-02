import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hms_app/presentation/component/resources/app_constant.dart';

class BadResponsePage extends StatelessWidget {
  const BadResponsePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SvgPicture.asset(
          AppConstant.badRequestSVG,
          fit: BoxFit.fitHeight,
        ),
      ],
    );
  }
}
