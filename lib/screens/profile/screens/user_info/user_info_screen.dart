import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/common/const.dart';
import 'package:provider/widgets/button.dart';
import 'package:provider/widgets/text_field.dart';

class UserInfoScreen extends StatelessWidget {
  const UserInfoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();

    return Scaffold(
      appBar: AppBar(
        title: Text('ویرایش اطلاعات کاربری'),
      ),
      body: SafeArea(
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              children: [
                Row(children: [
                  Expanded(
                    child: MyTextField(
                      labelText: 'نام',
                      prefixIcon: Icon(Icons.person),
                      validator: (value) =>
                          value!.isEmpty ? 'لطفا نام را وارد کنید' : null,
                    ),
                  ),
                  SizedBox(width: 8),
                  Expanded(
                    child: MyTextField(
                      labelText: 'نام خانوادگی',
                      prefixIcon: Icon(Icons.person),
                      validator: (value) => value!.isEmpty
                          ? 'لطفا نام خانوادگی را وارد کنید'
                          : null,
                    ),
                  ),
                ]),
                MyTextField(
                  labelText: 'کد ملی',
                  prefixIcon: Icon(Icons.person),
                  maxLength: 10,
                  keyboardType: TextInputType.number,
                  validator: (value) =>
                      value!.length < 10 ? 'کد ملی باید 10 رقم باشد' : null,
                ),
                MyTextField(
                  labelText: 'شماره موبایل',
                  prefixIcon: Icon(Icons.phone_android),
                  keyboardType: TextInputType.number,
                  maxLength: 11,
                  validator: (value) => value!.length < 11
                      ? 'شماره موبایل باید 11 رقم باشد'
                      : null,
                ),
                MyTextField(
                  labelText: 'شماره ثابت فروشگاه',
                  hintText: 'به همراه کد استان وارد کنید.',
                  prefixIcon: Icon(Icons.phone),
                  keyboardType: TextInputType.number,
                  maxLength: 11,
                  validator: (value) =>
                      value!.length < 11 ? 'شماره ثابت باید 11 رقم باشد' : null,
                ),
                MyTextField(
                  labelText: 'نام فروشگاه',
                  prefixIcon: Icon(Icons.store),
                  validator: (value) =>
                      value!.isEmpty ? 'لطفا نام فروشگاه را وارد کنید' : null,
                ),
                MyTextField(
                  labelText: 'شناسه پروانه',
                  prefixIcon: Icon(CupertinoIcons.doc_text_fill),
                  keyboardType: TextInputType.number,
                  validator: (value) =>
                      value!.isEmpty ? 'لطفا شناسه پروانه را وارد کنید' : null,
                ),
                MyTextField(
                  labelText: 'عنوان پروانه',
                  prefixIcon: Icon(CupertinoIcons.doc_person_fill),
                  validator: (value) =>
                      value!.isEmpty ? 'لطفا عنوان پروانه را وارد کنید' : null,
                ),
                MyTextField(
                  labelText: 'آدرس فروشگاه',
                  maxLines: 10,
                  minLines: 1,
                  prefixIcon: Icon(CupertinoIcons.location_solid),
                  validator: (value) =>
                      value!.isEmpty ? 'لطفا آدرس فروشگاه را وارد کنید' : null,
                ),
                SizedBox(
                  height: Constants.primaryButtonHeight,
                  width: MediaQuery.of(context).size.width,
                  child: MyElevatedButton(
                    onTap: () {
                      if (_formKey.currentState!.validate()) {
                        // انجام عملیات مورد نیاز
                      }
                    },
                    title: 'ویرایش',
                    icon: Icon(Icons.check),
                  ),
                ).marginOnly(top: 8),
              ],
            ).marginAll(Constants.primaryPadding),
          ),
        ),
      ),
    );
  }
}
