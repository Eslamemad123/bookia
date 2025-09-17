import 'package:bookia/core/utils/app%20color.dart';
import 'package:bookia/core/utils/textStyle.dart';
import 'package:flutter/material.dart';

class Rich_TextAuth extends StatelessWidget {
  const Rich_TextAuth({
    super.key,
    required this.textBlack,
    required this.textGold,
    this.onPress,
  });
  final String textBlack;
  final String textGold;
  final void Function()? onPress;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        RichText(
          text: TextSpan(
            children: [
              TextSpan(
                text: textBlack,
                style: Text_Style.getText15(color: App_Color.black1),
              ),
              WidgetSpan(
                alignment: PlaceholderAlignment.middle,
                child: TextButton(
                  onPressed: onPress,
                  child: Text(
                    textGold,
                    style: Text_Style.getText15(color: App_Color.goldPrimary),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
