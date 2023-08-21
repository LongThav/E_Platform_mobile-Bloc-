import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile/db_helpers/cache_profile.dart';
import 'package:mobile/logics/profile_logic.dart';
import 'package:mobile/utils/constants/color_app.dart';
import 'package:mobile/utils/rests/logger.dart';
import 'package:mobile/utils/rests/snack_bar.dart';
import 'package:mobile/utils/rests/url_base.dart';
import '../../../utils/constants/defualt_img.dart';

class UpdateProfileView extends StatefulWidget {
  final String? img;
  final int id;
  final String name;
  final String email;
  const UpdateProfileView(
      {super.key,
      required this.img,
      required this.email,
      required this.name,
      required this.id});

  @override
  State<UpdateProfileView> createState() => _UpdateProfileViewState();
}

class _UpdateProfileViewState extends State<UpdateProfileView> {
  late final TextEditingController emailCtrl;
  late final TextEditingController _userNameCtrl;
  late final TextEditingController imageCtrl;
  CacheProfile cacheProfile = CacheProfile();
  @override
  void initState() {
    "Username: ${widget.name}".log();
    _userNameCtrl = TextEditingController(text: widget.name);
    "UserName: ${_userNameCtrl.text}".log();
    emailCtrl = TextEditingController(text: widget.email);
    imageCtrl = TextEditingController(text: widget.img);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsApp.colorView,
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              context.read<ProfileLogic>().add(ProfileAppEvent());
              Navigator.pop(context);
            },
            icon: Icon(
              Icons.arrow_back_ios,
              color: Colors.grey[700],
            )),
        backgroundColor: ColorsApp.colorView,
        elevation: 0.0,
        titleSpacing: -13,
        title: Text(
          "Update profile",
          style: TextStyle(color: Colors.grey[700]),
        ),
      ),
      body: _buildbody(),
      bottomNavigationBar: _buildBottom(),
    );
  }

  Widget _buildbody() {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return ListView(
      children: [
        SizedBox(
          height: height * 0.05,
        ),
        GestureDetector(
          onTap: () {
            "Click".log();
            context.read<ProfileLogic>().add(GetImageEvent());
          },
          child: BlocBuilder<ProfileLogic, ProfileState>(
            builder: (context, state) {
              if (state is GetImageState) {
                File img = state.image;
                "Pick image".log();
                return Container(
                  padding: const EdgeInsets.all(0),
                  margin: const EdgeInsets.all(0),
                  width: width * 0.2,
                  height: height * 0.2,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.grey,
                    image: DecorationImage(
                        image: FileImage(File(img.path)), fit: BoxFit.fill),
                  ),
                );
              } else if (state is GetImageError) {
                return Center(
                  child: Text("Error"),
                );
              } else {
                "didnt't Pick Image".log();
                return Container(
                  padding: const EdgeInsets.all(0),
                  margin: const EdgeInsets.all(0),
                  width: width * 0.2,
                  height: height * 0.2,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.grey,
                      image: DecorationImage(
                          image: NetworkImage(widget.img == null
                              ? defaultImg
                              : hostImg + widget.img.toString()))),
                );
              }
            },
          ),
        ),
        _buildForm('FullName', _userNameCtrl, TextInputType.name),
        SizedBox(
          height: height * 0.02,
        ),
        _buildForm('Email', emailCtrl, TextInputType.emailAddress),
      ],
    );
  }

  Widget _buildForm(
      String title, TextEditingController controller, TextInputType type,
      {IconButton? icon, String? hind}) {
    final width = MediaQuery.of(context).size.width;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(left: width * 0.04),
          child: Text(
            title,
            style: TextStyle(fontSize: 18, color: Colors.grey[700]),
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: width * 0.05),
          child: TextField(
            keyboardType: type,
            controller: controller,
            decoration: InputDecoration(
                suffixIcon: icon,
                hintText: hind,
                hintStyle: TextStyle(color: Colors.grey[500], fontSize: 15)),
          ),
        ),
      ],
    );
  }

  Widget _buildBottom() {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return BlocBuilder<ProfileLogic, ProfileState>(builder: (context, state) {
      if (state is GetImageState) {
        String imgBase64 = state.base64;
        "ImgBase64 in Btn: ${imgBase64}".log();
        return GestureDetector(
          onTap: () async {
            if (_userNameCtrl.text.isEmpty) {
              snackBar(context, "username needed");
            } else if (emailCtrl.text.isEmpty) {
              snackBar(context, "email needed");
            } else {
              "Update with ImgBase64".log();
              // cacheProfile.deleteAll();
              await Future.delayed(Duration(milliseconds: 600), () {
                context.read<ProfileLogic>().add(UpdateProfileEvent(
                    _userNameCtrl.text,
                    emailCtrl.text,
                    imgBase64,
                    widget.id,
                    context));
              });
              "Updated".log();
              "_UserName; $_userNameCtrl".log();
              context.read<ProfileLogic>().add(ProfileAppEvent());
            }
          },
          child: Container(
            width: width,
            height: height * 0.08,
            padding: EdgeInsets.symmetric(
              horizontal: width * 0.05,
            ),
            margin:
                EdgeInsets.symmetric(horizontal: width * 0.05, vertical: 15),
            decoration: const BoxDecoration(
              gradient: const LinearGradient(
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                  colors: [Colors.blue, Colors.purple]),
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(12),
                  bottomRight: Radius.circular(12)),
            ),
            child: Center(
              child: const Text(
                "Update info",
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
            ),
          ),
        );
      } else {
        return GestureDetector(
          onTap: () {
            if (_userNameCtrl.text.isEmpty) {
              snackBar(context, "username needed");
            } else if (emailCtrl.text.isEmpty) {
              snackBar(context, "email needed");
            } else {
              "Start update profile with without Base64".log();
              context.read<ProfileLogic>().add(UpdateProfileEvent(
                  _userNameCtrl.text,
                  emailCtrl.text,
                  defaultProfile,
                  widget.id,
                  context));
            }
          },
          child: Container(
            width: width,
            height: height * 0.08,
            padding: EdgeInsets.symmetric(
              horizontal: width * 0.05,
            ),
            margin:
                EdgeInsets.symmetric(horizontal: width * 0.05, vertical: 15),
            decoration: const BoxDecoration(
              gradient: const LinearGradient(
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                  colors: [Colors.blue, Colors.purple]),
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(12),
                  bottomRight: Radius.circular(12)),
            ),
            child: Center(
              child: const Text(
                "Update info",
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
            ),
          ),
        );
      }
    });
  }
}
