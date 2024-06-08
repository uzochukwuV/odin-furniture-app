import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:odin/components/custom_text.dart';
import 'package:odin/components/text_input.dart';
import 'package:odin/constants/app_theme.dart';
import 'package:odin/models/cart.dart';

class CartItem extends StatelessWidget {
  final Cart cart;
  const CartItem({Key? key, required this.cart}) : super(key: key);

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
                  "assets/images/${cart.product.img}",
                  height: 110.h,
                  width: 110.w,
                  fit: BoxFit.cover,
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomText(
                    text: "${cart.product.name}",
                    color: AppTheme.secondary,
                    fs: 14.sp,
                  ),
                  CustomText(
                    text: "\$ ${cart.product.price}",
                    fw: FontWeight.bold,
                    fs: 14.sp,
                  ),
                  Spacer(),
                  TextInputView(
                    amount: cart.amount,
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
