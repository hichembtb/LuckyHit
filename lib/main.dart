import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:test_app/game.dart';
import 'package:test_app/home.dart';
import 'package:test_app/provider.dart';
import 'package:test_app/winner.dart';


void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) {
        return MyProvider();
      },
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Test(),
        routes: {
          "winner": (context) => Winner(),
          "test": (context) => Test(),
          "game": (context) => Game(),
          // "winnertwo": (context) => Winnertwo(),
        },
        theme: ThemeData(
          scaffoldBackgroundColor: Colors.white,
        ),
      ),
    );
  }
}
