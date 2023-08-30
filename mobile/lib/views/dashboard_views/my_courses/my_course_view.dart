import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile/logics/my_course_logic.dart';
import 'package:mobile/models/course/list_course_model.dart';
import 'package:mobile/utils/rests/handle_push_view.dart';
import 'package:mobile/views/dashboard_views/my_courses/chat_view.dart';
import '/utils/constants/color_app.dart';
import '/utils/constants/font_app.dart';
import 'video_call_view.dart';

class MyCourseView extends StatefulWidget {
  const MyCourseView({super.key});

  @override
  State<MyCourseView> createState() => _MyCourseViewState();
}

class _MyCourseViewState extends State<MyCourseView> {
  final PageController _pageController = PageController();
  int indexTitle = 0;
  String _sub = "My Courses";

  List<String> title = ['Courses', 'Live Sessions', 'BookMark'];
  List<dynamic> skillDevelopment = [
    {
      "title": "UX/UI Design",
      "img": "assets/imgs/ui.png",
      "duration": "3hr:45mn",
      "price": "\$30.00"
    },
    {
      "title": "Web Design",
      "img": "assets/imgs/web_design.png",
      "duration": "10hr:45mn",
      "price": "\$30.00"
    },
    {
      "title": "Graphics Design",
      "img": "assets/imgs/graphic_design.png",
      "duration": "3hr:45mn",
      "price": "\$30.00"
    },
    {
      "title": "Motion Graphics",
      "img": "assets/imgs/motion.png",
      "duration": "3hr:45mn",
      "price": "\$30.00"
    },
    {
      "title": "Graphics Design",
      "img": "assets/imgs/graphic_design.png",
      "duration": "3hr:45mn",
      "price": "\$30.00"
    },
    {
      "title": "Motion Graphics",
      "img": "assets/imgs/motion.png",
      "duration": "3hr:45mn",
      "price": "\$30.00"
    },
  ];

  List<dynamic> bookMark = [
    {
      "title": "Web Design",
      "img": "assets/imgs/web_design.png",
      "duration": "10hr:45mn",
      "price": "\$30.00"
    },
    {
      "title": "Graphics Design",
      "img": "assets/imgs/graphic_design.png",
      "duration": "3hr:45mn",
      "price": "\$30.00"
    },
    {
      "title": "Motion Graphics",
      "img": "assets/imgs/motion.png",
      "duration": "3hr:45mn",
      "price": "\$30.00"
    },
    {
      "title": "Graphics Design",
      "img": "assets/imgs/graphic_design.png",
      "duration": "3hr:45mn",
      "price": "\$30.00"
    },
    {
      "title": "Motion Graphics",
      "img": "assets/imgs/motion.png",
      "duration": "3hr:45mn",
      "price": "\$30.00"
    },
    {
      "title": "UX/UI Design",
      "img": "assets/imgs/ui.png",
      "duration": "3hr:45mn",
      "price": "\$30.00"
    },
  ];

  List<dynamic> liveSession = [
    {
      "title": "Mathematics",
      "img": "assets/imgs/playvideo.png",
      "comment": "assets/imgs/comments.png",
      "total_comment": "4.7",
      "like": "9.7k",
    },
    {
      "title": "Physics",
      "img": "assets/imgs/playvideo.png",
      "comment": "assets/imgs/comments.png",
      "total_comment": "4.7",
      "like": "9.7k",
    },
    {
      "title": "Marketing",
      "img": "assets/imgs/playvideo.png",
      "comment": "assets/imgs/comments.png",
      "total_comment": "4.7",
      "like": "9.7k",
    },
    {
      "title": "Management",
      "img": "assets/imgs/playvideo.png",
      "comment": "assets/imgs/comments.png",
      "total_comment": "4.7",
      "like": "9.7k",
    },
  ];

