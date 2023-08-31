class SkillDevModel{
  final bool code;
  final bool response;
  List<SkillData> skill;
  SkillDevModel({
    this.code = false,
    this.response = false,
    this.skill = const []
  });

  factory SkillDevModel.fromJson(Map<String,dynamic>json)=>SkillDevModel(
    code: json["code"],
    response: json["response"],
    skill: List<SkillData>.from(json["data"].map((e) => SkillData.fromJson(e))),
  );
}

class SkillData{
  final int id;
  final String title;
  final String image;
  final String price;
  final String video;
  final String? rate;
  final String totalTime;
  final Comments comments;
  SkillData({
    this.id = 0,
    this.title = 'no-title',
    this.image = 'no-image',
    this.price = 'no-price',
    this.video = 'no-video',
    this.rate,
    this.totalTime = 'no-time',
    required this.comments,
  });

  factory SkillData.fromJson(Map<String, dynamic>json) => SkillData(
    id: json["id"],
    title: json["title"],
    image: json["image"],
    price: json["price"],
    video: json["video"],
    rate: json["rate"] ?? "",
    totalTime: json["total_time_video"],
    comments: Comments.fromJson(json["comments"])
  );
}

class Comments{
  final List<Comment> comment;
  final List<ReplayComment> replyComment;
  Comments({
    this.comment = const [],
    this.replyComment = const []
  });

  factory Comments.fromJson(Map<String,dynamic>json)=>Comments(
    comment: List<Comment>.from(json["comment"].map((e) => Comment.fromJson(e))),
    replyComment: List<ReplayComment>.from(json["reply_comment"].map((e) => ReplayComment.fromJson(e))),
  );
}

class Comment{
  final int id;
  final String body;
  final String? userId;
  final String? postId;
  final dynamic likeCount;
  Comment({
    this.id = 0,
    this.body = 'no-body',
    this.userId = 'no-userId',
    this.postId = 'no-postId',
    this.likeCount
  });

  factory Comment.fromJson(Map<String,dynamic>json)=>Comment(
    id: json["id"],
    body: json["body"],
    userId: json["user_Id"] ?? "",
    postId: json["post_id"] ?? "",
    likeCount: json["like_count"] ?? 0
  );
}

class ReplayComment{
  final int id;
  final String body;
  final dynamic likeCount;
  ReplayComment({
    this.id = 0,
    this.body = 'no-body',
    this.likeCount
  });

  factory ReplayComment.fromJson(Map<String,dynamic>json)=>ReplayComment(
    id: json["id"],
    body: json["body"],
    likeCount: json["like_count"] ?? ""
  );
}