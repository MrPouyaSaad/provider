import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/common/const.dart';
import 'package:provider/widgets/decorated_container.dart';
import 'package:provider/widgets/dvider.dart';
import 'package:provider/widgets/factor.dart';
import 'package:provider/widgets/title.dart';

class WithdrawScreen extends StatelessWidget {
  const WithdrawScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('امور مالی'),
      ),
      body: SafeArea(
        child: Column(
          children: [
            MyDecoratedContainer(
              color: themeData.colorScheme.tertiary,
              child: Column(
                children: [
                  FactorItem(title: 'درآمد کل:', secTitle: '170 میلیون تومان'),
                  FactorItem(title: 'واریزی کل:', secTitle: '160 میلیون تومان'),
                  FactorItem(title: 'موجودی:', secTitle: '10 میلیون تومان'),
                ],
              ),
            ),
            MyDivider(),
            Expanded(
              child: ListView.builder(
                itemCount: 15,
                itemBuilder: (context, index) {
                  bool isDeposit = index.isEven;
                  return index == 0
                      ? DashboardTitle(title: 'گردش حساب')
                      : Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: Constants.primaryPadding,
                              vertical: Constants.primaryPadding / 2),
                          decoration: BoxDecoration(
                            color: themeData.colorScheme.surface,
                            borderRadius: Constants.primaryRadius,
                            boxShadow: Constants.primaryBoxShadow(context),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Row(
                                children: [
                                  const Text('1,575,000  تومان'),
                                  const Spacer(),
                                  Text(
                                    '19:37',
                                    style: TextStyle(
                                        fontSize: 12,
                                        color: themeData.colorScheme.secondary),
                                  ),
                                  const SizedBox(width: 8),
                                  Text(
                                    '1402/03/11',
                                    style: TextStyle(
                                        fontSize: 12,
                                        color: themeData.colorScheme.secondary),
                                  ),
                                ],
                              ),
                              const SizedBox(height: Constants.primaryPadding),
                              Row(
                                children: [
                                  Text(
                                    isDeposit
                                        ? 'واریز مبلغ سفارش 156484131'
                                        : index == 5
                                            ? 'جریمه عدم تحویل مرسوله در زمان مقرر'
                                            : 'برداشت خودکار درآمد روزانه',
                                    style: TextStyle(
                                        fontSize: 12,
                                        color: themeData.colorScheme.secondary),
                                  ),
                                  Spacer(),
                                  Text(
                                    isDeposit ? 'واریز' : 'برداشت',
                                    style: TextStyle(
                                        color: isDeposit
                                            ? themeData.colorScheme.tertiary
                                            : themeData.colorScheme.error),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ).marginOnly(bottom: Constants.primaryPadding);
                },
              ),
            ),
          ],
        ).marginAll(Constants.primaryPadding),
      ),
    );
  }
}
