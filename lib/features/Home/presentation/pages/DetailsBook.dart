import 'package:bookia/components/app__bar.dart';
import 'package:bookia/core/utils/app%20assets.dart';
import 'package:bookia/features/Home/data/model/books_response/product.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class Details_Book extends StatelessWidget {
  Details_Book({super.key, required this.product, required this.title});
  Product product;
  String title;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: App_Bar(
        leading: true,
        action: true,
        icon: App_Assets.bookmarkSVG,
      ),
      body: SingleChildScrollView(child: Column(children: [
        
      ],)),
    );
  }
}
