import 'package:bookia/core/utils/app%20color.dart';
import 'package:bookia/core/utils/textStyle.dart';
import 'package:flutter/material.dart';

class Main_Button extends StatelessWidget {
  Main_Button({
    super.key,
    required this.title,
    this.height = 60,
    this.width = double.infinity,
    required this.onPress,
  });
  final double? height;
  final double? width;
  final String? title;
  final Function() onPress;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 22),
      child: SizedBox(
        width: width,
        height: height,
        child: ElevatedButton(
          onPressed: onPress,
          child: Text(
            title!,
            style: Text_Style.getText15(color: App_Color.white),
          ),
          style: ElevatedButton.styleFrom(
            elevation: 0,
            backgroundColor: App_Color.goldPrimary,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          ),
        ),
      ),
    );
  }
}
