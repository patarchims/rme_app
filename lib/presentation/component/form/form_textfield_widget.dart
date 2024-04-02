import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:hms_app/presentation/component/button/button_helper.dart';
import 'package:hms_app/presentation/component/color/color_helper.dart';
import 'package:hms_app/presentation/component/fonts/font_helper.dart';
import 'package:sizer/sizer.dart';

class FormWidget {
  static dateText({
    String? text,
    bool? enable,
    Function(String)? onChanged,
  }) {
    return TextFormField(
        onChanged: onChanged,
        enabled: enable ?? true,
        controller: TextEditingController(text: text),
        style: blackTextStyle,
        decoration: InputDecoration(
          border: Button.styleOnly(),
          enabledBorder: Button.styleOnly(),
          focusedBorder: Button.styleOnly(),
          disabledBorder: Button.styleOnly(),
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 16,
          ),
          fillColor: (enable == true) ? Colors.white : ThemeColor.darkGreyColor,
          filled: true,
        ),
        autocorrect: false);
  }

  static title({required String title}) {
    return Container(
      margin: EdgeInsets.only(bottom: 5.sp),
      child: Text(
        title,
        style: blackTextStyle.copyWith(
            fontSize: 12.sp, color: ThemeColor.greyColor),
      ),
    );
  }

  static styleDropdown(BuildContext context) {
    return InputDecoration(
      enabledBorder: OutlineInputBorder(
        borderSide: const BorderSide(color: Colors.blue, width: 2),
        borderRadius: BorderRadius.circular(10),
      ),
      border: OutlineInputBorder(
        borderSide: const BorderSide(color: Colors.blue, width: 2),
        borderRadius: BorderRadius.circular(10),
      ),
      filled: true,
      fillColor: Colors.white,
    );
  }

  static textArea(
      {final String? value,
      final Function(String)? onChanged,
      final TextEditingController? controller,
      final String? Function(String?)? validator,
      final String? hinText,
      bool? enabled,
      int? maxLines = 6}) {
    return Container(
      margin: EdgeInsets.only(bottom: 5.sp),
      child: TextFormField(
        enabled: (enabled == null) ? true : enabled,
        validator: validator,
        controller: controller,
        maxLines: maxLines,
        style: blackTextStyle,
        initialValue: value,
        decoration: InputDecoration(
          enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.black, width: 2),
          ),
          hintText: hinText,
          hintStyle: greyTextStyle,
          border: Button.styleBorder(),
          focusedBorder: Button.styleBorder(),
          disabledBorder: Button.styleBorder(),
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 16,
          ),
          fillColor:
              (enabled == true) ? Colors.white : Colors.grey.withOpacity(0.5),
          filled: true,
        ),
        autocorrect: false,
        onChanged: onChanged,
      ),
    );
  }

  static textForm(
      {final Function(String)? onChanged,
      Function(String)? onFieldSubmitted,
      TextEditingController? controller,
      bool? autoFocus,
      bool? enable,
      Key? key,
      final String? value,
      String? labelText,
      final String? Function(String?)? validator}) {
    return TextFormField(
        onFieldSubmitted: onFieldSubmitted,
        autofocus: autoFocus ?? false,
        onChanged: onChanged,
        controller: controller,
        enabled: enable ?? true,
        style: blackTextStyle,
        initialValue: value,
        decoration: InputDecoration(
          labelText: labelText,
          labelStyle: blackTextStyle,
          enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.black, width: 2),
          ),
          focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.black, width: 2),
          ),
          filled: true,
          fillColor: (enable == true) ? Colors.white : ThemeColor.darkGreyColor,
        ),
        autocorrect: false);
  }

  static passwordTextField(
      {required bool isHiddenPassword,
      Function(String)? onChanged,
      Function? isHiddenOnTap,
      String? Function(String?)? validator}) {
    return TextFormField(
      style: blackTextStyle,
      obscureText: isHiddenPassword,
      decoration: InputDecoration(
        suffixIcon: GestureDetector(
          onTap: () {
            if (isHiddenOnTap != null) {
              log("IS HIDDEN PASSWORD");
              isHiddenOnTap();
            }
          },
          child: Icon(
            isHiddenPassword ? Icons.visibility_off : Icons.visibility,
            color: ThemeColor.primaryColor,
          ),
        ),
        hintText: '*******',
        border: Button.styleBorder(),
        enabledBorder: Button.styleBorder(),
        focusedBorder: Button.styleBorder(),
        disabledBorder: Button.styleBorder(),
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 16,
        ),
        fillColor: Colors.white,
        filled: true,
      ),
      autocorrect: false,
      onChanged: onChanged,
      validator: validator,
    );
  }

  static numberForm({
    final String? value,
    final bool? enable,
    final Function(String)? onChanged,
    TextEditingController? controller,
    final String? Function(String?)? validator,
  }) {
    return Container(
      margin: EdgeInsets.only(bottom: 5.sp),
      child: TextFormField(
        enabled: enable ?? true,
        controller: controller,
        validator: validator,
        initialValue: value,
        style: blackTextStyle,
        onChanged: onChanged,
        keyboardType: TextInputType.number,
        decoration: InputDecoration(
          labelStyle: blackTextStyle,
          enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.black, width: 2),
          ),
          focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.black, width: 2),
          ),
          filled: true,
          fillColor: (enable == true) ? Colors.white : ThemeColor.darkGreyColor,
        ),
        autocorrect: false,
      ),
    );
  }

  static phoneNumber({
    final String? value,
    final bool? enable,
    final Function(String)? onChanged,
    final String? Function(String?)? validator,
  }) {
    return Container(
      margin: EdgeInsets.only(bottom: 5.sp),
      child: TextFormField(
        enabled: enable ?? true,
        validator: validator,
        initialValue: value,
        style: blackTextStyle,
        onChanged: onChanged,
        keyboardType: TextInputType.number,
        decoration: InputDecoration(
          border: Button.styleBorderLeftPhone(),
          enabledBorder: Button.styleBorderLeftPhone(),
          focusedBorder: Button.styleBorderLeftPhone(),
          disabledBorder: Button.styleBorderLeftPhone(),
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 16,
          ),
          fillColor: (enable == true) ? Colors.white : ThemeColor.darkGreyColor,
          filled: true,
        ),
        autocorrect: false,
      ),
    );
  }

  static phoneNumber2({
    final String? value,
    final String? hinText,
    final bool? enable,
    final Function(String)? onChanged,
    final String? Function(String?)? validator,
  }) {
    return Container(
      margin: EdgeInsets.only(bottom: 5.sp),
      child: TextFormField(
        enabled: enable ?? true,
        validator: validator,
        initialValue: value,
        style: blackTextStyle,
        onChanged: onChanged,
        keyboardType: TextInputType.number,
        decoration: InputDecoration(
          hintText: hinText,
          border: Button.styleBorderPhone(),
          enabledBorder: Button.styleBorderPhone(),
          focusedBorder: Button.styleBorderPhone(),
          disabledBorder: Button.styleBorderPhone(),
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 16,
          ),
          fillColor: Colors.white,
          filled: true,
        ),
        autocorrect: false,
      ),
    );
  }

  static phoneNumberForm() {
    return Container(
      height: 55,
      decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(width: 1, color: Colors.grey),
          borderRadius: BorderRadius.circular(10)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(
            width: 10,
          ),
          SizedBox(
            width: 40,
            child: TextFormField(
              initialValue: "+62",
              style: blackTextStyle.copyWith(
                fontSize: 18.sp,
              ),
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                border: InputBorder.none,
              ),
            ),
          ),
          const Text(
            "|",
            style: TextStyle(fontSize: 33, color: Colors.grey),
          ),
          const SizedBox(
            width: 10,
          ),
          Expanded(
              child: TextField(
            keyboardType: TextInputType.phone,
            decoration: InputDecoration(
              border: Button.styleBorderPhone(),
              enabledBorder: Button.styleBorderPhone(),
              focusedBorder: Button.styleBorderPhone(),
              disabledBorder: Button.styleBorderPhone(),
              contentPadding: const EdgeInsets.symmetric(
                horizontal: 16,
                vertical: 16,
              ),
              fillColor: Colors.white,
              filled: true,
            ),
            // decoration: InputDecoration(

            //   border: InputBorder.none,
            //   hintText: "81366204109",
            //   hintStyle: greyTextStyle.copyWith(fontSize: 18.sp)
            // ),
          ))
        ],
      ),
    );
  }
}
