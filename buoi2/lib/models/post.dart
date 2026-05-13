class Post {
  final int id;
  final String img_url;
  final String title;
  final String body;
  final String sources;
  final String date;

  const Post({
    required this.title,
    required this.id,
    required this.body,
    required this.img_url,
    required this.sources,
    required this.date,
  });
  factory Post.fromJson(Map<String, dynamic> json) {
    return Post(
      title: json['title'] as String,
      body: json['body'] as String,
      id: json['id'] as int,
      img_url: "https://picsum.photos/500/300?random=${json['id']}",
      sources: "Ái Nhi",
      date: "12/05/2005",
    );
  }
}
