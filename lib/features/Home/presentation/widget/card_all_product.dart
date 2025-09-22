import 'package:bookia/components/mainButton.dart';
import 'package:bookia/core/routes/navigation.dart';
import 'package:bookia/core/routes/route.dart';
import 'package:bookia/core/utils/app%20color.dart';
import 'package:bookia/core/utils/textStyle.dart';
import 'package:bookia/features/Home/data/model/books_response/product.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class CardAllProduct extends StatelessWidget {
  CardAllProduct({super.key, required this.product, required this.title});
  Product product;
  String title;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        pushTo(context, Routes.Details, {
          'product': product,
          'sourse': '$title',
        });
      },
      child: Container(
        height: 300,
        decoration: BoxDecoration(
          color: App_Color.gold2,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.network(
                    product.image ??
                        'https://assets.tracegains.net/resources/img/global/no_image.jpg',
                    fit: BoxFit.cover,
                    width: double.infinity,
                    height: 200,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15, right: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Text(
                      product.name ?? '',
                      overflow: TextOverflow.ellipsis,
                      style: Text_Style.getText20(),
                      textAlign: TextAlign.left,
                    ),
                  ),
                  Gap(10),
                  Text(
                    '₹ ${double.parse(product.price ?? '').toInt()}',
                    style: Text_Style.getText20(),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: 20,
                right: 20,
                bottom: 15,
                top: 8,
              ),
              child: Main_Button(
                title: 'Buy',
                onPress: () {},
                height: 40,
                color: App_Color.black2,
                padding: 10,
                radius: 4,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
