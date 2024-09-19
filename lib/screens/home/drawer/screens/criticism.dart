import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../common/const.dart';
import '../../../../widgets/button.dart';
import '../../../../widgets/text_field.dart';

class CriticismScreen extends StatelessWidget {
  const CriticismScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('پیشنهاد و انتقاد'),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: SizedBox(
          height: Constants.primaryButtonHeight,
          width:
              MediaQuery.of(context).size.width - Constants.primaryPadding * 2,
          child: MyElevatedButton(
            title: 'ثبت',
            onTap: () {},
          ),
        ),
        body: SafeArea(
          child: Column(
            children: [
              const MyTextField(
                labelText: 'موضوع',
              ),
              const MyTextField(
                labelText: 'توضیحات',
                maxLines: 20,
                minLines: 5,
              ),
            ],
          ).paddingAll(Constants.primaryPadding),
        ),
      ),
    );
  }
}
