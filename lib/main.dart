import 'package:flutter/material.dart';
import 'package:political_preparedness_flutter/core/constants.dart';
import 'package:political_preparedness_flutter/pages/elections_page.dart';
import 'package:political_preparedness_flutter/pages/representatives_page.dart';
import 'package:political_preparedness_flutter/pages/voter_info_page.dart';
import 'injection_container.dart' as di;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();
  runApp(MyApp());
}

// #34495e
const PrimaryColor = const Color(0xFF34495e);
// #82d9c8
const AccentColor = const Color(0xFF82d9c8);

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: APP_NAME,
      theme: ThemeData(
        primaryColor: PrimaryColor,
        accentColor: AccentColor,
      ),
      home: ElectionsPage(),
      // navigation definition
      routes: {
        VoterInfoPage.routeName: (context) => VoterInfoPage(),
        ElectionsPage.routeName: (context) => ElectionsPage(),
        RepresentativesPage.routeName: (context) => RepresentativesPage(),
      },
    );
  }
}
