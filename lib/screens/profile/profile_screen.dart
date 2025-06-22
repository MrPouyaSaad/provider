import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
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
import 'package:vizi_dasht/widgets/star.dart';
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
                      gradient: [
                        themeData.colorScheme.primary,
                        themeData.colorScheme.primary
                            .withAlpha((255 * 0.85).toInt()),
                        themeData.colorScheme.primary,
                      ],
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
                                        .withAlpha((255 * 0.8).toInt())),
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
                    ).marginSymmetric(
                        horizontal: Constants.primaryPadding * 1.5),
                    MyDivider().marginSymmetric(
                        horizontal: Constants.primaryPadding * 1.5),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'امتیاز شما',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              wordSpacing: -1,
                              fontSize: 12,
                              color: themeData.colorScheme.onSurface),
                        ),
                        SellerRating(ratingPercentage: 0.5),
                        Text.rich(
                          TextSpan(
                            children: [
                              TextSpan(
                                text: '2.5 ',
                                style: TextStyle(
                                    fontSize: 13, fontWeight: FontWeight.bold),
                              ),
                              TextSpan(
                                text: 'از 5',
                                style: TextStyle(
                                    wordSpacing: -3,
                                    fontSize: 11,
                                    color: themeData.colorScheme.secondary),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ).marginSymmetric(horizontal: Constants.primaryPadding * 2),
                    MyDivider().marginSymmetric(
                        horizontal: Constants.primaryPadding * 1.5),
                    DrawerTile(
                      title: 'مرکز پشتیبانی',
                      icon: Icons.support_agent,
                      value: 1,
                      onTap: () {
                        Navigator.of(context).push(CupertinoPageRoute(
                          builder: (context) => SupportScreen(),
                        ));
                      },
                    ),
                    DrawerTile(
                      title: 'سوالات متداول',
                      icon: Icons.quiz_outlined,
                      onTap: () {
                        Navigator.of(context).push(CupertinoPageRoute(
                          builder: (context) => FAQScreen(),
                        ));
                      },
                    ),
                    DrawerTile(
                      title: 'مدیریت کارت ها',
                      icon: Icons.credit_card,
                      onTap: () {
                        Navigator.of(context).push(CupertinoPageRoute(
                          builder: (context) => BankCardManagerPage(),
                        ));
                      },
                    ),
                    DrawerTile(
                      title: 'پیام',
                      icon: Icons.chat_bubble_outline,
                      value: 2,
                      onTap: () {
                        Navigator.of(context).push(CupertinoPageRoute(
                          builder: (context) => MessageScreen(),
                        ));
                      },
                    ),
                    DrawerTile(
                      title: 'نظرات',
                      icon: Icons.rate_review_outlined,
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
                      icon: Icons.feedback_outlined,
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
                      icon: Icons.menu_book,
                      onTap: () {
                        // Navigator.of(context, rootNavigator: true)
                        //     .push(CupertinoPageRoute(
                        //   builder: (context) => const ReferralScreen(),
                        // ));
                      },
                    ),
                    DrawerTile(
                      title: 'جریمه ها',
                      icon: Icons.warning_amber_rounded,
                      onTap: () {
                        Navigator.of(context).push(CupertinoPageRoute(
                          builder: (context) => Fines(),
                        ));
                      },
                    ),
                    DrawerTile(
                      title: 'خروج از حساب',
                      icon: Icons.exit_to_app,
                      isEnd: true,
                      onTap: () {},
                    ),
                    AppVersionText().marginAll(8),
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

class AppVersionText extends StatefulWidget {
  @override
  _AppVersionTextState createState() => _AppVersionTextState();
}

class _AppVersionTextState extends State<AppVersionText> {
  String appVersion = "در حال دریافت...";

  @override
  void initState() {
    super.initState();
    getAppVersion().then((version) {
      setState(() {
        appVersion = version;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Text(
      appVersion,
      style: TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.bold,
          color: Theme.of(context)
              .colorScheme
              .secondary
              .withAlpha((0.6 * 255).toInt())),
    );
  }
}
