import 'package:flutter/material.dart';

class AddAmazingProductScreen extends StatelessWidget {
  const AddAmazingProductScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('افزودن محصول شگفت‌انگیز'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            // لیست محصولات قابل انتخاب
            Expanded(
              child: ListView.builder(
                itemCount: 10,
                itemBuilder: (context, index) {
                  return _buildProductItem(context, index);
                },
              ),
            ),

            // دکمه تأیید
            SizedBox(
              width: double.infinity,
              child: ElevatedButton.icon(
                icon: Icon(Icons.star, color: Colors.white),
                label: Text('تأیید و افزودن'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.purple,
                  padding: EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                onPressed: () {},
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildProductItem(BuildContext context, int index) {
    return Card(
      margin: EdgeInsets.only(bottom: 12),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: EdgeInsets.all(12),
        child: Row(
          children: [
            // تصویر محصول
            Container(
              width: 60,
              height: 60,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                image: DecorationImage(
                  image:
                      NetworkImage('https://picsum.photos/200?random=$index'),
                  fit: BoxFit.cover,
                ),
              ),
            ),

            SizedBox(width: 12),

            // اطلاعات محصول
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'نام محصول ${index + 1}',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                  SizedBox(height: 4),
                  Text(
                    'موجودی: ${index + 5} عدد',
                    style: TextStyle(
                      color: Colors.grey[600],
                    ),
                  ),
                ],
              ),
            ),

            // چک‌باکس انتخاب
            Checkbox(
              value: false,
              onChanged: (val) {},
              shape: CircleBorder(),
              fillColor: MaterialStateProperty.resolveWith<Color>(
                (Set<MaterialState> states) {
                  return Colors.purple;
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
