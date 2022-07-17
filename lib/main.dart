import 'package:camera/camera.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:pose_detection_teachable/login_screens/login_screen.dart';
import 'package:pose_detection_teachable/model/remindTime.dart';
import 'package:pose_detection_teachable/screens/custom-exercise/custom-exercise-action.dart';
import 'package:pose_detection_teachable/screens/custom-exercise/custom-exercise.dart';
import 'package:pose_detection_teachable/screens/exercise/congratulation-page.dart';
import 'package:pose_detection_teachable/screens/exercise/exercise-main.dart';
import 'package:pose_detection_teachable/screens/exercises.dart';
import 'package:pose_detection_teachable/screens/history.dart';
import 'package:pose_detection_teachable/screens/home_page.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:pose_detection_teachable/screens/promotions.dart';
import 'package:pose_detection_teachable/screens/settings.dart';
import 'package:pose_detection_teachable/screens/statistics.dart';
import 'package:pose_detection_teachable/screens/try-premium.dart';
import 'package:pose_detection_teachable/screens/welcome/welcome.dart';
import 'package:pose_detection_teachable/tabs_pages.dart';

import 'model/savedData.dart';

late List<CameraDescription> cameras;
//
// Future<void> main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   runApp(
//       MaterialApp(
//     debugShowCheckedModeBanner: false,
//     home: MyHomePage(
//       cameras,
//     ),
//   ));
// }

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  cameras = await availableCameras();
  await Hive.initFlutter();
  Hive.registerAdapter(SavedDataAdapter());
  Hive.registerAdapter(RemindTimeAdapter());
  await Hive.openBox('savedData');
  await Hive.openBox('settings');
  await Hive.openBox('timeReminded');
  if (Hive.box('settings').get('soundType') == null) {
    Hive.box('settings').put('soundType', 1);
  }
  if (Hive.box('settings').get('isPaused') == null) {
    Hive.box('settings').put('isPaused', true);
  }
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((_) async {
    runApp(MyApp());
  });
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    int _selectedIndex = 0;

    void _onItemTapped(int index) {
      setState(() {
        _selectedIndex = index;
        _selectedIndex = _selectedIndex;
        print(_selectedIndex);
      });
    }

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: LoginScreen(),
      ),
      title: "F4Fitness",
      // initialRoute: LoginScreen(),
      routes: <String, WidgetBuilder>{
        "/welcome": (BuildContext context) => new WelcomePage(),
        "/exercises": (BuildContext context) => new Exercises(),
        "/custom-exercise": (BuildContext context) => new CustomExercise(),
        "/custom-exercise-action": (BuildContext context) =>
            new CustomExerciseAction(),
        "/history": (BuildContext context) => new History(),
        "/settings": (BuildContext context) => new Settings(),
        "/statistics": (BuildContext context) => new Statistics(),
        "/promotions": (BuildContext context) => new Promotions(),
        "/exercise-main": (BuildContext context) => new ExerciseMain(),
        "/congratulation-page": (BuildContext context) =>
            new CongratulationPage(),
        "/try-premium": (BuildContext context) => new TryPremium(),
        '/pose-detection': (BuildContext context) => new PoseDetection(cameras),
        '/login':  (BuildContext context) => new LoginScreen(),
      },
    );
  }
}
