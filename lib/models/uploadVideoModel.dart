class UploadVideoModel{
  final String videoId;
  final String title;
  final String thumbnail;
  final String ownerId;
  final int views;
  final int likes;
  final int dislikes;
  final bool public;


  UploadVideoModel({
    required this.videoId,
    required this.title,
    required this.thumbnail,
    required this.ownerId,
    required this.views,
    required this.likes,
    required this.dislikes,
    required this.public,
  });

  Map<String, dynamic> toMap(){
    return {
      "video_id": videoId,
      "title": title,
      "thumbnail": thumbnail,
      "owner_id": ownerId,
      "views": views,
      "likes": likes,
      "dislikes": dislikes,
      "public": public,
    };
  }
}