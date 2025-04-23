import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vizi_dasht/common/const.dart';
import 'package:vizi_dasht/widgets/button.dart';
import 'package:vizi_dasht/widgets/text_field.dart';

class AddProductDetails extends StatefulWidget {
  final int id;
  final bool isEdit;

  const AddProductDetails({
    Key? key,
    required this.id,
    this.isEdit = false,
  }) : super(key: key);

  @override
  State<AddProductDetails> createState() => _AddProductDetailsState();
}

class _AddProductDetailsState extends State<AddProductDetails> {
  String? selectedProduct;
  bool isDiscount = false;
  final _formKey = GlobalKey<FormState>();
  final discountController = TextEditingController();
  final scrollController = ScrollController();

  // Sample product data
  final List<Map<String, String>> products = [
    {
      'name': 'روغن کنجد بی بو 450 میلی‌لیتری احمد اردایران',
      'image': 'assets/images/1526890419.jpg',
      'code': 'PRD-001'
    },
    {
      'name': 'ماکارونی فرمی شوئینگر هورنلی 500 گرمی تک‌ماکارون',
      'image': 'assets/images/6260100320116(1).jpg',
      'code': 'PRD-002'
    },
    {
      'name': 'پاستا نیمه آماده پنه ریگاته با سبزیجات 180 گرمی تک‌ماکارون',
      'image': 'assets/images/1509547706.jpg',
      'code': 'PRD-003'
    },
  ];

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.isEdit ? 'ویرایش محصول' : 'جزئیات محصول'),
        centerTitle: true,
        actions: widget.isEdit
            ? [
                IconButton(
                  onPressed: () => _showDeleteDialog(),
                  icon: Icon(Icons.delete_outline,
                      color: theme.colorScheme.error),
                  tooltip: 'حذف محصول',
                )
              ]
            : null,
      ),
      body: SingleChildScrollView(
        controller: scrollController,
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (!widget.isEdit) _buildProductSelector(theme),
            if (selectedProduct != null || widget.isEdit)
              _buildSelectedProductCard(theme),
            const SizedBox(height: 24),
            Form(
              key: _formKey,
              child: Column(
                children: [
                  _buildInputSection(theme),
                  const SizedBox(height: 16),
                  _buildPricingSection(theme),
                  const SizedBox(height: 24),
                  _buildSubmitButton(theme),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildProductSelector(ThemeData theme) {
    return Card(
      elevation: 3,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      shadowColor: theme.colorScheme.primary.withOpacity(0.1),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(Icons.search, color: theme.primaryColor),
                const SizedBox(width: 8),
                Text(
                  'انتخاب محصول',
                  style: theme.textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: theme.primaryColor,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            DropdownSearch<String>(
              popupProps: PopupProps.menu(
                showSearchBox: true,
                searchFieldProps: const TextFieldProps(
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.search, size: 20),
                    border: OutlineInputBorder(),
                    labelText: 'جستجو',
                  ),
                ),
                itemBuilder: (context, item, isSelected) {
                  final product =
                      products.firstWhere((product) => product['name'] == item);
                  return ListTile(
                    leading: Image.asset(
                      product['image']!,
                      width: 40,
                      height: 40,
                      fit: BoxFit.cover,
                    ),
                    title: Text(
                      product['name']!,
                      style: const TextStyle(fontSize: 14),
                    ),
                  );
                },
                menuProps: MenuProps(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              items: products.map((product) => product['name']!).toList(),
              dropdownDecoratorProps: DropDownDecoratorProps(
                dropdownSearchDecoration: InputDecoration(
                  // labelText: 'انتخاب محصول',
                  hintText: 'محصول مورد نظر را انتخاب کنید',
                  alignLabelWithHint: true,
                  // floatingLabelBehavior: FloatingLabelBehavior.always,

                  contentPadding: EdgeInsets.symmetric(
                    horizontal: Constants.primaryPadding,
                    vertical: 10,
                  ),
                  border: const OutlineInputBorder(),
                ),
                baseStyle: const TextStyle(fontSize: 12),
              ),
              onChanged: (value) {
                setState(() {
                  selectedProduct = value;
                });
              },
              selectedItem: selectedProduct,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSelectedProductCard(ThemeData theme) {
    final product = widget.isEdit
        ? {
            'name': 'محصول نمونه',
            'image': 'assets/images/placeholder.jpg',
            'code': 'PRD-${widget.id}'
          }
        : products.firstWhere((p) => p['name'] == selectedProduct);

    return Card(
      margin: const EdgeInsets.only(top: 16),
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Row(
          children: [
            Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border:
                      Border.all(color: theme.dividerColor.withOpacity(0.3))),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.asset(
                  product['image']!,
                  width: 80,
                  height: 80,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    product['name']!,
                    style: theme.textTheme.bodyLarge?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 6),
                  Row(
                    children: [
                      Icon(Icons.tag, size: 16, color: theme.hintColor),
                      const SizedBox(width: 4),
                      Text(
                        'کد محصول: ${product['code']}',
                        style: theme.textTheme.bodySmall?.copyWith(
                          color: theme.hintColor,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Icon(Icons.check_circle, color: theme.primaryColor),
          ],
        ),
      ),
    );
  }

  Widget _buildInputSection(ThemeData theme) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            _buildSectionHeader(
                icon: Icons.inventory_2, title: 'موجودی و بسته‌بندی'),
            const SizedBox(height: 12),
            _buildFormField(
              label: 'تعداد موجود برای فروش',
              isRequired: true,
              keyboardType: TextInputType.number,
              icon: Icons.store,
            ),
            _buildFormField(
              label: 'تعداد در هر بسته',
              isRequired: true,
              keyboardType: TextInputType.number,
              icon: Icons.layers,
            ),
            _buildFormField(
              label: 'تاریخ انقضاء',
              isRequired: true,
              hint: 'YYYY/MM/DD',
              icon: Icons.calendar_today,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPricingSection(ThemeData theme) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            _buildSectionHeader(icon: Icons.attach_money, title: 'قیمت‌گذاری'),
            const SizedBox(height: 12),
            _buildFormField(
              label: 'قیمت هر بسته',
              isRequired: true,
              keyboardType: TextInputType.number,
              prefix: 'تومان',
              icon: Icons.money,
            ),
            _buildFormField(
              label: 'قیمت 5 بسته',
              isRequired: false,
              keyboardType: TextInputType.number,
              prefix: 'تومان',
              icon: Icons.money,
            ),
            _buildFormField(
              label: 'قیمت 10 بسته',
              isRequired: false,
              keyboardType: TextInputType.number,
              prefix: 'تومان',
              icon: Icons.money,
            ),
            _buildFormField(
              label: 'قیمت مصرف کننده (روی جلد)',
              isRequired: true,
              keyboardType: TextInputType.number,
              prefix: 'تومان',
              icon: Icons.price_check,
            ),
            _buildFormField(
              label: 'درصد تخفیف',
              isRequired: false,
              keyboardType: TextInputType.number,
              prefix: '%',
              hint: '0-99',
              icon: Icons.discount,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionHeader({required IconData icon, required String title}) {
    final theme = Theme.of(context);

    return Row(
      children: [
        Icon(icon, color: theme.primaryColor, size: 20),
        const SizedBox(width: 4),
        Text(
          title,
          style: theme.textTheme.titleMedium?.copyWith(
            fontWeight: FontWeight.bold,
            color: theme.primaryColor,
          ),
        ),
      ],
    );
  }

  Widget _buildFormField({
    required String label,
    bool isRequired = true,
    String? hint,
    String? prefix,
    IconData? icon,
    TextInputType? keyboardType,
  }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: MyTextField(
        keyboardType: keyboardType,
        pbottom: 8,
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 12,
          vertical: 16,
        ),
        labelText: '$label${isRequired ? '*' : ''}',
        hintText: hint,
        prefixIcon: icon != null ? Icon(icon, size: 20) : null,
        // prefixText: prefix,
        validator: isRequired
            ? (value) => value?.isEmpty ?? true ? 'این فیلد الزامی است' : null
            : null,
      ),
    );
  }

  Widget _buildSubmitButton(ThemeData theme) {
    return SizedBox(
      width: double.infinity,
      height: Constants.primaryButtonHeight,
      child: MyElevatedButton(
        onTap: () {
          if (_formKey.currentState?.validate() ?? false) {
            _submitForm();
          } else {
            final startPosition = scrollController.position.minScrollExtent;
            final duration = Duration(milliseconds: 250);
            scrollController.animateTo(
              startPosition,
              duration: duration,
              curve: Curves.ease,
            );
          }
        },
        icon: Icon(
          widget.isEdit ? Icons.save : Icons.check_circle,
          size: 24,
        ),
        title: widget.isEdit ? 'ذخیره تغییرات' : 'اضافه کردن محصول',
      ),
    );
  }

  void _submitForm() {
    // Handle form submission
    Get.back();
    Get.snackbar(
      'موفقیت آمیز',
      widget.isEdit ? 'محصول با موفقیت ویرایش شد' : 'محصول با موفقیت اضافه شد',
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: Colors.green,
      colorText: Colors.white,
      icon: const Icon(Icons.check_circle, color: Colors.white),
    );
  }

  void _showDeleteDialog() {
    Get.dialog(
      AlertDialog(
        title: Row(
          children: [
            Icon(Icons.warning, color: Colors.orange),
            const SizedBox(width: 8),
            const Text('حذف محصول'),
          ],
        ),
        content: const Text(
            'آیا از حذف این محصول اطمینان دارید؟ این عمل غیرقابل بازگشت است.'),
        actions: [
          TextButton(
            onPressed: () => Get.back(),
            child: const Text('انصراف'),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.red.shade50,
              foregroundColor: Colors.red,
            ),
            onPressed: () {
              Get.back();
              Get.back();
              Get.snackbar(
                'حذف شد',
                'محصول با موفقیت حذف شد',
                snackPosition: SnackPosition.BOTTOM,
                backgroundColor: Colors.red,
                colorText: Colors.white,
                icon: const Icon(Icons.delete, color: Colors.white),
              );
            },
            child: const Text('حذف محصول'),
          ),
        ],
      ),
    );
  }
}
