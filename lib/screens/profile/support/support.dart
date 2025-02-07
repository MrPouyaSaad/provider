import 'package:flutter/material.dart';

class SupportScreen extends StatelessWidget {
  const SupportScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('مرکز پشتیبانی'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildSupportSection(
              context: context,
              icon: Icons.phone,
              title: "ارتباط با پشتیبانی",
              description:
                  "در صورت نیاز به راهنمایی، تیم پشتیبانی همراه شماست.",
              actionText: "تماس با ما",
              onAction: () {
                print("تماس با پشتیبانی");
              },
            ),
            const SizedBox(height: 20),
            _buildSupportSection(
              context: context,
              icon: Icons.help_outline,
              title: "راهنمای استفاده",
              description:
                  "سوالات متداول و پاسخ‌های کاربردی برای شما فراهم شده است.",
              actionText: "مشاهده راهنما",
              onAction: () {
                print("باز کردن راهنما");
              },
            ),
            const SizedBox(height: 20),
            _buildAccountClosureSection(context),
          ],
        ),
      ),
    );
  }

  Widget _buildSupportSection({
    required BuildContext context,
    required IconData icon,
    required String title,
    required String description,
    required String actionText,
    required VoidCallback onAction,
  }) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      shadowColor: Colors.blueAccent.withOpacity(0.2),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          gradient: const LinearGradient(
            colors: [Colors.white, Color(0xFFE3F2FD)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Icon(icon, size: 32, color: Colors.blueAccent),
                  const SizedBox(width: 10),
                  Text(
                    title,
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.blueAccent,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              Text(
                description,
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.grey[700],
                ),
              ),
              const SizedBox(height: 10),
              Align(
                alignment: Alignment.centerLeft,
                child: ElevatedButton(
                  onPressed: onAction,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blueAccent,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 24, vertical: 12),
                  ),
                  child: Text(
                    actionText,
                    style: const TextStyle(
                      fontSize: 16,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildAccountClosureSection(BuildContext context) {
    return Card(
      elevation: 6,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      shadowColor: Colors.redAccent.withOpacity(0.3), // سایه قرمز برای تأکید
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          gradient: const LinearGradient(
            colors: [Color(0xFFB71C1C), Color(0xFFD32F2F)], // قرمز تیره و شرابی
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Icon(Icons.block, size: 32, color: Colors.white),
                  const SizedBox(width: 10),
                  Text(
                    "تغییر وضعیت همکاری",
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              Text(
                "در صورتی که نیاز به تغییر وضعیت همکاری دارید، درخواست خود را ثبت کنید. تیم پشتیبانی در اسرع وقت با شما در ارتباط خواهد بود.",
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.white.withOpacity(0.9),
                ),
              ),
              const SizedBox(height: 10),
              Align(
                alignment: Alignment.centerLeft,
                child: ElevatedButton(
                  onPressed: () {
                    _showCollectPanelBottomSheet(context);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 24, vertical: 12),
                  ),
                  child: const Text(
                    "ثبت درخواست",
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.redAccent,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _showCollectPanelBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) {
        return _CollectPanelBottomSheetContent();
      },
    );
  }
}

class _CollectPanelBottomSheetContent extends StatefulWidget {
  @override
  _CollectPanelBottomSheetContentState createState() =>
      _CollectPanelBottomSheetContentState();
}

class _CollectPanelBottomSheetContentState
    extends State<_CollectPanelBottomSheetContent> {
  String? selectedReason;
  TextEditingController otherReasonController = TextEditingController();
  bool showTextField = false;
  FocusNode textFieldFocus = FocusNode();

  @override
  void dispose() {
    otherReasonController.dispose();
    textFieldFocus.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: const BorderRadius.vertical(top: Radius.circular(30)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 20,
            spreadRadius: 5,
          ),
        ],
      ),
      padding: EdgeInsets.only(
        bottom: MediaQuery.of(context).viewInsets.bottom,
        left: 16,
        right: 16,
        top: 16,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Center(
            child: Text(
              'درخواست تغییر وضعیت همکاری',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Colors.blueAccent,
              ),
            ),
          ),
          const SizedBox(height: 16),
          const Text(
            'لطفاً دلیل درخواست خود را انتخاب کنید:',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
          ),
          const SizedBox(height: 10),

          Column(
            children: ['مشکلات فنی', 'عدم نیاز', 'سایر موارد'].map((reason) {
              return AnimatedContainer(
                duration: const Duration(milliseconds: 300),
                margin: const EdgeInsets.symmetric(vertical: 4),
                decoration: BoxDecoration(
                  color: selectedReason == reason
                      ? Colors.blueAccent.withOpacity(0.1)
                      : Colors.transparent,
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(
                    color: selectedReason == reason
                        ? Colors.blueAccent
                        : Colors.grey.withOpacity(0.2),
                    width: 1.5,
                  ),
                ),
                child: RadioListTile<String>(
                  title: Text(
                    reason,
                    style: TextStyle(
                      fontSize: 14,
                      color: selectedReason == reason
                          ? Colors.blueAccent
                          : Colors.grey[700],
                      fontWeight: selectedReason == reason
                          ? FontWeight.bold
                          : FontWeight.normal,
                    ),
                  ),
                  value: reason,
                  groupValue: selectedReason,
                  onChanged: (value) {
                    setState(() {
                      selectedReason = value;
                      showTextField = value == 'سایر موارد';
                    });

                    if (value == 'سایر موارد') {
                      Future.delayed(
                        const Duration(milliseconds: 200),
                        () {
                          textFieldFocus.requestFocus();
                        },
                      );
                    }
                  },
                  activeColor: Colors.blueAccent,
                ),
              );
            }).toList(),
          ),

          // ✅ TextField برای "سایر موارد"
          if (showTextField)
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: TextField(
                controller: otherReasonController,
                focusNode: textFieldFocus,
                autofocus: true,
                decoration: InputDecoration(
                  hintText: 'لطفاً دلیل خود را وارد کنید',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(color: Colors.blueAccent),
                  ),
                  filled: true,
                  fillColor: Colors.grey[100],
                ),
                maxLines: 3,
              ),
            ),

          const SizedBox(height: 20),

          ElevatedButton(
            onPressed: () {
              String reason = selectedReason ?? 'انتخاب نشده';
              if (reason == 'سایر موارد') {
                reason = otherReasonController.text.trim();
              }
              if (reason.isEmpty) {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('لطفاً دلیل را انتخاب یا وارد کنید.'),
                  ),
                );
                return;
              }
              Navigator.pop(context);
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text('درخواست شما ثبت شد: $reason'),
                  backgroundColor: Colors.green,
                ),
              );
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.blueAccent,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              minimumSize: const Size(double.infinity, 50),
            ),
            child: const Text(
              'ارسال درخواست',
              style: TextStyle(fontSize: 16, color: Colors.white),
            ),
          ),

          const SizedBox(height: 10),
        ],
      ),
    );
  }
}
