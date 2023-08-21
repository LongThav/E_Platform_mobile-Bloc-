import 'package:flutter/material.dart';
import '/utils/constants/color_app.dart';
import '/utils/constants/font_app.dart';
import '/utils/rests/handle_push_view.dart';

class VideoCallView extends StatefulWidget {
  const VideoCallView({super.key});

  @override
  State<VideoCallView> createState() => _VideoCallViewState();
}

class _VideoCallViewState extends State<VideoCallView> {
  List<dynamic> img = ['assets/imgs/micro.png','assets/imgs/sms.png','assets/imgs/video.png'];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
        backgroundColor: ColorsApp.colorView,
        elevation: 0.0,
        title: Text(
          "David Smith",
          style: TextStyle(fontFamily: manropeBold, color: Colors.grey[700]),
        ),
        actions: [
          IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.video_call_outlined,
                color: Colors.grey[700],
              ))
        ],
      ),
      backgroundColor: ColorsApp.colorView,
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return SingleChildScrollView(
      padding: const EdgeInsets.all(15),
      child: Container(
        width: width,
        height: height * 0.82,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Stack(
          children: [
             Align(
              alignment: Alignment.topRight,
               child: Container(
                margin: const EdgeInsets.only(right: 15, top: 15),
                alignment: Alignment.centerRight,
                width: width * 0.25,
                height: height * 0.12,
                decoration: BoxDecoration(
                  color: const Color(0XFFFEF6CC),
                  borderRadius: BorderRadius.circular(12),
                  image: const DecorationImage(
                    image: AssetImage("assets/imgs/man.png")
                  )
                ),
                         ),
             ),
            Center(
                child: Padding(
              padding: EdgeInsets.only(bottom: height * 0.1),
              child: Image.asset('assets/imgs/teacher.png'),
            )),
            Center(
                child: Padding(
              padding: EdgeInsets.only(top: height * 0.5),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children:  [
                 const Text(
                    "David Smith",
                    style: TextStyle(
                        fontSize: 20,
                        color: Colors.black,
                        fontFamily: manropeBold),
                  ),
                  Text(
                    "24:41",
                    style: TextStyle(
                        fontSize: 20,
                        color: Colors.grey[700],
                        fontFamily: manropeBold),
                  ),
                  const SizedBox(height: 10,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: List.generate(img.length, (index){
                      return Container(
                        margin: const EdgeInsets.symmetric(horizontal: 15),
                        width: 60,
                        height: 60,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.circle,
                          boxShadow: const [
                            BoxShadow(
                              color: Color(0XFFedeff3),
                              blurRadius: 10
                            ),
                          ],
                          image: DecorationImage(
                            image: AssetImage(img[index])
                          )
                        ),
                      );
                    }),
                  ),
                  const SizedBox(height: 15,),
                  Container(
                        margin: const EdgeInsets.symmetric(horizontal: 15),
                        width: 60,
                        height: 60,
                        decoration: const BoxDecoration(
                          color: Color(0XFFfc585a),
                          shape: BoxShape.circle,
                          boxShadow:  [
                            BoxShadow(
                              color: Color(0XFFedeff3),
                              blurRadius: 20
                            ),
                          ],
                        ),
                        child: const Center(
                          child: Icon(Icons.call_outlined, color: Colors.white, size: 30,),
                        ),
                      )
                ],
              ),
            )),
          ],
        ),
      ),
    );
  }
}

