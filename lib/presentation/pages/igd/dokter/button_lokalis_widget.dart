import 'package:flutter/material.dart';
import 'package:hms_app/presentation/component/component.dart';
import 'package:sizer/sizer.dart';

class ButtonLokalisWidget extends StatefulWidget {
  const ButtonLokalisWidget({super.key});

  @override
  State<ButtonLokalisWidget> createState() => _ButtonLokalisWidgetState();
}

class _ButtonLokalisWidgetState extends State<ButtonLokalisWidget> {
  late String selectedValue;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(1.sp),
      height: 50.sp,
      width: 50.sp,
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            elevation: 1.sp,
            backgroundColor: ThemeColor.primaryColor,
            shape: const CircleBorder(
              side: BorderSide(
                color: Colors.white,
                style: BorderStyle.solid,
                width: 2,
              ),
            ),
          ),
          onPressed: () {},
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                height: 10.sp,
                width: 10.sp,
              ),
              Container(
                width: 40.sp,
                child: Text(
                  "e",
                  style: whiteTextStyle,
                  textAlign: TextAlign.center,
                ),
              )
            ],
          )),
    );
  }
}
