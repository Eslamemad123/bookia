import 'package:bookia/core/routes/navigation.dart';
import 'package:bookia/core/routes/route.dart';
import 'package:bookia/core/utils/app%20color.dart';
import 'package:bookia/core/utils/textStyle.dart';
import 'package:bookia/features/Home/data/model/books_response/product.dart';
import 'package:bookia/features/Home/presentation/widget/book__card.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class Best_Seller extends StatelessWidget {
  Best_Seller({super.key, required this.product});
  List<Product> product;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Best Seller', style: Text_Style.getText25()),
            TextButton(
              style: ButtonStyle(
                overlayColor: WidgetStateProperty.all(App_Color.gold2),
              ),
              onPressed: () {
                pushTo(context, Routes.SeeAll, {
                  'product': product,
                  'title': 'Best Saller',
                });
              },
              child: Text(
                'See All',
                style: Text_Style.getText25(color: App_Color.goldPrimary),
              ),
            ),
          ],
        ),
        Gap(15),
        SizedBox(
          height: 280,
          child: ListView.separated(
            itemBuilder: (context, index) {
              return Book_Card(product: product[index],title: 'bestSaller',);
            },
            separatorBuilder: (context, index) => Gap(10),
            itemCount: product.length,
            scrollDirection: Axis.horizontal,
          ),
        ),
      ],
    );
  }
}
