import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:odin/components/custom_text.dart';
import 'package:odin/components/shop_item.dart';
import 'package:odin/constants/app_theme.dart';
import 'package:odin/models/product.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

late Future<List<Product>> plist;
List<Product> products = [];

class _HomeScreenState extends State<HomeScreen> {
  Future<List<Product>> getProductList() async {
    await Future.delayed(Duration(seconds: 2));
    var k = productList.map((product) {
      return Product.fromJson(product);
    });

    return [...k];
  }

  @override
  void initState() {
    plist = getProductList();

    // TODO: implement initState
    super.initState();
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
                  products = snapshot.data! as List<Product>;
                  return Container(
                    constraints:
                        BoxConstraints(maxHeight: 1000.h, maxWidth: 360.w),
                    child: GridView.builder(
                      scrollDirection: Axis.vertical,
                      itemCount: snapshot.data!.length,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: 5,
                          childAspectRatio: 0.63,
                          mainAxisSpacing: 32.h),
                      itemBuilder: (context, index) => ShopItem(
                        product: snapshot.data![index],
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
