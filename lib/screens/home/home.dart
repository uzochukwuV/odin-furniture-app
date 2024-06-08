import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:odin/components/custom_text.dart';
import 'package:odin/components/shop_item.dart';
import 'package:odin/constants/app_theme.dart';
import 'package:odin/models/product.dart';
import 'package:odin/providers/cart_provider.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key? key, required this.tocart}) : super(key: key);
  final void Function() tocart;

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

List<Product> products = [];

class _HomeScreenState extends State<HomeScreen> {
  late Future<List<Product>> plist;

  String where = '';
  Future<List<Product>> getProductList() async {
    await Future.delayed(Duration(seconds: 2));
    var k = productList.map((product) {
      return Product.fromJson(product);
    });

    if (!where.isEmpty) {
      return [...k].where((element) => element.name.contains(where)).toList();
    }
    return [...k];
  }

  @override
  void initState() {
    plist = getProductList();

    // TODO: implement initState
    super.initState();
  }

  @override
  void dispose() {
    where = '';
    // TODO: implement dispose
    super.dispose();
  }

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
                  InkWell(
                    onTap: () {
                      widget.tocart();
                    },
                    child: Stack(
                      children: [
                        Icon(Icons.shopping_cart_outlined, size: 24.sp),
                        Consumer<CartProvider>(
                            builder: (context, carts, child) {
                          return CircleAvatar(
                            radius: 7,
                            backgroundColor: Colors.blueAccent,
                            child: CustomText(
                              text: carts.cart.length.toString(),
                              fs: 6,
                              color: Colors.white,
                            ),
                          );
                        })
                      ],
                    ),
                  )
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
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              where = images[index].split(".")[0];
                            });
                          },
                          child: Container(
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
                        ),
                        CustomText(
                          text:
                              "${images[index].split(".")[0].replaceAll(r'-', ' ')}",
                          fs: 14.sp,
                          color: AppTheme.diabled,
                        )
                      ],
                    ),
                  );
                },
              ),
            ),
            FutureBuilder(
                initialData: products,
                future: plist,
                builder: (context, snapshot) {
                  if (products.isEmpty &&
                          snapshot.connectionState == ConnectionState.waiting ||
                      !snapshot.hasData) {
                    return Container(
                      constraints:
                          BoxConstraints(maxHeight: 1000.h, maxWidth: 360.w),
                      child: GridView(
                        scrollDirection: Axis.vertical,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            childAspectRatio: 0.63,
                            crossAxisSpacing: 5,
                            mainAxisSpacing: 32.h),
                        children: [
                          ShopItemShimer(),
                          ShopItemShimer(),
                          ShopItemShimer(),
                          ShopItemShimer(),
                          ShopItemShimer()
                        ],
                      ),
                    );
                  }
                  products = snapshot.data!;
                  var data = where.isEmpty
                      ? snapshot.data!
                      : snapshot.data!
                          .where(
                            (element) => element.name.contains(where),
                          )
                          .toList();
                  print(data);
                  return Container(
                    constraints:
                        BoxConstraints(maxHeight: 1000.h, maxWidth: 360.w),
                    child: GridView.builder(
                      scrollDirection: Axis.vertical,
                      itemCount: data.length,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: 5,
                          childAspectRatio: 0.63,
                          mainAxisSpacing: 32.h),
                      itemBuilder: (context, index) => ShopItem(
                        product: data[index],
                      ),
                    ),
                  );
                })
          ],
        ),
      ),
    );
  }
}
