import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:odin/components/cartItem.dart';
import 'package:odin/components/custom_text.dart';
import 'package:odin/providers/cart_provider.dart';
import 'package:provider/provider.dart';

class CartPage extends StatelessWidget {
  const CartPage({Key? key}) : super(key: key);

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
                    Icons.chevron_left_outlined,
                    size: 24.sp,
                  ),
                  CustomText(
                    text: "Carts",
                    fw: FontWeight.bold,
                  ),
                  Icon(
                    Icons.shopping_cart_outlined,
                    size: 24.sp,
                    color: Colors.transparent,
                  )
                ],
              ),
            ),
            Consumer<CartProvider>(builder: (context, carts, child) {
              return Container(
                padding: EdgeInsets.symmetric(vertical: 20.h),
                constraints: BoxConstraints(maxHeight: 1000.h),
                child: ListView.builder(
                  itemCount: carts.cart.products.length,
                  itemBuilder: (context, index) {
                    return CartItem();
                  },
                ),
              );
            })
          ],
        )));
  }
}
