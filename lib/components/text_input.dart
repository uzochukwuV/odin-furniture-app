import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:odin/components/custom_text.dart';
import 'package:odin/constants/app_theme.dart';

class TextInputView extends StatelessWidget {
  final int amount;

  const TextInputView({super.key, required this.amount});
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
              text: amount > 10 ? amount.toString() : "0${amount.toString()}",
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
