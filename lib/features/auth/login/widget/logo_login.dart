import 'package:bookia/core/utils/app%20assets.dart';
import 'package:bookia/core/utils/app%20color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class LogoLogin extends StatelessWidget {
  const LogoLogin({
    super.key, required this.logo, this.onTap,
  });
  final SvgPicture logo;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap:onTap ,
      child: Container(
        padding:EdgeInsets.all(12) ,
        height: 60,
        decoration: BoxDecoration(
        border: Border.all(color: App_Color.borderFormFiled,width: 1),
        borderRadius: BorderRadius.circular(8),
        color: App_Color.white,
      ),
      child:SizedBox(height: 22,width: 22, child: logo),),
    );
  }
}
