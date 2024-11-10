import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/common/const.dart';
import 'package:provider/widgets/button.dart';
import 'package:provider/widgets/text_field.dart';

class UserInfoScreen extends StatefulWidget {
  const UserInfoScreen({super.key});

  @override
  _UserInfoScreenState createState() => _UserInfoScreenState();
}

class _UserInfoScreenState extends State<UserInfoScreen> {
  final _formKey = GlobalKey<FormState>();

  // Define controllers for each text field
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _nationalIdController = TextEditingController();
  final TextEditingController _mobileNumberController = TextEditingController();
  final TextEditingController _storePhoneController = TextEditingController();
  final TextEditingController _storeNameController = TextEditingController();
  final TextEditingController _licenseIdController = TextEditingController();
  final TextEditingController _licenseTitleController = TextEditingController();
  final TextEditingController _storeAddressController = TextEditingController();

  @override
  void dispose() {
    // Dispose of controllers when not needed
    _firstNameController.dispose();
    _lastNameController.dispose();
    _nationalIdController.dispose();
    _mobileNumberController.dispose();
    _storePhoneController.dispose();
    _storeNameController.dispose();
    _licenseIdController.dispose();
    _licenseTitleController.dispose();
    _storeAddressController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ویرایش اطلاعات کاربری'),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                Row(children: [
                  Expanded(
                    child: MyTextField(
                      controller: _firstNameController,
                      labelText: 'نام',
                      prefixIcon: Icon(Icons.person),
                      validator: (value) =>
                          value!.isEmpty ? 'لطفا نام را وارد کنید' : null,
                    ),
                  ),
                  SizedBox(width: 8),
                  Expanded(
                    child: MyTextField(
                      controller: _lastNameController,
                      labelText: 'نام خانوادگی',
                      prefixIcon: Icon(Icons.person),
                      validator: (value) => value!.isEmpty
                          ? 'لطفا نام خانوادگی را وارد کنید'
                          : null,
                    ),
                  ),
                ]),
                MyTextField(
                  controller: _nationalIdController,
                  labelText: 'کد ملی',
                  prefixIcon: Icon(Icons.person),
                  maxLength: 10,
                  keyboardType: TextInputType.number,
                  validator: (value) =>
                      value!.length < 10 ? 'کد ملی باید 10 رقم باشد' : null,
                ),
                MyTextField(
                  controller: _mobileNumberController,
                  labelText: 'شماره موبایل',
                  prefixIcon: Icon(Icons.phone_android),
                  keyboardType: TextInputType.number,
                  maxLength: 11,
                  validator: (value) => value!.length < 11
                      ? 'شماره موبایل باید 11 رقم باشد'
                      : null,
                ),
                MyTextField(
                  controller: _storePhoneController,
                  labelText: 'شماره ثابت فروشگاه',
                  hintText: 'به همراه کد استان وارد کنید.',
                  prefixIcon: Icon(Icons.phone),
                  keyboardType: TextInputType.number,
                  maxLength: 11,
                  validator: (value) =>
                      value!.length < 11 ? 'شماره ثابت باید 11 رقم باشد' : null,
                ),
                MyTextField(
                  controller: _storeNameController,
                  labelText: 'نام فروشگاه',
                  prefixIcon: Icon(Icons.store),
                  validator: (value) =>
                      value!.isEmpty ? 'لطفا نام فروشگاه را وارد کنید' : null,
                ),
                MyTextField(
                  controller: _licenseIdController,
                  labelText: 'شناسه پروانه',
                  prefixIcon: Icon(CupertinoIcons.doc_text_fill),
                  keyboardType: TextInputType.number,
                  validator: (value) =>
                      value!.isEmpty ? 'لطفا شناسه پروانه را وارد کنید' : null,
                ),
                MyTextField(
                  controller: _licenseTitleController,
                  labelText: 'عنوان پروانه',
                  prefixIcon: Icon(CupertinoIcons.doc_person_fill),
                  validator: (value) =>
                      value!.isEmpty ? 'لطفا عنوان پروانه را وارد کنید' : null,
                ),
                MyTextField(
                  controller: _storeAddressController,
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
