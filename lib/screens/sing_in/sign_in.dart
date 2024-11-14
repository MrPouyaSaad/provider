import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/common/const.dart';
import 'package:provider/screens/sing_in/code_screen.dart';
import 'package:provider/screens/sing_in/first_info.dart';
import 'package:provider/widgets/button.dart';
import 'package:provider/widgets/text_field.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  late TextEditingController phoneNumberController;
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    phoneNumberController = TextEditingController(text: '09028430830');
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
          child: Column(
            children: [
              Text(
                'ویزی دخل',
                style: TextStyle(
                    color: themeData.colorScheme.surface,
                    fontSize: 32,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 48),
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
                      Icons.login,
                      color: themeData.colorScheme.primary,
                      size: 68,
                    ),
                    SizedBox(height: 32),

                    Text(
                      ' لطفا شماره همراه ثبت شده را وارد کنید.',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          wordSpacing: -2,
                          fontWeight: FontWeight.bold,
                          fontSize: 12),
                    ),
                    SizedBox(height: 16),

                    Form(
                      key: _formKey,
                      child: MyTextField(
                        labelText: 'شماره همراه',
                        maxLength: 11,
                        letterSpacing: 5,
                        textAlign: TextAlign.center,
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
                      ),
                    ),
                    SizedBox(height: Constants.primaryPadding),
                    SizedBox(
                      width: double.infinity,
                      height: Constants.primaryButtonHeight,
                      child: MyElevatedButton(
                        title: 'ورود',
                        backgroundColor: themeData.colorScheme.primary,
                        forgroundColor: themeData.colorScheme.surface,
                        onTap: () {
                          if (_formKey.currentState!.validate()) {
                            Navigator.of(context).push(
                              CupertinoPageRoute(
                                builder: (context) => CodeScreen(),
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
                          'ثبت نام نکرده اید؟',
                          style: TextStyle(
                            fontSize: 11,
                            color: themeData.colorScheme.secondary,
                          ),
                        ),
                        TextButton(
                            onPressed: () {
                              Navigator.of(context).push(CupertinoPageRoute(
                                builder: (context) => SignUpScreen(),
                              ));
                            },
                            child: Text(
                              'ثبت نام',
                              style: TextStyle(
                                decoration: TextDecoration.underline,
                                fontSize: 13,
                                fontWeight: FontWeight.bold,
                                color: themeData.colorScheme.primary,
                              ),
                            )),
                      ],
                    ).marginSymmetric(horizontal: Constants.primaryPadding)
                  ],
                ),
              ),
            ],
          ).paddingAll(Constants.primaryPadding * 2),
        ),
      ),
    );
  }
}
