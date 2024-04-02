// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ImageSectionWidget extends StatelessWidget {
  final String? imageString;
  const ImageSectionWidget({
    Key? key,
    this.imageString,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: Center(
        child: SvgPicture.asset(
          imageString ?? "assets/svg/login.svg",
          width: 647,
          height: 602,
        ),
      ),
    );
  }
}
