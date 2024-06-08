import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:odin/components/custom_text.dart';
import 'package:odin/constants/app_theme.dart';
import "package:flutter_secure_storage/flutter_secure_storage.dart";

class MyLoginPage extends StatefulWidget {
  const MyLoginPage({Key? key}) : super(key: key);

  @override
  State<MyLoginPage> createState() => _MyLoginPageState();
}

class _MyLoginPageState extends State<MyLoginPage> {
  late TextEditingController _editingController;
  late TextEditingController _passwordController;
  final _storage = const FlutterSecureStorage();

  @override
  void initState() {
    _editingController = TextEditingController();
    _passwordController = TextEditingController();
    _storage.readAll().then((value) => {
          if (!jsonDecode(value["user"]!)["email"]?.isEmpty)
            {Navigator.of(context).pushNamed("/home")}
        });

    // TODO: implement initState
    super.initState();
  }

  Future<void> setUser() async {
    String data = jsonEncode({
      "email": _editingController.text,
      "password": _passwordController.text
    });

    print(data);
    await _storage.write(key: "user", value: data);
  }

  Future<void> getUser() async {
    var user = await _storage.read(key: "user");
    var data = jsonDecode(user!);

    print(data["email"]);
    print(user);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          color: AppTheme.white,
          child: SafeArea(
            child: Padding(
              padding: EdgeInsets.all(20),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
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
                          Flexible(
                              child:
                                  Divider(height: 1.h, color: AppTheme.divider))
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 30.h,
                    ),
                    CustomText(
                      text: "Hello !",
                      color: AppTheme.secondary,
                      fs: 30.sp,
                    ),
                    SizedBox(
                      height: 5.h,
                    ),
                    CustomText(
                      text: "WELCOME BACK",
                      color: AppTheme.primary,
                      fs: 24.sp,
                      fw: FontWeight.bold,
                    ),
                    SizedBox(
                      height: 30.h,
                    ),
                    Transform.translate(
                      offset: Offset(-20.w, 0),
                      child: Container(
                          height: 440.h,
                          width: 345.w,
                          decoration:
                              BoxDecoration(color: AppTheme.white, boxShadow: [
                            BoxShadow(
                                offset: Offset(0, 7),
                                spreadRadius: 0,
                                blurRadius: 30,
                                color: Color(0xff8A959E).withOpacity(0.2))
                          ]),
                          padding: EdgeInsets.only(
                              top: 20.h, left: 40.w, bottom: 20.h),
                          child: Form(
                              child: Column(
                            children: [
                              Container(
                                padding:
                                    EdgeInsets.only(top: 20.h, bottom: 20.h),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    CustomText(
                                      text: "Email",
                                      color: AppTheme.secondary,
                                      fs: 14.sp,
                                    ),
                                    TextFormField(
                                      controller: _editingController,
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
                                padding:
                                    EdgeInsets.only(top: 20.h, bottom: 20.h),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    CustomText(
                                      text: "Password",
                                      color: AppTheme.secondary,
                                      fs: 14.sp,
                                    ),
                                    TextFormField(
                                      controller: _passwordController,
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
                              SizedBox(
                                height: 20.h,
                              ),
                              GestureDetector(
                                onTap: () {
                                  getUser();
                                },
                                child: CustomText(
                                  text: "Forget Password",
                                  fw: FontWeight.w500,
                                ),
                              ),
                              SizedBox(
                                height: 40.h,
                              ),
                              InkWell(
                                onTap: () {
                                  setUser().then((value) =>
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(SnackBar(
                                              content: CustomText(
                                                  text: "User created"))));
                                },
                                child: Container(
                                  height: 50.h,
                                  width: 280.w,
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                      color: Colors.black,
                                      borderRadius:
                                          BorderRadius.circular(12.sp)),
                                  child: CustomText(
                                    text: "Log in",
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
                                onTap: () {
                                  Navigator.of(context).pushNamed("/home");
                                },
                                child: CustomText(
                                  text: "SIGN UP",
                                  fw: FontWeight.w500,
                                ),
                              ),
                            ],
                          ))),
                    )
                  ],
                ),
              ),
            ),
          )),
    );
  }
}