  @override
  void initState() {
    context.read<MyCourseLogic>().add(ReadMyCourseEvent());
    super.initState();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: ColorsApp.colorView,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: ColorsApp.colorView,
        title: Text(
          _sub,
          style: TextStyle(
              fontSize: 20, fontFamily: manropeBold, color: Colors.grey[700]),
        ),
        elevation: 0.0,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        physics: const NeverScrollableScrollPhysics(),
        padding: const EdgeInsets.symmetric(
          horizontal: 15,
        ),
        child: Container(
          width: width,
          padding: const EdgeInsets.only(bottom: 0),
          decoration: BoxDecoration(
              color: const Color(0XFFFFFFFF),
              borderRadius: BorderRadius.circular(12)),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 15),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: List.generate(title.length, (index) {
                    return InkWell(
                      onTap: () {
                        setState(() {
                          indexTitle = index;
                          if (index == 0) {
                            _sub = "My Courses";
                            context.read<MyCourseLogic>().add(ReadMyCourseEvent());
                          } else if (index == 1) {
                            _sub = "Live Sessions";
                          } else {
                            _sub = "BookMark";
                          }
                        });
                        _pageController.jumpToPage(index);
                      },
                      child: Container(
                        alignment: Alignment.topCenter,
                        margin: const EdgeInsets.symmetric(horizontal: 15),
                        height: height * 0.05,
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                            color: indexTitle == index
                                ? ColorsApp.btnColor
                                : Colors.white,
                            borderRadius: BorderRadius.circular(12),
                            boxShadow: indexTitle == index
                                ? null
                                : [
                                    BoxShadow(
                                      blurRadius: 2.0,
                                      color: ColorsApp.colorView,
                                      offset: const Offset(7, 8),
                                    )
                                  ]),
                        child: Center(
                          child: Text(
                            title[index],
                            style: TextStyle(
                                color: indexTitle == index
                                    ? Colors.white
                                    : Colors.grey[700],
                                fontFamily: manrope,
                                fontWeight: FontWeight.bold,
                                letterSpacing: 0.2),
                          ),
                        ),
                      ),
                    );
                  }),
                ),
                Container(
                  padding: const EdgeInsets.only(top: 15),
                  width: width,
                  height: height * 0.7,
                  child: PageView(
                    onPageChanged: (value) {
                      setState(() {
                        indexTitle = value;
                      });
                    },
                    controller: _pageController,
                    children: [
                      BlocBuilder<MyCourseLogic, MyCourseState>(
                          builder: (context, state) {
                        if (state is InitializeState || state is LoadingState) {
                          return Center(
                            child: CircularProgressIndicator(),
                          );
                        } else if (state is ErrorState) {
                          String err = state.error;
                          return Center(
                            child: Text(err),
                          );
                        } else if (state is ReadMyCourseStateSuccess) {
                          var data = state.courseModel;
                          return _buildCourse(data, width, height);
                        } else {
                          return Container();
                        }
                      }),
                      _buildLiveSession(width, height),
                      _buildBookMark(width, height),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildCourse(CourseModel _courseModel ,double width, double height) {
    return RefreshIndicator(
      onRefresh: ()async{
        context.read<MyCourseLogic>().add(ReadMyCourseEvent());
      },
      child: SizedBox(
        child: ListView.builder(
          shrinkWrap: true,
          itemCount: _courseModel.datacourse.length,
          itemBuilder: (context, index) {
            var data = _courseModel.datacourse[index];
            return Container(
              margin: const EdgeInsets.only(bottom: 0, top: 10),
              padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [
                    BoxShadow(
                      blurRadius: 2.0,
                      color: ColorsApp.colorView,
                      offset: const Offset(-7, -8),
                    )
                  ]),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Container(
                        width: 100,
                        height: 90,
                        decoration: BoxDecoration(
                            color: ColorsApp.colorView,
                            borderRadius: BorderRadius.circular(12),
                            image: DecorationImage(
                                image:
                                    AssetImage(skillDevelopment[index]['img']))),
                      ),
                      SizedBox(
                        width: width * 0.03,
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            data.title,
                            style: const TextStyle(
                              fontFamily: manropeBold,
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(
                            height: height * 0.01,
                          ),
                          Row(
                            children: const [
                              Icon(
                                Icons.star,
                                color: Colors.yellow,
                                size: 18,
                              ),
                              Icon(
                                Icons.star,
                                color: Colors.yellow,
                                size: 18,
                              ),
                              Icon(
                                Icons.star,
                                color: Colors.yellow,
                                size: 18,
                              ),
                              Icon(
                                Icons.star,
                                color: Colors.yellow,
                                size: 18,
                              ),
                            ],
                          ),
                          SizedBox(
                            height: height * 0.01,
                          ),
                          Row(
                            children: [
                              const Icon(
                                Icons.alarm_outlined,
                                size: 18,
                              ),
                              Text(
                                data.timeVideo,
                                style: const TextStyle(
                                    fontFamily: manrope,
                                    fontWeight: FontWeight.bold,
                                    letterSpacing: 0.5),
                              )
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Container(
                        width: 40,
                        height: 40,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle, color: ColorsApp.circleColor),
                        child: const Center(
                          child: Icon(
                            Icons.arrow_forward_ios,
                            color: Colors.white,
                            size: 20,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: height * 0.005,
                      ),
                      Text(
                        "USD:${data.price}",
                        style: const TextStyle(
                            fontFamily: manrope,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 0.5,
                            fontSize: 13),
                      )
                    ],
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  Widget _buildBookMark(double width, double height) {
    return SizedBox(
      child: ListView.builder(
        itemCount: bookMark.length,
        itemBuilder: (context, index) {
          return Container(
            margin: const EdgeInsets.only(bottom: 0, top: 10),
            padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    blurRadius: 2.0,
                    color: ColorsApp.colorView,
                    offset: const Offset(-7, -8),
                  )
                ]),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Container(
                      width: 100,
                      height: 90,
                      decoration: BoxDecoration(
                          color: ColorsApp.colorView,
                          borderRadius: BorderRadius.circular(12),
                          image: DecorationImage(
                              image: AssetImage(bookMark[index]['img']))),
                    ),
                    SizedBox(
                      width: width * 0.03,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          bookMark[index]['title'],
                          style: const TextStyle(
                            fontFamily: manropeBold,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(
                          height: height * 0.01,
                        ),
                        Row(
                          children: const [
                            Icon(
                              Icons.star,
                              color: Colors.yellow,
                              size: 18,
                            ),
                            Icon(
                              Icons.star,
                              color: Colors.yellow,
                              size: 18,
                            ),
                            Icon(
                              Icons.star,
                              color: Colors.yellow,
                              size: 18,
                            ),
                            Icon(
                              Icons.star,
                              color: Colors.yellow,
                              size: 18,
                            ),
                          ],
                        ),
                        SizedBox(
                          height: height * 0.01,
                        ),
                        Row(
                          children: [
                            const Icon(
                              Icons.alarm_outlined,
                              size: 18,
                            ),
                            Text(
                              bookMark[index]['duration'],
                              style: const TextStyle(
                                  fontFamily: manrope,
                                  fontWeight: FontWeight.bold,
                                  letterSpacing: 0.5),
                            )
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Container(
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle, color: ColorsApp.circleColor),
                      child: const Center(
                        child: Icon(
                          Icons.arrow_forward_ios,
                          color: Colors.white,
                          size: 20,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: height * 0.005,
                    ),
                    Text(
                      "USD:${bookMark[index]['price']}",
                      style: const TextStyle(
                          fontFamily: manrope,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 0.5,
                          fontSize: 13),
                    )
                  ],
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _buildLiveSession(double width, double height) {
    return ListView(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                "Live Courses",
                style: TextStyle(
                    fontFamily: manropeBold,
                    fontSize: 22,
                    fontWeight: FontWeight.bold),
              ),
              InkWell(
                onTap: () {},
                child: Row(
                  children: const [
                    Text(
                      "See More",
                      style: TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.bold,
                          fontFamily: manrope,
                          letterSpacing: 0.5),
                    ),
                    SizedBox(
                      width: 3,
                    ),
                    Icon(
                      Icons.arrow_forward_ios,
                      size: 18,
                    )
                  ],
                ),
              )
            ],
          ),
        ),
        SizedBox(
          height: height * 0.015,
        ),
        Container(
          color: ColorsApp.colorView,
          height: height * 0.5,
          child: GridView.count(
            physics: const NeverScrollableScrollPhysics(),
            crossAxisCount: 2,
            mainAxisSpacing: 0,
            crossAxisSpacing: 15,
            children: List.generate(liveSession.length, (index) {
              return Container(
                margin: const EdgeInsets.only(top: 15),
                width: width * 0.1,
                height: height * 0.1,
                decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                          color: ColorsApp.colorView,
                          offset: const Offset(15, 10),
                          blurStyle: BlurStyle.solid),
                    ],
                    borderRadius: BorderRadius.circular(12)),
                child: Column(
                  children: [
                    Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 15, vertical: 10),
                        alignment: Alignment.centerLeft,
                        child: Text(
                          liveSession[index]['title'],
                          style: const TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                              fontFamily: manropeBold),
                        )),
                    Container(
                      margin: const EdgeInsets.symmetric(horizontal: 15),
                      width: width,
                      height: height * 0.1,
                      decoration: BoxDecoration(
                        color: ColorsApp.colorView,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Center(
                        child: Image.asset(liveSession[index]['img']),
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.only(left: 15, top: 10, right: 15),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Row(
                            children: [
                              Container(
                                width: 15,
                                height: 15,
                                decoration: BoxDecoration(
                                    image: DecorationImage(
                                        image: AssetImage(
                                            liveSession[index]['comment']),
                                        fit: BoxFit.fill)),
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              Text(liveSession[index]['total_comment'])
                            ],
                          ),
                          Row(
                            children: [
                              const Icon(
                                Icons.favorite_outline,
                                size: 19,
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              Text(liveSession[index]['like'])
                            ],
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              );
            }),
          ),
        ),
        Container(
          margin: const EdgeInsets.only(bottom: 15),
          width: width,
          height: height * 0.2,
          decoration: const BoxDecoration(
            color: Colors.white,
          ),
          child: ListView(
            physics: const NeverScrollableScrollPhysics(),
            children: [
              Container(
                alignment: Alignment.centerLeft,
                padding: const EdgeInsets.only(left: 15, top: 15),
                child: Text(
                  "Live Chat",
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      fontFamily: manropeBold,
                      color: ColorsApp.btnColor),
                ),
              ),
              Row(
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Padding(
                        padding: EdgeInsets.only(left: 15),
                        child: Text(
                          "Instructor",
                          style:
                              TextStyle(fontSize: 18, fontFamily: manropeBold),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Container(
                        margin: const EdgeInsets.only(left: 15),
                        width: 60,
                        height: 60,
                        decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            image: DecorationImage(
                                image: AssetImage('assets/imgs/pic1.png'),
                                fit: BoxFit.fill)),
                      )
                    ],
                  ),
                  const SizedBox(
                    width: 15,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text(
                        "David Smith",
                        style: TextStyle(
                          fontSize: 18,
                        ),
                      ),
                      Text(
                        "UX/UI Designer",
                        style: TextStyle(
                          fontSize: 18,
                        ),
                      )
                    ],
                  ),
                  const SizedBox(
                    width: 15,
                  ),
                  Column(
                    children: [
                      InkWell(
                        onTap: () {
                          pushView(context, const VideoCallView());
                        },
                        child: Container(
                          width: 100,
                          padding: const EdgeInsets.symmetric(
                              horizontal: 15, vertical: 10),
                          decoration: BoxDecoration(
                              color: ColorsApp.btnColor,
                              borderRadius: BorderRadius.circular(12)),
                          child: const Center(
                            child: Icon(
                              Icons.video_call_outlined,
                              size: 30,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      InkWell(
                        onTap: () {
                          pushView(context, const ChatView());
                        },
                        child: Container(
                          width: 100,
                          padding: const EdgeInsets.symmetric(
                              horizontal: 15, vertical: 10),
                          decoration: BoxDecoration(
                              color: Colors.grey[300],
                              borderRadius: BorderRadius.circular(12)),
                          child: Center(
                            child: Image.asset("assets/imgs/sms.png"),
                          ),
                        ),
                      )
                    ],
                  )
                ],
              )
            ],
          ),
        ),
      ],
    );
  }
}
