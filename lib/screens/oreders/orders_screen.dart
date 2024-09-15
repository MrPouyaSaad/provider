import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/common/const.dart';

class OrdersScreen extends StatelessWidget {
  const OrdersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('سفارش‌ها'),
      ),
      body: SafeArea(
        child: ListView.builder(
          itemCount: 10, // تعداد سفارش‌ها
          padding: EdgeInsets.symmetric(horizontal: Constants.primaryPadding),
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                // هدایت به صفحه جزئیات سفارش
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => OrderDetailsScreen(orderId: index),
                  ),
                );
              },
              child: Container(
                // padding: EdgeInsets.all(12),
                margin: EdgeInsets.symmetric(
                    vertical: Constants.primaryPadding / 2),
                decoration: BoxDecoration(
                  borderRadius: Constants.primaryRadius,
                  color: themeData.colorScheme.surface,
                  boxShadow: Constants.primaryBoxShadow(context),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('سفارش شماره ${index + 1}',
                            style: themeData.textTheme.bodyMedium),
                        Column(
                          children: [
                            Text('تاریخ: 2024/09/15',
                                style: themeData.textTheme.bodySmall),
                            SizedBox(height: 8),
                            Text('ساعت: 12:53:12',
                                style: themeData.textTheme.bodySmall),
                          ],
                        ),
                      ],
                    ).marginOnly(top: 16, left: 16, right: 16),
                    SizedBox(height: 8),
                    SizedBox(
                      height: 96, // ارتفاع لیست افقی آیتم‌ها
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal, // نمایش افقی
                        itemCount: 5, // تعداد آیتم‌های سفارش
                        itemBuilder: (context, itemIndex) {
                          return Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: 12, vertical: 8),
                            margin: EdgeInsets.symmetric(
                                horizontal: 8,
                                vertical: Constants.primaryPadding),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              color: themeData.colorScheme.secondary
                                  .withOpacity(0.1),
                              border: Border.all(
                                  color: themeData.colorScheme.secondary),
                            ),
                            child: Center(
                              child: Text('آیتم ${itemIndex + 1}'),
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

class OrderDetailsScreen extends StatelessWidget {
  final int orderId;

  const OrderDetailsScreen({required this.orderId, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('جزئیات سفارش $orderId'),
      ),
      body: Padding(
        padding: EdgeInsets.all(Constants.primaryPadding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('سفارش شماره $orderId', style: themeData.textTheme.bodyLarge),
            SizedBox(height: 16),
            Text('تاریخ سفارش: 2024/09/15'),
            SizedBox(height: 8),
            Text('وضعیت: در حال پردازش'),
            SizedBox(height: 8),
            Text('جزئیات سفارش:'),
            SizedBox(height: 8),
            // نمایش لیست آیتم‌های سفارش
            ...List.generate(3, (index) => Text('آیتم $index')),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                // اقداماتی مثل قبول یا رد سفارش
              },
              child: Text('اقدام به پردازش سفارش'),
            ),
          ],
        ),
      ),
    );
  }
}
