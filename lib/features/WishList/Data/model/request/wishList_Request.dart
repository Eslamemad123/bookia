class WishList_Request {
  num? id;
  WishList_Request({this.id});

  Map<String, dynamic> toJson_WishList() {
    return {'product_id': id};
  }
}
