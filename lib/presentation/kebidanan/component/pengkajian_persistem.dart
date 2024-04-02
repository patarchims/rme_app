import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hms_app/presentation/component/component.dart';
import 'package:searchfield/searchfield.dart';
import 'package:sizer/sizer.dart';

class ComponenPengkajian {
  static Container selectionPengkajian({
    required String title,
    required Widget widget,
  }) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 5.sp,
      ),
      child: Table(
        border: TableBorder.all(color: ThemeColor.bgColor),
        columnWidths: const {
          1: FlexColumnWidth(3),
          2: FlexColumnWidth(1.2),
        },
        children: [
          TableRow(children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                title,
                textAlign: TextAlign.left,
                style: blackTextStyle.copyWith(fontSize: 6.sp),
              ),
            ),
            widget,
          ]),
        ],
      ),
    );
  }

  static Container penkajian({
    required List<String> pilihan,
    required TextEditingController controller,
    List<SearchFieldListItem<String>>? Function(String)? onSearchTextChanged,
    required String value,
    required String title,
  }) {
    return Container(
      width: Get.width,
      padding: EdgeInsets.all(5.sp),
      decoration: BoxDecoration(color: ThemeColor.bgColor),
      child: Table(
        border: TableBorder.all(color: ThemeColor.bgColor),
        columnWidths: const {
          1: FlexColumnWidth(3),
        },
        children: [
          TableRow(children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                title,
                textAlign: TextAlign.left,
                style: blackTextStyle.copyWith(fontSize: 6.sp),
              ),
            ),
            SizedBox(
              child: SearchField(
                searchStyle: blackTextStyle,
                enabled: true,
                marginColor: ThemeColor.whiteColor,
                itemHeight: 15.sp,
                suggestionStyle: blackTextStyle,
                suggestions: pilihan
                    .map(
                      (e) => SearchFieldListItem(
                        e,
                        item: e.toUpperCase(),
                        child: Container(
                          height: 50.sp,
                          width: Get.width,
                          color: ThemeColor.whiteColor,
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            e,
                            style: blackTextStyle.copyWith(fontSize: 6.sp),
                          ),
                        ),
                      ),
                    )
                    .toList(),
                validator: (x) {
                  return null;
                },
                // CONTROLLER
                controller: controller..text = value,
                onSearchTextChanged: onSearchTextChanged,
                onSubmit: (value) {
                  log("ON SUBMIT");
                  log(value.toString());
                },
                suggestionState: Suggestion.expand,
                readOnly: false,
                autofocus: false,
                maxSuggestionsInViewPort: 5,
                suggestionItemDecoration:
                    BoxDecoration(color: ThemeColor.bgColor),
                onTap: () {
                  log("ON TAP");
                },
                onSaved: (a) {
                  log("ON save");
                  log(value.toString());
                },
                searchInputDecoration: InputDecoration(
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.black.withOpacity(0.8),
                    ),
                  ),
                  border: const OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.red),
                  ),
                ),
              ),
            ),
          ]),
        ],
      ),
    );
  }
}
