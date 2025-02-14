import 'package:flutter/material.dart';

import '../common/const.dart';

class FactorItem extends StatelessWidget {
  const FactorItem({
    super.key,
    required this.title,
    required this.secTitle,
    this.color,
    this.isSelectable = false,
    this.textColor,
  });
  final String title;
  final String secTitle;
  final Color? color;
  final Color? textColor;
  final bool isSelectable;
  @override
  Widget build(BuildContext context) {
    final ptimaryTextColor = textColor ?? Color(0xff52525b);
    final secTextStyle = TextStyle(
        fontSize: 12, color: ptimaryTextColor, fontWeight: FontWeight.bold);
    return Container(
      padding: const EdgeInsets.symmetric(
        vertical: Constants.primaryPadding / 3,
        horizontal: Constants.primaryPadding / 2,
      ),
      margin:
          const EdgeInsets.symmetric(vertical: Constants.primaryPadding / 3),
      decoration: BoxDecoration(
        borderRadius: Constants.primaryRadius,
        color: color ?? const Color(0xfff3f4f6),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(
                fontSize: 12,
                color: ptimaryTextColor,
                fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            width: Constants.primaryPadding / 2,
          ),
          Expanded(
            child: isSelectable
                ? SelectableText(
                    secTitle,
                    style: secTextStyle,
                    textAlign: TextAlign.end,
                  )
                : Text(
                    secTitle,
                    style: secTextStyle,
                    textAlign: TextAlign.end,
                  ),
          ),
        ],
      ),
    );
  }
}
