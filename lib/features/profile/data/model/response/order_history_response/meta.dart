class Meta {
  num? total;
  num? perPage;
  num? currentPage;
  num? lastPage;

  Meta({this.total, this.perPage, this.currentPage, this.lastPage});

  factory Meta.fromJson(Map<String, dynamic> json) => Meta(
    total: num.tryParse(json['total'].toString()),
    perPage: num.tryParse(json['per_page'].toString()),
    currentPage: num.tryParse(json['current_page'].toString()),
    lastPage: num.tryParse(json['last_page'].toString()),
  );

  Map<String, dynamic> toJson() => {
    if (total != null) 'total': total,
    if (perPage != null) 'per_page': perPage,
    if (currentPage != null) 'current_page': currentPage,
    if (lastPage != null) 'last_page': lastPage,
  };
}
