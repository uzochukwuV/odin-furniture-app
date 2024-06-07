import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:odin/components/custom_text.dart';
import 'package:odin/components/shop_item.dart';
import 'package:odin/constants/app_theme.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<String> images = [
      "star.png",
      "chair.png",
      "arm-chair.png",
      "table.png",
      "bed.png",
      "simple-desk.png",
    ];
    return Container(
      width: 375.w,
      padding: EdgeInsets.all(18.sp),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 375.w,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Icon(
                    Icons.search_rounded,
                    size: 24.sp,
                  ),
                  Column(
                    children: [
                      CustomText(
                        text: "Make home",
                        color: AppTheme.secondary,
                      ),
                      CustomText(
                        text: "BEAUTIFUL",
                        fw: FontWeight.bold,
                      ),
                    ],
                  ),
                  Icon(Icons.shopping_cart_outlined, size: 24.sp)
                ],
              ),
            ),
            Container(
              width: 375.w,
              margin: EdgeInsets.only(top: 20.w),
              height: 80.h,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                padding: EdgeInsets.symmetric(horizontal: 1.w),
                itemCount: images.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: EdgeInsets.only(left: 10.w),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          alignment: Alignment.center,
                          width: 60.w,
                          height: 44.h,
                          decoration: BoxDecoration(
                              color: index == 0
                                  ? AppTheme.primary
                                  : AppTheme.diabledfield,
                              borderRadius: BorderRadius.circular(12)),
                          child: Image.asset(
                            "assets/images/${images[index]}",
                          ),
                        ),
                        CustomText(
                          text: "${images[index].split(".")[0]}",
                          fs: 14.sp,
                          color: AppTheme.diabled,
                        )
                      ],
                    ),
                  );
                },
              ),
            ),
            Container(
              constraints: BoxConstraints(maxHeight: 1000.h, maxWidth: 360.w),
              child: GridView(
                scrollDirection: Axis.vertical,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 0.63,
                    mainAxisSpacing: 32.h),
                children: [ShopItem()],
              ),
            )
          ],
        ),
      ),
    );
  }
}
