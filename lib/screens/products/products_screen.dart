import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vizi_dasht/screens/products/add_product/add_product_details.dart';
import 'package:vizi_dasht/screens/products/add_product/select_category.dart';

import '../../common/const.dart';
import '../../widgets/text_field.dart';

class ProductsScreen extends StatelessWidget {
  const ProductsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context);

    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => AddProduct(),
            ),
          );
        },
        child: Icon(Icons.add),
      ),
      body: SafeArea(
        child: NestedScrollView(
          headerSliverBuilder: (context, innerBoxIsScrolled) {
            return [
              SliverAppBar(
                backgroundColor: themeData.colorScheme.surface,
                shadowColor: themeData.colorScheme.surface,
                surfaceTintColor: themeData.colorScheme.surface,
                toolbarHeight: 72,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(18),
                    bottomRight: Radius.circular(18),
                  ),
                ),
                title: MyTextField(
                  textAlign: TextAlign.right,
                  textAlignVertical: TextAlignVertical.center,
                  hintText: 'جستجو',
                  isDense: true,
                  alignLabelWithHint: true,
                  prefixIcon: Icon(
                    Icons.search,
                    size: 26,
                  ),
                ).marginOnly(top: 12),
                automaticallyImplyLeading: false,
                centerTitle: true,
                elevation: 1.0,
                floating: true,
                pinned: false,
                snap: true,
              ),
            ];
          },
          body: ListView.builder(
            itemCount: 10,
            padding: EdgeInsets.fromLTRB(
                Constants.primaryPadding, 8, Constants.primaryPadding, 78),
            itemBuilder: (context, index) {
              final count = index == 3
                  ? 0
                  : index == 1
                      ? 5
                      : 15;
              bool isEmpty = count == 0;
              return GestureDetector(
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => AddProductDetails(
                        id: index,
                        isEdit: true,
                      ),
                    ),
                  );
                },
                child: Container(
                  padding: EdgeInsets.all(12),
                  margin: EdgeInsets.symmetric(
                      vertical: Constants.primaryPadding / 2),
                  decoration: BoxDecoration(
                    borderRadius: Constants.primaryRadius,
                    color: isEmpty
                        ? Colors.grey.shade200
                        : themeData.colorScheme.surface,
                    boxShadow: Constants.primaryBoxShadow(context),
                  ),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Stack(
                            children: [
                              SizedBox(
                                  width: 54,
                                  height: 54,
                                  child: Image.asset(
                                      'assets/images/1509547706.jpg')),
                              if (count == 0)
                                Container(
                                  width: 54,
                                  height: 54,
                                  color: Colors.grey.withOpacity(0.35),
                                )
                            ],
                          ),
                          SizedBox(width: Constants.primaryPadding / 2),
                          Expanded(
                            child: Text(
                              'پاستا نیمه آماده پنه ریگاته با سبزیجات 180 گرمی تک‌ماکارون',
                              style: TextStyle(
                                fontSize: 14,
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: Constants.primaryPadding),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          isEmpty
                              ? Text(
                                  'ناموجود',
                                  style: TextStyle(
                                      fontSize: 13,
                                      fontWeight: FontWeight.bold,
                                      color: themeData.colorScheme.secondary),
                                )
                              : Text.rich(
                                  TextSpan(
                                    text: '$count بسته ',
                                    style: TextStyle(
                                        fontSize: 13,
                                        color: count <= 5
                                            ? themeData
                                                .colorScheme.errorContainer
                                            : null,
                                        fontWeight: FontWeight.bold),
                                    children: [
                                      TextSpan(
                                        text: 'باقیمانده ',
                                        style: TextStyle(
                                          color: count <= 5
                                              ? themeData
                                                  .colorScheme.errorContainer
                                                  .withOpacity(0.7)
                                              : themeData.colorScheme.secondary,
                                          fontSize: 11,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                          SizedBox(width: Constants.primaryPadding / 2),
                          Flexible(
                            child: Container(
                              padding: EdgeInsets.symmetric(
                                  vertical: 6, horizontal: 8),
                              decoration: BoxDecoration(
                                color: count == 0
                                    ? themeData.colorScheme.secondary
                                    : themeData.colorScheme.primary,
                                borderRadius: Constants.primaryRadius,
                              ),
                              child: Text(
                                '580,000 تومان',
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                  color: themeData.colorScheme.surface,
                                  fontSize: 13,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
