// Country class with fromJson factory constructor
class Country {
  final String name;
  final String code;
  final String emoji;
  final String image;

  Country({required this.name, required this.code, required this.emoji, required this.image});

  factory Country.fromJson(Map<String, dynamic> json) {
    return Country(
      name: json['name'],
      code: json['code'],
      emoji: json['emoji'],
      image: json['image'],
    );
  }
}