import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:vizi_dasht/common/const.dart';
import 'package:vizi_dasht/screens/profile/bloc/profile_screen_bloc.dart';
import 'package:vizi_dasht/screens/profile/message.dart';
import 'package:vizi_dasht/screens/profile/screens/Fines.dart';
import 'package:vizi_dasht/screens/profile/screens/bank_cart/card_manager.dart';
import 'package:vizi_dasht/screens/profile/screens/comments.dart';
import 'package:vizi_dasht/screens/profile/screens/f_a_q.dart';
import 'package:vizi_dasht/screens/profile/screens/user_info/user_info_screen.dart';
import 'package:vizi_dasht/screens/profile/support/support.dart';
import 'package:vizi_dasht/widgets/decorated_container.dart';
import 'package:vizi_dasht/widgets/dvider.dart';
import 'package:vizi_dasht/widgets/loading/profile.dart';
import 'package:vizi_dasht/widgets/start.dart';
import 'screens/drawer.dart';
import 'screens/criticism.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);
    return BlocProvider(
      create: (context) => ProfileScreenBloc()..add(ProfileScreenStarted()),
      child: BlocBuilder<ProfileScreenBloc, ProfileScreenState>(
        builder: (context, state) {
          if (state is ProfileScreenLoading) {
            return ProfileShimmer();
          }
          return Scaffold(
            body: SafeArea(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    MyDecoratedContainer(
                      color: themeData.colorScheme.primary,
                      child: Row(
                        children: [
                          Icon(
                            CupertinoIcons.person_circle,
                            size: 62,
                            color: themeData.colorScheme.surface,
                          ),
                          const SizedBox(width: 12),
                          Column(
                            children: [
                              Text(
                                'بازرگانی غفاری',
                                style: TextStyle(
                                    color: themeData.colorScheme.surface,
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold),
                              ),
                              const SizedBox(height: 4),
                              Text(
                                '458541258875',
                                style: TextStyle(
                                    fontSize: 12,
                                    color: themeData.colorScheme.surface
                                        .withOpacity(0.8)),
                              ),
                            ],
                          ),
                          Spacer(),
                          TextButton(
                            onPressed: () {
                              Navigator.of(context).push(
                                CupertinoPageRoute(
                                  builder: (context) => UserInfoScreen(),
                                ),
                              );
                            },
                            style: TextButton.styleFrom(
                              foregroundColor: themeData.colorScheme.surface,
                              // backgroundColor: themeData.colorScheme.primary,
                              shape: RoundedRectangleBorder(
                                  borderRadius: Constants.primaryRadius),
                              side: BorderSide(
                                width: 1,
                                color: themeData.colorScheme.surface,
                              ),
                            ),
                            child: Text(
                              'ویرایش',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ).marginOnly(left: 6)
                        ],
                      ),
                    ).marginSymmetric(horizontal: Constants.primaryPadding),
                    MyDivider()
                        .marginSymmetric(horizontal: Constants.primaryPadding),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('امتیاز شما'),
                        SellerRating(ratingPercentage: 0.5),
                        Text.rich(TextSpan(children: [
                          TextSpan(
                              text: '2.5 ',
                              style: TextStyle(
                                  fontSize: 13, fontWeight: FontWeight.bold)),
                          TextSpan(
                              text: 'از 5',
                              style: TextStyle(
                                  wordSpacing: -3,
                                  fontSize: 11,
                                  color: themeData.colorScheme.secondary)),
                        ])),
                      ],
                    ).marginSymmetric(horizontal: Constants.primaryPadding + 4),
                    MyDivider()
                        .marginSymmetric(horizontal: Constants.primaryPadding),
                    DrawerTile(
                      title: 'مدیریت کارت ها',
                      icon: Icons.credit_card,
                      isEven: true,
                      onTap: () {
                        Navigator.of(context).push(CupertinoPageRoute(
                          builder: (context) => BankCardManagerPage(),
                        ));
                      },
                    ),
                    DrawerTile(
                      title: 'پیام',
                      icon: Icons.message,
                      value: 2,
                      onTap: () {
                        Navigator.of(context).push(CupertinoPageRoute(
                          builder: (context) => MessageScreen(),
                        ));
                      },
                    ),
                    DrawerTile(
                      title: 'نظرات',
                      icon: Icons.comment_outlined,
                      isEven: true,
                      value: 6,
                      onTap: () {
                        Navigator.of(context).push(
                          CupertinoPageRoute(
                            builder: (context) => const CommentsList(),
                          ),
                        );
                      },
                    ),
                    DrawerTile(
                      title: 'پیشنهاد و انتقاد',
                      icon: Icons.feed,
                      isEven: false,
                      onTap: () {
                        Navigator.of(context).push(
                          CupertinoPageRoute(
                            builder: (context) => const CriticismScreen(),
                          ),
                        );
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
                      title: 'جریمه ها',
                      icon: Icons.error_rounded,
                      onTap: () {
                        Navigator.of(context).push(CupertinoPageRoute(
                          builder: (context) => Fines(),
                        ));
                      },
                    ),
                    DrawerTile(
                      title: 'سوالات متدال',
                      icon: Icons.question_answer_outlined,
                      isEven: true,
                      onTap: () {
                        Navigator.of(context).push(CupertinoPageRoute(
                          builder: (context) => FAQScreen(),
                        ));
                      },
                    ),
                    DrawerTile(
                      title: 'مرکز پشتیبانی',
                      icon: Icons.headset_mic_sharp,
                      value: 1,
                      isEven: false,
                      onTap: () {
                        Navigator.of(context).push(CupertinoPageRoute(
                          builder: (context) => SupportScreen(),
                        ));
                      },
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
        },
      ),
    );
  }
}
