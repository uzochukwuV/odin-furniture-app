import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:odin/components/custom_text.dart';
import 'package:odin/constants/app_theme.dart';

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
