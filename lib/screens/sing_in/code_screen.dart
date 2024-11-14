import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/common/const.dart';
import 'package:provider/root.dart';
import 'package:provider/widgets/button.dart';
import 'package:provider/widgets/text_field.dart';

class CodeScreen extends StatefulWidget {
  const CodeScreen({super.key, this.isSingUp = false});
  final bool isSingUp;

  @override
  State<CodeScreen> createState() => _CodeScreenState();
}

class _CodeScreenState extends State<CodeScreen> {
  late TextEditingController controller;
  final _formKey = GlobalKey<FormState>();
  int _currentStep = 2;

  @override
  void initState() {
    controller = TextEditingController(text: '12345');
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);
    final TextStyle titleStyle =
        TextStyle(fontWeight: FontWeight.bold, fontSize: 12, wordSpacing: -2);
    final subTitleStyle =
        TextStyle(fontWeight: FontWeight.bold, fontSize: 11, wordSpacing: -2);
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: themeData.colorScheme.surfaceContainerHigh,
        body: SafeArea(
          child: SingleChildScrollView(
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
                        Icons.password,
                        color: themeData.colorScheme.surfaceContainerHighest,
                        size: 68,
                      ),
                      SizedBox(height: 32),

                      if (widget.isSingUp) ...{
                        Stepper(
                          currentStep: _currentStep,
                          physics: NeverScrollableScrollPhysics(),
                          controlsBuilder: (context, details) => Container(),
                          steps: [
                            Step(
                              subtitle: Text(
                                'مدت زمان انتظار : (1) الی (60) دقیقه',
                                style: subTitleStyle,
                              ),
                              title: Text(
                                'تایید تطابق نام و نام خانوادگی، کدملی و شماره همراه',
                                style: titleStyle,
                              ),
                              content: Container(),
                              isActive: _currentStep >= 0,
                            ),
                            Step(
                              title:
                                  Text('تایید شناسه صنفی', style: titleStyle),
                              subtitle: Text(
                                'مدت زمان انتظار : (1) الی (24) ساعت',
                                style: subTitleStyle,
                              ),
                              content: Container(),
                              isActive: _currentStep >= 1,
                            ),
                            Step(
                              title:
                                  Text('تایید شماره همراه', style: titleStyle),
                              subtitle: Text(
                                'کد تایید ارسال شده به شماره 09028430830 را وارد کنید.',
                                style: subTitleStyle,
                              ),
                              content: Form(
                                key: _formKey,
                                child: MyTextField(
                                  labelText: 'کد تایید',
                                  maxLength: 5,
                                  textAlign: TextAlign.center,
                                  letterSpacing: 7,
                                  controller: controller,
                                  enabled: _currentStep ==
                                      2, // غیرفعال تا رسیدن به مرحله 3
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'کد تایید خود را وارد کنید!';
                                    } else if (value.length < 5) {
                                      return 'کد تایید نمیتواند کمتر از 5 رقم باشد!';
                                    } else {
                                      return null;
                                    }
                                  },
                                  keyboardType: TextInputType.number,
                                ),
                              ),
                              isActive: _currentStep >= 2,
                            ),
                          ],
                        ),
                      } else
                        Column(
                          children: [
                            Text(
                              'کد تایید ارسال شده به شماره 09028430830 را وارد کنید.',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  wordSpacing: -2,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 12),
                            ),
                            SizedBox(height: Constants.primaryPadding),
                            Form(
                              key: _formKey,
                              child: MyTextField(
                                labelText: 'کد تایید',
                                maxLength: 5,
                                textAlign: TextAlign.center,
                                letterSpacing: 7,
                                controller: controller,
                                enabled: _currentStep ==
                                    2, // غیرفعال تا رسیدن به مرحله 3
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'کد تایید خود را وارد کنید!';
                                  } else if (value.length < 5) {
                                    return 'کد تایید نمیتواند کمتر از 5 رقم باشد!';
                                  } else {
                                    return null;
                                  }
                                },
                                keyboardType: TextInputType.number,
                              ),
                            ).marginOnly(bottom: Constants.primaryPadding),
                          ],
                        ),
                      // Text(
                      //   'برای ورود کد تایید ارسال شده را وارد کنید.',
                      //   textAlign: TextAlign.center,
                      //   style: TextStyle(
                      //       wordSpacing: -2,
                      //       fontWeight: FontWeight.bold,
                      //       fontSize: 12),
                      // ),

                      SizedBox(
                        width: double.infinity,
                        height: Constants.primaryButtonHeight,
                        child: MyElevatedButton(
                            title: 'ورود',
                            backgroundColor:
                                themeData.colorScheme.surfaceContainerHighest,
                            forgroundColor: themeData.colorScheme.surface,
                            onTap: widget.isSingUp
                                ? (_currentStep == 2)
                                    ? () {
                                        if (_formKey.currentState!.validate()) {
                                          Navigator.of(context).pushReplacement(
                                            MaterialPageRoute(
                                              builder: (context) =>
                                                  RootScreen(),
                                            ),
                                          );
                                        }
                                      }
                                    : null
                                : () {
                                    Navigator.of(context).pushReplacement(
                                      MaterialPageRoute(
                                        builder: (context) => RootScreen(),
                                      ),
                                    );
                                  }),
                      ),
                      SizedBox(height: 8),
                      if (_currentStep == 2)
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'شماره را اشتباه وارد کردید؟',
                              style: TextStyle(
                                fontSize: 11,
                                color: themeData.colorScheme.onSurface,
                              ),
                            ),
                            TextButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              child: Text(
                                'ویرایش',
                                style: TextStyle(
                                  decoration: TextDecoration.underline,
                                  decorationColor: themeData
                                      .colorScheme.surfaceContainerHighest,
                                  fontSize: 13,
                                  fontWeight: FontWeight.bold,
                                  color: themeData
                                      .colorScheme.surfaceContainerHighest,
                                ),
                              ),
                            ),
                          ],
                        ).marginSymmetric(horizontal: Constants.primaryPadding),
                    ],
                  ),
                ),
              ],
            ).paddingAll(Constants.primaryPadding * 2),
          ),
        ),
      ),
    );
  }
}
