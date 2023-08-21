import 'package:flutter/material.dart';

import '../../views/dashboard_views/explores/explores_view.dart';
import '../../views/dashboard_views/homes/home_view.dart';
import '../../views/dashboard_views/my_courses/my_course_view.dart';
import '../../views/dashboard_views/profiles/profile_view.dart';
import '../../views/dashboard_views/progresss/progress_view.dart';

class IndexView extends StatefulWidget {
  const IndexView({super.key});

  @override
  State<IndexView> createState() => _IndexViewState();
}

class _IndexViewState extends State<IndexView> {
  List<dynamic> views = [
    const HomeView(),
    const ExploreView(),
    const ProgressView(),
    const MyCourseView(),
    const ProfileView(),
  ];

  int index = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: views[index],
      bottomNavigationBar: BottomNavigationBar(
        mouseCursor: MouseCursor.defer,
        currentIndex: index,
        onTap: (value){
          setState(() {
            index = value;
          });
        },
        useLegacyColorScheme: true,
        iconSize: 35,
        elevation: 0.0,
        selectedItemColor: Colors.blue[700],
        unselectedItemColor: Colors.grey[700],
        showUnselectedLabels: true,

        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.explore_outlined),
            label: 'Explore'
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.track_changes_outlined),
            label: 'Progress'
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.library_add_outlined),
            label: 'Course'
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outline),
            label: 'Profile'
          ),
        ],
      ),
    );
  }
}