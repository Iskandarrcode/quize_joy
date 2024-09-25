class QuizeModel {
  String? id; // id maydoni String bo'ladi
  String question;
  String answer;

  QuizeModel({this.id, required this.question, required this.answer});

  // Xarita ko'rinishidan QuizeModel yaratish
  factory QuizeModel.fromMap(Map<String, dynamic> map) {
    return QuizeModel(
      id: map['id'] as String?,
      question: map['question'] as String,
      answer: map['answer'] as String,
    );
  }

  // QuizeModelni xarita ko'rinishiga aylantirish
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'question': question,
      'answer': answer,
    };
  }
}
