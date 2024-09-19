import 'package:flutter/material.dart';

import '../common/const.dart';

class FactorItem extends StatelessWidget {
  const FactorItem({
    super.key,
    required this.title,
    required this.secTitle,
  });
  final String title;
  final String secTitle;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(Constants.primaryPadding / 3),
      margin: const EdgeInsets.all(Constants.primaryPadding / 3),
      decoration: BoxDecoration(
        borderRadius: Constants.primaryRadius,
        color: const Color(0xfff3f4f6),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
                fontSize: 12,
                color: Color(0xff52525b),
                fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            width: Constants.primaryPadding / 2,
          ),
          Expanded(
            child: SelectableText(
              secTitle,
              style: const TextStyle(
                  fontSize: 12,
                  color: Color(0xff52525b),
                  fontWeight: FontWeight.bold),
              textAlign: TextAlign.end,
            ),
          ),
        ],
      ),
    );
  }
}
