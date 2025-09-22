import 'package:bookia/components/app__bar.dart';
import 'package:bookia/features/Home/data/model/books_response/product.dart';
import 'package:bookia/features/Home/presentation/widget/card_all_product.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class See_All extends StatelessWidget {
  See_All({super.key, required this.product, required this.title});
  List<Product> product;
  final String title;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: App_Bar(leading: true, title: title),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              width: double.infinity,
              child: ListView.separated(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  return CardAllProduct(product: product[index],title: 'SeeAll-$title',);
                },
                separatorBuilder: (context, index) => Gap(15),
                itemCount: product.length,
                scrollDirection: Axis.vertical,
              ),
            ) /*
            SizedBox(
              width: double.infinity,
              height: double.infinity,
              child: GridView.builder(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  mainAxisExtent: 200
                ),
                itemBuilder: (context, index) {
                  log('>>>>> ${product[index]}');
              
                  return Book_Card(product: product[index]);
                },
              ),
            ),*/,
          ],
        ),
      ),
    );
  }
}
