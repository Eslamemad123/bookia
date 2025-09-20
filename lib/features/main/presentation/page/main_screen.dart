import 'package:bookia/core/utils/app%20assets.dart';
import 'package:bookia/core/utils/app%20color.dart';
import 'package:bookia/features/Home/presentation/pages/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Main_Screen extends StatefulWidget {
  const Main_Screen({super.key});

  @override
  State<Main_Screen> createState() => _Main_ScreenState();
}

class _Main_ScreenState extends State<Main_Screen> {
  @override
  Widget build(BuildContext context) {
    int currentIndex = 0;
    return Scaffold(
      body: Home_Screen(),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: App_Color.white,
        items: [
          BottomNavigationBarItem(
            icon: SvgPicture.asset(App_Assets.homeSVG),
            activeIcon: SvgPicture.asset(
              App_Assets.homeSVG,
              colorFilter: ColorFilter.mode(
                App_Color.goldPrimary,
                BlendMode.srcIn,
              ),
            ),
            label: 'home',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(App_Assets.bookmarkSVG),
            activeIcon: SvgPicture.asset(
              App_Assets.bookmarkSVG,
              colorFilter: ColorFilter.mode(
                App_Color.goldPrimary,
                BlendMode.srcIn,
              ),
            ),
            label: 'whish list',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(App_Assets.cartSVG),
            activeIcon: SvgPicture.asset(
              App_Assets.cartSVG,
              colorFilter: ColorFilter.mode(
                App_Color.goldPrimary,
                BlendMode.srcIn,
              ),
            ),
            label: 'cart',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(App_Assets.profileSVG),
            activeIcon: SvgPicture.asset(
              App_Assets.profileSVG,
              colorFilter: ColorFilter.mode(
                App_Color.goldPrimary,
                BlendMode.srcIn,
              ),
            ),
            label: 'profile',
          ),
        ],
        currentIndex: currentIndex,
        onTap: (index) {
          currentIndex = index;
        },
        showSelectedLabels: false,
        showUnselectedLabels: false,
      ),
    );
  }
}
