import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:odin/components/custom_text.dart';
import 'package:odin/constants/app_theme.dart';

class MySignUpPage extends StatelessWidget {
  const MySignUpPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      color: AppTheme.white,
      child: SafeArea(
          child: Padding(
        padding: EdgeInsets.all(20),
        child: SingleChildScrollView(
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            SizedBox(
              height: 30.h,
            ),
            SizedBox(
              width: 350.w,
              height: 70.h,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Flexible(
                    flex: 1,
                    child: Divider(
                      height: 2.h,
                      thickness: 3,
                      color: AppTheme.divider,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.w),
                    child: Image.asset(
                      "assets/images/homely.png",
                      height: 50.h,
                      width: 50.h,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Flexible(child: Divider(height: 1.h, color: AppTheme.divider))
                ],
              ),
            ),
            SizedBox(
              height: 30.h,
            ),
            CustomText(
              text: "WELCOME ",
              color: AppTheme.primary,
              fs: 24.sp,
              fw: FontWeight.bold,
            ),
            Transform.translate(
              offset: Offset(-20.w, 0),
              child: Container(
                  height: 540.h,
                  width: 345.w,
                  decoration: BoxDecoration(color: AppTheme.white, boxShadow: [
                    BoxShadow(
                        offset: Offset(0, 7),
                        spreadRadius: 0,
                        blurRadius: 30,
                        color: Color(0xff8A959E).withOpacity(0.2))
                  ]),
                  padding: EdgeInsets.only(
                    top: 20.h,
                    left: 40.w,
                  ),
                  child: Form(
                      child: Column(
                    children: [
                      Container(
                        padding: EdgeInsets.only(
                          top: 20.h,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CustomText(
                              text: "Name",
                              color: AppTheme.secondary,
                              fs: 14.sp,
                            ),
                            TextFormField(
                              keyboardType: TextInputType.emailAddress,
                              decoration: InputDecoration(
                                  border: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                          color: AppTheme.secondary))),
                              validator: (value) {
                                if (value == null ||
                                    value.isEmpty ||
                                    value.length < 3) {
                                  return "Value Must be greater than 4";
                                }
                                return "";
                              },
                            )
                          ],
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.only(
                          top: 20.h,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CustomText(
                              text: "Email",
                              color: AppTheme.secondary,
                              fs: 14.sp,
                            ),
                            TextFormField(
                              keyboardType: TextInputType.emailAddress,
                              decoration: InputDecoration(
                                  border: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                          color: AppTheme.secondary))),
                              validator: (value) {
                                if (value == null ||
                                    value.isEmpty ||
                                    value.length < 3) {
                                  return "Value Must be greater than 4";
                                }
                                return "";
                              },
                            )
                          ],
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.only(
                          top: 20.h,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CustomText(
                              text: "Password",
                              color: AppTheme.secondary,
                              fs: 14.sp,
                            ),
                            TextFormField(
                              obscureText: true,
                              keyboardType: TextInputType.emailAddress,
                              decoration: InputDecoration(
                                  border: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                          color: AppTheme.secondary))),
                              validator: (value) {
                                if (value == null ||
                                    value.isEmpty ||
                                    value.length < 3) {
                                  return "Value Must be greater than 4";
                                }
                                return "";
                              },
                            )
                          ],
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.only(
                          top: 20.h,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CustomText(
                              text: "Confirm Password",
                              color: AppTheme.secondary,
                              fs: 14.sp,
                            ),
                            TextFormField(
                              keyboardType: TextInputType.emailAddress,
                              decoration: InputDecoration(
                                  border: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                          color: AppTheme.secondary))),
                              validator: (value) {
                                if (value == null ||
                                    value.isEmpty ||
                                    value.length < 3) {
                                  return "Value Must be greater than 4";
                                }
                                return "";
                              },
                            )
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 40.h,
                      ),
                      InkWell(
                        child: Container(
                          height: 50.h,
                          width: 280.w,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                              color: Colors.black,
                              borderRadius: BorderRadius.circular(12.sp)),
                          child: CustomText(
                            text: "Sign Up",
                            color: AppTheme.white,
                            fs: 18.sp,
                            fw: FontWeight.w500,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      GestureDetector(
                        child: CustomText(
                          text: "Already have an account? SIGN IN",
                          fw: FontWeight.w500,
                        ),
                      ),
                    ],
                  ))),
            )
          ]),
        ),
      )),
    ));
  }
}
