import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:odin/components/custom_text.dart';
import 'package:odin/constants/app_theme.dart';
import 'package:odin/screens/product/page.dart';

class ShopItem extends StatelessWidget {
  const ShopItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 250.h,
      width: 150.w,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          InkWell(
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => ProductDetailPage(),
              ));
            },
            child: Container(
              height: 200.h,
              child: Stack(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Hero(
                      tag: "nancy",
                      child: Image.asset(
                        "assets/images/jonny-caspari.png",
                        fit: BoxFit.cover,
                        height: 200.h,
                      ),
                    ),
                  ),
                  Positioned(
                      bottom: 5.h,
                      right: 5.w,
                      child: Container(
                          height: 24.h,
                          width: 24.h,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                              color: AppTheme.placeholder,
                              borderRadius: BorderRadius.circular(5)),
                          child: Image.asset("assets/images/shopping_bag.png")))
                ],
              ),
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
          )
        ],
      ),
    );
  }
}
