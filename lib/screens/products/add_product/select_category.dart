import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/common/const.dart';
import 'package:provider/widgets/button.dart';
import 'add_product_details.dart';

class AddProduct extends StatefulWidget {
  const AddProduct({super.key});

  @override
  State<AddProduct> createState() => _AddProductState();
}

class _AddProductState extends State<AddProduct> {
  int? selectedIndex; // متغیر برای ذخیره آیتم انتخاب‌شده
  final int itemCount = 10; // تعداد آیتم‌ها

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("انتخاب دسته بندی"),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: SizedBox(
        width: MediaQuery.of(context).size.width - Constants.primaryPadding * 2,
        height: Constants.primaryButtonHeight,
        child: MyElevatedButton(
          title: 'تایید',
          onTap: selectedIndex == null
              ? null
              : () {
                  Navigator.of(context).push(
                    CupertinoPageRoute(
                      builder: (context) => AddProductDetails(id: 1),
                    ),
                  );
                },
          icon: const Icon(Icons.check),
        ),
      ),
      body: SafeArea(
        child: GridView.builder(
          padding: const EdgeInsets.only(
              top: Constants.primaryPadding * 3,
              bottom: Constants.primaryPadding * 5,
              left: Constants.primaryPadding * 2,
              right: Constants.primaryPadding * 2),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3, // دو آیتم در هر سطر
            mainAxisSpacing: 10.0,
            crossAxisSpacing: 10.0,
            childAspectRatio: 0.9, // نسبت برای آیتم‌های دایره‌ای
          ),
          itemCount: itemCount,
          itemBuilder: (context, index) {
            bool isSelected = selectedIndex == index; // بررسی انتخاب آیتم
            return GestureDetector(
              onTap: () {
                setState(() {
                  if (isSelected) {
                    selectedIndex =
                        null; // اگر کلیک مجدد شود، آیتم لغو انتخاب شود
                  } else {
                    selectedIndex = index; // آیتم جدید انتخاب شود
                  }
                });
              },
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(
                    color: isSelected
                        ? Theme.of(context).primaryColor
                        : Theme.of(context)
                            .colorScheme
                            .secondary
                            .withOpacity(0.25),
                    width: 3.0,
                  ),
                  borderRadius: Constants.primaryRadius,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Flexible(
                        child: Image.asset('assets/images/1509547706.jpg')),
                    const SizedBox(height: 10),
                    Text(
                      'Item $index',
                      style: const TextStyle(fontSize: 16),
                    ),
                  ],
                ).paddingAll(Constants.primaryPadding),
              ),
            );
          },
        ),
      ),
    );
  }
}
