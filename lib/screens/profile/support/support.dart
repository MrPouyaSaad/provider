import 'package:flutter/material.dart';
import 'package:vizi_dasht/common/const.dart';

class SupportScreen extends StatelessWidget {
  const SupportScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('پشتیبانی'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // بخش تماس با پشتیبانی
            _buildSupportSection(
              context: context,
              icon: Icons.phone,
              title: "تماس با پشتیبانی",
              description: "برای تماس با پشتیبانی، شماره زیر را بگیرید:",
              actionText: "۰۲۱-۱۲۳۴۵۶۷۸",
              onAction: () {
                // منطق تماس با پشتیبانی
                print("تماس با پشتیبانی");
              },
            ),
            const SizedBox(height: 20),

            // بخش سوالات متداول (FAQ)
            _buildSupportSection(
              context: context,
              icon: Icons.help_outline,
              title: "سوالات متداول",
              description: "پاسخ به سوالات پرتکرار شما در این بخش قرار دارد.",
              actionText: "مشاهده سوالات",
              onAction: () {
                // منطق باز کردن صفحه FAQ
                print("باز کردن سوالات متداول");
              },
            ),
            const SizedBox(height: 20),

            // بخش درخواست جمع‌آوری پنل
            _buildSupportSection(
              context: context,
              icon: Icons.build,
              title: "درخواست جمع‌آوری پنل",
              description:
                  "اگر نیاز به جمع‌آوری پنل دارید، درخواست خود را ثبت کنید.",
              actionText: "ثبت درخواست",
              onAction: () {
                _showCollectPanelBottomSheet(context);
              },
            ),
          ],
        ),
      ),
    );
  }

  // ویجت برای ساخت بخش‌های پشتیبانی
  Widget _buildSupportSection({
    required IconData icon,
    required String title,
    required String description,
    required String actionText,
    required VoidCallback onAction,
    required BuildContext context,
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
          boxShadow: Constants.primaryBoxShadow(context),
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

  // دیزاین فوق‌العاده خاص برای جمع‌آوری پنل
  void _showCollectPanelBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) {
        String? selectedReason;
        TextEditingController otherReasonController = TextEditingController();
        bool showTextField = false;

        return StatefulBuilder(
          builder: (context, setState) {
            return Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius:
                    const BorderRadius.vertical(top: Radius.circular(30)),
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
                      'درخواست جمع‌آوری پنل',
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: Colors.blueAccent,
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  const Text(
                    'لطفاً دلیل جمع‌آوری پنل خود را انتخاب کنید:',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                  ),
                  const SizedBox(height: 10),
                  ...['مشکلات فنی', 'عدم نیاز', 'سایر موارد'].map((reason) {
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
                        },
                        activeColor: Colors.blueAccent,
                      ),
                    );
                  }).toList(),
                  if (showTextField)
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: TextField(
                        controller: otherReasonController,
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
          },
        );
      },
    );
  }
}
