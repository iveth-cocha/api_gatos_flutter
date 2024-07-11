class Fox {
  final String image;
  final String link;

  Fox({required this.image, required this.link});

  factory Fox.fromJson(Map<String, dynamic> json) {
    return Fox(
      image: json['image'],
      link: json['link'],
    );
  }
}