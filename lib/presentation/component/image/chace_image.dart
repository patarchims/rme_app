import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:hms_app/presentation/component/resources/app_constant.dart';

class ChaceImage extends StatelessWidget {
  final String imageUrl;
  final double? height;
  final double? width;

  const ChaceImage({Key? key, required this.imageUrl, this.height, this.width})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      key: ValueKey(key),
      imageUrl: imageUrl.toString(),
      fit: BoxFit.cover,
      height: height,
      width: width,
      placeholder: (context, url) => Image.asset(
        AppConstant.imageDefault,
        fit: BoxFit.cover,
        height: 240,
      ),
      errorWidget: (context, url, error) => const Icon(
        Icons.error,
        color: Colors.red,
        size: 24,
      ),
    );
  }
}
