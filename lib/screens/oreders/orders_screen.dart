import 'package:flutter/material.dart';
import 'package:provider/common/const.dart';

class OrdersScreen extends StatelessWidget {
  const OrdersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context);
    return Scaffold(
      body: SafeArea(
        child: ListView.builder(
          itemCount: 10,
          padding: EdgeInsets.symmetric(horizontal: Constants.primaryPadding),
          itemBuilder: (context, index) {
            return Container(
              padding: EdgeInsets.all(12),
              margin:
                  EdgeInsets.symmetric(vertical: Constants.primaryPadding / 2),
              decoration: BoxDecoration(
                borderRadius: Constants.primaryRadius,
                color: themeData.colorScheme.error,
                boxShadow: Constants.primaryBoxShadow(context),
              ),
              child: Column(
                children: [Text('سفارش')],
              ),
            );
          },
        ),
      ),
    );
  }
}
