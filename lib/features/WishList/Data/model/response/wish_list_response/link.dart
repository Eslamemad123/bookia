class Link {
  dynamic url;
  String? label;
  bool? active;

  Link({this.url, this.label, this.active});

  factory Link.fromJson(Map<String, dynamic> json) => Link(
    url: json['url'],
    label: json['label']?.toString(),
    active: json['active']?.toString().contains("true"),
  );

  Map<String, dynamic> toJson() => {
    if (url != null) 'url': url,
    if (label != null) 'label': label,
    if (active != null) 'active': active,
  };
}
