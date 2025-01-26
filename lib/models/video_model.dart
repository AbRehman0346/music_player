import 'package:music_player/constants.dart';

class VideoModelFields{
  String videoId = "video_id";
  String title = "title";
  String thumbnail = "thumbnail";
  String ownerId = "owner_id";
  String views = "views";
  String likes = "likes";
  String dislikes = "dislikes";
  String public = "public";
}

class VideoModel{
  final String videoId;
  final String title;
  final String thumbnail;
  final String ownerId;
  final int views;
  final int likes;
  final int dislikes;
  final bool public;


  VideoModel({
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
    VideoModelFields fields = VideoModelFields();
    return {
      fields.videoId: videoId,
      fields.title: title,
      fields.thumbnail: thumbnail,
      fields.ownerId: ownerId,
      fields.views: views,
      fields.likes: likes,
      fields.dislikes: dislikes,
      fields.public: public,
    };
  }


  String getFullVideoLink(){
    return Constants.getLink(videoId);
  }

  String getFullThumbnailLink(){
    return Constants.getLink(thumbnail);
  }

}