class Order {
  num? id;
  String? orderCode;
  String? orderDate;
  String? status;
  String? total;

  Order({this.id, this.orderCode, this.orderDate, this.status, this.total});

  factory Order.fromJson(Map<String, dynamic> json) => Order(
    id: num.tryParse(json['id'].toString()),
    orderCode: json['order_code']?.toString(),
    orderDate: json['order_date']?.toString(),
    status: json['status']?.toString(),
    total: json['total']?.toString(),
  );

  Map<String, dynamic> toJson() => {
    if (id != null) 'id': id,
    if (orderCode != null) 'order_code': orderCode,
    if (orderDate != null) 'order_date': orderDate,
    if (status != null) 'status': status,
    if (total != null) 'total': total,
  };
}
