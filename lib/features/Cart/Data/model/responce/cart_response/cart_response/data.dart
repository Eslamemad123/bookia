import 'package:bookia/features/Home/data/model/books_response/product.dart';

import 'cart_item.dart';
import 'user.dart';

class Data {
  num? id;
  User? user;
  String? total;
  List<CartItem>? cartItem;

  Data({this.id, this.user, this.total, this.cartItem});

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    id: num.tryParse(json['id'].toString()),
    user:
        json['user'] == null
            ? null
            : User.fromJson(Map<String, dynamic>.from(json['user'])),
    total: json['total']?.toString(),
    cartItem:
        (json['cart_items'] as List<dynamic>?)
            ?.map((e) => CartItem.fromJson(Map<String, dynamic>.from(e)))
            .toList(),
  );

  Map<String, dynamic> toJson() => {
    if (id != null) 'id': id,
    if (user != null) 'user': user?.toJson(),
    if (total != null) 'total': total,
    if (cartItem != null)
      'cart_items': cartItem?.map((e) => e.toJson()).toList(),
  };
}
