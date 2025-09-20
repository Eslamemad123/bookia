import 'slider.dart';

class Data {
  List<Slider_Model>? sliders;

  Data({this.sliders});

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    sliders:
        (json['sliders'] as List<dynamic>?)
            ?.map((e) => Slider_Model.fromJson(Map<String, dynamic>.from(e)))
            .toList(),
  );

  Map<String, dynamic> toJson() => {
    if (sliders != null) 'sliders': sliders?.map((e) => e.toJson()).toList(),
  };
}
