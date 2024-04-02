import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class CustomDialogWidget {
  // GET SINGLE PASIEN

  static Future<bool?> getDialog({required Widget widget, Color? color}) {
    return Get.dialog(
      StatefulBuilder(builder:
          (BuildContext context, void Function(void Function()) setState) {
        // TODO : GET CONTEXT RESIKO JATUH // TODO: RESIKO JATUH

        return Dialog(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.0)),
          elevation: 1,
          backgroundColor: Colors.transparent,
          child: SizedBox(
            child: Stack(
              children: <Widget>[
                Container(
                  padding: EdgeInsets.only(top: 4.sp),
                  decoration: BoxDecoration(
                      color: color ?? Colors.white,
                      shape: BoxShape.rectangle,
                      borderRadius: BorderRadius.circular(16.0),
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.black26,
                          blurRadius: 0.0,
                          offset: Offset(0.0, 0.0),
                        ),
                      ]),
                  child: widget,
                ),
                Positioned(
                  right: 0.0,
                  child: GestureDetector(
                    onTap: () {
                      Navigator.of(context).pop();
                    },
                    child: Align(
                      alignment: Alignment.topRight,
                      child: CircleAvatar(
                        radius: 10.sp,
                        backgroundColor: Colors.red,
                        child: const Icon(Icons.close, color: Colors.white),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      }),
      barrierDismissible: false,
    );
  }

  static Future<bool?> dialog(BuildContext context,
      {required String value,
      required String alasanPembatalan,
      Function(String)? onChanged,
      Function()? onPressed,
      required Widget widget}) async {
    return showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) => StatefulBuilder(
            builder: ((context, setState) => Dialog(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16.0)),
                  elevation: 1,
                  backgroundColor: Colors.transparent,
                  child: SizedBox(
                    child: SingleChildScrollView(
                      child: Stack(
                        children: <Widget>[
                          Container(
                            padding: EdgeInsets.only(top: 4.sp),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                shape: BoxShape.rectangle,
                                borderRadius: BorderRadius.circular(16.0),
                                boxShadow: const [
                                  BoxShadow(
                                    color: Colors.black26,
                                    blurRadius: 0.0,
                                    offset: Offset(0.0, 0.0),
                                  ),
                                ]),
                            child: widget,
                          ),
                          Positioned(
                            right: 0.0,
                            child: GestureDetector(
                              onTap: () {
                                Navigator.of(context).pop();
                              },
                              child: const Align(
                                alignment: Alignment.topRight,
                                child: CircleAvatar(
                                  radius: 14.0,
                                  backgroundColor: Colors.red,
                                  child: Icon(
                                    Icons.close,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ))));
  }
}
