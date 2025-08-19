import 'package:flutter/material.dart';
import 'package:vizi_dasht/common/const.dart';
import 'package:vizi_dasht/widgets/title.dart';

class FAQScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
          title: Text('سوالات متداول'),
        ),
        body: FAQCategoryList(),
      ),
    );
  }
}

class FAQCategoryList extends StatelessWidget {
  final List<Map<String, dynamic>> faqCategories = [
    {
      'category': 'مدیریت سفارشات',
      'faqs': [
        {
          'question':
              'اگر محصولی موجود نیست، چطور می‌توانم به مشتری اطلاع دهم؟',
          'answer':
              'شما میتوانید از بخش محصولات من، روی محصول مورد نظر کلیک کرده و در صفحه ویرایش محصول موجودی را به "صفر" تغییر دهید.'
        },
        {
          'question': 'آیا محصولات تخفیف‌ هم دارند؟',
          'answer': 'بله، برخی از محصولات به طور دوره‌ای دارای تخفیف می‌باشند.'
        },
        {
          'question': 'آیا محصولات تخفیف‌ هم دارند؟',
          'answer': 'بله، برخی از محصولات به طور دوره‌ای دارای تخفیف می‌باشند.'
        },
      ],
    },
    {
      'category': 'مدیریت محصولات',
      'faqs': [
        {
          'question': 'سیاست بازگشت کالا چیست؟',
          'answer':
              'شما تا 7 روز پس از دریافت کالا می‌توانید آن را بازگشت دهید.'
        },
        {
          'question': 'آیا امکان لغو کردن سفارش وجود دارد؟',
          'answer':
              'بله، تا قبل از ارسال سفارش می‌توانید سفارش خود را کنسل کنید.'
        },
      ],
    },
    {
      'category': 'مدیریت پرداخت ها',
      'faqs': [
        {
          'question': 'سیاست بازگشت کالا چیست؟',
          'answer':
              'شما تا 7 روز پس از دریافت کالا می‌توانید آن را بازگشت دهید.'
        },
        {
          'question': 'آیا امکان لغو کردن سفارش وجود دارد؟',
          'answer':
              'بله، تا قبل از ارسال سفارش می‌توانید سفارش خود را کنسل کنید.'
        },
      ],
    },
    {
      'category': 'حمل و نقل و ارسال',
      'faqs': [
        {
          'question': 'سیاست بازگشت کالا چیست؟',
          'answer':
              'شما تا 7 روز پس از دریافت کالا می‌توانید آن را بازگشت دهید.'
        },
        {
          'question': 'آیا امکان لغو کردن سفارش وجود دارد؟',
          'answer':
              'بله، تا قبل از ارسال سفارش می‌توانید سفارش خود را کنسل کنید.'
        },
      ],
    },
    {
      'category': 'پشتیبانی و کمک',
      'faqs': [
        {
          'question': 'سیاست بازگشت کالا چیست؟',
          'answer':
              'شما تا 7 روز پس از دریافت کالا می‌توانید آن را بازگشت دهید.'
        },
        {
          'question': 'آیا امکان لغو کردن سفارش وجود دارد؟',
          'answer':
              'بله، تا قبل از ارسال سفارش می‌توانید سفارش خود را کنسل کنید.'
        },
      ],
    },
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: faqCategories.length,
      itemBuilder: (context, index) {
        return FAQCategoryItem(
          category: faqCategories[index]['category'],
          faqs: faqCategories[index]['faqs'],
        );
      },
    );
  }
}

class FAQCategoryItem extends StatelessWidget {
  final String category;
  final List<Map<String, String>> faqs;

  FAQCategoryItem({required this.category, required this.faqs});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AppTitle(title: category),
          ListView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemCount: faqs.length,
            itemBuilder: (context, index) {
              return FAQItem(
                question: faqs[index]['question']!,
                answer: faqs[index]['answer']!,
              );
            },
          ),
        ],
      ),
    );
  }
}

class FAQItem extends StatefulWidget {
  final String question;
  final String answer;

  FAQItem({required this.question, required this.answer});

  @override
  _FAQItemState createState() => _FAQItemState();
}

class _FAQItemState extends State<FAQItem> with SingleTickerProviderStateMixin {
  bool isExpanded = false;

  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context);
    final backgroundColor = themeData.colorScheme.primary;
    final titleColor = themeData.colorScheme.surface;
    final captionColor = themeData.colorScheme.onPrimary;
    final iconColor = themeData.colorScheme.surface;
    return Card(
      margin: EdgeInsets.only(bottom: Constants.primaryPadding),
      shape: RoundedRectangleBorder(borderRadius: Constants.primaryRadius),
      color: backgroundColor,
      elevation: 4,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ListTile(
            title: Text(
              widget.question,
              style: TextStyle(
                  fontSize: 13,
                  wordSpacing: -1,
                  fontWeight: FontWeight.bold,
                  color: titleColor),
            ),
            trailing: Icon(
              isExpanded ? Icons.keyboard_arrow_up : Icons.keyboard_arrow_down,
              color: iconColor,
            ),
            onTap: () {
              setState(() {
                isExpanded = !isExpanded;
              });
            },
          ),
          AnimatedCrossFade(
            duration: Duration(milliseconds: 300),
            firstChild: Container(),
            secondChild: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Text(
                widget.answer,
                textAlign: TextAlign.right,
                style: TextStyle(
                    fontSize: 12, wordSpacing: -1, color: captionColor),
              ),
            ),
            crossFadeState: isExpanded
                ? CrossFadeState.showSecond
                : CrossFadeState.showFirst,
          ),
        ],
      ),
    );
  }
}
