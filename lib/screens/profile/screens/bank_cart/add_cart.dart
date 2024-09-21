import 'package:flutter/material.dart';
import 'package:provider/common/const.dart';

import '../../../../widgets/button.dart';

class AddOrEditBankCardPage extends StatefulWidget {
  @override
  _AddOrEditBankCardPageState createState() => _AddOrEditBankCardPageState();
}

class _AddOrEditBankCardPageState extends State<AddOrEditBankCardPage> {
  final _formKey = GlobalKey<FormState>();

  // کنترلرهای فرم
  TextEditingController _cardNumberController = TextEditingController();
  TextEditingController _shabaNumberController = TextEditingController();
  TextEditingController _accountNumberController = TextEditingController();
  TextEditingController _holderNameController = TextEditingController();

  String? _bankName; // نام بانک شناسایی شده

  // دیکشنری برای شناسایی بانک‌ها بر اساس شماره BIN
  Map<String, String> binToBankMap = {
    '6037': 'بانک ملی',
    '5892': 'بانک صادرات',
    '6273': 'بانک تجارت',
    '6221': 'بانک پارسیان',
    // سایر بانک‌ها را نیز می‌توانید اضافه کنید
  };

  // متد برای شناسایی بانک بر اساس شماره کارت
  void _identifyBank(String cardNumber) {
    if (cardNumber.length >= 4) {
      String bin = cardNumber.substring(0, 4);
      setState(() {
        _bankName = binToBankMap[bin];
      });
    } else {
      setState(() {
        _bankName = null;
      });
    }
  }

  void _extractAccountNumberFromShaba() {
    String shaba = _shabaNumberController.text;
    if (shaba.length > 6) {
      String accountNumber = shaba.substring(6);
      setState(() {
        _accountNumberController.text = accountNumber;
      });
    }
  }

  @override
  void initState() {
    super.initState();

    // اضافه کردن listener برای شماره کارت
    _cardNumberController.addListener(() {
      _identifyBank(_cardNumberController.text);
      setState(() {}); // برای آپدیت پیش‌نمایش کارت
    });

    // اضافه کردن listener برای سایر فیلدها جهت به‌روزرسانی پیش‌نمایش
    _shabaNumberController.addListener(() => setState(() {
          _extractAccountNumberFromShaba();
          setState(() {});
        }));
    _accountNumberController.addListener(() => setState(() {}));
    _holderNameController.addListener(() => setState(() {}));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('افزودن کارت بانکی'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                // پیش‌نمایش کارت
                BankCardWidget(
                  bankName: _bankName ?? 'نام بانک',
                  cardNumber: _cardNumberController.text.isNotEmpty
                      ? _cardNumberController.text
                      : '**** **** **** ****',
                  shabaNumber: _shabaNumberController.text.isNotEmpty
                      ? 'IR ' + _shabaNumberController.text
                      : '****************** * *** **IR',
                  accountNumber: _accountNumberController.text.isNotEmpty
                      ? _accountNumberController.text
                      : '**********',
                  holderName: _holderNameController.text.isNotEmpty
                      ? _holderNameController.text
                      : 'نام صاحب کارت',
                ),
                SizedBox(height: 20),

                // فیلدهای ورودی
                TextFormField(
                  controller: _cardNumberController,
                  decoration: InputDecoration(labelText: 'شماره کارت'),
                  keyboardType: TextInputType.number,
                  maxLength: 16,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'شماره کارت را وارد کنید';
                    }
                    return null;
                  },
                ),
                SizedBox(height: Constants.primaryPadding),

                TextFormField(
                  controller: _shabaNumberController,
                  decoration: InputDecoration(labelText: 'شماره شبا'),
                  keyboardType: TextInputType.number,
                  maxLength: 24,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'شماره شبا را وارد کنید';
                    }
                    return null;
                  },
                ),
                SizedBox(height: Constants.primaryPadding),

                TextFormField(
                  controller: _accountNumberController,
                  decoration: InputDecoration(labelText: 'شماره حساب'),
                  keyboardType: TextInputType.number,
                  maxLength: 18,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'شماره حساب را وارد کنید';
                    }
                    return null;
                  },
                ),
                SizedBox(height: Constants.primaryPadding),
                TextFormField(
                  controller: _holderNameController,
                  decoration: InputDecoration(labelText: 'نام دارنده کارت'),
                  keyboardType: TextInputType.text,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'نام دارنده کارت را وارد کنید';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 20),
                MyElevatedButton(
                  onTap: () {
                    if (_formKey.currentState!.validate()) {
                      // انجام عملیات ذخیره کارت
                      Navigator.pop(context);
                    }
                  },
                  title: ('ذخیره کارت'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// ویجت پیش‌نمایش کارت بانکی
class BankCardWidget extends StatelessWidget {
  final String bankName;
  final String cardNumber;
  final String shabaNumber;
  final String accountNumber;
  final String holderName;

  BankCardWidget({
    required this.bankName,
    required this.cardNumber,
    required this.shabaNumber,
    required this.accountNumber,
    required this.holderName,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(10),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      elevation: 5,
      child: Container(
        height: 200,
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          gradient: LinearGradient(
            colors: [Colors.blueAccent, Colors.blue],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Stack(
          children: [
            // نام بانک بالا سمت راست
            Align(
              alignment: Alignment.topRight,
              child: Text(
                bankName,
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
            ),
            // شماره کارت در وسط
            Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    cardNumber,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      letterSpacing: 2.0,
                    ),
                  ),
                  SizedBox(height: 8),
                  // شماره شبا زیر شماره کارت
                  Text(
                    shabaNumber,
                    style: TextStyle(
                      color: Colors.white70,
                      fontSize: 14,
                      letterSpacing: 1.5,
                    ),
                  ),
                ],
              ),
            ),
            // شماره حساب پایین سمت راست
            Align(
              alignment: Alignment.bottomRight,
              child: Text(
                accountNumber,
                style: TextStyle(
                  color: Colors.white70,
                  fontSize: 14,
                ),
              ),
            ),
            // نام دارنده پایین سمت چپ
            Align(
              alignment: Alignment.bottomLeft,
              child: Text(
                holderName,
                style: TextStyle(
                  color: Colors.white70,
                  fontSize: 14,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
