import 'package:bookia/core/utils/app%20color.dart';
import 'package:bookia/features/Home/data/model/SliderResponse/slider_resbonse/slider.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class Home_Slider extends StatefulWidget {
  Home_Slider({super.key, required this.slider});
  List<Slider_Model> slider;
  @override
  State<Home_Slider> createState() => _Home_SliderState();
}

class _Home_SliderState extends State<Home_Slider> {
  @override
  int CurrentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [Gap(10), Curouse_Slider(), Gap(10), Smooth_Effect()],
    );
  }

  SmoothPageIndicator Smooth_Effect() {
    return SmoothPageIndicator(
      controller: PageController(initialPage: CurrentIndex), // PageController
      count: widget.slider.length,
      effect: ExpandingDotsEffect(
        dotWidth: 7,
        dotHeight: 7,
        spacing: 7,
        dotColor: App_Color.borderFormFiled,
        activeDotColor: App_Color.goldPrimary,
        expansionFactor: 5,
      ), // your preferred effect
      onDotClicked: (index) {},
    );
  }

  CarouselSlider Curouse_Slider() {
    return CarouselSlider.builder(
      itemBuilder:
          (BuildContext context, int itemIndex, int pageViewIndex) => Padding(
            padding: const EdgeInsets.all(15),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.network(
                widget.slider[CurrentIndex].image ??
                    'https://assets.tracegains.net/resources/img/global/no_image.jpg',
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
          ),
      itemCount: 3,
      options: CarouselOptions(
        height: 170,
        viewportFraction: 1,
        initialPage: 0,
        enableInfiniteScroll: true,
        reverse: false,
        autoPlay: true,
        autoPlayInterval: Duration(seconds: 3),
        autoPlayAnimationDuration: Duration(milliseconds: 800),
        autoPlayCurve: Curves.fastOutSlowIn,
        enlargeCenterPage: true,
        enlargeFactor: 0.3,
        scrollDirection: Axis.horizontal,
        onPageChanged: (int index, CarouselPageChangedReason reason) {
          setState(() {
            CurrentIndex = index;
          });
        },
      ),
    );
  }
}
