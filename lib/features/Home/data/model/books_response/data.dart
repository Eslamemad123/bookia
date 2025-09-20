import 'links.dart';
import 'meta.dart';
import 'product.dart';

class Data {
  List<Product>? products;
  Meta? meta;
  Links? links;

  Data({this.products, this.meta, this.links});

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    products:
        (json['products'] as List<dynamic>?)
            ?.map((e) => Product.fromJson(Map<String, dynamic>.from(e)))
            .toList(),
    meta:
        json['meta'] == null
            ? null
            : Meta.fromJson(Map<String, dynamic>.from(json['meta'])),
    links:
        json['links'] == null
            ? null
            : Links.fromJson(Map<String, dynamic>.from(json['links'])),
  );

  Map<String, dynamic> toJson() => {
    if (products != null) 'products': products?.map((e) => e.toJson()).toList(),
    if (meta != null) 'meta': meta?.toJson(),
    if (links != null) 'links': links?.toJson(),
  };
}
