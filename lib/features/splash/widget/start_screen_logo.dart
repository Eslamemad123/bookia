import 'package:bookia/core/utils/app%20assets.dart';
import 'package:bookia/core/utils/textStyle.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';

class startScreenLogo extends StatelessWidget {
  startScreenLogo({super.key, required this.gap});
  double? gap;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(App_Assets.logoSVG),
          Gap(gap!),
          Text('Order Your Book Now!', style: Text_Style.getText18()),
        ],
      ),
    );
  }
}
