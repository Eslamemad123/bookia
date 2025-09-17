import 'package:bookia/core/utils/app%20assets.dart';
import 'package:bookia/core/utils/app%20color.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

showErrorDialog(BuildContext context, String message) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      behavior: SnackBarBehavior.floating,
      margin: const EdgeInsets.all(20),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      backgroundColor: App_Color.red,
      content: Text(message),
    ),
  );
}

showLoadingDialog(BuildContext context) {
  showDialog(
    context: context,
    barrierDismissible: false,
    builder:
        (context) => Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [Expanded(child: Lottie.asset(App_Assets.loadingJson))],
          ),
        ),
  );
}
