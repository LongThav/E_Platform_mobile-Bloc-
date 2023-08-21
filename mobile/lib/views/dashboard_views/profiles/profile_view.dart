import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile/db_helpers/catch_signup.dart';
import 'package:mobile/logics/auth_logic.dart';
import 'package:mobile/utils/rests/handle_push_view.dart';
import 'package:mobile/utils/rests/logger.dart';
import 'package:mobile/utils/rests/url_base.dart';
import 'package:mobile/views/dashboard_views/profiles/update_profile_view.dart';
import '../../../commons/common_forword.dart';
import '../../../db_helpers/cache_profile.dart';
import '../../../logics/profile_logic.dart';
import '/utils/companents/list_static_profile.dart';
import '/utils/constants/color_app.dart';
import '/utils/constants/font_app.dart';

class ProfileView extends StatefulWidget {
  const ProfileView({super.key});

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  CatchAuth _catchAuth = CatchAuth();
  CacheProfile cacheProfile = CacheProfile();

  @override
  void initState() {
    context.read<ProfileLogic>().add(ProfileAppEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfileLogic, ProfileState>(builder: (context, state) {
      if (state is ProfileInitailizeState || state is ProfileLoadingState) {
        return Center(
          child: CupertinoActivityIndicator(),
        );
      } else if (state is ProfileAppState) {
        String name = state.name;
        String email = state.email;
        String img = state.img ?? hostImg; 
        int id = state.id;
        "img: $img".log();
        return Scaffold(
          backgroundColor: ColorsApp.colorView,
          body: _buildBody(name, email, img, id),
        );
      } else {
        return Center(
          child: Text("Error"),
        );
      }
    });
  }

  Widget _buildBody(String name, String email, String img, int id) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    "Image profile: ${hostImg + img}".log();
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
              child: Row(
                children: [
                  Container(
                    width: width * 0.2,
                    height: height * 0.1,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                          image: NetworkImage(
                           hostImg + img,),
                          fit: BoxFit.fill),
                    ),
                  ),
                  SizedBox(
                    width: width * 0.03,
                  ),
                  Flexible(
                    child: RichText(
                      text: TextSpan(children: [
                        TextSpan(
                            text: "${name}\n",
                            style: TextStyle(
                                letterSpacing: 0.5,
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                                color: Colors.grey[700],
                                fontFamily: manrope)),
                        TextSpan(
                            text: "$email",
                            style: TextStyle(
                                fontSize: 15,
                                color: Colors.grey[700],
                                fontWeight: FontWeight.bold,
                                fontFamily: manrope,
                                letterSpacing: 0.5))
                      ]),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(bottom: height * 0.03),
                    child: IconButton(
                        padding: const EdgeInsets.all(0),
                        onPressed: () {
                          pushView(
                              context,
                              UpdateProfileView(
                                name: name,
                                email: email,
                                img: img,
                                id: id,
                              ));
                        },
                        icon: Icon(
                          Icons.edit,
                          color: ColorsApp.btnColor,
                          size: 18,
                        )),
                  ),
                ],
              ),
            ),
            _buildList(),
            const Divider(
              thickness: 1,
            ),
            CommonForward(
              label: 'Log out',
              voidCallback: () {
                _catchAuth.deleteUserInfo();
                cacheProfile.deleteAll();
                context.read<AuthLogic>().add(UserLogoutEvent(context));
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildList() {
    return Column(
      children: List.generate(itemProfile.length, (index) {
        return Column(
          children: [
            const Divider(
              thickness: 1,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: ListTile(
                leading: Container(
                  width: 28,
                  height: 28,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage(itemProfile[index]['img']),
                        fit: BoxFit.fill),
                  ),
                ),
                title: Text(
                  itemProfile[index]['title'],
                  style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      fontFamily: manrope,
                      letterSpacing: 0.6),
                ),
                trailing: const Icon(Icons.arrow_forward_ios),
              ),
            ),
          ],
        );
      }),
    );
  }
}
