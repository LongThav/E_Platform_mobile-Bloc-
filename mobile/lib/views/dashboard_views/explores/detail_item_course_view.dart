import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import '../../../commons/common_forword.dart';
import '../../../utils/constants/color_app.dart';
import '../../../utils/constants/font_app.dart';
import '../../../utils/rests/handle_push_view.dart';

class DetailItemCourseView extends StatefulWidget {
  final String title;
  final String img;
  final String price;
  final String duration;
  const DetailItemCourseView(
      {super.key,
      required this.title,
      required this.img,
      required this.price,
      required this.duration});

  @override
  State<DetailItemCourseView> createState() => _DetailItemCourseViewState();
}

class _DetailItemCourseViewState extends State<DetailItemCourseView> {
  double progress = 1 / 1.5;
  int selectIndex = 0;
  final PageController _pageController = PageController();
  List<String> categorie = ['Overview', 'Information', 'Certificate', 'About'];

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
      bottomNavigationBar: CommonForward(
        label: 'Checkout',
        voidCallback: () {},
      ),
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
            onTap: () {},
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
          "Details",
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.grey[700],
            fontFamily: manropeBold,
          ),
        ),
      ),
      body: _buildBody(width, height),
    );
  }

  Widget _buildBody(double width, double height) {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Column(
        children: [
          const SizedBox(
            height: 15,
          ),
          Container(
            width: width,
            // height: height * 0.37,
            padding: EdgeInsets.only(bottom: 15),
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(12)),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Container(
                      padding: const EdgeInsets.symmetric(
                          vertical: 8, horizontal: 8),
                      margin: const EdgeInsets.only(left: 15, top: 15),
                      decoration: BoxDecoration(
                        color: ColorsApp.btnColor,
                        borderRadius: BorderRadius.circular(3),
                      ),
                      child: const Center(
                        child: Text(
                          "Top Selling",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                              fontFamily: manropeBold),
                        ),
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.only(top: 15, left: 15, right: 15),
                      child: Text(
                        widget.title,
                        style: TextStyle(
                            color: Colors.grey[700],
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            fontFamily: manropeBold),
                      ),
                    ),
                      ],
                    ),
                    // SizedBox(
                    //   width: width * 0.14,
                    // ),
                    Padding(
                      padding: const EdgeInsets.only(top: 15, right: 15),
                      child: CircularProgressIndicator(
                        strokeWidth: 4,
                        value: progress,
                        color: progress == 1 / 1.5
                            ? const Color(0XFFff743a)
                            : Colors.black,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 15,
                ),
                Center(
                  child: Image.asset("assets/imgs/detail_view.png"),
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
                            color: Colors.grey[700],
                          ),
                          Text(
                            "17.6k",
                            style: TextStyle(color: Colors.grey[700]),
                          )
                        ],
                      ),
                      Row(
                        children: [
                          Icon(
                            Icons.star,
                            size: 18,
                            color: Colors.grey[700],
                          ),
                          Text(
                            "4",
                            style: TextStyle(color: Colors.grey[700]),
                          )
                        ],
                      ),
                      Row(
                        children: [
                          Icon(
                            Icons.favorite_outline,
                            size: 18,
                            color: Colors.grey[700],
                          ),
                          Text(
                            "7.8k",
                            style: TextStyle(color: Colors.grey[700]),
                          ),
                        ],
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(
                            vertical: 8, horizontal: 8),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: const Color(0XFFff743a),
                        ),
                        child: const Center(
                          child: Text(
                            '\$:29.00',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
          Container(
            alignment: Alignment.centerLeft,
            margin: const EdgeInsets.only(top: 15),
            child: const Text(
              "Preview Course Overview",
              style: TextStyle(fontSize: 18, fontFamily: manropeBold),
            ),
          ),
          Container(
            width: width,
            margin: const EdgeInsets.symmetric(vertical: 15),
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Image.asset("assets/imgs/playvideo.png"),
                    const SizedBox(
                      width: 15,
                    ),
                    RichText(
                      text: const TextSpan(children: [
                        TextSpan(
                            text: "Introduction\n",
                            style: TextStyle(
                                color: Colors.black,
                                fontFamily: manropeBold,
                                fontSize: 17)),
                        TextSpan(
                            text: "2.25mn",
                            style: TextStyle(
                                color: Colors.grey,
                                fontFamily: manropeBold,
                                fontSize: 14))
                      ]),
                    ),
                    SizedBox(
                      width: width * 0.05,
                    ),
                    Container(
                      height: 50,
                      width: 2,
                      color: Colors.grey[200],
                    ),
                  ],
                ),
                const Icon(Icons.arrow_forward_ios)
              ],
            ),
          ),
          _buildCategoris(width, height),
          _buildChilCategoris(width, height),
        ],
      ),
    );
  }

  Widget _buildCategoris(double width, double height) {
    return Container(
      margin: const EdgeInsets.only(top: 15),
      width: width,
      height: 55,
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(12), topRight: Radius.circular(12)),
      ),
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          shrinkWrap: true,
          itemCount: categorie.length,
          itemBuilder: (context, index) {
            return InkWell(
              onTap: () {
                setState(() {
                  selectIndex = index;
                });
                _pageController.jumpToPage(index);
              },
              child: Container(
                margin: const EdgeInsets.only(
                    left: 10, top: 10, bottom: 10, right: 15),
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                decoration: BoxDecoration(
                  color: selectIndex == index ? ColorsApp.btnColor : null,
                  boxShadow: selectIndex == index
                      ? null
                      : [
                          BoxShadow(
                            blurRadius: 2.0,
                            color: ColorsApp.colorView,
                          )
                        ],
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Center(
                  child: Text(
                    categorie[index],
                    style: TextStyle(
                        fontFamily: manropeBold,
                        color: selectIndex == index
                            ? Colors.white
                            : Colors.grey[700]),
                  ),
                ),
              ),
            );
          }),
    );
  }

  Widget _buildChilCategoris(double width, double height) {
    return SizedBox(
      width: width,
      height: height * 0.4,
      child: PageView(
        allowImplicitScrolling: true,
        dragStartBehavior: DragStartBehavior.start,
        pageSnapping: true,
        onPageChanged: (value) {
          setState(() {
            selectIndex = value;
          });
        },
        controller: _pageController,
        children: [
          Container(
            color: Colors.white,
            width: width,
            padding: const EdgeInsets.only(bottom: 15),
            child: _buildItemOverview(width, height),
          ),
          Container(
            width: width,
            padding: const EdgeInsets.only(bottom: 15),
            color: Colors.white,
            child: _buildInfo(width, height),
          ),
          Container(
            width: width,
            padding: const EdgeInsets.only(bottom: 15),
            color: Colors.white,
            child: _buildCertificate(width, height),
          ),
          Container(
            width: width,
            padding: const EdgeInsets.only(bottom: 15),
            color: Colors.white,
            child: _buildAbout(width, height),
          ),
        ],
      ),
    );
  }

  Widget _buildItemOverview(double width, double height) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 15, top: 15, right: 15),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "6hr 40mn to go",
                    style: TextStyle(fontSize: 18, fontFamily: manropeBold),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  SizedBox(
                    width: width / 2,
                    height: 10,
                    child: const LinearProgressIndicator(
                      backgroundColor: Color(0XFFffa042),
                    ),
                  ),
                  const Text(
                    "2 assignments due",
                    style: TextStyle(fontSize: 18, fontFamily: manrope),
                  ),
                ],
              ),
              Column(
                children: [
                  Container(
                    width: 45,
                    height: 45,
                    decoration: BoxDecoration(
                        border: Border.all(color: const Color(0XFFffa042)),
                        borderRadius: BorderRadius.circular(15),
                        image: const DecorationImage(
                          image: AssetImage("assets/imgs/download.png"),
                        )),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  const Text("Download")
                ],
              )
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 15, top: 15, right: 15),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Container(
                    width: 25,
                    height: 25,
                    decoration: const BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage("assets/imgs/lecture.png"),
                            fit: BoxFit.fill)),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  RichText(
                    text: TextSpan(children: [
                      TextSpan(
                          text: 'Lecture Sliders\n',
                          style: TextStyle(
                              fontFamily: manropeBold,
                              color: Colors.grey[700],
                              fontSize: 18)),
                      TextSpan(
                          text: 'Reading* 20 min',
                          style: TextStyle(
                              fontFamily: manrope,
                              color: Colors.grey[700],
                              fontSize: 15,
                              fontWeight: FontWeight.w700))
                    ]),
                  ),
                ],
              ),
              Column(
                children: [
                  Container(
                    width: 45,
                    height: 45,
                    decoration: BoxDecoration(
                        border: Border.all(color: const Color(0XFFffa042)),
                        borderRadius: BorderRadius.circular(15),
                        image: const DecorationImage(
                          image: AssetImage("assets/imgs/download.png"),
                        )),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  const Text("Download")
                ],
              )
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 15, top: 15, right: 15),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Container(
                    width: 25,
                    height: 25,
                    decoration: const BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage("assets/imgs/indro.png"),
                            fit: BoxFit.fill)),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  RichText(
                    text: TextSpan(children: [
                      TextSpan(
                          text: 'Intoduction\n',
                          style: TextStyle(
                              fontFamily: manropeBold,
                              color: Colors.grey[700],
                              fontSize: 18)),
                      TextSpan(
                          text: 'Quiz* 5 Questions',
                          style: TextStyle(
                              fontFamily: manrope,
                              color: Colors.grey[700],
                              fontSize: 15,
                              fontWeight: FontWeight.w700))
                    ]),
                  ),
                ],
              ),
              Column(
                children: [
                  Container(
                    width: 45,
                    height: 45,
                    decoration: BoxDecoration(
                        border: Border.all(color: const Color(0XFFffa042)),
                        borderRadius: BorderRadius.circular(15),
                        image: const DecorationImage(
                          image: AssetImage("assets/imgs/download.png"),
                        )),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  const Text("Download")
                ],
              )
            ],
          ),
        )
      ],
    );
  }

  Widget _buildInfo(double width, double height) {
    return Column(
      children: [
        Container(
          alignment: Alignment.centerLeft,
          padding: const EdgeInsets.only(left: 15, top: 15),
          child: const Text(
            "About this course",
            style: TextStyle(
              fontFamily: manropeBold,
              fontSize: 18,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 15, top: 15),
          child: RichText(
            text:
                const TextSpan(style: TextStyle(color: Colors.grey), children: [
              TextSpan(
                  text: 'UX/UI Design is the best demandable course in the\n'),
              TextSpan(
                  text: "present world. It's making focus point how to use"),
              TextSpan(
                  text: "easiar way, like producting Apps, web...Read More")
            ]),
          ),
        ),
        Container(
          alignment: Alignment.centerLeft,
          padding: const EdgeInsets.only(left: 15, top: 15),
          child: const Text(
            "Instructor",
            style: TextStyle(
              fontFamily: manropeBold,
              fontSize: 18,
            ),
          ),
        ),
        const SizedBox(
          height: 15,
        ),
        ListTile(
          leading: Container(
            width: 65,
            height: 65,
            decoration: const BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                    image: AssetImage("assets/imgs/asai.png"),
                    fit: BoxFit.fill)),
          ),
          title: const Text(
            "David Smith",
            style: TextStyle(
              fontFamily: manropeBold,
            ),
          ),
          subtitle: RichText(
            text:
                const TextSpan(style: TextStyle(color: Colors.grey), children: [
              TextSpan(text: "Lecturer in University of\n"),
              TextSpan(text: "Oxford at UX Designer...See More")
            ]),
          ),
        ),
      ],
    );
  }

  Widget _buildCertificate(double width, double hegiht) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 15, top: 15, right: 15),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                width: 150,
                height: 150,
                decoration: BoxDecoration(
                    color: Colors.grey[300],
                    image: const DecorationImage(
                        image: AssetImage("assets/imgs/certificate.png"),
                        fit: BoxFit.fill)),
              ),
              Column(
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Container(
                        width: 45,
                        height: 45,
                        decoration: BoxDecoration(
                            border: Border.all(color: const Color(0XFFffa042)),
                            borderRadius: BorderRadius.circular(15),
                            image: const DecorationImage(
                              image: AssetImage("assets/imgs/download.png"),
                            )),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      const Text("Download"),
                      const SizedBox(
                        height: 15,
                      ),
                      Container(
                        width: 45,
                        height: 45,
                        decoration: BoxDecoration(
                          border: Border.all(color: const Color(0XFFffa042)),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: const Center(
                          child: Icon(Icons.share_outlined),
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Text(
                        "Share with your friends",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontFamily: manropeBold,
                            color: ColorsApp.btnColor),
                      )
                    ],
                  )
                ],
              ),
            ],
          ),
        )
      ],
    );
  }

  Widget _buildAbout(double width, double height) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "Thank You for Ensroll Our Course!",
          style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              fontFamily: manropeBold,
              color: ColorsApp.btnColor),
        ),
        const Text(
          "😍😍😍",
          style: TextStyle(
            fontSize: 18,
          ),
        )
      ],
    );
  }
}
