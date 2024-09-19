import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

import '../../../common/const.dart';

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
            title: 'برداشت ها',
            icon: Icons.credit_card,
            isEven: true,
            onTap: () {
              // Navigator.of(context).push(CupertinoPageRoute(
              //   builder: (context) => const FavoritesScreen(),
              // ));
            },
          ),
          DrawerTile(
            title: 'آموزش',
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
              // Navigator.of(context, rootNavigator: true).push(
              //   CupertinoPageRoute(
              //     builder: (context) => const CriticismScreen(),
              //   ),
              // );
            },
          ),
          DrawerTile(
            title: 'پشتیبانی',
            icon: CupertinoIcons.chat_bubble_2_fill,
            isEven: false,
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
    required this.title,
    required this.icon,
    required this.onTap,
  });
  final bool isEven;
  final bool isEnd;
  final String title;
  final IconData icon;
  final Function() onTap;
  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);
    return ListTile(
      tileColor: isEven
          ? themeData.colorScheme.primary.withOpacity(0.05)
          : isEnd
              ? themeData.colorScheme.error.withOpacity(0.2)
              : null,
      title: Text(
        title,
        style: TextStyle(
          color: isEnd ? themeData.colorScheme.errorContainer : null,
          fontSize: 12,
          fontWeight: FontWeight.bold,
          wordSpacing: -2,
        ),
      ),
      leading: Icon(
        icon,
        size: 22,
        color: isEnd
            ? themeData.colorScheme.errorContainer
            : themeData.colorScheme.primary,
      ),
      onTap: onTap,
    ).animate().slideY(
          begin: -1,
          curve: Constants.animationCurve,
          duration: Constants.duration,
        );
  }
}
