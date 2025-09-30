import 'package:bookia/core/utils/app%20assets.dart';
import 'package:bookia/core/utils/app%20color.dart';
import 'package:bookia/features/Cart/Presentation/pages/CartScreen.dart';
import 'package:bookia/features/Home/presentation/pages/home.dart';
import 'package:bookia/features/WishList/Presentation/pages/wishListScreen.dart';
import 'package:bookia/features/profile/presentation/page/profile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Main_Screen extends StatefulWidget {
  const Main_Screen({super.key,this.initialIndex});
final int? initialIndex;
  @override
  State<Main_Screen> createState() => _Main_ScreenState();
}

class _Main_ScreenState extends State<Main_Screen> {
  int currentIndex = 0;

@override
  void initState() {
    super.initState();
    currentIndex = widget.initialIndex ?? currentIndex;
  }
  @override
  void didUpdateWidget(covariant Main_Screen oldWidget) {
    super.didUpdateWidget(oldWidget);
    currentIndex = widget.initialIndex ??currentIndex;
  }
  List<Widget> screens = [
    Home_Screen(),
    WishList_Screen(),
    Cart_Screen(),
    Profile_Screen(),
    // Welcom_Screen(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[currentIndex],
      bottomNavigationBar: _BottomNavigation(),
    );
  }

  BottomNavigationBar _BottomNavigation() {
    return BottomNavigationBar(
      elevation: 0,

      type: BottomNavigationBarType.fixed,
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
        setState(() {
          currentIndex = index;
        });
      },
      showSelectedLabels: false,
      showUnselectedLabels: false,
    );
  }
}
