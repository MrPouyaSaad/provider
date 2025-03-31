import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:vizi_dasht/common/const.dart';
import 'package:vizi_dasht/screens/profile/support/requests.dart';
import 'package:vizi_dasht/widgets/badge.dart';
import 'package:vizi_dasht/widgets/button.dart';
import 'package:vizi_dasht/widgets/dvider.dart';

import '../../../widgets/text_field.dart';

void main() {
  runApp(MaterialApp(
    home: SupportRequestPage(),
  ));
}

class SupportRequestPage extends StatefulWidget {
  @override
  _SupportRequestPageState createState() => _SupportRequestPageState();
}

class _SupportRequestPageState extends State<SupportRequestPage> {
  final _formKey = GlobalKey<FormState>();
  final _subjectController = TextEditingController();
  final _descriptionController = TextEditingController();

  @override
  void dispose() {
    _subjectController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }

  void _submitSupportRequest() {
    if (_formKey.currentState!.validate()) {
      final subject = _subjectController.text;
      final description = _descriptionController.text;

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('درخواست پشتیبانی شما با موضوع $subjectموفقیت ثبت شد.'),
          backgroundColor: Colors.green,
        ),
      );
      log('Subject: $subject, Description: $description');

      _subjectController.clear();
      _descriptionController.clear();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ثبت درخواست پشتیبانی'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              SupportRequestStatusWidget(),
              MyDivider(),
              MyTextField(
                controller: _subjectController,
                labelText: 'موضوع',
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'لطفاً موضوع را وارد کنید.';
                  }
                  return null;
                },
              ),
              MyTextField(
                controller: _descriptionController,
                labelText: 'توضیحات',
                maxLines: 20,
                minLines: 5,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'لطفاً توضیحات را وارد کنید.';
                  }
                  return null;
                },
              ),
              SizedBox(
                height: Constants.primaryButtonHeight,
                width: double.infinity,
                child: MyElevatedButton(
                  onTap: _submitSupportRequest,
                  title: 'ارسال درخواست',
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class SupportRequestStatusWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: GestureDetector(
            onTap: () => Navigator.of(context).push(
              CupertinoPageRoute(
                builder: (context) => RequestListPage(),
              ),
            ),
            child: _buildRequestSection(
              isBadge: true,
              title: 'پاسخ داده شده',
              count: 5,
              color: Colors.green[50]!,
              icon: CupertinoIcons.checkmark_seal_fill,
              iconColor: Colors.green,
            ),
          ),
        ),
        SizedBox(width: 12),
        Expanded(
          child: _buildRequestSection(
            title: 'در حال بررسی',
            count: 3,
            color: Colors.orange[50]!,
            icon: CupertinoIcons.clock_fill,
            iconColor: Colors.orange,
          ),
        ),
      ],
    );
  }

  Widget _buildRequestSection({
    required String title,
    required int count,
    required Color color,
    required IconData icon,
    required Color iconColor,
    bool isBadge = false,
  }) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(12),
          ),
          padding: EdgeInsets.symmetric(vertical: 14, horizontal: 16),
          child: Row(
            children: [
              Icon(icon, color: iconColor, size: 28),
              SizedBox(width: 10),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                  ),
                  SizedBox(height: 4),
                  Text(
                    '$count درخواست',
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.black54,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        if (isBadge)
          Positioned(top: -5, left: -5, child: CounterBadge(value: 1)),
      ],
    );
  }
}
