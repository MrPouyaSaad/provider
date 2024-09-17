import 'package:flutter/material.dart';

import '../../common/const.dart';

class OrderDetailsScreen extends StatelessWidget {
  final int orderId;

  const OrderDetailsScreen({required this.orderId, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context);
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
          title: Text('جزئیات سفارش'),
        ),
        body: Padding(
          padding: EdgeInsets.all(Constants.primaryPadding),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('سفارش شماره $orderId',
                  style: themeData.textTheme.bodyLarge),
              SizedBox(height: 16),
              Text('تاریخ سفارش: 1403/09/15'),
              SizedBox(height: 8),
              Text('وضعیت: در حال آماده سازی'),
              SizedBox(height: 8),
              Text('جزئیات سفارش:'),
              SizedBox(height: 8),
              // نمایش لیست آیتم‌های سفارش
              ...List.generate(
                3,
                (index) => Column(
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Image.asset(
                          'assets/images/6260100320116(1).jpg',
                          width: 100,
                          height: 100,
                          fit: BoxFit.cover,
                        ),
                        const SizedBox(width: 10),
                        Expanded(
                          child: Text(
                            'ماکارونی فرمی شوئینگر هورنلی 500 گرمی تک‌ماکارون',
                            style: const TextStyle(
                              fontSize: 12, // تنظیم سایز متن
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        SizedBox(width: Constants.primaryPadding + 10),
                        Column(
                          children: [
                            Text('تعداد'),
                            Text('15 بسته'),
                          ],
                        ),
                        Expanded(
                          child: Text(
                            'قیمت کل : 15,000,000 تومان',
                            textAlign: TextAlign.end,
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
              SizedBox(height: 16),
              Text('مبلغ کل : 45,000,000 تومان'),
            ],
          ),
        ),
      ),
    );
  }
}
