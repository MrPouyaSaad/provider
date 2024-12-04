import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vizi_dasht/common/const.dart';
import 'package:vizi_dasht/widgets/decorated_container.dart';
import 'package:vizi_dasht/widgets/factor.dart';
import 'package:vizi_dasht/widgets/title.dart';

class FinanceScreen extends StatelessWidget {
  const FinanceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context);
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
          title: Text('امور مالی'),
        ),
        body: SafeArea(
          child: ListView.builder(
            itemCount: 15,
            itemBuilder: (context, index) {
              bool isDeposit = index.isEven;
              return index == 0
                  ? MyDecoratedContainer(
                      color: themeData.colorScheme.primary,
                      child: Column(
                        children: [
                          FactorItem(
                              title: 'درآمد کل:', secTitle: '170 میلیون تومان'),
                          FactorItem(
                              title: 'واریزی کل:',
                              secTitle: '160 میلیون تومان'),
                          FactorItem(
                              title: 'موجودی:', secTitle: '10 میلیون تومان'),
                        ],
                      ),
                    ).marginAll(Constants.primaryPadding)
                  : index == 1
                      ? DashboardTitle(title: 'گردش حساب')
                          .marginSymmetric(horizontal: Constants.primaryPadding)
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
                                        ? 'سفارش 156484131'
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
                        ).marginOnly(
                          bottom: Constants.primaryPadding,
                          left: Constants.primaryPadding,
                          right: Constants.primaryPadding);
            },
          ),
        ),
      ),
    );
  }
}
