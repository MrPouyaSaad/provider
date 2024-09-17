import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../common/const.dart';

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
          childAspectRatio: 0.75),
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
          border: Border.all(
              color: Theme.of(context).colorScheme.surfaceContainerHighest,
              width: 1),
          borderRadius: Constants.primaryRadius,
        ),
        child: Image.asset(
          imagePath,
          fit: BoxFit.contain,
        ),
      ),
    );
  }
}
