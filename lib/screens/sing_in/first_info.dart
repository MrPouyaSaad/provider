// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:provider/common/const.dart';
import 'package:provider/screens/sing_in/code_screen.dart';
import 'package:provider/screens/sing_in/sign_in.dart';
import 'package:provider/widgets/button.dart';
import 'package:provider/widgets/text_field.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  bool phoneNumberState = true;
  late TextEditingController firstNameController;
  late TextEditingController lastNameController;
  late TextEditingController idController;
  late TextEditingController phoneNumberController;
  late TextEditingController shopIdController;
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    firstNameController = TextEditingController(text: 'پویا');
    lastNameController = TextEditingController(text: 'صادق زاده');
    idController = TextEditingController(text: '1363447378');
    phoneNumberController = TextEditingController(text: '09028430830');
    shopIdController = TextEditingController(text: '0123456789');
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: themeData.colorScheme.primaryFixedDim,
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Text(
                    'به ${Constants.appName} خوش آمدید!',
                    style: TextStyle(
                        color: themeData.colorScheme.surface,
                        fontSize: 24,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                SizedBox(height: 32),
                Container(
                  padding: EdgeInsets.all(Constants.primaryPadding),
                  decoration: BoxDecoration(
                    color: themeData.colorScheme.surface,
                    borderRadius: BorderRadius.circular(18),
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(
                        CupertinoIcons.person_add,
                        color: themeData.colorScheme.primary,
                        size: 68,
                      ),
                      SizedBox(height: 32),

                      Text(
                        'لطفا موقع ثبت نام به نکات پایین صفحه توجه داشته باشید!',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            wordSpacing: -2,
                            fontWeight: FontWeight.bold,
                            fontSize: 12),
                      ),
                      SizedBox(height: 16),
                      Form(
                        key: _formKey,
                        child: Column(
                          children: [
                            MyTextField(
                              labelText: 'نام',
                              controller: firstNameController,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'نام خود را وارد کنید!';
                                } else {
                                  return null;
                                }
                              },
                              prefixIcon: Icon(Icons.person),
                            ),
                            MyTextField(
                              labelText: 'نام خانوادگی',
                              controller: lastNameController,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'نام خانوادگی خود را وارد کنید!';
                                } else {
                                  return null;
                                }
                              },
                              prefixIcon: Icon(Icons.person),
                            ),
                            MyTextField(
                              labelText: 'کد ملی',
                              maxLength: 10,
                              controller: idController,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'کد ملی خود را وارد کنید!';
                                } else if (value.length < 10) {
                                  return 'کد ملی نمیتواند کمتر از 10 رقم باشد!';
                                } else if (!value.isNumericOnly) {
                                  return 'کد ملی صحیح نیست!';
                                } else {
                                  return null;
                                }
                              },
                              keyboardType: TextInputType.number,
                              prefixIcon: Icon(Icons.perm_identity_rounded),
                            ),
                            MyTextField(
                              labelText: 'شماره همراه',
                              maxLength: 11,
                              controller: phoneNumberController,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'شماره همراه خود را وارد کنید!';
                                } else if (value.length < 11) {
                                  return 'شماره همراه نمیتواند کمتر از 11 رقم باشد!';
                                } else if (!value.isNumericOnly ||
                                    (value[0] != '0' || value[1] != '9')) {
                                  return 'شماره همراه صحیح نیست!';
                                } else {
                                  return null;
                                }
                              },
                              keyboardType: TextInputType.number,
                              prefixIcon: Icon(Icons.phone_android),
                            ),
                            MyTextField(
                              labelText: 'شناسه صنفی',
                              maxLength: 10,
                              controller: shopIdController,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'شناسه صنفی خود را وارد کنید!';
                                } else if (value.length < 10) {
                                  return 'شناسه صنفی نمیتواند کمتر از 10 رقم باشد!';
                                } else if (!value.isNumericOnly) {
                                  return 'شناسه صنفی صحیح نیست!';
                                } else {
                                  return null;
                                }
                              },
                              keyboardType: TextInputType.number,
                              prefixIcon: Icon(Icons.description),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: Constants.primaryPadding),
                      SizedBox(
                        width: double.infinity,
                        height: Constants.primaryButtonHeight,
                        child: MyElevatedButton(
                          title: 'ثبت نام',
                          backgroundColor: themeData.colorScheme.primary,
                          forgroundColor: themeData.colorScheme.surface,
                          onTap: () {
                            if (_formKey.currentState!.validate()) {
                              Navigator.of(context).push(
                                CupertinoPageRoute(
                                  builder: (context) =>
                                      CodeScreen(isSingUp: true),
                                ),
                              );
                            }
                          },
                        ),
                      ),
                      SizedBox(height: 8),
                      // SizedBox(
                      //   width: double.infinity,
                      //   child: MyElevatedButton(
                      //     onTap: () {},
                      //     backgroundColor: themeData.colorScheme.primary,
                      //     forgroundColor: themeData.colorScheme.surface,
                      //     title: 'ثبت نام',
                      //   ),
                      // ),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'ثبت نام کرده اید؟',
                            style: TextStyle(
                              fontSize: 11,
                              color: themeData.colorScheme.secondary,
                            ),
                          ),
                          TextButton(
                              onPressed: () {
                                Navigator.of(context)
                                    .pushReplacement(CupertinoPageRoute(
                                  builder: (context) => SignInScreen(),
                                ));
                              },
                              child: Text(
                                'ورود',
                                style: TextStyle(
                                  decoration: TextDecoration.underline,
                                  fontSize: 13,
                                  fontWeight: FontWeight.bold,
                                  color: themeData.colorScheme.primary,
                                ),
                              )),
                        ],
                      ).marginSymmetric(horizontal: Constants.primaryPadding),
                    ],
                  ),
                ),
                SizedBox(height: Constants.primaryPadding),
                Container(
                  padding:
                      const EdgeInsets.only(right: Constants.primaryPadding),
                  margin: const EdgeInsets.only(right: 3),
                  decoration: BoxDecoration(
                    border: Border(
                        right: BorderSide(
                            width: 2.5, color: themeData.colorScheme.surface)),
                  ),
                  child: Text(
                    'کاربر گرامی برای ثبت نام آسان تر و بدون مشکل لطفا به نکات زیر توجه فرمائید :',
                    style: TextStyle(
                        wordSpacing: -2,
                        fontWeight: FontWeight.bold,
                        color: themeData.colorScheme.surface),
                  ),
                ),
                SizedBox(height: Constants.primaryPadding),
                RuleTextWidget(
                    title: 'فروشگاه حتما باید دارای پروانه کسب معتبر باشد.'),
                RuleTextWidget(
                    title:
                        'تمامی مشخصات باید متعلق به صاحب فروشگاه  (دارنده پروانه کسب)  باشد.'),
                RuleTextWidget(
                    title:
                        'نام و نام خانوادگی خود را دقیقاً مطابق کارت ملی وارد کنید.'),
                RuleTextWidget(
                    title:
                        'نام و نام خانوادگی، کد ملی و شماره همراه شما به‌طور سیستمی بررسی می‌شود؛ لذا در وارد کردن آن‌ها دقت فرمایید.'),
                RuleTextWidget(
                    title:
                        'شناسه صنفی، درج‌شده در پروانه کسب، باید با کد ملی دارنده پروانه مطابقت داشته باشد.'),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'به راهنمایی نیاز دارید؟',
                      style: TextStyle(
                        fontSize: 12,
                        wordSpacing: -1,
                        color: themeData.colorScheme.surface,
                      ),
                    ),
                    TextButton(
                        onPressed: () {
                          Navigator.of(context)
                              .pushReplacement(CupertinoPageRoute(
                            builder: (context) => SignInScreen(),
                          ));
                        },
                        child: Text(
                          'پشتیبانی',
                          style: TextStyle(
                            decoration: TextDecoration.underline,
                            decorationColor: themeData.colorScheme.surface,
                            fontSize: 13,
                            fontWeight: FontWeight.bold,
                            color: themeData.colorScheme.surface,
                          ),
                        )),
                  ],
                ).marginSymmetric(horizontal: Constants.primaryPadding),
              ],
            ).paddingAll(Constants.primaryPadding * 2),
          ),
        ),
      ),
    );
  }
}

class RuleTextWidget extends StatelessWidget {
  const RuleTextWidget({
    Key? key,
    required this.title,
  }) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);

    return Padding(
      padding: EdgeInsets.only(bottom: Constants.primaryPadding / 2),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '*   ',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 12,
              color: themeData.colorScheme.surface,
            ),
          ),
          Expanded(
            child: Text(
              title,
              style: TextStyle(
                wordSpacing: -2,
                fontWeight: FontWeight.bold,
                fontSize: 12,
                color: themeData.colorScheme.surface,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
