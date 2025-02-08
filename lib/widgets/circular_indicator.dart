import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';

class ProfileCircularIndicator extends StatelessWidget {
  const ProfileCircularIndicator({
    super.key,
    required this.title,
    required this.amount,
  });

  final String title;
  final double amount;

  @override
  Widget build(BuildContext context) {
    String rate = 'نامشخص';
    IconData icon = CupertinoIcons.question_circle_fill;
    Color iconColor = Colors.grey;
    Color primaryColor = Colors.grey;

    final themeData = Theme.of(context);

    if (amount > 0.9) {
      rate = 'عالی';
      icon = CupertinoIcons.checkmark_alt_circle_fill;
      iconColor = themeData.colorScheme.tertiary;
      primaryColor = themeData.colorScheme.tertiary.withOpacity(0.75);
    } else if (amount > 0.7) {
      rate = 'خوب';
      icon = CupertinoIcons.checkmark_alt_circle_fill;
      iconColor = themeData.colorScheme.primaryFixedDim;
      primaryColor = themeData.colorScheme.primaryFixedDim.withOpacity(0.75);
    } else if (amount > 0.5) {
      rate = 'متوسط';
      icon = CupertinoIcons.exclamationmark_circle_fill;
      iconColor = themeData.colorScheme.secondaryContainer;
      primaryColor = themeData.colorScheme.secondaryContainer.withOpacity(0.75);
    } else {
      rate = 'ضعیف';
      icon = CupertinoIcons.xmark_circle_fill;
      iconColor = themeData.colorScheme.errorContainer;
      primaryColor = themeData.colorScheme.errorContainer.withOpacity(0.75);
    }

    return Expanded(
      child: Container(
        padding: const EdgeInsets.all(8),
        margin: EdgeInsets.symmetric(horizontal: 4),
        decoration: BoxDecoration(
          border: Border.all(
            width: 0.5,
            color: themeData.colorScheme.secondary.withOpacity(0.5),
          ),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          children: [
            Text(
              title,
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.bold,
                color: Theme.of(context).colorScheme.secondary,
              ),
            ),
            SizedBox(height: 8),
            TweenAnimationBuilder<double>(
              tween: Tween(begin: 0, end: amount),
              duration: const Duration(seconds: 2),
              builder: (context, value, _) {
                return CircularPercentIndicator(
                  radius: 35.0,
                  lineWidth: 5.0,
                  percent: value,
                  center: Text(
                    "${(value * 100).toStringAsFixed(0)}%",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: primaryColor,
                    ),
                  ),
                  progressColor: primaryColor,
                  backgroundColor: Colors.grey.shade300,
                );
              },
            ),
            SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  rate,
                  style: TextStyle(
                    fontSize: 10,
                    fontWeight: FontWeight.bold,
                    color: iconColor,
                  ),
                ),
                const SizedBox(width: 2),
                Icon(
                  icon,
                  size: 18,
                  color: iconColor,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
