class Links {
  String? first;
  String? last;
  dynamic prev;
  String? next;

  Links({this.first, this.last, this.prev, this.next});

  factory Links.fromJson(Map<String, dynamic> json) => Links(
    first: json['first']?.toString(),
    last: json['last']?.toString(),
    prev: json['prev'],
    next: json['next']?.toString(),
  );

  Map<String, dynamic> toJson() => {
    if (first != null) 'first': first,
    if (last != null) 'last': last,
    if (prev != null) 'prev': prev,
    if (next != null) 'next': next,
  };
}
