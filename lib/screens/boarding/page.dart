import 'package:flutter/material.dart';
import "package:flutter_screenutil/flutter_screenutil.dart";
import 'package:odin/components/custom_text.dart';
import 'package:odin/constants/app_theme.dart';

class Boarding extends StatefulWidget {
  const Boarding({Key? key}) : super(key: key);

  @override
  State<Boarding> createState() => _BoardingState();
}

class _BoardingState extends State<Boarding> with TickerProviderStateMixin {
  final IntTween intTween = IntTween(begin: 0, end: 1);

  @override
  Widget build(BuildContext context) {
    return Container(
        width: 375.w,
        height: MediaQuery.of(context).size.height,
        child: Stack(children: [
          Image.asset(
            "assets/images/boarding.png",
            width: 375.w,
            height: 812.h,
            filterQuality: FilterQuality.high,
            fit: BoxFit.cover,
          ),
          Padding(
              padding: EdgeInsets.all(20.w),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomText(
                      text: 'MAKE  YOUR',
                      fs: 24,
                      fw: FontWeight.w500,
                      color: Color(0xff606060),
                    ),
                    CustomText(
                      text: 'HOME BEAUTIFUL',
                      fs: 30,
                      fw: FontWeight.bold,
                      color: AppTheme.primary,
                    ),
                    TweenAnimationBuilder(
                      tween: intTween,
                      duration: Duration(seconds: 1),
                      builder: (context, value, child) {
                        return Opacity(
                          opacity: value * 1,
                          child: Padding(
                            padding: const EdgeInsets.only(left: 20, top: 20),
                            child: CustomText(
                              text:
                                  "The best simple place where you discover most wonderful furnitures and make your home beautiful",
                              fs: 18,
                              color: AppTheme.secondary,
                            ),
                          ),
                        );
                      },
                    ),
                    SizedBox(
                      height: 150.h,
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context).pushNamed("/login");
                      },
                      child: Container(
                        height: 54.h,
                        width: 160.w,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(color: AppTheme.primary),
                        child: CustomText(
                          text: "Get Started",
                          color: AppTheme.white,
                          fw: FontWeight.w500,
                        ),
                      ),
                    )
                  ]))
        ]));
  }
}
