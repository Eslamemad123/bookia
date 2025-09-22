import 'package:bookia/core/utils/app%20assets.dart';
import 'package:bookia/core/utils/app%20color.dart';
import 'package:bookia/core/utils/textStyle.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class App_Bar extends StatelessWidget implements PreferredSizeWidget {
  const App_Bar({
    super.key,
    this.title = '',
    this.leading = false,
    this.action = false,
    this.icon,
  });
  final String title;
  final bool leading;
  final bool action;
  final String? icon;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      scrolledUnderElevation: 0,
      automaticallyImplyLeading: false,
      backgroundColor: App_Color.white,
      title: Text(title, style: Text_Style.getText25()),
      actions:
          action
              ? [
                Padding(
                  padding: const EdgeInsets.only(right: 10),
                  child: IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: SvgPicture.asset(icon ?? App_Assets.cartSVG),
                  ),
                ),
              ]
              : null,
      centerTitle: true,
      leadingWidth: 75,
      leading:
          leading
              ? Padding(
                padding: const EdgeInsets.only(left: 12),
                child: //SvgPicture.asset(App_Assets.backArrowSVG)
                    IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: SvgPicture.asset(App_Assets.backArrowSVG),
                ),
              )
              : null,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
