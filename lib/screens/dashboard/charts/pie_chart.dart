import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:vizi_dasht/common/const.dart';

class OrdersPieChart extends StatefulWidget {
  final int totalOrders;
  final int deliveredOrders;
  final int undeliveredOrders;

  const OrdersPieChart({
    super.key,
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
                  sections: _buildPieChartSections(),
                  centerSpaceRadius: 60,
                  sectionsSpace: 2,
                  startDegreeOffset: 180,
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
                duration: const Duration(milliseconds: 220),
                curve: Curves.easeOut,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'سفارشات کل',
                    textDirection: TextDirection.rtl,
                    style: const TextStyle(
                        fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    '${widget.totalOrders}',
                    style: const TextStyle(
                        fontSize: 26, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ],
          ),
        ),
        const SizedBox(height: 16),
        Wrap(
          spacing: 16,
          runSpacing: 8,
          alignment: WrapAlignment.center,
          children: [
            LegendItem(
              colors: Constants.blueGradientColors,
              text: 'تحویل داده شده',
            ),
            LegendItem(
              colors: Constants.redGradientColors,
              text: 'تحویل داده نشده',
            ),
          ],
        ),
      ],
    );
  }

  List<PieChartSectionData> _buildPieChartSections() {
    if (widget.totalOrders == 0) {
      return [
        PieChartSectionData(
          value: 1,
          color: Colors.grey,
          radius: 100,
          title: "No Data",
          titleStyle: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ];
    }

    final double deliveredPercentage =
        (widget.deliveredOrders / widget.totalOrders) * 100;
    final double undeliveredPercentage =
        (widget.undeliveredOrders / widget.totalOrders) * 100;

    return [
      PieChartSectionData(
        value: widget.deliveredOrders.toDouble(),
        gradient: Constants.myGradient(Constants.blueGradientColors),
        radius: touchedIndex == 0 ? 115 : 100,
        title: "${deliveredPercentage.round()}%",
        titleStyle: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
        badgeWidget: touchedIndex == 0
            ? Text(
                "\n\n${widget.deliveredOrders}",
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 20),
              )
            : null,
        badgePositionPercentageOffset: 0.5,
      ),
      PieChartSectionData(
        value: widget.undeliveredOrders.toDouble(),
        gradient: Constants.myGradient(Constants.redGradientColors),
        radius: touchedIndex == 1 ? 115 : 100,
        title: "${undeliveredPercentage.round()}%",
        titleStyle: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
        badgeWidget: touchedIndex == 1
            ? Text(
                "\n\n${widget.undeliveredOrders}",
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 20),
              )
            : null,
        badgePositionPercentageOffset: 0.5,
      ),
    ];
  }
}

class LegendItem extends StatelessWidget {
  final List<Color> colors;
  final String text;

  const LegendItem({
    super.key,
    required this.colors,
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
            gradient: Constants.myGradient(colors),
            borderRadius:
                BorderRadius.circular(Constants.primaryRadiusValue / 2),
          ),
        ),
        const SizedBox(width: 8),
        Text(
          text,
          textDirection: TextDirection.rtl,
          style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}
