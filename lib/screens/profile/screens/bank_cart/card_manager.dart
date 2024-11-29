import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vizi_dasht/screens/profile/screens/bank_cart/add_cart.dart';

class BankCardManagerPage extends StatefulWidget {
  @override
  _BankCardManagerPageState createState() => _BankCardManagerPageState();
}

class _BankCardManagerPageState extends State<BankCardManagerPage> {
  List<Map<String, String>> bankCards = [
    {
      'bankName': 'بانک ملی',
      'accountNumber': '123456789',
      'cardNumber': '6037 1234 5678 9101',
      'shabaNumber': 'IR820170000000123456789',
      'holderName': 'پویا صادق زاده',
    },
    {
      'bankName': 'بانک صادرات',
      'accountNumber': '987654321',
      'cardNumber': '5892 1234 5678 9101',
      'shabaNumber': 'IR820170000000987654321',
      'holderName': 'پویا صادق زاده',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
          title: Text('مدیریت کارت‌ ها'),
        ),
        body: ListView.builder(
          itemCount: bankCards.length,
          itemBuilder: (context, index) {
            return BankCardWidget(
              bankCard: bankCards[index],
              onEdit: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => AddOrEditBankCardPage(),
                  ),
                );
              },
            );
          },
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            // انتقال به صفحه افزودن کارت جدید
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => AddOrEditBankCardPage(),
              ),
            );
          },
          child: Icon(Icons.add),
          tooltip: 'افزودن کارت جدید',
        ),
      ),
    );
  }
}

// ویجت کارت بانکی با طراحی شبیه به کارت بانکی واقعی
class BankCardWidget extends StatelessWidget {
  final Map<String, String> bankCard;
  final VoidCallback onEdit;

  BankCardWidget({required this.bankCard, required this.onEdit});

  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context);
    return Card(
      margin: EdgeInsets.all(16),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      elevation: 5,
      child: Container(
        height: 200,
        padding: EdgeInsets.fromLTRB(8, 8, 16, 16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          gradient: LinearGradient(
            colors: [
              themeData.colorScheme.surfaceContainerHighest,
              themeData.colorScheme.primaryFixedDim,
              themeData.colorScheme.primaryFixedDim,
              themeData.colorScheme.surfaceContainerHighest,
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Stack(
          children: [
            // آیکون ویرایش بالا سمت چپ
            Align(
              alignment: Alignment.topLeft,
              child: IconButton(
                icon: Icon(Icons.edit, color: themeData.colorScheme.surface),
                onPressed: onEdit,
              ),
            ),
            // نام بانک بالا سمت راست
            Align(
              alignment: Alignment.topRight,
              child: Text(
                bankCard['bankName']!,
                style: TextStyle(
                  color: themeData.colorScheme.surface,
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ).marginOnly(top: 8),
            ),
            // شماره کارت در وسط
            Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    bankCard['cardNumber']!,
                    textDirection: TextDirection.ltr,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 2.0,
                    ),
                  ),
                  SizedBox(height: 8),
                  // شماره شبا زیر شماره کارت
                  Text(
                    bankCard['shabaNumber']!,
                    style: TextStyle(
                      color: themeData.colorScheme.onPrimary.withOpacity(0.85),
                      fontSize: 16,
                      letterSpacing: 1.5,
                    ),
                  ),
                ],
              ),
            ).marginOnly(left: 8),
            // شماره حساب پایین سمت راست
            Align(
              alignment: Alignment.bottomRight,
              child: Text(
                bankCard['accountNumber']!,
                style: TextStyle(
                  color: themeData.colorScheme.onPrimary.withOpacity(0.85),
                  fontSize: 14,
                ),
              ),
            ),
            // نام دارنده پایین سمت چپ
            Align(
              alignment: Alignment.bottomLeft,
              child: Text(
                bankCard['holderName']!,
                style: TextStyle(
                  color: Colors.white70,
                  fontSize: 14,
                ),
              ).marginOnly(left: 8),
            ),
          ],
        ),
      ),
    );
  }
}
