class Post {
  String? id;
  String? title;
  String? description;
  String? postUrl;

  Post({this.id, this.title, this.description, this.postUrl});

  // Convert a Post object into a Map object
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'postUrl': postUrl,
    };
  }

  // Extract a Post object from a Map object
  factory Post.fromJson(Map<String, dynamic> json) {
    return Post(
      id: json['id'],
      title: json['title'],
      description: json['description'],
      postUrl: json['image'], // Assuming 'image' is the URL you want to use
    );
  }
}
