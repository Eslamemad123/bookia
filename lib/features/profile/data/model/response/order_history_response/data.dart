import 'links.dart';
import 'meta.dart';
import 'order.dart';

class Data {
  List<Order>? orders;
  Meta? meta;
  Links? links;

  Data({this.orders, this.meta, this.links});

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    orders:
        (json['orders'] as List<dynamic>?)
            ?.map((e) => Order.fromJson(Map<String, dynamic>.from(e)))
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
    if (orders != null) 'orders': orders?.map((e) => e.toJson()).toList(),
    if (meta != null) 'meta': meta?.toJson(),
    if (links != null) 'links': links?.toJson(),
  };
}
