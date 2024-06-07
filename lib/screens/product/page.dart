import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:odin/components/custom_text.dart';
import 'package:odin/constants/app_theme.dart';

class ProductDetailPage extends StatelessWidget {
  const ProductDetailPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: 375.w,
        height: 812.h,
        child: Column(
          children: [
            Container(
              height: 450.h,
              child: Stack(
                children: [
                  Positioned(
                      right: 0,
                      child: ClipRRect(
                        child: Hero(
                          tag: "nancy",
                          child: Image.asset(
                            "assets/images/minimal-stand.png",
                            width: 320.w,
                            height: 450.h,
                            fit: BoxFit.cover,
                          ),
                        ),
                      )),
                  Positioned(
                      top: 40.h,
                      left: 32.w,
                      child: Container(
                        height: 40.h,
                        width: 40.h,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            boxShadow: [AppTheme.boxShadow],
                            color: AppTheme.white,
                            borderRadius: BorderRadius.circular(5)),
                        child: Icon(Icons.chevron_left_outlined),
                      )),
                  Positioned(
                      top: 150.h,
                      left: 24.w,
                      child: Container(
                        height: 200.h,
                        width: 64.h,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            boxShadow: [AppTheme.boxShadow],
                            color: AppTheme.white,
                            borderRadius: BorderRadius.circular(5)),
                        child: Icon(Icons.chevron_left_outlined),
                      ))
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 20.w,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomText(
                    text: "Minimal Stand",
                    fw: FontWeight.w400,
                    fs: 24.sp,
                    color: AppTheme.black,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      CustomText(
                        text: "\$ 50",
                        fs: 30.sp,
                        fw: FontWeight.w500,
                        color: AppTheme.black,
                      ),
                      TextInputView()
                    ],
                  ),
                  SizedBox(
                    height: 5.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.star,
                        color: Colors.yellow,
                        size: 30.sp,
                      ),
                      SizedBox(
                        width: 6.w,
                      ),
                      CustomText(
                        text: "4.5",
                        fw: FontWeight.w500,
                        fs: 18.sp,
                        color: AppTheme.secondary,
                      ),
                      SizedBox(
                        width: 120.w,
                      ),
                      CustomText(
                        text: "(50 reviews)",
                        fw: FontWeight.w500,
                        fs: 14.sp,
                        color: AppTheme.secondary,
                      ),
                    ],
                  ),
                  CustomText(
                    text:
                        " Minimal Stand is made of by natural wood. The design that is very simple and minimal. This is truly one of the best furnitures in any family for now. With 3 different colors, you can easily select the best match for your home.",
                    fw: FontWeight.w300,
                    fs: 14.sp,
                    color: AppTheme.secondary,
                  ),
                  Container(
                    height: 90.h,
                    child: Row(
                      children: [
                        Container(
                          width: 60.w,
                          height: 60.h,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                              boxShadow: [AppTheme.boxShadow],
                              color: AppTheme.placeholder.withOpacity(0.2),
                              borderRadius: BorderRadius.circular(5)),
                          child: Icon(
                            Icons.bookmark_outline_sharp,
                            color: AppTheme.secondary,
                            size: 32.sp,
                          ),
                        ),
                        Spacer(),
                        Container(
                            width: 250.w,
                            height: 60.h,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                                boxShadow: [AppTheme.boxShadow],
                                color: AppTheme.black,
                                borderRadius: BorderRadius.circular(5)),
                            child: CustomText(
                              text: "Add to cart",
                              color: AppTheme.white,
                              fw: FontWeight.w500,
                              fs: 20.sp,
                            )),
                      ],
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class TextInputView extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Container(
        width: 110.h,
        height: 30.h,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: 30.w,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  boxShadow: [AppTheme.boxShadow],
                  color: AppTheme.placeholder.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(5)),
              child: Icon(Icons.add_outlined),
            ),
            CustomText(
              text: "02",
              fs: 18.sp,
              color: AppTheme.secondary,
            ),
            Container(
              width: 30.w,
              height: 30.h,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  boxShadow: [AppTheme.boxShadow],
                  color: AppTheme.placeholder.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(5)),
              child: Icon(Icons.remove),
            )
          ],
        ),
      );
}
