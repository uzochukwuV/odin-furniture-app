import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomText extends StatelessWidget {
  const CustomText(
      {Key? key,
      required this.text,
      this.color = Colors.black,
      this.fs = 18,
      this.fw = FontWeight.w400,
      this.ls = 0})
      : super(key: key);
  final String text;
  final Color color;
  final double fs;
  final FontWeight fw;
  final double ls;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
          color: color,
          fontSize: fs.sp,
          fontFamily: "ManRope",
          fontWeight: fw,
          letterSpacing: ls,
          decoration: TextDecoration.none),
    );
  }
}
