import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vizi_dasht/widgets/decorated_container.dart';

import '../../common/const.dart';

class BestProductsList extends StatelessWidget {
  BestProductsList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          crossAxisSpacing: 8,
          mainAxisSpacing: Constants.primaryPadding / 2,
          childAspectRatio: 0.65),
      itemCount: 6,
      shrinkWrap: true,
      padding: EdgeInsets.symmetric(horizontal: Constants.primaryPadding),
      physics: NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        final String img = '1509547706.jpg';

        return BestProductListItem(
          imagePath: 'assets/images/$img',
          onTap: () {
            // Navigator.push(
            //   context,
            //   MaterialPageRoute(
            //     builder: (context) => ProductListScreen(),
            //   ),
            // );
          },
        );
      },
    ).marginOnly(top: Constants.primaryPadding);
  }
}

class BestProductListItem extends StatelessWidget {
  const BestProductListItem({
    Key? key,
    required this.imagePath,
    required this.onTap,
  }) : super(key: key);

  final String imagePath;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.surface,
          boxShadow: Constants.primaryBoxShadow(context,
              blurRadius: 6, colorOpacity: 0.1),
          borderRadius: Constants.primaryRadius,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(),
            Image.asset(
              imagePath,
              fit: BoxFit.contain,
            ),
            Container(
              margin: EdgeInsets.only(bottom: 8),
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.primary.withOpacity(0.12),
                borderRadius: Constants.primaryRadius,
              ),
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      'تعداد',
                      style:
                          TextStyle(fontSize: 10, fontWeight: FontWeight.bold),
                    ),
                  ),
                  MyDecoratedContainer(
                    color: Theme.of(context).primaryColor,
                    child: Text(
                      '1,453',
                      style: TextStyle(
                          color: Theme.of(context).colorScheme.surface,
                          fontSize: 10,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ).paddingOnly(right: 6),
            ).marginSymmetric(horizontal: 8)
          ],
        ),
      ),
    );
  }
}
