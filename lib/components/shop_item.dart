import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:odin/components/custom_text.dart';
import 'package:odin/constants/app_theme.dart';
import 'package:odin/models/product.dart';
import 'package:odin/screens/product/page.dart';

class ShopItem extends StatelessWidget {
  final Product product;
  const ShopItem({Key? key, required this.product}) : super(key: key);

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
                builder: (context) => ProductDetailPage(
                  product: product,
                ),
              ));
            },
            child: Container(
              height: 200.h,
              child: Stack(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Hero(
                      tag: "${product.id}",
                      child: Image.asset(
                        "assets/images/${product.img}",
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
                          width: 24.w,
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
                text: "${product.name}",
                color: AppTheme.secondary,
                fs: 14.sp,
              ),
              CustomText(
                text: "\$ ${product.price}",
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

class ShopItemShimer extends StatelessWidget {
  const ShopItemShimer({Key? key}) : super(key: key);

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
            child: Container(
              height: 200.h,
              child: Stack(
                children: [
                  ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Container(
                        height: 200.h,
                        width: 300.w,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            color: AppTheme.placeholder,
                            borderRadius: BorderRadius.circular(5)),
                      )),
                  Positioned(
                      bottom: 5.h,
                      right: 5.w,
                      child: Container(
                        height: 24.h,
                        width: 24.w,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            color: AppTheme.placeholder,
                            borderRadius: BorderRadius.circular(5)),
                      ))
                ],
              ),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 20.h,
                width: 104.w,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    color: AppTheme.placeholder,
                    borderRadius: BorderRadius.circular(5)),
              ),
              SizedBox(
                height: 5,
              ),
              Container(
                height: 18.h,
                width: 54.w,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    color: AppTheme.placeholder,
                    borderRadius: BorderRadius.circular(5)),
              )
            ],
          )
        ],
      ),
    );
  }
}
