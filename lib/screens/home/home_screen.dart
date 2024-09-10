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
                    bottomTitles: AxisTitles(
                      sideTitles: SideTitles(
                          showTitles: true, getTitlesWidget: bottomTitles),
                    ),
                    leftTitles: AxisTitles(
                      sideTitles: SideTitles(
                        showTitles: true,
                        reservedSize: 40, // حاشیه بیشتر برای نمایش اعداد
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
                        FlSpot(7, 1200),
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
                          showTitles: true, getTitlesWidget: bottomTitles),
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
                  barGroups: [
                    BarChartGroupData(
                      x: 1,
                      barRods: [
                        BarChartRodData(
                          toY: 10,
                          color: Colors.orange,
                          borderRadius: barBorderRadius,
                        )
                      ],
                    ),
                    BarChartGroupData(x: 2, barRods: [
                      BarChartRodData(
                        toY: 15,
                        color: Colors.orange,
                        borderRadius: barBorderRadius,
                      )
                    ]),
                    BarChartGroupData(x: 3, barRods: [
                      BarChartRodData(
                        toY: 8,
                        color: Colors.orange,
                        borderRadius: barBorderRadius,
                      )
                    ]),
                    BarChartGroupData(x: 4, barRods: [
                      BarChartRodData(
                        toY: 12,
                        color: Colors.orange,
                        borderRadius: barBorderRadius,
                      )
                    ]),
                    BarChartGroupData(x: 5, barRods: [
                      BarChartRodData(
                        toY: 18,
                        color: Colors.orange,
                        borderRadius: barBorderRadius,
                      )
                    ]),
                    BarChartGroupData(x: 6, barRods: [
                      BarChartRodData(
                        toY: 20,
                        color: Colors.orange,
                        borderRadius: barBorderRadius,
                      )
                    ]),
                    BarChartGroupData(x: 7, barRods: [
                      BarChartRodData(
                        toY: 25,
                        color: Colors.orange,
                        borderRadius: barBorderRadius,
                      )
                    ]),
                  ],
                  borderData: FlBorderData(show: true),
                  gridData: FlGridData(show: true),
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

  Widget bottomTitles(double value, TitleMeta meta) {
    const style = TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: 12,
    );
    Widget text;
    switch (value.toInt()) {
      case 1:
        text = Text('فروردین', style: style);
        break;
      case 2:
        text = Text('اردیبهشت', style: style);
        break;
      case 3:
        text = Text('خرداد', style: style);
        break;
      case 4:
        text = Text('تیر', style: style);
        break;
      case 5:
        text = Text('مرداد', style: style);
        break;
      case 6:
        text = Text('شهریور', style: style);
        break;
      case 7:
        text = Text('مهر', style: style);
        break;
      default:
        text = Text('');
        break;
    }
    return SideTitleWidget(
      axisSide: meta.axisSide,
      child: text,
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
