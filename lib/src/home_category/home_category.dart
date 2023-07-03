class HomeCategory {
  HomeCategory({
    required this.title,
    required this.image,
  });

  String title;
  String image;

  factory HomeCategory.fromJson(Map<String, dynamic> json) => HomeCategory(
        title: json["title"],
        image: json["image"],
      );

  Map<String, dynamic> toJson() => {
        "uid": title,
        "name": image,
      };
}
