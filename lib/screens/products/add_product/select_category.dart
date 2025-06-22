import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:vizi_dasht/common/const.dart';
import 'package:vizi_dasht/widgets/button.dart';

import 'add_product_details.dart';

class CategorySelectionScreen extends StatefulWidget {
  const CategorySelectionScreen({super.key});

  @override
  State<CategorySelectionScreen> createState() =>
      _CategorySelectionScreenState();
}

class _CategorySelectionScreenState extends State<CategorySelectionScreen> {
  int? selectedCategoryIndex;
  final List<Map<String, dynamic>> categories = [
    {
      'name': 'الکترونیک',
      'icon': Icons.electrical_services,
      'color': Colors.blue
    },
    {'name': 'پوشاک', 'icon': Icons.checkroom, 'color': Colors.pink},
    {'name': 'لوازم خانگی', 'icon': Icons.home, 'color': Colors.orange},
    {
      'name': 'کتاب و لوازم تحریر',
      'icon': Icons.menu_book,
      'color': Colors.purple
    },
    {'name': 'ورزشی', 'icon': Icons.sports_soccer, 'color': Colors.green},
    {'name': 'زیبایی و سلامت', 'icon': Icons.spa, 'color': Colors.teal},
    {'name': 'ابزار', 'icon': Icons.build, 'color': Colors.brown},
    {'name': 'اسباب بازی', 'icon': Icons.toys, 'color': Colors.red},
    {'name': 'خوراکی', 'icon': Icons.fastfood, 'color': Colors.amber},
    {'name': 'دیجیتال', 'icon': Icons.computer, 'color': Colors.indigo},
  ];

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      backgroundColor: Colors.grey[50],
      appBar: AppBar(
        title: const Text("انتخاب دسته بندی محصول"),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(32),
          child: Container(
            padding: EdgeInsets.symmetric(vertical: 8, horizontal: 4),
            alignment: Alignment.center,
            child: Text(
              "لطفاً دسته‌بندی مناسب برای محصول‌تان را انتخاب کنید.",
              textAlign: TextAlign.center,
              style: TextStyle(
                wordSpacing: -2,
                fontWeight: FontWeight.bold,
                color: Colors.grey[600],
                fontSize: 13,
              ),
            ),
          ),
        ),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.transparent,
        foregroundColor: theme.primaryColor,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: SizedBox(
        width: MediaQuery.of(context).size.width - 32,
        height: Constants.primaryButtonHeight,
        child: MyElevatedButton(
          onTap: selectedCategoryIndex == null
              ? null
              : () {
                  // Navigate to next screen
                  Navigator.push(
                    context,
                    CupertinoPageRoute(
                      builder: (context) => AddProductDetails(
                        id: selectedCategoryIndex! + 1,
                      ),
                    ),
                  );
                },
          backgroundColor: selectedCategoryIndex == null
              ? Colors.grey.shade400
              : theme.primaryColor,
          foregroundColor: Colors.white,
          child: const Text(
            "تایید و ادامه",
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: GridView.builder(
              padding:
                  EdgeInsets.only(top: 16, left: 16, right: 16, bottom: 84),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 16.0,
                crossAxisSpacing: 16.0,
                childAspectRatio: 1.2,
              ),
              itemCount: categories.length,
              itemBuilder: (context, index) {
                final category = categories[index];
                final isSelected = selectedCategoryIndex == index;

                return CategoryCard(
                  name: category['name'],
                  icon: category['icon'],
                  color: category['color'],
                  isSelected: isSelected,
                  onTap: () {
                    setState(() {
                      selectedCategoryIndex = isSelected ? null : index;
                    });
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class CategoryCard extends StatelessWidget {
  final String name;
  final IconData icon;
  final Color color;
  final bool isSelected;
  final VoidCallback onTap;

  const CategoryCard({
    super.key,
    required this.name,
    required this.icon,
    required this.color,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        decoration: BoxDecoration(
          color: isSelected ? color.withOpacity(0.1) : Colors.white,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: isSelected ? color : Colors.grey.withOpacity(0.2),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.1),
              blurRadius: 10,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 60,
              height: 60,
              decoration: BoxDecoration(
                color: color.withOpacity(0.2),
                shape: BoxShape.circle,
              ),
              child: Icon(
                icon,
                size: 30,
                color: color,
              ),
            ),
            const SizedBox(height: 12),
            Text(
              name,
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
                color: isSelected ? color : Colors.grey[800],
              ),
            ),
            if (isSelected)
              Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: Icon(
                  Icons.check_circle,
                  color: color,
                  size: 20,
                ),
              ),
          ],
        ),
      ),
    );
  }
}
