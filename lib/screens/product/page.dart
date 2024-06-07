import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:odin/components/custom_text.dart';
import 'package:odin/components/text_input.dart';
import 'package:odin/constants/app_theme.dart';
import 'package:odin/models/cart.dart';
import 'package:odin/models/product.dart';
import 'package:odin/providers/cart_provider.dart';
import 'package:provider/provider.dart';

class ProductDetailPage extends StatelessWidget {
  final Product product;
  const ProductDetailPage({Key? key, required this.product}) : super(key: key);

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
                        borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(48.sp)),
                        child: Hero(
                          tag: "${product.id}",
                          child: Image.asset(
                            "assets/images/${product.img}",
                            width: 320.w,
                            height: 450.h,
                            fit: BoxFit.cover,
                          ),
                        ),
                      )),
                  Positioned(
                      top: 40.h,
                      left: 32.w,
                      child: InkWell(
                        onTap: () {
                          Navigator.of(context).pop();
                        },
                        child: Container(
                          height: 40.h,
                          width: 40.h,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                              boxShadow: [AppTheme.boxShadow],
                              color: AppTheme.white,
                              borderRadius: BorderRadius.circular(6.sp)),
                          child: Icon(Icons.chevron_left_outlined),
                        ),
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
                            borderRadius: BorderRadius.circular(12.sp)),
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
                    text: "${product.name}",
                    fw: FontWeight.w400,
                    fs: 24.sp,
                    color: AppTheme.black,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      CustomText(
                        text: "\$ ${product.price}",
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
                        text: "${product.ratings}",
                        fw: FontWeight.w500,
                        fs: 18.sp,
                        color: AppTheme.secondary,
                      ),
                      SizedBox(
                        width: 120.w,
                      ),
                      CustomText(
                        text: "(${product.review} reviews)",
                        fw: FontWeight.w500,
                        fs: 14.sp,
                        color: AppTheme.secondary,
                      ),
                    ],
                  ),
                  CustomText(
                    text: product.description,
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
                        Consumer<CartProvider>(
                            builder: (context, carts, child) {
                          return GestureDetector(
                            onTap: () {
                              carts.addToCart(product);
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(SnackBar(
                                      duration: Duration(milliseconds: 500),
                                      elevation: 0,
                                      backgroundColor: Colors.transparent,
                                      content: Container(
                                        height: 60.h,
                                        width: 200.w,
                                        margin: EdgeInsets.only(bottom: 40.h),
                                        alignment: Alignment.center,
                                        decoration: BoxDecoration(
                                            color: AppTheme.white,
                                            boxShadow: [AppTheme.boxShadow],
                                            borderRadius:
                                                BorderRadius.circular(20)),
                                        child: CustomText(
                                          text: "Added to cart",
                                          fs: 16.sp,
                                          fw: FontWeight.bold,
                                        ),
                                      )));
                            },
                            child: Container(
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
                          );
                        }),
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
