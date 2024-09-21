import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/common/const.dart';
import 'package:provider/screens/profile/screens/f_a_q.dart';
import 'package:provider/widgets/decorated_container.dart';
import 'package:provider/widgets/dvider.dart';
import 'screens/drawer.dart';
import 'screens/criticism.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('حساب کاربری'),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              MyDecoratedContainer(
                child: Row(
                  children: [
                    Icon(
                      CupertinoIcons.person_circle,
                      size: 62,
                      color: themeData.colorScheme.secondary,
                    ),
                    const SizedBox(width: 12),
                    Column(
                      children: [
                        Text(
                          'بازرگانی غفاری',
                          style: TextStyle(
                              fontSize: 14, fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          '458541258875',
                          style: TextStyle(
                              fontSize: 12,
                              color: themeData.colorScheme.secondary),
                        ),
                      ],
                    ),
                    Spacer(),
                    TextButton(
                      onPressed: () {},
                      child: Text('ویرایش'),
                    )
                  ],
                ),
              ).marginSymmetric(horizontal: Constants.primaryPadding),
              MyDivider().marginSymmetric(horizontal: Constants.primaryPadding),
              //  SizedBox(height: Constants.primaryPadding),
              DrawerTile(
                title: 'مدیریت کارت ها',
                icon: Icons.credit_card,
                isEven: true,
                onTap: () {
                  // Navigator.of(context).push(CupertinoPageRoute(
                  //   builder: (context) => const WithdrawScreen(),
                  // ));
                },
              ),

              DrawerTile(
                title: 'نظرات',
                icon: Icons.comment,
                isEven: false,
                onTap: () {
                  // Navigator.of(context, rootNavigator: true).push(
                  //   CupertinoPageRoute(
                  //     builder: (context) => const BonusScreen(),
                  //   ),
                  // );
                },
              ),
              DrawerTile(
                title: 'آموزش',
                icon: Icons.cast_for_education,
                isEven: true,
                onTap: () {
                  // Navigator.of(context, rootNavigator: true)
                  //     .push(CupertinoPageRoute(
                  //   builder: (context) => const ReferralScreen(),
                  // ));
                },
              ),
              DrawerTile(
                title: 'پیشنهاد و انتقاد',
                icon: Icons.feed,
                isEven: false,
                onTap: () {
                  Navigator.of(context, rootNavigator: true).push(
                    CupertinoPageRoute(
                      builder: (context) => const CriticismScreen(),
                    ),
                  );
                },
              ),
              DrawerTile(
                title: 'سوالات متدال',
                icon: Icons.question_answer_outlined,
                isEven: true,
                onTap: () {
                  Navigator.of(context, rootNavigator: true)
                      .push(CupertinoPageRoute(
                    builder: (context) => FAQScreen(),
                  ));
                },
              ),
              DrawerTile(
                title: 'پشتیبانی',
                icon: Icons.headset_mic_sharp,
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
          ).marginSymmetric(vertical: Constants.primaryPadding),
        ),
      ),
    );
  }
}
