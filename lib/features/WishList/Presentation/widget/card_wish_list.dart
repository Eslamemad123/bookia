import 'package:bookia/components/mainButton.dart';
import 'package:bookia/core/routes/navigation.dart';
import 'package:bookia/core/routes/route.dart';
import 'package:bookia/core/utils/app%20assets.dart';
import 'package:bookia/core/utils/app%20color.dart';
import 'package:bookia/core/utils/textStyle.dart';
import 'package:bookia/features/Home/data/model/books_response/product.dart';
import 'package:bookia/features/WishList/Presentation/cubit/wishList_cubit.dart';
import 'package:bookia/features/WishList/Presentation/cubit/wishList_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';

class Card_wishList extends StatelessWidget {
  Card_wishList({
    super.key,
    required this.product,
    required this.onDelete,
    required this.onRefresh,
  });
  final Product product;
  void Function() onDelete;
  void Function() onRefresh;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        pushTo(context, Routes.Details, {
          'product': product,
          'sourse': 'wishList',
        }).then((v) {
          onRefresh();
        });
      },
      child: Container(
        child: Column(
          children: [
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: SizedBox(
                    height: 120,
                    width:  100,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.network(
                        product.image ?? '',
                        height: 120,
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
                                product.name ?? '',
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
                          '\$ ${product.price}',
                          style: Text_Style.getText18(color: App_Color.black2),
                        ),
                        Gap(15),
                        Padding(
                          padding: const EdgeInsets.only(right: 20),
                          child: Text(
                            textAlign: TextAlign.left,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            '\$ ${product.description}',
                            style: Text_Style.getText16(
                              color: App_Color.textgreydark,
                            ),
                          ),
                        ),
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
      ),
    );
  }
}
