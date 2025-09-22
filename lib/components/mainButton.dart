import 'package:bookia/core/utils/app%20assets.dart';
import 'package:bookia/core/utils/app%20color.dart';
import 'package:bookia/core/utils/textStyle.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class Main_Button extends StatelessWidget {
  const Main_Button({
    super.key,
    required this.title,
    this.height = 60,
    this.width = double.infinity,
    required this.onPress,
    this.isLoading = false,
    this.color,
    this.radius,
    this.padding = 22,
  });

  final double? height;
  final double? width;
  final String? title;
  final Function() onPress;
  final bool isLoading;
  final Color? color;
  final double? radius;
  final double padding;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: padding),
      child: SizedBox(
        width: width,
        height: height,
        child: ElevatedButton(
          onPressed: onPress,
          style: ElevatedButton.styleFrom(
            elevation: 0,
            backgroundColor: color ?? App_Color.goldPrimary,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(radius ?? 8),
            ),
          ),
          child:
              isLoading
                  ? Lottie.asset(App_Assets.loadingJson2)
                  : Text(
                    title!,
                    style: Text_Style.getText15(color: App_Color.white),
                  ),
        ),
      ),
    );
  }
}
