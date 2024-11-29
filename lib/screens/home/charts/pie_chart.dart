import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:vizi_dasht/common/const.dart';

class OrdersPieChart extends StatefulWidget {
  final int totalOrders;
  final int deliveredOrders;
  final int undeliveredOrders;

  OrdersPieChart({
    required this.totalOrders,
    required this.deliveredOrders,
    required this.undeliveredOrders,
  });

  @override
  _OrdersPieChartState createState() => _OrdersPieChartState();
}

class _OrdersPieChartState extends State<OrdersPieChart> {
  int touchedIndex = -1;

  @override
  Widget build(BuildContext context) {
    final Color delivered = Theme.of(context).primaryColor;
    final Color unDelivered = Theme.of(context).colorScheme.errorContainer;
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        AspectRatio(
          aspectRatio: 1,
          child: Stack(
            alignment: Alignment.center,
            children: [
              PieChart(
                PieChartData(
                  sections: _buildPieChartSections(delivered, unDelivered),
                  centerSpaceRadius: 60,
                  sectionsSpace: 2,
                  pieTouchData: PieTouchData(
                    touchCallback: (FlTouchEvent event, pieTouchResponse) {
                      setState(() {
                        if (!event.isInterestedForInteractions ||
                            pieTouchResponse == null ||
                            pieTouchResponse.touchedSection == null) {
                          touchedIndex = -1;
                          return;
                        }
                        touchedIndex = pieTouchResponse
                            .touchedSection!.touchedSectionIndex;
                      });
                    },
                  ),
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'سفارشات کل',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    '${widget.totalOrders}',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ],
          ),
        ),
        SizedBox(height: 16),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            LegendItem(
              color: delivered,
              text: 'تحویل داده شده',
            ),
            SizedBox(width: 16),
            LegendItem(
              color: unDelivered,
              text: 'تحویل داده نشده',
            ),
          ],
        ),
      ],
    );
  }

  List<PieChartSectionData> _buildPieChartSections(
      Color delivered, Color unDelivered) {
    final double deliveredPercentage =
        (widget.deliveredOrders / widget.totalOrders) * 100;
    final double undeliveredPercentage =
        (widget.undeliveredOrders / widget.totalOrders) * 100;

    return [
      PieChartSectionData(
        value: widget.deliveredOrders.toDouble(),
        title: touchedIndex == 0
            ? "${deliveredPercentage.toStringAsFixed(1)}%\n${widget.deliveredOrders}"
            : '${deliveredPercentage.toStringAsFixed(1)}%',
        color: delivered,
        radius: touchedIndex == 0 ? 110 : 100, // افزایش اندازه در صورت لمس
        titleStyle: TextStyle(
          fontSize: touchedIndex == 0 ? 22 : 16,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
      ),
      PieChartSectionData(
        value: widget.undeliveredOrders.toDouble(),
        title: touchedIndex == 1
            ? "${undeliveredPercentage.toStringAsFixed(1)}%\n${widget.undeliveredOrders}"
            : '${undeliveredPercentage.toStringAsFixed(1)}%',
        color: unDelivered,
        radius: touchedIndex == 1 ? 110 : 100, // افزایش اندازه در صورت لمس
        titleStyle: TextStyle(
          fontSize: touchedIndex == 1 ? 22 : 16,
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
        SizedBox(width: 8),
        Text(
          text,
          style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}
