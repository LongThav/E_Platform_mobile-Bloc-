import 'package:flutter/material.dart';

import '../../../utils/constants/color_app.dart';
import '../../../utils/constants/font_app.dart';
import '../../../utils/rests/handle_push_view.dart';

class ExploreHomeView extends StatefulWidget {
  const ExploreHomeView({super.key});

  @override
  State<ExploreHomeView> createState() => _ExploreHomeViewState();
}

class _ExploreHomeViewState extends State<ExploreHomeView> {
  final TextEditingController _searchCtrl = TextEditingController();

    List<dynamic> skillDevelopment = [
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
  @override
  void dispose() {
    _searchCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
        backgroundColor: ColorsApp.colorView,
        appBar: AppBar(
          backgroundColor: ColorsApp.colorView,
          elevation: 0.0,
          leading: InkWell(
            onTap: () {
              backView(context);
            },
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
              width: 30,
              height: 30,
              padding: const EdgeInsets.only(left: 7),
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(8)),
              child: Center(
                child: Icon(
                  Icons.arrow_back_ios,
                  color: Colors.grey[700],
                  size: 18,
                ),
              ),
            ),
          ),
          titleSpacing: 0,
          title: Container(
            margin: const EdgeInsets.only(right: 15),
            padding: const EdgeInsets.only(left: 15),
            width: width,
            height: height * 0.05,
            decoration: BoxDecoration(
                color:  Colors.white,
                borderRadius: BorderRadius.circular(12)),
            child: TextField(
              controller: _searchCtrl,
              decoration: const InputDecoration(
                  border: InputBorder.none,
                  hintText: "search your perfect course",
                  suffixIcon: Icon(
                    Icons.search,
                    color: Color(0XFFff743a),
                  )),
            ),
          ),
        ),
        body: _buildBody(width, height),
      );
  }

  Widget _buildBody(double width, double height){
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: ListView.builder(
        itemCount: skillDevelopment.length,
        shrinkWrap: true,
        itemBuilder: (context, index){
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
        }
      ),
    );
  }
}
