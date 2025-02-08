import 'package:flutter/material.dart';

class RequestListPage extends StatelessWidget {
  final List<Map<String, String>> requests = [
    {"title": "درخواست شماره 1", "response": "پاسخ به درخواست 1"},
    {"title": "درخواست شماره 2", "response": "پاسخ به درخواست 2"},
    {"title": "درخواست شماره 3", "response": "پاسخ به درخواست 3"},
    // اضافه کردن درخواست‌های بیشتر
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('درخواست‌های پاسخ داده شده'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView.builder(
          itemCount: requests.length,
          itemBuilder: (context, index) {
            return Card(
              elevation: 5,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              margin: const EdgeInsets.symmetric(vertical: 10),
              child: ListTile(
                contentPadding: const EdgeInsets.all(16.0),
                title: Text(
                  requests[index]['title']!,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                subtitle: Text(
                  requests[index]['response']!,
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.grey[700],
                  ),
                ),
                trailing: Icon(Icons.check, color: Colors.green),
              ),
            );
          },
        ),
      ),
    );
  }
}
