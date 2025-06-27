import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vizi_dasht/common/const.dart';
import 'package:vizi_dasht/widgets/badge.dart';
import 'package:vizi_dasht/widgets/dvider.dart';

import 'decorated_container.dart';

class DeliveriOnWayWidegt extends StatelessWidget {
  const DeliveriOnWayWidegt({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return DecoratedContainerWithIcon(
      colors: Constants.primaryGradientColors,
      icon: Icons.local_shipping_outlined,
      title: 'باربر ویزیتوم در راه است!',
      caption: 'تأمین‌کننده عزیز، لطفاً برای تحویل سفارشات آماده باشید.',
    );
  }
}

class DeliveriMessage extends StatelessWidget {
  const DeliveriMessage({super.key});

  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);

    return Column(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            RippleBadge(
              maxRadius: 12,
              gradient: Constants.primaryGradientColors,
              color: themeData.colorScheme.surfaceContainerHighest,
              child: Container(
                padding: EdgeInsets.all(2),
                decoration: BoxDecoration(
                  gradient:
                      Constants.myGradient(Constants.primaryGradientColors),
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  size: 22,
                  opticalSize: 22,
                  Icons.priority_high_rounded,
                  color: themeData.colorScheme.surface,
                ),
              ),
            ).marginOnly(left: 10),
            Expanded(child: DeliveriOnWayWidegt()),
          ],
        ),
        MyDivider(),
      ],
    );
  }
}
