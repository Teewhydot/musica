class Album {
  final String imageUrl;
  final String title;
  final String artistName;
  final int fans;
  final String trackList;

  Album({
    required this.imageUrl,
    required this.title,
    required this.artistName,
    required this.fans,
    required this.trackList,
  });

  factory Album.fromJson(Map<String, dynamic> json) {
    return Album(
      imageUrl: json['picture_big'],
      title: json['title'],
      artistName: json['creator']['name'],
      fans: json['id'],
      trackList: json['tracklist'],
    );
  }
}
