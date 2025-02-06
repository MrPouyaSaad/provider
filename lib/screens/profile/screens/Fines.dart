import 'package:flutter/material.dart';

import 'f_a_q.dart';

class Fines extends StatelessWidget {
  const Fines({super.key});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
          title: Text('جریمه ها'),
        ),
        body: FAQCategoryList(),
      ),
    );
  }
}
