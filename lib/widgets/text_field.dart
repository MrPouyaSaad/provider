import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/common/const.dart';

class MyTextField extends StatelessWidget {
  final String? labelText;
  final String? hintText;
  final Widget? prefixIcon;
  final TextEditingController? controller;
  final TextInputType? keyboardType;
  final bool enabled;
  final TextAlign textAlign;
  final TextAlignVertical? textAlignVertical;
  final bool alignLabelWithHint;
  final int? maxLines;
  final int? minLines;
  final int? maxLength;
  final FormFieldValidator<String>? validator;
  final String? caption;
  const MyTextField({
    Key? key,
    this.labelText,
    this.hintText,
    this.prefixIcon,
    this.controller,
    this.keyboardType = TextInputType.text,
    this.enabled = true,
    this.textAlign = TextAlign.start,
    this.textAlignVertical,
    this.alignLabelWithHint = true,
    this.maxLines = 1,
    this.minLines,
    this.maxLength,
    this.validator,
    this.caption,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        if (caption != null)
          Text(
            caption!,
            style: TextStyle(
                fontSize: 10,
                fontWeight: FontWeight.bold,
                color: Theme.of(context).colorScheme.onSurface),
          ).marginOnly(bottom: 4, left: 4),
        TextFormField(
          controller: controller,
          onTapOutside: Constants.dismisTextField,
          keyboardType: keyboardType,
          maxLength: maxLength,
          maxLines: maxLines,
          minLines: minLines,
          textAlign: textAlign,
          textAlignVertical: textAlignVertical,
          enabled: enabled,
          decoration: InputDecoration(
            labelText: labelText,
            hintText: hintText,
            prefixIcon: prefixIcon,
            alignLabelWithHint: alignLabelWithHint,
          ),
          validator: validator,
        ),
      ],
    ).marginOnly(
        top: caption != null ? 0 : Constants.primaryPadding / 2,
        bottom: maxLength != null ? 0 : Constants.primaryPadding);
  }
}
