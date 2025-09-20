class Slider_Model {
  String? image;

  Slider_Model({this.image});

  factory Slider_Model.fromJson(Map<String, dynamic> json) =>
      Slider_Model(image: json['image']?.toString());

  Map<String, dynamic> toJson() => {if (image != null) 'image': image};
}
