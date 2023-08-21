import 'package:flutter/material.dart';

import '../../../utils/constants/color_app.dart';
import '../../../utils/constants/font_app.dart';
import '../../../utils/rests/handle_push_view.dart';

class ChatView extends StatefulWidget {
  const ChatView({super.key});

  @override
  State<ChatView> createState() => _ChatViewState();
}

class _ChatViewState extends State<ChatView> {
  bool _yourself = true;
  bool _showIcon = false;

  @override
  void initState() {
    super.initState();
    _scroller.addListener(() {
      if (_scroller.position.pixels >= 500) {
        setState(() {
          _showIcon = true;
        });
      } else {
        setState(() {
          _showIcon = false;
        });
      }
    });
  }
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
              icon: Image.asset("assets/imgs/sms.png"),
          ),
        ],
      ),
      backgroundColor: ColorsApp.colorView,
      body: _buildBody,
    );
  }
  Widget get _buildBody{
    return InkWell(
      child: _buildChat(),
      onTap: () {
        FocusScope.of(context).requestFocus(FocusNode());
      },
    );
  }
  Widget _buildChat() {
    return Stack(
      alignment: Alignment.center,
      children: [
        _buildNewBody(),
        Positioned(
          bottom: 120,
          child: _showIcon ? _buildDownIcon() : const SizedBox(),
        ),
      ],
    );
  }

  Widget _buildDownIcon() {
    return InkWell(
      onTap: () {
        _scroller.animateTo(
          0,
          duration: Duration(milliseconds: 300),
          curve: Curves.easeInOut,
        );
      },
      child: Container(
        width: 50,
        height: 50,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.grey[300],
        ),
        child: Icon(Icons.arrow_downward_sharp),
      ),
    );
  }

  Widget _buildNewBody() {
    return Column(
      children: [
        Expanded(
          child: _buildMessages(),
        ),
        _buildTextFieldBar(),
      ],
    );
  }

  // List<String> _texts = [
  //   "how are you?",
  //   "are you there?",
  //   "Hi",
  // ];

  final List<Map<String, dynamic>> _textList = [
    {"text": "How are you?", "yourself": true},
    {"text": "I'm good", "yourself": false},
  ];

  final _txtCtrl = TextEditingController();

  Widget _buildTextFieldBar() {
    return Container(
      alignment: Alignment.topCenter,
      color: Colors.grey[200],
      padding: const EdgeInsets.all(20),
      margin: const EdgeInsets.only(bottom: 20),
      child: TextField(
        controller: _txtCtrl,
        keyboardType: TextInputType.multiline,
        minLines: 1,
        maxLines: 2,
        decoration: InputDecoration(
          hintText: "Message",
          suffixIcon: IconButton(
            onPressed: () {
              Map<String, dynamic> map = {
                "text": _txtCtrl.text,
                "yourself": _yourself,
              };

              setState(() {
                _textList.add(map);
              });

              _txtCtrl.clear();
            },
            icon: const Icon(Icons.send),
          ),
        ),
      ),
    );
  }

  final _scroller = ScrollController();

  Widget _buildMessages() {
    List<Widget> messageWidgets = [];

    for (var item in _textList) {
      messageWidgets.add(
        _buildMessage(
          item["text"],
          right: item["yourself"],
        ),
      );
    }

    String bg = "https://cdn.dribbble.com/users/1003944/screenshots/15741863/06_comp_1_4x.gif?resize=400x0";

    return Container(
      alignment: Alignment.bottomRight,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: NetworkImage(bg),
          fit: BoxFit.cover,
          colorFilter: ColorFilter.mode(
            Colors.white.withOpacity(0.7),
            BlendMode.screen,
          ),
        ),
      ),
      child: SingleChildScrollView(
        controller: _scroller,
        physics: const BouncingScrollPhysics(),
        reverse: true,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: messageWidgets,
        ),
      ),
    );
  }

  Widget _buildMessage(String text, {bool right = false}) {
    return Container(
      alignment: right ? Alignment.centerRight : Alignment.centerLeft,
      margin: const EdgeInsets.all(5),
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 5),
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        decoration: BoxDecoration(
          color: right ? Colors.blue : Colors.purple,
          borderRadius: BorderRadius.circular(100),
        ),
        child: Text(text, style: const TextStyle(fontSize: 18, color: Colors.white),),
      ),
    );
  }

}