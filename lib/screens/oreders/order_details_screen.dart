import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/widgets/decorated_container.dart';
import 'package:provider/widgets/factor.dart';
import 'package:provider/widgets/title.dart';

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
              MyDecoratedContainer(
                  child: Column(
                    children: [
                      FactorItem(title: 'شناسه سفارش', secTitle: '1458742168V'),
                      FactorItem(title: 'کد پیگیری', secTitle: 'SSODHJVC152'),
                      FactorItem(title: 'تاریخ سفارش', secTitle: '1403/09/15'),
                      FactorItem(title: 'زمان سفارش', secTitle: '14:35:12'),
                      FactorItem(title: 'مبلغ دریافتی', secTitle: '14,000,000'),
                    ],
                  ),
                  color: themeData.colorScheme.surface),

              SizedBox(height: 8),
              DashboardTitle(title: 'محصولات ارسالی'),
              // نمایش لیست آیتم‌های سفارش
              ...List.generate(
                3,
                (index) => MyDecoratedContainer(
                  color: themeData.colorScheme.surface,
                  child: Column(
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
                      SizedBox(height: Constants.primaryPadding / 2),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          SizedBox(width: Constants.primaryPadding + 10),
                          MyDecoratedContainer(
                            isOutlined: true,
                            color: themeData.colorScheme.primary,
                            padding: EdgeInsets.symmetric(
                                vertical: 2, horizontal: 4),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  '12',
                                  style: TextStyle(
                                      color: themeData.colorScheme.primary,
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  '×',
                                  style: TextStyle(
                                      color: themeData.colorScheme.primary,
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                          ),
                          Spacer(),
                          Flexible(
                            child: MyDecoratedContainer(
                              color: themeData.colorScheme.primary,
                              padding: EdgeInsets.symmetric(
                                  vertical: 4, horizontal: 8),
                              child: Text(
                                '15,000,000 تومان',
                                style: TextStyle(
                                    color: themeData.colorScheme.surface,
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                ).marginOnly(bottom: Constants.primaryPadding),
              ),
              SizedBox(height: 16),
            ],
          ).marginAll(Constants.primaryPadding),
        ),
      ),
    );
  }
}
