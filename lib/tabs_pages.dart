// // import 'package:camera/camera.dart';
// import 'package:flutter/material.dart';
// import 'package:pose_detection_teachable/screens/custom-exercise/custom-exercise-action.dart';
// import 'package:pose_detection_teachable/screens/custom-exercise/custom-exercise.dart';
// import 'package:pose_detection_teachable/screens/exercise/congratulation-page.dart';
// import 'package:pose_detection_teachable/screens/exercise/exercise-main.dart';
// import 'package:pose_detection_teachable/screens/exercises.dart';
// import 'package:pose_detection_teachable/screens/history.dart';
// import 'package:pose_detection_teachable/screens/home_page.dart';
// import 'package:pose_detection_teachable/screens/promotions.dart';
// import 'package:pose_detection_teachable/screens/settings.dart';
// import 'package:pose_detection_teachable/screens/statistics.dart';
// import 'package:pose_detection_teachable/screens/try-premium.dart';
// import 'package:pose_detection_teachable/screens/welcome/welcome.dart';
// import 'package:pose_detection_teachable/tabs.dart';
// import 'package:pose_detection_teachable/widgets/drawer.dart';
//
// late List<CameraDescription> cameras;
// class TabsPage extends StatefulWidget {
//   int selectedIndex = 0;
//
//   TabsPage({required this.selectedIndex});
//
//   @override
//   _TabsPageState createState() => _TabsPageState();
// }
//
// class _TabsPageState extends State<TabsPage> {
//   int _selectedIndex = 0;
//
//   void _onItemTapped(int index) {
//     setState(() {
//       widget.selectedIndex = index;
//       _selectedIndex = widget.selectedIndex;
//       print(_selectedIndex);
//     });
//   }
//   @override
//   void initState() {
//
//     _onItemTapped(widget.selectedIndex);
//     super.initState();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       // initialRoute: WelcomePage.id,
//       // routes: <String, WidgetBuilder>{
//       //   "/welcome": (BuildContext context) => new WelcomePage(),
//       //   "/exercises": (BuildContext context) => new Exercises(),
//       //   "/custom-exercise": (BuildContext context) => new CustomExercise(),
//       //   "/custom-exercise-action": (BuildContext context) =>
//       //       new CustomExerciseAction(),
//       //   "/history": (BuildContext context) => new History(),
//       //   "/settings": (BuildContext context) => new Settings(),
//       //   "/statistics": (BuildContext context) => new Statistics(),
//       //   "/promotions": (BuildContext context) => new Promotions(),
//       //   "/exercise-main": (BuildContext context) => new ExerciseMain(),
//       //   "/congratulation-page": (BuildContext context) =>
//       //       new CongratulationPage(),
//       //   "/try-premium": (BuildContext context) => new TryPremium(),
//       //   '/pose-detection': (BuildContext context) => new PoseDetection(cameras),
//       // },
//       home: Scaffold(
//         body: Scaffold(
//           drawer: MaterialDrawer(currentRoute: Exercises.id,),
//           body: IndexedStack(
//             // index: widget.selectedIndex,
//             children: [
//               for (final tabItem in TabNavigationItem.items) tabItem.page,
//             ],
//           ),
//         ),
//         bottomNavigationBar: BottomNavigationBar(
//           items:  <BottomNavigationBarItem>[
//             BottomNavigationBarItem(
//               icon: Icon(Icons.home),
//               label: Text('Home').toString(),
//             ),
//             BottomNavigationBarItem(
//               icon: Icon(Icons.search),
//               label: Text('Search').toString(),
//             ),
//             BottomNavigationBarItem(
//               icon: Icon(Icons.verified_user),
//               label: Text('Profile').toString(),
//             ),
//           ],
//           currentIndex: _selectedIndex,
//           selectedItemColor: Colors.amber[800],
//           onTap: _onItemTapped,
//         ),
//       ),
//     );
//   }
// }