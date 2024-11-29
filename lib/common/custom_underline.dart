import 'package:flutter/material.dart';
import 'package:vizi_dasht/common/const.dart';

class CustomUnderLine extends StatelessWidget {
  const CustomUnderLine({
    super.key,
    required this.child,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);
    return Container(
        padding: const EdgeInsets.only(bottom: Constants.primaryPadding / 4),
        decoration: BoxDecoration(
          border: Border(
            bottom:
                BorderSide(width: 1.5, color: themeData.colorScheme.primary),
          ),
        ),
        child: child);
  }
}
