import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:vizi_dasht/screens/dashboard/finance.dart';
import 'package:vizi_dasht/widgets/badge.dart';

import '../../../common/const.dart';
import 'criticism.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);

    return Drawer(
      semanticLabel: 'منو',
      child: Column(
        children: [
          DrawerHeader(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  CupertinoIcons.person_crop_circle,
                  size: 62,
                  color: themeData.colorScheme.primary,
                ),
                const SizedBox(height: 12),
                const Text(
                  'بازرگانی غفاری',
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 2,
                ),
                Text(
                  '458541258875',
                  style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                      color: themeData.colorScheme.secondary),
                ),
              ],
            ),
          ).animate().slideX(
                begin: 1,
                duration: Constants.duration,
                curve: Constants.animationCurve,
              ),
          const SizedBox(height: 12),
          DrawerTile(
            title: 'امور مالی',
            icon: Icons.credit_card,
            isEven: true,
            onTap: () {
              Navigator.of(context).push(CupertinoPageRoute(
                builder: (context) => const FinanceScreen(),
              ));
            },
          ),
          DrawerTile(
            title: 'آموزش',
            value: 1,
            icon: Icons.cast_for_education,
            isEven: false,
            onTap: () {
              // Navigator.of(context, rootNavigator: true)
              //     .push(CupertinoPageRoute(
              //   builder: (context) => const ReferralScreen(),
              // ));
            },
          ),
          // DrawerTile(
          //   title: 'تخفیف ها',
          //   icon: Icons.percent,
          //   isEven: false,
          //   onTap: () {
          //     // Navigator.of(context, rootNavigator: true).push(
          //     //   CupertinoPageRoute(
          //     //     builder: (context) => const BonusScreen(),
          //     //   ),
          //     // );
          //   },
          // ),
          DrawerTile(
            title: 'پیشنهاد و انتقاد',
            icon: Icons.feed_outlined,
            isEven: true,
            onTap: () {
              Navigator.of(context, rootNavigator: true).push(
                CupertinoPageRoute(
                  builder: (context) => const CriticismScreen(),
                ),
              );
            },
          ),
          DrawerTile(
            title: 'پشتیبانی',
            icon: Icons.headset_mic_sharp,
            isEven: false,
            value: 1,
            onTap: () {},
          ),
          DrawerTile(
            title: 'خروج از حساب',
            icon: Icons.logout_sharp,
            isEnd: true,
            onTap: () {},
          ),
        ],
      ),
    );
  }
}

class DrawerTile extends StatelessWidget {
  const DrawerTile({
    super.key,
    this.isEven = false,
    this.isEnd = false,
    this.value = 0,
    required this.title,
    required this.icon,
    required this.onTap,
  });
  final bool isEven;
  final int value;
  final bool isEnd;
  final String title;
  final IconData icon;
  final Function() onTap;
  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);
    return ListTile(
      contentPadding:
          EdgeInsets.symmetric(horizontal: Constants.primaryPadding * 2),
      tileColor: isEven
          ? themeData.colorScheme.primary.withOpacity(0.05)
          : isEnd
              ? themeData.colorScheme.error.withOpacity(0.2)
              : null,
      title: Row(
        children: [
          Expanded(
            child: Text(
              title,
              style: TextStyle(
                color: isEnd ? themeData.colorScheme.errorContainer : null,
                fontSize: 12,
                fontWeight: FontWeight.bold,
                wordSpacing: -2,
              ),
            ),
          ),
          CounterBadge(value: value),
        ],
      ),
      leading: Icon(
        icon,
        size: 22,
        color: isEnd
            ? themeData.colorScheme.errorContainer
            : themeData.colorScheme.primary,
      ),
      trailing: isEnd ? null : Icon(Icons.arrow_forward_ios, size: 16),
      onTap: onTap,
    );
  }
}
