import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hms_app/presentation/component/color/color_helper.dart';
import 'package:sizer/sizer.dart';

TextStyle blackTextStyle = GoogleFonts.poppins(
    fontWeight: FontWeight.w400, color: Colors.black, fontSize: 6.sp);

TextStyle blackCalibriTextStyle = TextStyle(
    fontWeight: FontWeight.w400,
    color: Colors.black,
    fontSize: 8.sp,
    fontFamily: 'Calibri');

TextStyle whiteCalibriTextStyle = TextStyle(
    fontWeight: FontWeight.w400,
    color: Colors.white,
    fontSize: 8.sp,
    fontFamily: 'Calibri');

TextStyle blackRubikTextStyle = GoogleFonts.rubikMonoOne(
    fontWeight: FontWeight.w400, color: Colors.black, fontSize: 7.sp);

TextStyle blackDayOneTextStyle = GoogleFonts.daysOne(
    fontWeight: FontWeight.w400, color: Colors.black, fontSize: 7.sp);

TextStyle whiteTextStyle = GoogleFonts.poppins(
    fontWeight: FontWeight.w400, color: Colors.white, fontSize: 7.sp);

TextStyle greyTextStyle = GoogleFonts.poppins(
    fontWeight: FontWeight.w400,
    color: const Color(0xFF515559),
    fontSize: 7.sp);

TextStyle primaryTextStyle = GoogleFonts.poppins(
    fontWeight: FontWeight.w500,
    color: ThemeColor.primaryColor,
    fontSize: 8.sp);

TextStyle dangerTextStyle = GoogleFonts.poppins(
  fontWeight: FontWeight.w500,
  color: ThemeColor.dangerColor,
  fontSize: 8.sp,
);
TextStyle whiteFredokaTextStyle = GoogleFonts.fredoka(
    fontWeight: FontWeight.w500, color: Colors.white, fontSize: 12.sp);

TextStyle logoTextStyle = GoogleFonts.roboto(
    color: ThemeColor.primaryColor,
    fontSize: 14.sp,
    fontWeight: FontWeight.bold);
