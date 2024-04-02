import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hms_app/presentation/component/form/form_textfield_widget.dart';
import 'package:sizer/sizer.dart';
import 'package:hms_app/presentation/component/fonts/font_helper.dart';

class RadioButtonWithTextField extends StatefulWidget {
  final String title;
  final double? width;
  final String? selectedItem;
  final double? height;
  final List<String> children;
  final bool isHeader;
  final bool isEnableTextField;
  final Function(String? value)? onTap;
  final TextEditingController? textEditingController;

  const RadioButtonWithTextField({
    super.key,
    required this.title,
    this.selectedItem,
    this.onTap,
    this.width,
    this.height,
    this.isEnableTextField = true,
    this.isHeader = false,
    this.textEditingController,
    required this.children,
  });

  @override
  State<RadioButtonWithTextField> createState() =>
      _RadioButtonSkringWidgetState();
}

class _RadioButtonSkringWidgetState extends State<RadioButtonWithTextField> {
  String selectedItem = "";

  @override
  void initState() {
    selectedItem = widget.selectedItem ?? widget.children.last;
    super.initState();

    if (selectedItem == widget.children.last) {
      widget.textEditingController!.clear();
    }
  }

  @override
  void dispose() {
    super.dispose();
  }

  setSelectedRadio(String value) {
    setState(() {
      selectedItem = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Get.width,
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(6.sp)),
      child: Column(
        children: [
          (widget.isHeader == true)
              ? Container(
                  padding: EdgeInsets.all(3.sp),
                  width: Get.width,
                  decoration: BoxDecoration(
                      color: const Color(0xFF293074),
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(6.sp),
                          topRight: Radius.circular(6.sp))),
                  child: Center(
                    child: Text(
                      widget.title,
                      textAlign: TextAlign.center,
                      style: whiteCalibriTextStyle.copyWith(fontSize: 9.sp),
                    ),
                  ),
                )
              : Container(
                  padding: EdgeInsets.only(left: 6.sp),
                  width: Get.width,
                  child: Text(
                    widget.title,
                    textAlign: TextAlign.left,
                    style: blackCalibriTextStyle.copyWith(fontSize: 9.sp),
                  ),
                ),
          Row(
            children: widget.children
                .map((e) => SizedBox(
                      width: 100.sp,
                      child: RadioListTile(
                        selected: (e == widget.children.first) ? true : false,
                        activeColor: const Color(0xFF293074),
                        selectedTileColor: Colors.cyan,
                        title: Text(
                          e,
                          style: blackCalibriTextStyle,
                          maxLines: 3,
                          textAlign: TextAlign.start,
                          softWrap: true,
                          overflow: TextOverflow.ellipsis,
                        ),
                        value: e,
                        groupValue: selectedItem,
                        onChanged: (value) {
                          setSelectedRadio(value.toString());
                          if (widget.onTap != null) {
                            widget.onTap!(value);
                          }

                          if (value.toString() == widget.children.last) {
                            widget.textEditingController!.clear();
                          }
                        },
                      ),
                    ))
                .toList(),
          ),
          (selectedItem == "Ya" && widget.isEnableTextField == true)
              ? Padding(
                  padding:
                      EdgeInsets.only(left: 12.sp, right: 12.sp, bottom: 6.sp),
                  child: FormWidget.textForm(
                    controller: widget.textEditingController,
                    onChanged: (value) {
                      log(value.toString());
                    },
                    enable: true,
                  ),
                )
              : Container(),
        ],
      ),
    );
  }
}
