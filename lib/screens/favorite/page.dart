import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:odin/components/custom_text.dart';
import 'package:odin/components/favourite_item.dart';
import 'package:odin/constants/app_theme.dart';

class FavoritePage extends StatelessWidget {
  const FavoritePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        width: 375.w,
        padding: EdgeInsets.all(18.sp),
        child: SingleChildScrollView(
            child: Column(
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
                  CustomText(
                    text: "Favorites",
                    fw: FontWeight.bold,
                  ),
                  Icon(Icons.shopping_cart_outlined, size: 24.sp)
                ],
              ),
            ),
            ListView.builder(
              itemCount: 1,
              itemBuilder: (context, index) {
                return FavouriteItem();
              },
            )
          ],
        )));
  }
}
