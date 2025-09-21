import 'package:bookia/core/utils/app%20assets.dart';
import 'package:bookia/core/utils/app%20color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class Filter extends StatelessWidget {
  const Filter({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 55,
      height: 55,
      decoration: BoxDecoration(
        color: App_Color.borderFormFiled,
        borderRadius: BorderRadius.circular(15),
      ),
    
      child: Center(
        child: SvgPicture.asset(
          App_Assets.Filter,
          width: 40,
          height: 40,
          colorFilter: ColorFilter.mode(
            App_Color.goldPrimary,
            BlendMode.srcIn,
          ),
        ),
      ),
    );
  }
}
