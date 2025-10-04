import 'package:bookia/components/mainButton.dart';
import 'package:bookia/core/routes/navigation.dart';
import 'package:bookia/core/routes/route.dart';
import 'package:bookia/core/utils/app%20assets.dart';
import 'package:bookia/core/utils/app%20color.dart';
import 'package:bookia/core/utils/textStyle.dart';
import 'package:bookia/features/Cart/Data/model/responce/cart_response/cart_response/cart_item.dart';
import 'package:bookia/features/Cart/Presentation/widget/lineDiscoundProduct.dart';
import 'package:bookia/features/Home/data/model/books_response/product.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';

class Card_Cart extends StatelessWidget {
  Card_Cart({
    super.key,
    required this.product,
    required this.onDelete,
    required this.onUpdate,
  });
  final CartItem product;
  void Function()? onDelete;
  void Function(num) onUpdate;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: SizedBox(
                  height: 120,
                  width: 100,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.network(
                      product.itemProductImage ??
                          'https://assets.tracegains.net/resources/img/global/no_image.jpg',
                      height: 130,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Text(
                              product.itemProductName ?? '',
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: Text_Style.getText18(
                                color: App_Color.textgreydark,
                              ),
                            ),
                          ),
                          Gap(10),
                          Padding(
                            padding: const EdgeInsets.only(right: 25),
                            child: GestureDetector(
                              onTap: onDelete,
                              child: SvgPicture.asset(App_Assets.closeSVG),
                            ),
                          ),
                        ],
                      ),
                      Gap(10),
                      Text(
                        textAlign: TextAlign.left,
                        '\$ ${product.itemProductPrice}',
                        style: Text_Style.getText18(color: App_Color.black2),
                      ),
                      Gap(15),
                      Price(),
                    ],
                  ),
                ),
              ),
            ],
          ),
          Gap(10),
          Divider(
            color: App_Color.borderFormFiled,
            thickness: 1,
            endIndent: 40,
            indent: 40,
          ),
        ],
      ),
    );
  }

  Row Price() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Counter(),
        Padding(
          padding: const EdgeInsets.only(right: 10),
          child: Column(
            children: [
              PriceBeforeDiscound(),
              Text(
                '\$ ${(product.itemTotal ?? 0).toStringAsFixed(1)}',
                style: Text_Style.getText20(color: App_Color.green),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Stack PriceBeforeDiscound() {
    return Stack(
      children: [
        Text(
          "\$ ${(double.parse(product.itemProductPrice ?? '0')) * (product.itemQuantity ?? 1)}",
          style: TextStyle(
            fontSize: 18,
            color: Colors.grey,
            fontStyle: FontStyle.italic,
          ),
        ),
        Positioned.fill(child: CustomPaint(painter: DiagonalLinePainter())),
      ],
    );
  }

  Row Counter() {
    return Row(
      children: [
        SizedBox(
          width: 45,
          height: 45,
          child: FloatingActionButton(
            heroTag: 'minus${product.itemId}',
            elevation: 0,
            onPressed: () {
              if ((product.itemQuantity ?? 1) > 1) {
                onUpdate((product.itemQuantity ?? 1) - 1);
              }
            },
            backgroundColor: App_Color.gold2,
            child: SvgPicture.asset(App_Assets.minusSVG),
          ),
        ),
        SizedBox(
          width: 40,
          child: Text(
            product.itemQuantity.toString(),
            style: Text_Style.getText20(),
            textAlign: TextAlign.center,
          ),
        ),

        SizedBox(
          width: 45,
          height: 45,
          child: FloatingActionButton(
            heroTag: 'plus${product.itemId}',

            elevation: 0,
            onPressed: () {
              if ((product.itemQuantity ?? 1) <
                  (product.itemProductStock ?? 1)) {
                onUpdate((product.itemQuantity ?? 1) + 1);
              }
            },
            backgroundColor: App_Color.gold2,
            child: SvgPicture.asset(App_Assets.plusSVG),
          ),
        ),
      ],
    );
  }
}
