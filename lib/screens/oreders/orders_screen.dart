import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vizi_dasht/common/const.dart';
import 'package:vizi_dasht/screens/oreders/order_details_screen.dart';

class OrdersScreen extends StatelessWidget {
  const OrdersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context);
    final style = TextStyle(
      fontSize: 12,
      fontWeight: FontWeight.bold,
      color: themeData.colorScheme.secondary,
    );
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
          title: Text('سفارش‌ها'),
          centerTitle: true,
          leading: IconButton(
            onPressed: () {},
            icon: Icon(Icons.headset_mic_sharp),
          ),
          actions: [
            TextButton(
              onPressed: () {},
              child: IconButton(
                onPressed: () {},
                icon: Icon(Icons.history),
              ),
            )
          ],
        ),
        body: SafeArea(
          child: ListView.builder(
            itemCount: 10, // تعداد سفارش‌ها
            padding: EdgeInsets.symmetric(horizontal: Constants.primaryPadding),
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  // هدایت به صفحه جزئیات سفارش
                  Navigator.of(context).push(
                    CupertinoPageRoute(
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
                          Text(
                            '14,000,000 تومان',
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              color: themeData.colorScheme.onSurface,
                            ),
                          ),
                          Column(
                            children: [
                              Text('تاریخ: 2024/09/15', style: style),
                              SizedBox(height: 8),
                              Text('ساعت: 12:53:12', style: style),
                            ],
                          ),
                        ],
                      ).marginOnly(top: 16, left: 16, right: 16),
                      SizedBox(height: 20),
                      SizedBox(
                        height: 100, // ارتفاع لیست افقی آیتم‌ها
                        child: ListView.builder(
                          padding: EdgeInsets.only(bottom: 16),
                          scrollDirection: Axis.horizontal, // نمایش افقی
                          itemCount: 5, // تعداد آیتم‌های سفارش
                          itemBuilder: (context, itemIndex) {
                            return Container(
                                height: 84,
                                width: 84,
                                margin: EdgeInsets.symmetric(
                                  horizontal: 8,
                                ),
                                decoration: BoxDecoration(
                                  borderRadius: Constants.primaryRadius,
                                  color: themeData.colorScheme.secondary
                                      .withOpacity(0.1),
                                  border: Border.all(
                                      color: themeData.colorScheme.secondary),
                                ),
                                child: ClipRRect(
                                  borderRadius: Constants.primaryRadius,
                                  child: Image.asset(
                                    'assets/images/1526890419.jpg',
                                  ),
                                ));
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
      ),
    );
  }
}
