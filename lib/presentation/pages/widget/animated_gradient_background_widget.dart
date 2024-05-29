// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:animate_gradient/animate_gradient.dart';
import 'package:flutter/material.dart';

import 'package:hms_app/presentation/component/color/color_helper.dart';

class AnimatedGradientWidget extends StatefulWidget {
  final Widget widget;
  const AnimatedGradientWidget({
    super.key,
    required this.widget,
  });

  @override
  State<AnimatedGradientWidget> createState() => _AnimatedGradientWidgetState();
}

class _AnimatedGradientWidgetState extends State<AnimatedGradientWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimateGradient(
      primaryBeginGeometry: const AlignmentDirectional(0, 1),
      primaryEndGeometry: const AlignmentDirectional(0, 2),
      secondaryBeginGeometry: const AlignmentDirectional(2, 0),
      secondaryEndGeometry: const AlignmentDirectional(0, -0.8),
      primaryColors: [
        ThemeColor.primaryColor.withOpacity(0.5),
        Colors.blueAccent.withOpacity(0.5),
        Colors.white,
      ],
      secondaryColors: const [
        ThemeColor.primaryColor,
        Colors.blueAccent,
        Colors.white,
      ],
      child: widget,
    );
  }
}
