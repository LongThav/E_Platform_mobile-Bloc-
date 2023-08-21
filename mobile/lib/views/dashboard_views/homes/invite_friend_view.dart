import 'package:flutter/material.dart';
import '/utils/constants/color_app.dart';
import '/utils/constants/font_app.dart';
import '/utils/rests/handle_push_view.dart';
import 'explore_view.dart';

class InviteFriendView extends StatefulWidget {
  const InviteFriendView({super.key});

  @override
  State<InviteFriendView> createState() => _InviteFriendViewState();
}

class _InviteFriendViewState extends State<InviteFriendView> {
  final TextEditingController _searchCtrl = TextEditingController();
  List<dynamic> listFriend = [
    {
      "name": "Wade Warren",
      "img": "assets/imgs/pic1.png",
      "school": "Oxford OX1 2JD, UK",
      "status": "Beginner"
    },
    {
      "name": "Esther Howard",
      "img": "assets/imgs/pic2.png",
      "school": "Oxford OX1 2JD, UK",
      "status": "Intermediate"
    },
    {
      "name": "Jenny Wilson",
      "img": "assets/imgs/pic3.png",
      "school": "Oxford OX1 2JD, UK",
      "status": "Beginner"
    },
    {
      "name": "Robert Fox",
      "img": "assets/imgs/pic4.png",
      "school": "Oxford OX1 2JD, UK",
      "status": "Intermediate"
    },
    {
      "name": "Bessie Cooper",
      "img": "assets/imgs/pic5.png",
      "school": "Oxford OX1 2JD, UK",
      "status": "Beginner"
    },
    {
      "name": "Jerome Bell",
      "img": "assets/imgs/pic6.png",
      "school": "Oxford OX1 2JD, UK",
      "status": "Beginner"
    },
  ];
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
        actions: [
          InkWell(
          onTap: () {
            pushView(context, const ExploreHomeView());
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
                Icons.arrow_forward_ios,
                color: Colors.grey[700],
                size: 18,
              ),
            ),
          ),
        ),
        ],
        centerTitle: true,
        title: Text(
          "Invite Friends",
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.grey[700],
            fontFamily: manropeBold,
          ),
        ),
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(height * 0.07),
          child: Container(
            margin: EdgeInsets.only(left: width * 0.08, right: width * 0.08, bottom: 10),
            padding: const EdgeInsets.only(left: 15, bottom: 3),
            width: width,
            height: height * 0.055,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Center(
              child: TextField(
                controller: _searchCtrl,
                decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: 'Search your Friends',
                    suffixIcon: IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.search,
                          color: Colors.red,
                        ))),
              ),
            ),
          ),
        ),
      ),
      body: _buildBody(width, height),
    );
  }

  Widget _buildBody(double width, double height) {
    return ListView.builder(
        itemCount: listFriend.length,
        shrinkWrap: true,
        itemBuilder: (context, index) {
          return Container(
            margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 15),
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
                              image: AssetImage(listFriend[index]['img']))),
                    ),
                    SizedBox(
                      width: width * 0.03,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          listFriend[index]['name'],
                          style: const TextStyle(
                            fontFamily: manropeBold,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(
                          height: height * 0.01,
                        ),
                        Text(listFriend[index]['school']),
                        SizedBox(
                          height: height * 0.01,
                        ),
                        Text(
                          "Status: ${listFriend[index]['status']}",
                          style: const TextStyle(
                              fontFamily: manrope,
                              fontWeight: FontWeight.bold,
                              letterSpacing: 0.5),
                        )
                      ],
                    ),
                  ],
                ),
                Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle, color: ColorsApp.circleColor),
                  child: const Center(
                    child: Icon(
                      Icons.add,
                      color: Colors.white,
                      size: 20,
                    ),
                  ),
                ),
              ],
            ),
          );
        });
  }
}
