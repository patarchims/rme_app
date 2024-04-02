import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:hms_app/presentation/component/color/color_helper.dart';
import 'package:hms_app/presentation/component/fonts/font_helper.dart';

class Button {
  static modalButton(BuildContext context, List<Widget> children) {
    return showModalBottomSheet<void>(
      context: context,
      builder: (BuildContext context) {
        return StatefulBuilder(
            builder: (BuildContext context, StateSetter setState) {
          return Container(
            height: Get.height / 2.1,
            color: Colors.white,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: children,
            ),
          );
        });
      },
    );
  }

  static SizedBox btnChouseFileFrom(
      {required FaIcon icons, required String title, Function? onTap}) {
    return SizedBox(
        height: 52,
        width: Get.width,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
              elevation: 0,
              shadowColor: Colors.white,
              backgroundColor: Colors.white),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Row(
              children: [
                Container(
                  height: 42,
                  width: 42,
                  decoration: const BoxDecoration(
                      color: Color(0xFFEEEEEE), shape: BoxShape.circle),
                  child:
                      Container(margin: const EdgeInsets.all(8), child: icons),
                ),
                const SizedBox(width: 20),
                Text(
                  title,
                  style: blackTextStyle,
                ),
              ],
            ),
          ),
          onPressed: () {
            // FUNCTION HERE
            if (onTap != null) {
              onTap();
            }
          },
        ));
  }

  static InputBorder styleBorder() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      borderSide: const BorderSide(
        width: 0,
        color: ThemeColor.primaryColor,
      ),
    );
  }

  static InputBorder styleBorderPhone() {
    return const OutlineInputBorder(
      borderRadius: BorderRadius.only(
          topLeft: Radius.circular(0),
          bottomLeft: Radius.circular(0),
          topRight: Radius.circular(10),
          bottomRight: Radius.circular(10)),
      borderSide: BorderSide(
        width: 0,
        color: ThemeColor.primaryColor,
      ),
    );
  }

  static InputBorder styleBorderLeftPhone() {
    return const OutlineInputBorder(
      borderRadius: BorderRadius.only(
          topRight: Radius.circular(0),
          bottomRight: Radius.circular(0),
          topLeft: Radius.circular(10),
          bottomLeft: Radius.circular(10)),
      borderSide: BorderSide(
        width: 0,
        color: ThemeColor.primaryColor,
      ),
    );
  }

  static InputBorder styleOnly() {
    return const OutlineInputBorder(
      borderRadius: BorderRadius.only(
          topLeft: Radius.circular(10), bottomLeft: Radius.circular(10)),
      borderSide: BorderSide(
        width: 0,
        color: ThemeColor.primaryColor,
      ),
    );
  }

  static InputBorder styleBorderOnly() {
    return const OutlineInputBorder(
      borderRadius: BorderRadius.only(
          topLeft: Radius.circular(10),
          bottomLeft: Radius.circular(10),
          bottomRight: Radius.circular(0),
          topRight: Radius.circular(0)),
      borderSide: BorderSide(
        width: 0,
        color: ThemeColor.primaryColor,
      ),
    );
  }
}
