import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';
import 'package:vizi_dasht/common/const.dart';
import 'package:vizi_dasht/screens/home/finance.dart';
import 'package:vizi_dasht/screens/products/best_products_list.dart';
import 'package:vizi_dasht/widgets/button.dart';
import 'package:vizi_dasht/widgets/custom_shadow_box.dart';
import 'package:vizi_dasht/widgets/factor.dart';
import 'package:vizi_dasht/widgets/loading/dashboard.dart';
import 'package:vizi_dasht/widgets/loading/orders.dart';
import 'package:vizi_dasht/widgets/loading/shimmer.dart';
import '../../widgets/circular_indicator.dart';
import '../../widgets/decorated_container.dart';
import '../../widgets/dvider.dart';
import '../../widgets/title.dart';
import 'bloc/home_bloc.dart';
import 'charts/pie_chart.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);
    List<int> dailySales = [10, 15, 8, 12, 18, 20, 1];
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        centerTitle: true,
        title: Image.asset('assets/images/ViziDasht-Logo.png', width: 150),
      ),
      body: SingleChildScrollView(
        child: BlocProvider(
          create: (context) => HomeBloc()..add(HomeStarted()),
          child: BlocBuilder<HomeBloc, HomeState>(
            builder: (context, state) {
              if (state is HomeLoading) {
                return DashboardShimmer();
              } else
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        DashboardTitle(
                            title: 'میزان رضایت', isBottomPadding: false),
                        Text.rich(TextSpan(children: [
                          TextSpan(
                              text: '88% ',
                              style: TextStyle(
                                  fontSize: 13, fontWeight: FontWeight.bold)),
                          TextSpan(
                              text: 'از 16 نظر',
                              style: TextStyle(
                                  wordSpacing: -3,
                                  fontSize: 11,
                                  color: themeData.colorScheme.secondary)),
                        ])),
                      ],
                    ),
                    SizedBox(height: Constants.primaryPadding),

                    RatingSection(
                      withoutReturn: 1.0, // 100%
                      withoutCancel: 1.0, // 100%
                      onTimeDelivery: 1.0, // 100%
                    ),
                    //?Divider
                    MyDivider(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        DashboardTitle(
                            title: 'گزارش مالی', isBottomPadding: false),
                        MyTextButton(
                          title: 'جزئیات',
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => FinanceScreen(),
                            ));
                          },
                        )
                      ],
                    ).marginOnly(bottom: Constants.primaryPadding - 2),
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => FinanceScreen(),
                        ));
                      },
                      child: MyDecoratedContainer(
                        color: themeData.colorScheme.primary,
                        child: Column(
                          children: [
                            FactorItem(
                              title: 'درامد کل:',
                              secTitle: '150,000,000 تومان',
                            ),
                            FactorItem(
                              title: 'واریز نشده:',
                              secTitle: '18,000,000 تومان',
                            ),
                          ],
                        ),
                      ),
                    ),

                    //?Divider
                    MyDivider(),

                    DashboardTitle(
                      title: 'گزارش فروش امروز',
                      subTitle: 'تا 15:45:12',
                      isBottomPadding: false,
                    ).marginOnly(bottom: Constants.primaryPadding),
                    MyDecoratedContainer(
                      color: themeData.colorScheme.surfaceContainerHighest,
                      child: Column(
                        children: [
                          FactorItem(
                            title: 'تعداد سفارش:',
                            secTitle: '73',
                            color: themeData.colorScheme.surfaceContainerHigh,
                            textColor: themeData.colorScheme.surface,
                          ),
                          FactorItem(
                            title: 'مبلغ فروش:',
                            secTitle: '192,582,000 تومان',
                            textColor: themeData.colorScheme.surface,
                            color: themeData.colorScheme.surfaceContainerHigh,
                          ),
                        ],
                      ),
                    ),
                    //?Divider
                    MyDivider(),

                    //? best products Chart
                    DashboardTitle(title: 'تعداد سفارش هفتگی'),
                    CustomShadowBox(
                      child: AspectRatio(
                        aspectRatio: 1.5,
                        child: BarChart(
                          BarChartData(
                            alignment: BarChartAlignment.spaceAround,
                            titlesData: FlTitlesData(
                              rightTitles: AxisTitles(
                                  sideTitles: SideTitles(showTitles: false)),
                              topTitles: AxisTitles(
                                sideTitles: SideTitles(
                                  showTitles:
                                      true, // نمایش مقادیر فروش در بالای نمودار
                                  reservedSize: 40,
                                  getTitlesWidget: (value, meta) {
                                    // مقدار فروش را از بار دیتا می‌گیریم نه از اندیس روزها
                                    const style = TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold);
                                    int index =
                                        value.toInt() - 1; // ایندکس مقادیر فروش
                                    if (index >= 0 &&
                                        index < dailySales.length) {
                                      return Text(
                                        dailySales[index]
                                            .toString(), // نمایش مقدار فروش
                                        style: style,
                                        textAlign: TextAlign.center,
                                      );
                                    } else {
                                      return Container(); // برای جلوگیری از ارور در صورت نادرستی مقدار
                                    }
                                  },
                                ),
                              ),
                              bottomTitles: AxisTitles(
                                sideTitles: SideTitles(
                                  reservedSize: 50,
                                  showTitles: true, // نمایش عناوین روزهای هفته
                                  getTitlesWidget:
                                      weekTitles, // تابع برای نمایش روزهای هفته
                                ),
                              ),
                              leftTitles: AxisTitles(
                                sideTitles: SideTitles(
                                    showTitles: false, reservedSize: 40),
                              ),
                            ),
                            borderData: FlBorderData(
                              show: false,
                              border: Border(left: BorderSide(width: 1)),
                            ),
                            gridData: FlGridData(show: false),
                            barGroups: getBarChartWeeklyReport(
                                context), // داده‌های فروش
                            barTouchData: BarTouchData(
                              enabled: true,
                              touchTooltipData: BarTouchTooltipData(
                                getTooltipItem:
                                    (group, groupIndex, rod, rodIndex) {
                                  return BarTooltipItem(
                                    '${rod.toY.toInt()}', // نمایش مقدار فروش
                                    TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white, // رنگ متن Tooltip
                                    ),
                                  );
                                },
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),

                    //? Divider
                    // MyDivider(),
                    //? Sales Chart
                    // DashboardTitle(title: 'میزان فروش ماهانه(تومان)'),
                    // AspectRatio(
                    //   aspectRatio: 1,
                    //   child: LineChart(
                    //     LineChartData(
                    //       gridData: FlGridData(show: false),
                    //       titlesData: FlTitlesData(
                    //         rightTitles:
                    //             AxisTitles(sideTitles: SideTitles(showTitles: false)),
                    //         topTitles:
                    //             AxisTitles(sideTitles: SideTitles(showTitles: false)),
                    //         //?--------------------------
                    //         bottomTitles: AxisTitles(
                    //           sideTitles: SideTitles(
                    //             showTitles: true,
                    //             reservedSize: 50,
                    //             getTitlesWidget: monthTitles,
                    //           ),
                    //         ),
                    //         //?------------------------
                    //         leftTitles: AxisTitles(
                    //           sideTitles: SideTitles(
                    //             showTitles: true,
                    //             reservedSize: 50,
                    //             getTitlesWidget: (value, meta) {
                    //               const style = TextStyle(
                    //                 fontSize: 12,
                    //                 fontWeight: FontWeight.bold,
                    //               );
                    //               return Padding(
                    //                 padding: const EdgeInsets.only(right: 4),
                    //                 child: Text(
                    //                   value.formatToUnits(),
                    //                   style: style,
                    //                   textAlign: TextAlign.center,
                    //                 ),
                    //               );
                    //             },
                    //           ),
                    //         ),
                    //       ),
                    //       borderData: FlBorderData(
                    //         show: true,
                    //         border: Border(
                    //           bottom: BorderSide(width: 1),
                    //           left: BorderSide(width: 1),
                    //         ),
                    //       ),
                    //       lineBarsData: [
                    //         LineChartBarData(
                    //           spots: [
                    //             FlSpot(1, 10000000),
                    //             FlSpot(2, 40000000),
                    //             FlSpot(3, 90000000),
                    //             FlSpot(4, 160000000),
                    //             FlSpot(5, 250000000),
                    //             FlSpot(6, 360000000),
                    //             FlSpot(8, 640000000),
                    //             FlSpot(9, 810000000),
                    //             FlSpot(10, 1000000000),
                    //             FlSpot(11, 1210000000),
                    //             FlSpot(12, 1440000000),
                    //           ],
                    //           isCurved: true,
                    //           color: Colors.blue,
                    //           dotData: FlDotData(show: true),
                    //           belowBarData: BarAreaData(
                    //               show: true, color: Colors.blue.withOpacity(0.3)),
                    //         ),
                    //       ],
                    //     ),
                    //   ),
                    // ),
                    //?Divider
                    MyDivider(),
                    //? Orders Chart
                    DashboardTitle(title: 'تعداد سفارش ماهانه'),
                    CustomShadowBox(
                      child: AspectRatio(
                        aspectRatio: 1.5,
                        child: BarChart(
                          BarChartData(
                            alignment: BarChartAlignment.spaceAround,
                            titlesData: FlTitlesData(
                              rightTitles: AxisTitles(
                                  sideTitles: SideTitles(showTitles: false)),
                              topTitles: AxisTitles(
                                  sideTitles: SideTitles(showTitles: false)),
                              bottomTitles: AxisTitles(
                                sideTitles: SideTitles(
                                  reservedSize: 50,
                                  showTitles: true,
                                  getTitlesWidget: monthTitles,
                                ),
                              ),
                              leftTitles: AxisTitles(
                                sideTitles: SideTitles(
                                  showTitles: true,
                                  reservedSize:
                                      40, // حاشیه بیشتر برای نمایش اعداد
                                  getTitlesWidget: (value, meta) {
                                    const style = TextStyle(fontSize: 14);
                                    return Padding(
                                      padding: EdgeInsets.only(right: 4),
                                      child: Text(
                                        value.toInt().toString(),
                                        style: style,
                                        textAlign: TextAlign.center,
                                      ),
                                    );
                                  },
                                ),
                              ),
                            ),
                            borderData: FlBorderData(
                              show: true,
                              border: Border(
                                bottom: BorderSide(width: 1),
                                left: BorderSide(width: 1),
                              ),
                            ),
                            gridData: FlGridData(show: false),
                            barGroups: getBarChartMonthlyReport(
                                context), // تابع برای دریافت داده‌های بهینه‌شده
                            barTouchData: BarTouchData(
                              enabled: true,
                              touchTooltipData: BarTouchTooltipData(
                                getTooltipItem:
                                    (group, groupIndex, rod, rodIndex) {
                                  return BarTooltipItem(
                                    '${rod.toY.toInt()}', // نمایش مقدار فروش
                                    TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.orange, // رنگ متن Tooltip
                                    ),
                                  );
                                },
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    //?
                    MyDivider(),

                    DashboardTitle(
                      title: 'پرفروش ترین محصولات',
                      isBottomPadding: false,
                    ),
                    BestProductsList(),
                    //? Divider
                    MyDivider(),
                    //? Pie Chart
                    DashboardTitle(
                      title: 'تعداد کل سفارشات',
                      isBottomPadding: false,
                    ),

                    OrdersPieChart(
                      totalOrders: 50,
                      deliveredOrders: 39,
                      undeliveredOrders: 11,
                    ),
                  ],
                );
            },
          ),
        ).paddingAll(Constants.primaryPadding),
      ),
    );
  }

  List<BarChartGroupData> getBarChartMonthlyReport(BuildContext context) {
    List<double> monthlySales = [10, 15, 8, 12, 18, 20, 25, 30, 17, 14, 19, 22];

    return List.generate(monthlySales.length, (index) {
      return BarChartGroupData(
        x: index + 1,
        barRods: [
          BarChartRodData(
            toY: monthlySales[index],
            color: Theme.of(context).colorScheme.secondaryContainer,
            borderRadius: BorderRadius.vertical(
              top: Radius.circular(12),
            ),
          ),
        ],
      );
    });
  }

  List<BarChartGroupData> getBarChartWeeklyReport(BuildContext context) {
    // مقادیر فروش روزانه
    List<int> dailySales = [10, 15, 8, 12, 18, 20, 1];
    return List.generate(dailySales.length, (index) {
      return BarChartGroupData(
        x: index + 1, // مقدار x برای هر روز (از 1 تا 7)
        barRods: [
          BarChartRodData(
            width: 20,
            toY: dailySales[index].toDouble(), // مقدار فروش روزانه
            color: Theme.of(context).colorScheme.primary,
            borderRadius: Constants.primaryRadius,
          ),
        ],
      );
    });
  }

  Widget weekTitles(double value, TitleMeta meta) {
    String text;
    switch (value.toInt()) {
      case 1:
        text = 'شنبه';
        break;
      case 2:
        text = 'یکشنبه';
        break;
      case 3:
        text = 'دوشنبه';
        break;
      case 4:
        text = 'سه شنبه';
        break;
      case 5:
        text = 'چهارشنبه';
        break;
      case 6:
        text = 'پنجشنبه';
        break;
      case 7:
        text = 'جمعه';
        break;
      default:
        text = '';
        break;
    }

    // Apply padding and slight rotation to avoid overlap
    return SideTitleWidget(
      axisSide: meta.axisSide,
      angle: 6,
      space: 2,
      child: Container(
        padding: const EdgeInsets.only(top: 10, right: 8),
        child: Text(
          text,
          textDirection: TextDirection.rtl,
          style: TextStyle(
            wordSpacing: -2,
            fontWeight: FontWeight.bold,
            fontSize: 11,
          ),
        ),
      ),
    );
  }

  Widget monthTitles(double value, TitleMeta meta) {
    String text;
    switch (value.toInt()) {
      case 1:
        text = 'فروردین';
        break;
      case 2:
        text = 'اردیبهشت';
        break;
      case 3:
        text = 'خرداد';
        break;
      case 4:
        text = 'تیر';
        break;
      case 5:
        text = 'مرداد';
        break;
      case 6:
        text = 'شهریور';
        break;
      case 7:
        text = 'مهر';
        break;
      case 8:
        text = 'آبان';
        break;
      case 9:
        text = 'آذر';
        break;
      case 10:
        text = 'دی';
        break;
      case 11:
        text = 'بهمن';
        break;
      case 12:
        text = 'اسفند';
        break;
      default:
        text = '';
        break;
    }

    // Apply padding and slight rotation to avoid overlap
    return SideTitleWidget(
      axisSide: meta.axisSide,
      angle: -70,
      space: 0,
      child: Container(
        padding: const EdgeInsets.only(top: 10, right: 8),
        child: Text(
          text,
          textDirection: TextDirection.rtl,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 11,
          ),
        ),
      ),
    );
  }
}

class RatingSection extends StatelessWidget {
  final double withoutReturn;
  final double withoutCancel;
  final double onTimeDelivery;

  RatingSection({
    required this.withoutReturn,
    required this.withoutCancel,
    required this.onTimeDelivery,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        ProfileCircularIndicator(title: 'بدون برگشتی', amount: withoutReturn),
        ProfileCircularIndicator(title: 'بدون لغو', amount: withoutCancel),
        ProfileCircularIndicator(title: 'ارسال بموقع', amount: onTimeDelivery),
      ],
    );
  }
}
