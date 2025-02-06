import 'package:flutter/material.dart';

class MessageScreen extends StatelessWidget {
  const MessageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('پیام ها'),
      ),
      body: SafeArea(
        child: ListView.builder(
          itemCount: 6,
          itemBuilder: (context, index) => Container(),
        ),
      ),
    );
  }
}
