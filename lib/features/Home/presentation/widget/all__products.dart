import 'package:bookia/components/mainButton.dart';
import 'package:bookia/core/routes/navigation.dart';
import 'package:bookia/core/routes/route.dart';
import 'package:bookia/core/utils/app%20assets.dart';
import 'package:bookia/core/utils/app%20color.dart';
import 'package:bookia/core/utils/textStyle.dart';
import 'package:bookia/features/Home/data/model/books_response/product.dart';
import 'package:bookia/features/Home/presentation/widget/card_all_product.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class All_Products extends StatelessWidget {
  All_Products({super.key, required this.product});
  List<Product> product;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('All Product', style: Text_Style.getText25()),
            TextButton(
              style: ButtonStyle(
                overlayColor: WidgetStateProperty.all(App_Color.gold2),
              ),
              onPressed: () {
                                pushTo(context, Routes.SeeAll,{'product':product,'title':'Best Saller'});

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
          width: double.infinity,
          child: ListView.separated(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              return CardAllProduct(product: product[index]);
            },
            separatorBuilder: (context, index) => Gap(15),
            itemCount: product.length,
            scrollDirection: Axis.vertical,
          ),
        ),
      ],
    );
  }
}
