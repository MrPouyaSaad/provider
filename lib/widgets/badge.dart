// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class CounterBadge extends StatelessWidget {
  const CounterBadge({
    super.key,
    required this.value,
    this.isActive = false,
  });
  final int value;
  final bool isActive;
  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context);
    return Visibility(
      visible: value > 0,
      child: Container(
        height: 18,
        width: 18,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          border: isActive
              ? Border.all(width: 1, color: themeData.colorScheme.primary)
              : null,
          shape: BoxShape.circle,
          color: isActive
              ? themeData.colorScheme.surface
              : themeData.colorScheme.primary,
        ),
        child: Text(
          value.toString(),
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 12,
            color: isActive
                ? themeData.colorScheme.primary
                : themeData.colorScheme.surface,
          ),
        ),
      ),
    );
  }
}
