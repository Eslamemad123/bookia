import 'faq.dart';

class Data {
  List<Faq>? faqs;

  Data({this.faqs});

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    faqs:
        (json['faqs'] as List<dynamic>?)
            ?.map((e) => Faq.fromJson(Map<String, dynamic>.from(e)))
            .toList(),
  );

  Map<String, dynamic> toJson() => {
    if (faqs != null) 'faqs': faqs?.map((e) => e.toJson()).toList(),
  };
}
