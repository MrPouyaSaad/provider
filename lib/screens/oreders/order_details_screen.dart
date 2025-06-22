import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vizi_dasht/widgets/button.dart';
import 'package:vizi_dasht/widgets/custom_shadow_box.dart';
import 'package:vizi_dasht/widgets/decorated_container.dart';
import 'package:vizi_dasht/widgets/dvider.dart';
import 'package:vizi_dasht/widgets/factor.dart';
import 'package:vizi_dasht/widgets/title.dart';

import '../../common/const.dart';
import '../../widgets/deliveri_message.dart';

class OrderDetailsScreen extends StatefulWidget {
  final int orderId;

  const OrderDetailsScreen({required this.orderId, Key? key}) : super(key: key);

  @override
  State<OrderDetailsScreen> createState() => _OrderDetailsScreenState();
}

class _OrderDetailsScreenState extends State<OrderDetailsScreen> {
  void showCancelItemDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Directionality(
          textDirection: TextDirection.rtl,
          child: AlertDialog(
            backgroundColor: Theme.of(context).colorScheme.surface,
            title: Text('لغو سفارش',
                style: TextStyle(fontWeight: FontWeight.bold)),
            content: Text('آیا از لغو این سفارش اطمینان دارید؟'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text(
                  'خیر',
                  style: TextStyle(
                      color: Theme.of(context).colorScheme.primaryContainer),
                ),
              ),
              TextButton(
                style: TextButton.styleFrom(
                  foregroundColor: Theme.of(context).colorScheme.surface,
                  backgroundColor: Constants.errorGradientColors.last,
                ),
                onPressed: () {
                  // عملیات لغو آیتم
                  Navigator.of(context).pop(); // بستن دیالوگ
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('آیتم با موفقیت لغو شد'),
                      backgroundColor:
                          Theme.of(context).colorScheme.errorContainer,
                      duration: Duration(seconds: 3),
                    ),
                  );
                },
                child: Text('بله'),
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context);
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
          title: Text('جزئیات سفارش'),
          actions: [
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.headset_mic_sharp),
            ),
          ],
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              DeliveriOnWayWidegt().marginOnly(bottom: 16),
              CustomShadowBox(
                child: Column(
                  children: [
                    FactorItem(
                      title: 'شناسه سفارش',
                      secTitle: '1458742168K',
                      isSelectable: true,
                    ),
                    FactorItem(
                      title: 'تاریخ سفارش',
                      secTitle: '1403/09/15',
                      isSelectable: true,
                    ),
                    FactorItem(
                      title: 'زمان سفارش',
                      secTitle: '14:35:12',
                      isSelectable: true,
                    ),
                    FactorItem(
                      title: 'مبلغ دریافتی',
                      secTitle: '14,000,000',
                      isSelectable: true,
                    ),
                  ],
                ),
              ),
              SizedBox(height: 16),
              AppTitle(title: 'محصولات ارسالی'),
              ...List.generate(
                3,
                (index) => CustomShadowBox(
                  child: Column(
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Image.asset(
                            'assets/images/1526890419.jpg',
                            width: 84,
                            height: 84,
                            fit: BoxFit.cover,
                          ),
                          const SizedBox(width: 10),
                          Expanded(
                            child: Text(
                              'روغن کنجد بی بو 450 میلی‌لیتری احمد اردایران',
                              style: const TextStyle(
                                fontSize: 12, // تنظیم سایز متن
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: Constants.primaryPadding),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          MyDecoratedContainer(
                            isOutlined: true,
                            color: Constants.greenGradientColors.first,
                            borderRadius: BorderRadius.circular(50),
                            padding: EdgeInsets.symmetric(
                                vertical: 2, horizontal: 4),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  '5',
                                  style: TextStyle(
                                      color:
                                          Constants.primaryGradientColors.last,
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  '×',
                                  style: TextStyle(
                                      color:
                                          Constants.primaryGradientColors.last,
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                          ).marginSymmetric(
                              horizontal: Constants.primaryPadding + 8),
                          Row(
                            children: [
                              GestureDetector(
                                onTap: () {
                                  showCancelItemDialog(context);
                                },
                                child: MyDecoratedContainer(
                                  color: themeData.colorScheme.errorContainer,
                                  gradient: Constants.errorGradientColors,
                                  padding: EdgeInsets.symmetric(
                                      vertical: 5, horizontal: 8),
                                  child: Row(
                                    children: [
                                      Text(
                                        'لغو',
                                        style: TextStyle(
                                            color:
                                                themeData.colorScheme.surface,
                                            fontSize: 14,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      SizedBox(width: 4),
                                      Icon(
                                        Icons.cancel,
                                        color: themeData.colorScheme.surface,
                                        size: 16,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              SizedBox(width: 8),
                              MyDecoratedContainer(
                                color: themeData.colorScheme.primary,
                                gradient: Constants.primaryGradientColors,
                                padding: EdgeInsets.symmetric(
                                    vertical: 5, horizontal: 8),
                                child: Text(
                                  '15,000,000 تومان',
                                  style: TextStyle(
                                      color: themeData.colorScheme.surface,
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ).marginOnly(bottom: Constants.primaryPadding),
              ),
              SizedBox(height: 16),
              SizedBox(
                width: double.infinity,
                height: Constants.primaryButtonHeight,
                child: MyElevatedButton(
                  title: 'لغو کل سفارش',
                  onTap: () {},
                  backgroundColor: themeData.colorScheme.errorContainer,
                  gradient: Constants.errorGradientColors,
                ),
              )
            ],
          ).marginAll(Constants.primaryPadding),
        ),
      ),
    );
  }
}
