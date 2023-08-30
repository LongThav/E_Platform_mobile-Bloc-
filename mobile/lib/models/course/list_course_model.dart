class CourseModel {
  final int code;
  final bool successfully;
  List<DataCourse> datacourse;
  CourseModel(
      {this.code = 0,
      this.successfully = false,
      this.datacourse = const []});

  factory CourseModel.fromJson(Map<String, dynamic> json) => CourseModel(
        code: json["code"],
        successfully: json["successfully"],
        datacourse: List<DataCourse>.from(
            json["data"].map((e) => DataCourse.fromJson(e))),
      );
}

class DataCourse {
  final int id;
  final String title;
  final String image;
  final String price;
  final String video;
  final int rate;
  final String timeVideo;

  DataCourse(
      {this.id = 0,
      this.title = "no-title",
      this.image = "no-image",
      this.price = "no-price",
      this.video = "no-video",
      this.rate = 0,
      this.timeVideo = "no-timevideo"});

  factory DataCourse.fromJson(Map<String, dynamic> json) => DataCourse(
      id: json["id"],
      title: json["title"],
      image: json["image"],
      price: json["price"],
      video: json["video"],
      rate: json["rate"],
      timeVideo: json["total_time_video"]);
}
