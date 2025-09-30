import 'package:bookia/core/utils/app%20assets.dart';
import 'package:bookia/core/utils/app%20color.dart';
import 'package:bookia/core/utils/textStyle.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ItemProfile extends StatelessWidget {
  ItemProfile({super.key, required this.title, required this.onPress});
  void Function()? onPress;
  String title;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 60,
      child: GestureDetector(
        onTap: onPress,
        child: Container(
          decoration: BoxDecoration(
            color: App_Color.white,
            borderRadius: BorderRadius.circular(4),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 15),
                child: Text(
                  title,
                  style: Text_Style.getText18(color: App_Color.black3),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 15),
                child: SvgPicture.asset(App_Assets.arrowForwardSVG),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
