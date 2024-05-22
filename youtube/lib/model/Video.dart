class Video {
  final String id;
  final String title;
  final String description;
  final String image;
  final String channelId;

  Video({
    required this.id,
    required this.title,
    required this.description,
    required this.image,
    required this.channelId,
  });

  factory Video.fromJson(Map<String, dynamic> json) {
    return Video(
      id: json["id"]["videoId"] as String,
      title: json["snippet"]["title"] as String,
      description: json["snippet"]["description"] as String,
      image: json["snippet"]["thumbnails"]["high"]["url"] as String,
      channelId: json["snippet"]["channelId"] as String,
    );
  }

// Other methods, getters, setters, etc.
}
