import 'package:bookia/components/mainButton.dart';
import 'package:bookia/core/routes/navigation.dart';
import 'package:bookia/core/routes/route.dart';
import 'package:bookia/core/utils/app%20color.dart';
import 'package:bookia/core/utils/textStyle.dart';
import 'package:bookia/features/Home/data/model/books_response/product.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class Book_Card extends StatelessWidget {
  Book_Card({super.key, required this.product, required this.title});
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
        width: 170,
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
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: SizedBox(
                height: 45,
                child: Text(
                  product.name ?? '',
                  style: Text_Style.getText16(),
                  textAlign: TextAlign.left,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                ),
              ),
            ),
            Gap(5),
            Padding(
              padding: const EdgeInsets.only(left: 10, bottom: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '₹ ${double.parse(product.price ?? '').toInt()}',
                    style: Text_Style.getText18(),
                  ),
                  Main_Button(
                    title: 'Buy',
                    onPress: () {},
                    width: 80,
                    height: 30,
                    color: App_Color.black2,
                    padding: 10,
                    radius: 4,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
