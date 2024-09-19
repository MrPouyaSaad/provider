import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/common/const.dart';

import 'package:provider/screens/home/drawer/drawer.dart';
import 'package:provider/screens/home/drawer/screens/profile/profile_screen.dart';
import 'package:provider/screens/products/products_list.dart';
import 'package:provider/widgets/custom_shadow_box.dart';
import 'package:provider/widgets/factor.dart';
import '../../widgets/decorated_container.dart';
import '../../widgets/dvider.dart';
import '../../widgets/title.dart';
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
        elevation: 1,
        centerTitle: true,
        backgroundColor: themeData.colorScheme.surface,
        title: Text('ویزی دشت'),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            MyDecoratedContainer(
              color: themeData.colorScheme.primary,
              child: Column(
                children: [
                  FactorItem(
                    title: 'درامد کل:',
                    secTitle: '150,000,000 تومان',
                    color: themeData.colorScheme.primaryFixedDim,
                    textColor: themeData.colorScheme.surface,
                  ),
                  FactorItem(
                    title: 'واریز نشده:',
                    secTitle: '18,000,000 تومان',
                    color: themeData.colorScheme.primaryFixedDim,
                    textColor: themeData.colorScheme.surface,
                  ),
                ],
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
                      rightTitles:
                          AxisTitles(sideTitles: SideTitles(showTitles: false)),
                      topTitles: AxisTitles(
                        sideTitles: SideTitles(
                          showTitles: true, // نمایش مقادیر فروش در بالای نمودار
                          reservedSize: 40,
                          getTitlesWidget: (value, meta) {
                            // مقدار فروش را از بار دیتا می‌گیریم نه از اندیس روزها
                            const style = TextStyle(
                                fontSize: 14, fontWeight: FontWeight.bold);
                            int index = value.toInt() - 1; // ایندکس مقادیر فروش
                            if (index >= 0 && index < dailySales.length) {
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
                        sideTitles:
                            SideTitles(showTitles: false, reservedSize: 40),
                      ),
                    ),
                    borderData: FlBorderData(
                      show: false,
                      border: Border(left: BorderSide(width: 1)),
                    ),
                    gridData: FlGridData(show: false),
                    barGroups:
                        getBarChartProductsSaleData(context), // داده‌های فروش
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
                      rightTitles:
                          AxisTitles(sideTitles: SideTitles(showTitles: false)),
                      topTitles:
                          AxisTitles(sideTitles: SideTitles(showTitles: false)),
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
                          reservedSize: 40, // حاشیه بیشتر برای نمایش اعداد
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
                    barGroups:
                        getBarChartData(), // تابع برای دریافت داده‌های بهینه‌شده
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
              totalOrders: 100,
              deliveredOrders: 85,
              undeliveredOrders: 15,
            ),
          ],
        ).paddingAll(Constants.primaryPadding),
      ),
    );
  }

  List<BarChartGroupData> getBarChartData() {
    // مقادیر مربوط به هر ماه (این مقادیر را می‌توان دینامیک کرد)
    List<double> monthlySales = [10, 15, 8, 12, 18, 20, 25, 30, 17, 14, 19, 22];

    return List.generate(monthlySales.length, (index) {
      // تولید داده‌ها برای هر ماه
      return BarChartGroupData(
        x: index + 1, // شماره ماه
        barRods: [
          BarChartRodData(
            toY: monthlySales[index], // مقدار فروش ماهانه
            color: Colors.orange,
            borderRadius: BorderRadius.vertical(
              top: Radius.circular(12),
            ),
          ),
        ],
      );
    });
  }

  List<BarChartGroupData> getBarChartProductsSaleData(BuildContext context) {
    // مقادیر فروش روزانه
    List<int> dailySales = [10, 15, 8, 12, 18, 20, 1];
    return List.generate(dailySales.length, (index) {
      return BarChartGroupData(
        x: index + 1, // مقدار x برای هر روز (از 1 تا 7)
        barRods: [
          BarChartRodData(
            width: 20,
            toY: dailySales[index].toDouble(), // مقدار فروش روزانه
            color: Theme.of(context).colorScheme.tertiary,
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
