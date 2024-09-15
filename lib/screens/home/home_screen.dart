import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/common/const.dart';
import 'charts/pie_chart.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);
    final barBorderRadius = BorderRadius.vertical(
      top: Radius.circular(12),
    );
    return Scaffold(
      appBar: AppBar(
        elevation: 1,
        backgroundColor: themeData.colorScheme.surface,
        title: Text('ویزی دشت'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.all(12),
              decoration: BoxDecoration(
                boxShadow: Constants.primaryBoxShadow(context),
                borderRadius: Constants.primaryRadius,
                color: themeData.colorScheme.primary,
              ),
              child: Column(
                children: [
                  SalaryWidget(
                    title: 'درامد کل:',
                    amount: '150,000,000 تومان',
                  ),
                  SizedBox(height: Constants.primaryPadding / 2),
                  SalaryWidget(
                    title: 'واریز نشده:',
                    amount: '18,000,000 تومان',
                  ),
                ],
              ),
            ),
            //?Divider
            MyDivider(),
            //? Sales Chart
            DashboardTitle(title: 'میزان فروش ماهانه'),
            AspectRatio(
              aspectRatio: 1,
              child: LineChart(
                LineChartData(
                  gridData: FlGridData(show: true),
                  titlesData: FlTitlesData(
                    rightTitles:
                        AxisTitles(sideTitles: SideTitles(showTitles: false)),
                    topTitles:
                        AxisTitles(sideTitles: SideTitles(showTitles: false)),
                    //?--------------------------
                    bottomTitles: AxisTitles(
                      sideTitles: SideTitles(
                        showTitles: true,
                        reservedSize: 50,
                        getTitlesWidget: bottomTitles,
                      ),
                    ),
                    //?------------------------
                    leftTitles: AxisTitles(
                      sideTitles: SideTitles(
                        showTitles: true,
                        reservedSize: 40,
                        getTitlesWidget: (value, meta) {
                          const style = TextStyle(
                            fontSize: 14,
                          );
                          return Padding(
                            padding: const EdgeInsets.only(right: 4),
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
                  borderData: FlBorderData(show: true),
                  lineBarsData: [
                    LineChartBarData(
                      spots: [
                        FlSpot(1, 200),
                        FlSpot(2, 450),
                        FlSpot(3, 350),
                        FlSpot(4, 600),
                        FlSpot(5, 800),
                        FlSpot(6, 900),
                        FlSpot(8, 1200),
                        FlSpot(9, 950),
                        FlSpot(10, 750),
                        FlSpot(11, 900),
                        FlSpot(12, 1800),
                      ],
                      isCurved: true,
                      color: Colors.blue,
                      dotData: FlDotData(show: true),
                      belowBarData: BarAreaData(
                          show: true, color: Colors.blue.withOpacity(0.3)),
                    ),
                  ],
                ),
              ),
            ),
            //?Divider
            MyDivider(),
            //? Orders Chart
            DashboardTitle(title: 'تعداد سفارشات ماهانه'),
            AspectRatio(
              aspectRatio: 1,
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
                        getTitlesWidget: bottomTitles,
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
                  borderData: FlBorderData(show: true),
                  gridData: FlGridData(show: true),
                  barGroups:
                      getBarChartData(), // تابع برای دریافت داده‌های بهینه‌شده
                ),
              ),
            ),

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

    return List.generate(12, (index) {
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

  Widget bottomTitles(double value, TitleMeta meta) {
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

class MyDivider extends StatelessWidget {
  const MyDivider({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);
    return Divider(color: themeData.colorScheme.secondary)
        .marginOnly(top: Constants.primaryPadding, left: 4, right: 4);
  }
}

class DashboardTitle extends StatelessWidget {
  const DashboardTitle(
      {super.key, required this.title, this.isBottomPadding = true});
  final String title;
  final bool isBottomPadding;
  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
    ).marginOnly(
        top: Constants.primaryPadding,
        bottom: isBottomPadding ? Constants.primaryPadding : 0);
  }
}

class SalaryWidget extends StatelessWidget {
  const SalaryWidget({
    super.key,
    required this.title,
    required this.amount,
  });
  final String title;
  final String amount;
  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);
    final TextStyle style = TextStyle(
      fontSize: 14,
      wordSpacing: -2,
      letterSpacing: -0.1,
      fontWeight: FontWeight.bold,
      color: themeData.colorScheme.surface,
    );
    return Container(
      padding: EdgeInsets.all(Constants.primaryPadding / 2),
      decoration: BoxDecoration(
          borderRadius: Constants.primaryRadius,
          color: themeData.colorScheme.primaryFixedDim),
      child: Row(
        children: [
          Text(
            title,
            style: style,
          ),
          Expanded(
              child: Text(
            amount,
            style: style,
            textAlign: TextAlign.left,
          )),
        ],
      ),
    );
  }
}
