class Product {
  num? id;
  String? name;
  String? description;
  String? price;
  num? discount;
  num? priceAfterDiscount;
  num? stock;
  num? bestSeller;
  String? image;
  String? category;

  Product({
    this.id,
    this.name,
    this.description,
    this.price,
    this.discount,
    this.priceAfterDiscount,
    this.stock,
    this.bestSeller,
    this.image,
    this.category,
  });

  factory Product.fromJson(Map<String, dynamic> json) => Product(
    id: num.tryParse(json['id'].toString()),
    name: json['name']?.toString(),
    description: json['description']?.toString(),
    price: json['price']?.toString(),
    discount: num.tryParse(json['discount'].toString()),
    priceAfterDiscount: num.tryParse(json['price_after_discount'].toString()),
    stock: num.tryParse(json['stock'].toString()),
    bestSeller: num.tryParse(json['best_seller'].toString()),
    image: json['image']?.toString(),
    category: json['category']?.toString(),
  );

  Map<String, dynamic> toJson() => {
    if (id != null) 'id': id,
    if (name != null) 'name': name,
    if (description != null) 'description': description,
    if (price != null) 'price': price,
    if (discount != null) 'discount': discount,
    if (priceAfterDiscount != null) 'price_after_discount': priceAfterDiscount,
    if (stock != null) 'stock': stock,
    if (bestSeller != null) 'best_seller': bestSeller,
    if (image != null) 'image': image,
    if (category != null) 'category': category,
  };
}
