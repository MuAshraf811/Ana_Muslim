class HadithBooksModel {
  final String name;
  final String id;
  final int count;

  HadithBooksModel({
    required this.name,
    required this.id,
    required this.count,
  });

  factory HadithBooksModel.fromJson(Map<String, dynamic> json) {
    return HadithBooksModel(
      name: json["name"],
      id: json["id"],
      count: json["available"],
    );
  }
}
