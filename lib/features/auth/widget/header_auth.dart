import 'package:bookia/core/utils/app%20color.dart';
import 'package:bookia/core/utils/textStyle.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class Header_Auth extends StatelessWidget {
  Header_Auth({
    super.key,
    required this.title,
    this.subTitle,
    this.Alighn = CrossAxisAlignment.start,
  });
  final String title;
  final String? subTitle;
  final CrossAxisAlignment Alighn;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 22),
      child: Column(
        crossAxisAlignment: Alighn,
        children: [
          Text(title, style: Text_Style.getText30()),
          Gap(10),
          if (subTitle != null)
            Text(
              subTitle!,
              style: Text_Style.getText16(color: App_Color.textgreyForm),
            ),
        ],
      ),
    );
  }
}
