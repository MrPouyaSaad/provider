import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:provider/common/const.dart';

class OrdersPieChart extends StatelessWidget {
  final int totalOrders;
  final int deliveredOrders;
  final int undeliveredOrders;

  OrdersPieChart({
    required this.totalOrders,
    required this.deliveredOrders,
    required this.undeliveredOrders,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        // چارت دایره‌ای
        AspectRatio(
          aspectRatio: 1,
          child: Stack(
            alignment: Alignment.center,
            children: [
              PieChart(
                PieChartData(
                  sections: _buildPieChartSections(),
                  centerSpaceRadius: 60, // فضای خالی وسط دایره
                  sectionsSpace: 2, // فضای بین بخش‌ها
                ),
              ),
              // نمایش تعداد کل سفارشات در وسط دایره
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'سفارشات کل',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    '$totalOrders',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ],
          ),
        ),
        SizedBox(height: 16), // فاصله بین چارت و راهنما
        // راهنما در پایین نمودار
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            LegendItem(
              color: Colors.green,
              text: 'تحویل داده شده',
            ),
            SizedBox(width: 16), // فاصله بین دو راهنما
            LegendItem(
              color: Colors.red,
              text: 'تحویل داده نشده',
            ),
          ],
        ),
      ],
    );
  }

  // ساخت بخش‌های چارت
  List<PieChartSectionData> _buildPieChartSections() {
    final double deliveredPercentage = (deliveredOrders / totalOrders) * 100;
    final double undeliveredPercentage =
        (undeliveredOrders / totalOrders) * 100;

    return [
      PieChartSectionData(
        value: deliveredOrders.toDouble(),
        title: '${deliveredPercentage.toStringAsFixed(1)}%',
        color: Colors.green,
        radius: 100,
        titleStyle: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
      ),
      PieChartSectionData(
        value: undeliveredOrders.toDouble(),
        title: '${undeliveredPercentage.toStringAsFixed(1)}%',
        color: Colors.red,
        radius: 100,
        titleStyle: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
      ),
    ];
  }
}

// ویجت برای نمایش راهنمای رنگ و متن
class LegendItem extends StatelessWidget {
  final Color color;
  final String text;

  const LegendItem({
    required this.color,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: 16,
          height: 16,
          decoration: BoxDecoration(
            color: color,
            borderRadius:
                BorderRadius.circular(Constants.primaryRadiusValue / 2),
          ),
        ),
        SizedBox(width: 8), // فاصله بین رنگ و متن
        Text(
          text,
          style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}
