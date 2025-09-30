class Faq {
  num? id;
  String? question;
  String? answer;

  Faq({this.id, this.question, this.answer});

  factory Faq.fromJson(Map<String, dynamic> json) => Faq(
    id: num.tryParse(json['id'].toString()),
    question: json['question']?.toString(),
    answer: json['answer']?.toString(),
  );

  Map<String, dynamic> toJson() => {
    if (id != null) 'id': id,
    if (question != null) 'question': question,
    if (answer != null) 'answer': answer,
  };
}
