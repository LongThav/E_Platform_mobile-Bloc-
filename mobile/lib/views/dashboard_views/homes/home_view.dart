import 'package:flutter/material.dart';

import '/utils/rests/handle_push_view.dart';
import '/utils/constants/color_app.dart';
import '/utils/constants/font_app.dart';
import '../../../utils/constants/img_static.dart';
import 'invite_friend_view.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  int? indexItem;
  List<dynamic> listCourse = [
    {
      "img": "assets/imgs/science.png",
      "title": "Science",
      "totalView": "1.4k",
      "rate": "4",
      "fav": "9.7k",
    },
    {
      "img": "assets/imgs/business.png",
      "title": "Business Studies",
      "totalView": "1.2k",
      "rate": "4",
      "fav": "9.2k",
    },
  ];

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
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsApp.colorView,
      appBar: AppBar(
        backgroundColor: ColorsApp.colorView,
        elevation: 0.0,
        titleSpacing: 0,
        leading: IconButton(onPressed: () {}, icon: Image.asset(menu)),
        title: RichText(
          text: TextSpan(children: [
            TextSpan(
              text: "Welcome!\n",
              style: TextStyle(
                  fontSize: 11.5,
                  color: ColorsApp.btnColor,
                  fontFamily: manrope,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 0.5),
            ),
            TextSpan(
                text: 'Mr. LongThav SiPav',
                style: TextStyle(
                    fontSize: 13,
                    color: Colors.grey[700],
                    fontFamily: manrope,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 0.5))
          ]),
        ),
        actions: [
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              margin: const EdgeInsets.only(bottom: 7),
              child: InkWell(
                onTap: () {
                  pushView(context, const InviteFriendView());
                },
                child: Text(
                  "Invite now",
                  style: TextStyle(
                    fontSize: 12,
                    color: ColorsApp.btnColor,
                    decoration: TextDecoration.underline,
                    fontFamily: manrope,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 0.5,
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          Container(
            margin: const EdgeInsets.all(5),
            width: 45,
            height: 30,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                image: const DecorationImage(
                    image: AssetImage("assets/imgs/home_img.png"),
                    fit: BoxFit.fill)),
          ),
        ],
      ),
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return SingleChildScrollView(
      padding: const EdgeInsets.all(15),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                "Academic Courses",
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
          _buildCourse(height, width),
          SizedBox(
            height: height * 0.03,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                "Skill Development",
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
          const SizedBox(
            height: 10,
          ),
          _buildSkillDevelopemt(width, height),
        ],
      ),
    );
  }

  Widget _buildCourse(double height, double width) {
    return SizedBox(
      height: height * 0.27,
      child: ListView.builder(
          itemCount: listCourse.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return InkWell(
              onTap: () {
                setState(() {
                  indexItem = index;
                });
              },
              child: Container(
                margin: const EdgeInsets.only(right: 15, top: 15),
                height: height * 0.25,
                width: width * 0.55,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: indexItem == index ? ColorsApp.btnColor : Colors.white,
                  image: DecorationImage(
                      image: AssetImage(listCourse[index]['img'])),
                ),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(
                            left: 15,
                            top: 0,
                          ),
                          child: Text(
                            listCourse[index]['title'],
                            style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                                fontFamily: manropeBold,
                                color: indexItem == index
                                    ? Colors.white
                                    : Colors.grey[700]),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 10, right: 10),
                          child: Image.asset("assets/imgs/bookmark.png"),
                        )
                      ],
                    ),
                    SizedBox(
                      height: height * 0.16,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Icon(
                                Icons.person_2_outlined,
                                size: 18,
                                color: indexItem == index
                                    ? Colors.white
                                    : Colors.grey[700],
                              ),
                              Text(
                                listCourse[index]['totalView'],
                                style: TextStyle(
                                    color: indexItem == index
                                        ? Colors.white
                                        : Colors.grey[700]),
                              )
                            ],
                          ),
                          Row(
                            children: [
                              Icon(
                                Icons.star,
                                size: 18,
                                color: indexItem == index
                                    ? Colors.white
                                    : Colors.grey[700],
                              ),
                              Text(
                                listCourse[index]['rate'],
                                style: TextStyle(
                                    color: indexItem == index
                                        ? Colors.white
                                        : Colors.grey[700]),
                              )
                            ],
                          ),
                          Row(
                            children: [
                              Icon(
                                Icons.favorite_outline,
                                size: 18,
                                color: indexItem == index
                                    ? Colors.white
                                    : Colors.grey[700],
                              ),
                              Text(
                                listCourse[index]['fav'],
                                style: TextStyle(
                                    color: indexItem == index
                                        ? Colors.white
                                        : Colors.grey[700]),
                              )
                            ],
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            );
          }),
    );
  }

  Widget _buildSkillDevelopemt(double width, double height) {
    return Column(
      children: List.generate(skillDevelopment.length, (index) {
        return Container(
          margin: const EdgeInsets.symmetric(vertical: 5),
          padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
          ),
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
                            image: AssetImage(skillDevelopment[index]['img']))),
                  ),
                  SizedBox(
                    width: width * 0.03,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        skillDevelopment[index]['title'],
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
                            skillDevelopment[index]['duration'],
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
                    "USD:${skillDevelopment[index]['price']}",
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
      }),
    );
  }
}
