import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:vizi_dasht/common/const.dart';
import 'package:vizi_dasht/screens/oreders/bloc/orders_bloc.dart';
import 'package:vizi_dasht/screens/oreders/order_details_screen.dart';
import 'package:vizi_dasht/widgets/loading/orders.dart';
import '../../widgets/deliveri_message.dart';
import '../../widgets/new_label.dart';

class OrdersScreen extends StatelessWidget {
  const OrdersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context);
    final style = TextStyle(
      fontSize: 12,
      fontWeight: FontWeight.bold,
      color: themeData.colorScheme.secondary,
    );
    return Directionality(
      textDirection: TextDirection.rtl,
      child: BlocProvider(
        create: (context) => OrdersBloc()..add(OrdersStarted()),
        child: BlocBuilder<OrdersBloc, OrdersState>(
          builder: (context, state) {
            if (state is OrdersLoading) {
              return OrdersShimmer();
            } else
              return Scaffold(
                appBar: AppBar(
                  title: Text('سفارشات'),
                  centerTitle: true,
                  leading: IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.history,
                      size: 24,
                      opticalSize: 24,
                    ),
                  ),
                ),
                body: SafeArea(
                  child: ListView.builder(
                    itemCount: 10,
                    padding: EdgeInsets.symmetric(
                        vertical: Constants.primaryPadding,
                        horizontal: Constants.primaryPadding),
                    itemBuilder: (context, index) {
                      final bool isDeliver = index == 0;
                      if (isDeliver) return DeliveriMessage();
                      return GestureDetector(
                        onTap: () {
                          Navigator.of(context).push(
                            CupertinoPageRoute(
                              builder: (context) =>
                                  OrderDetailsScreen(orderId: index),
                            ),
                          );
                        },
                        child: Container(
                          // padding: EdgeInsets.all(12),
                          margin: EdgeInsets.symmetric(
                              vertical: Constants.primaryPadding / 2),
                          decoration: BoxDecoration(
                            borderRadius: Constants.primaryRadius,
                            color: themeData.colorScheme.surface,
                            boxShadow: Constants.primaryBoxShadow(context,
                                colorOpacity: 0.03,
                                shadowColor: themeData
                                    .colorScheme.surfaceContainerHighest),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        '10,821,000 تومان',
                                        style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.bold,
                                          color:
                                              themeData.colorScheme.onSurface,
                                        ),
                                      ),
                                      SizedBox(height: 4),
                                      Row(
                                        children: [
                                          if (index.isEven)
                                            LabelContainer(
                                              text: 'جدید',
                                              gradient: Constants
                                                  .primaryGradientColors,
                                            ).marginOnly(left: 8),
                                        ],
                                      )
                                    ],
                                  ),
                                  Column(
                                    children: [
                                      Text('تاریخ: 2024/09/15', style: style),
                                      SizedBox(height: 8),
                                      Text('ساعت: 12:53:12', style: style),
                                    ],
                                  ),
                                ],
                              ).marginOnly(top: 16, left: 16, right: 16),
                              SizedBox(
                                height: 104,
                                child: ListView.builder(
                                  padding: EdgeInsets.symmetric(vertical: 16),
                                  scrollDirection: Axis.horizontal,
                                  itemCount: 5,
                                  itemBuilder: (context, itemIndex) {
                                    return Container(
                                      height: 72,
                                      width: 72,
                                      padding: EdgeInsets.all(4),
                                      margin: EdgeInsets.symmetric(
                                        horizontal: 8,
                                      ),
                                      decoration: BoxDecoration(
                                        borderRadius: Constants.primaryRadius,
                                        color: themeData.colorScheme.surface,
                                        boxShadow: Constants.primaryBoxShadow(
                                            blurRadius: 4,
                                            colorOpacity: 0.05,
                                            context),
                                      ),
                                      child: ClipRRect(
                                        borderRadius: Constants.primaryRadius,
                                        child: Image.asset(
                                          'assets/images/1526890419.jpg',
                                        ),
                                      ),
                                    );
                                  },
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
              );
          },
        ),
      ),
    );
  }
}
