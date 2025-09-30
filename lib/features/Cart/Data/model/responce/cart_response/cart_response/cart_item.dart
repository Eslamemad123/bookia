class CartItem {
  num? itemId;
  num? itemProductId;
  String? itemProductName;
  String? itemProductImage;
  String? itemProductPrice;
  num? itemProductDiscount;
  num? itemProductPriceAfterDiscount;
  num? itemProductStock;
  num? itemQuantity;
  num? itemTotal;

  CartItem({
    this.itemId,
    this.itemProductId,
    this.itemProductName,
    this.itemProductImage,
    this.itemProductPrice,
    this.itemProductDiscount,
    this.itemProductPriceAfterDiscount,
    this.itemProductStock,
    this.itemQuantity,
    this.itemTotal,
  });

  factory CartItem.fromJson(Map<String, dynamic> json) => CartItem(
    itemId: num.tryParse(json['item_id'].toString()),
    itemProductId: num.tryParse(json['item_product_id'].toString()),
    itemProductName: json['item_product_name']?.toString(),
    itemProductImage: json['item_product_image']?.toString(),
    itemProductPrice: json['item_product_price']?.toString(),
    itemProductDiscount: num.tryParse(json['item_product_discount'].toString()),
    itemProductPriceAfterDiscount: num.tryParse(
      json['item_product_price_after_discount'].toString(),
    ),
    itemProductStock: num.tryParse(json['item_product_stock'].toString()),
    itemQuantity: num.tryParse(json['item_quantity'].toString()),
    itemTotal: num.tryParse(json['item_total'].toString()),
  );

  Map<String, dynamic> toJson() => {
    if (itemId != null) 'item_id': itemId,
    if (itemProductId != null) 'item_product_id': itemProductId,
    if (itemProductName != null) 'item_product_name': itemProductName,
    if (itemProductImage != null) 'item_product_image': itemProductImage,
    if (itemProductPrice != null) 'item_product_price': itemProductPrice,
    if (itemProductDiscount != null)
      'item_product_discount': itemProductDiscount,
    if (itemProductPriceAfterDiscount != null)
      'item_product_price_after_discount': itemProductPriceAfterDiscount,
    if (itemProductStock != null) 'item_product_stock': itemProductStock,
    if (itemQuantity != null) 'item_quantity': itemQuantity,
    if (itemTotal != null) 'item_total': itemTotal,
  };
}
