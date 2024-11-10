// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:provider/common/const.dart';
import 'package:provider/widgets/button.dart';
import 'package:provider/widgets/text_field.dart';

class AddProductDetails extends StatefulWidget {
  const AddProductDetails({
    Key? key,
    required this.id,
    this.isEdit = false,
  }) : super(key: key);
  final int id;
  final bool isEdit;
  @override
  State<AddProductDetails> createState() => _AddProductDetailsState();
}

class _AddProductDetailsState extends State<AddProductDetails> {
  String? selectedProduct;
  bool isDiscount = false;
  bool confirm = true;
  TextEditingController dicountController = TextEditingController();
  final List<Map<String, String>> products = [
    {
      'name': 'روغن کنجد بی بو 450 میلی‌لیتری احمد اردایران',
      'image': 'assets/images/1526890419.jpg'
    },
    {
      'name': 'ماکارونی فرمی شوئینگر هورنلی 500 گرمی تک‌ماکارون',
      'image': 'assets/images/6260100320116(1).jpg'
    },
    {
      'name': 'روغن کنجد بی بو 450 میلی‌لیتری احمد اردایران',
      'image': 'assets/images/1526890419.jpg'
    },
    {
      'name': 'ماکارونی فرمی شوئینگر هورنلی 500 گرمی تک‌ماکارون',
      'image': 'assets/images/6260100320116(1).jpg'
    },
    {
      'name': 'پاستا نیمه آماده پنه ریگاته با سبزیجات 180 گرمی تک‌ماکارون',
      'image': 'assets/images/1509547706.jpg'
    },
    {
      'name': 'روغن کنجد بی بو 450 میلی‌لیتری احمد اردایران',
      'image': 'assets/images/1526890419.jpg'
    },
    {
      'name': 'ماکارونی فرمی شوئینگر هورنلی 500 گرمی تک‌ماکارون',
      'image': 'assets/images/6260100320116(1).jpg'
    },
  ];
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
          title: Text(widget.isEdit ? 'ویرایش محصول' : 'جزییات محصول'),
          actions: widget.isEdit
              ? [
                  IconButton(
                    onPressed: () {},
                    icon: Icon(
                      CupertinoIcons.delete,
                      color: themeData.colorScheme.error,
                    ),
                  )
                ]
              : null),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Searchable Dropdown for select product
            if (!widget.isEdit)
              DropdownSearch<String>(
                popupProps: PopupProps.menu(
                  showSearchBox: true, // فعال‌سازی جستجو
                  searchFieldProps: const TextFieldProps(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'جستجو',
                    ),
                  ),
                  itemBuilder: (context, item, isSelected) {
                    final product = products
                        .firstWhere((product) => product['name'] == item);
                    return ListTile(
                      leading: Image.asset(
                        product['image']!,
                        width: 40,
                        height: 40,
                        fit: BoxFit.cover,
                      ),
                      title: Text(
                        product['name']!,
                        style: const TextStyle(fontSize: 14),
                      ),
                    );
                  },
                  menuProps: MenuProps(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                items: products.map((product) => product['name']!).toList(),
                dropdownDecoratorProps: DropDownDecoratorProps(
                  dropdownSearchDecoration: InputDecoration(
                    labelText: 'انتخاب محصول',
                    contentPadding: EdgeInsets.symmetric(
                      horizontal: Constants.primaryPadding,
                      vertical: 10,
                    ),
                    border: const OutlineInputBorder(),
                  ),
                  baseStyle: const TextStyle(
                    fontSize: 12, // تنظیم سایز متن برای محصول انتخاب‌شده
                  ),
                ),
                onChanged: (value) {
                  setState(() {
                    selectedProduct = value;
                  });
                },
                selectedItem: selectedProduct,
              ),
            const SizedBox(height: 20),
            // نمایش محصول انتخاب‌شده
            if (selectedProduct != null)
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset(
                    products.firstWhere((product) =>
                        product['name'] == selectedProduct)['image']!,
                    width: 100,
                    height: 100,
                    fit: BoxFit.cover,
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: Text(
                      selectedProduct!,
                      style: const TextStyle(
                        fontSize: 12, // تنظیم سایز متن
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            Form(
              key: _formKey,
              child: Column(
                children: [
                  MyTextField(
                    labelText: 'تعداد موجود برای فروش',
                    keyboardType: TextInputType.number,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'لطفا تعداد موجود برای فروش را وارد کنید';
                      }
                      if (int.tryParse(value) == null) {
                        return 'مقدار وارد شده باید یک عدد باشد';
                      }
                      return null;
                    },
                  ),
                  MyTextField(
                    labelText: 'تعداد در هر بسته',
                    keyboardType: TextInputType.number,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'لطفا تعداد در هر بسته را وارد کنید';
                      }
                      if (int.tryParse(value) == null) {
                        return 'مقدار وارد شده باید یک عدد باشد';
                      }
                      return null;
                    },
                  ),
                  MyTextField(
                    labelText: 'تاریخ انقضاء',
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'لطفا تاریخ انقضاء را وارد کنید';
                      }
                      // می‌توانید اینجا یک اعتبارسنجی برای فرمت تاریخ اضافه کنید
                      return null;
                    },
                  ),
                  MyTextField(
                    labelText: 'قیمت هر بسته',
                    keyboardType: TextInputType.number,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'لطفا قیمت هر بسته را وارد کنید';
                      }
                      if (double.tryParse(value) == null) {
                        return 'مقدار وارد شده باید یک عدد باشد';
                      }
                      return null;
                    },
                  ),
                  MyTextField(
                    labelText: 'قیمت 5 بسته',
                    keyboardType: TextInputType.number,
                    caption: 'اختیاری',
                  ),
                  MyTextField(
                    labelText: 'قیمت 10 بسته',
                    keyboardType: TextInputType.number,
                    caption: 'اختیاری',
                  ),
                  MyTextField(
                    labelText: 'قیمت برای مصرف کننده(روی جلد)',
                    keyboardType: TextInputType.number,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'لطفا قیمت برای مصرف کننده را وارد کنید';
                      }
                      if (double.tryParse(value) == null) {
                        return 'مقدار وارد شده باید یک عدد باشد';
                      }
                      return null;
                    },
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      GestureDetector(
                        onTap: () {
                          if (isDiscount == true) {
                            setState(() {
                              isDiscount = false;
                              dicountController.clear();
                            });
                          } else {
                            setState(() {
                              isDiscount = true;
                            });
                          }
                        },
                        child: Container(
                          padding: EdgeInsets.symmetric(
                              vertical: Constants.primaryPadding - 4),
                          child: Row(
                            children: [
                              Container(
                                width: 20,
                                height: 20,
                                decoration: BoxDecoration(
                                  border: !isDiscount
                                      ? Border.all(
                                          color: themeData.colorScheme.primary,
                                          width: 2.5)
                                      : null,
                                  borderRadius: BorderRadius.circular(
                                      Constants.primaryRadiusValue / 2),
                                  color: isDiscount
                                      ? themeData.primaryColor
                                      : themeData.colorScheme.surface,
                                ),
                                child: isDiscount
                                    ? Icon(
                                        Icons.check,
                                        color: Colors.white,
                                        size: 18,
                                      )
                                    : null,
                              ),
                              SizedBox(width: Constants.primaryPadding / 2),
                              Text(
                                'تخفیف',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Theme.of(context).primaryColor,
                                    fontSize: 16),
                              ),
                            ],
                          ).marginOnly(left: Constants.primaryPadding),
                        ),
                      ),
                      Expanded(
                        child: MyTextField(
                          labelText: 'درصد تخفیف',
                          enabled: isDiscount,
                          controller: dicountController,
                          keyboardType: TextInputType.number,
                          validator: (value) {
                            if (isDiscount) {
                              if (value == null || value.isEmpty) {
                                return 'لطفا درصد تخفیف را وارد کنید';
                              }
                              if (double.tryParse(value) == null) {
                                return 'مقدار وارد شده باید یک عدد باشد';
                              }
                            }
                            return null;
                          },
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width -
                  Constants.primaryPadding * 2,
              height: Constants.primaryButtonHeight,
              child: MyElevatedButton(
                title: 'تایید',
                onTap: !confirm
                    ? null
                    : () {
                        if (_formKey.currentState!.validate()) {
                          Navigator.popUntil(context, (route) => route.isFirst);
                        }
                      },
                icon: const Icon(Icons.check),
              ),
            ).marginSymmetric(vertical: Constants.primaryPadding),
          ],
        ).marginAll(Constants.primaryPadding),
      ),
    );
  }
}
