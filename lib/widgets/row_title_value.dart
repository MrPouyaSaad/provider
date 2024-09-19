import 'package:flutter/material.dart';

import '../common/const.dart';

class RowTitleValue extends StatelessWidget {
  const RowTitleValue({
    super.key,
    required this.title,
    required this.amount,
    required this.color,
  });
  final String title;
  final String amount;
  final Color color;
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
      decoration:
          BoxDecoration(borderRadius: Constants.primaryRadius, color: color),
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
