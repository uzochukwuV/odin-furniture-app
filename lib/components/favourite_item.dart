import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:odin/components/custom_text.dart';
import 'package:odin/constants/app_theme.dart';

class FavouriteItem extends StatelessWidget {
  const FavouriteItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Container(
        height: 120.h,
        width: 375.w,
        padding: EdgeInsets.only(bottom: 10.h),
        child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.asset(
                  "assets/images/minimal-stand.png",
                  height: 110.h,
                  width: 110.w,
                  fit: BoxFit.cover,
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomText(
                    text: "Minimal Stand",
                    color: AppTheme.secondary,
                    fs: 14.sp,
                  ),
                  CustomText(
                    text: "\$ 25.00",
                    fw: FontWeight.bold,
                    fs: 14.sp,
                  )
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Icon(
                    Icons.cancel_outlined,
                    size: 24.sp,
                  ),
                  Container(
                      height: 24.h,
                      width: 24.h,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          color: AppTheme.black,
                          borderRadius: BorderRadius.circular(8)),
                      child: Image.asset("assets/images/shopping_bag.png"))
                ],
              )
            ]),
      ),
      Divider(
        height: 1,
      ),
      SizedBox(
        height: 10.h,
      )
    ]);
  }
}
