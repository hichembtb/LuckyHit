import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:test_app/animation.dart';
import 'package:test_app/components/constants.dart';
import 'package:test_app/helper/app_provider.dart';
import 'dart:math';

import 'package:test_app/screens/winner_screen.dart';

import '../widget/custom_button.dart';

class Game extends StatefulWidget {
  const Game({Key? key}) : super(key: key);

  @override
  _GameState createState() => _GameState();
}

class _GameState extends State<Game> {
  int number = 0;
  int number2 = 0;
  bool disablebutton = false;
  @override
  @override
  Widget build(BuildContext context) {
    // Provider instence
    AppProvider provider = Provider.of<AppProvider>(
      context,
      listen: false,
    );
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              const SizedBox(
                height: 20,
              ),
              ShaderMask(
                shaderCallback: (Rect bounds) {
                  return const RadialGradient(
                    colors: [
                      Colors.blue,
                      Colors.black,
                    ],
                    stops: [0.1, 0.6],
                    center: Alignment.topLeft,
                    radius: 1.0,
                    tileMode: TileMode.mirror,
                  ).createShader(bounds);
                },
                child: const FittedBox(
                  fit: BoxFit.fill,
                  alignment: Alignment.center,
                  child: Text(
                    "Luck number",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 45,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              Stack(
                alignment: Alignment.center,
                children: [
                  Image.asset(
                    "images/splash2.png",
                    height: MediaQuery.of(context).size.height * 0.1,
                  ),
                  Text(
                    "${provider.luckynum}",
                    style: const TextStyle(
                      fontSize: 25.0,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 50,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      PlayerName(playerName: "${provider.user1}"),
                      const SizedBox(
                        height: 20,
                      ),
                      PlayerImage(gender: provider.gender1),
                      const SizedBox(
                        height: 45,
                      ),
                      InkWell(
                        highlightColor: Colors.transparent,
                        splashColor: Colors.transparent,
                        onTap: () {
                          setState(
                            () {
                              if (disablebutton == false) {
                                number = Random().nextInt(provider.maximum) + 1;
                                if (number == provider.luckynum) {
                                  provider.genderwinner = provider.gender1;
                                  provider.winner = provider.user1;
                                  Navigator.of(context).pushReplacement(
                                    GameToWinner(
                                      page: const Winner(),
                                    ),
                                  );
                                }
                                disablebutton = !disablebutton;
                              }
                            },
                          );
                        },
                        child: disablebutton == false
                            ? Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(35),
                                  // color: Colors.white,
                                ),
                                margin: const EdgeInsets.all(10),
                                height: 100,
                                width: 100,
                                child: Stack(
                                  alignment: Alignment.center,
                                  children: [
                                    Image.asset(
                                      "images/splash2.png",
                                      fit: BoxFit.contain,
                                    ),
                                    Text(
                                      "$number",
                                      style: const TextStyle(
                                        fontSize: 30,
                                        fontWeight: FontWeight.w900,
                                        color: Colors.black,
                                      ),
                                    )
                                  ],
                                ),
                              )
                            //Second ShaderMAsk
                            : Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(35),
                                  // color: Colors.white,
                                ),
                                margin: const EdgeInsets.all(10),
                                height: 100,
                                width: 100,
                                child: Stack(
                                  alignment: Alignment.center,
                                  children: [
                                    Image.asset(
                                      "images/splash3.png",
                                      fit: BoxFit.contain,
                                    ),
                                    Text(
                                      "$number",
                                      style: const TextStyle(
                                        fontSize: 30,
                                        fontWeight: FontWeight.w900,
                                        color: Colors.black,
                                      ),
                                    )
                                  ],
                                ),
                              ),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      PlayerName(playerName: "${provider.user2}"),
                      const SizedBox(
                        height: 20,
                      ),
                      PlayerImage(gender: provider.gender2),
                      const SizedBox(
                        height: 45,
                      ),
                      InkWell(
                        highlightColor: Colors.transparent,
                        splashColor: Colors.transparent,
                        onTap: () {
                          setState(() {
                            if (disablebutton == true) {
                              number2 = Random().nextInt(provider.maximum) + 1;
                              if (number2 == provider.luckynum) {
                                provider.genderwinner = provider.gender2;
                                provider.winner = provider.user2;
                                Navigator.of(context).pushReplacement(
                                  GameToWinner(
                                    page: const Winner(),
                                  ),
                                );
                              }
                              disablebutton = !disablebutton;
                            }
                          });
                        },
                        child: disablebutton == false
                            ? Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(35),
                                  // color: Colors.white,
                                ),
                                margin: const EdgeInsets.all(10),
                                height: 100,
                                width: 100,
                                child: Stack(
                                  alignment: Alignment.center,
                                  children: [
                                    Image.asset(
                                      "images/splash3.png",
                                      fit: BoxFit.contain,
                                    ),
                                    Text(
                                      "$number2",
                                      style: const TextStyle(
                                        fontSize: 30,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black,
                                      ),
                                    )
                                  ],
                                ),
                              )
                            //Second 2 ShadeMAsk
                            : Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(35),
                                  // color: Colors.white,
                                ),
                                margin: const EdgeInsets.all(10),
                                height: 100,
                                width: 100,
                                child: Stack(
                                  alignment: Alignment.center,
                                  children: [
                                    Image.asset(
                                      "images/splash2.png",
                                      fit: BoxFit.contain,
                                    ),
                                    Text(
                                      "$number2",
                                      style: const TextStyle(
                                        fontSize: 30,
                                        fontWeight: FontWeight.w900,
                                        color: Colors.black,
                                      ),
                                    )
                                  ],
                                ),
                              ),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(
                height: 70,
              ),
              InkWell(
                child: const CustomButton(
                  text: 'Exit',
                ),
                onTap: () {
                  SystemNavigator.pop();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// Players Images , male ,female
class PlayerImage extends StatelessWidget {
  const PlayerImage({
    Key? key,
    required this.gender,
  }) : super(key: key);

  final String gender;
  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      child: Container(
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(color: Colors.black, width: 2),
          //color: Colors.red,
          //borderRadius: BorderRadius.circular(16),
        ),
      ),
      radius: 50,
      backgroundColor: Colors.transparent,
      backgroundImage: gender == "Female"
          ? const AssetImage(
              "images/female.png",
            )
          : const AssetImage("images/male.jpg"),
    );
  }
}

// Players name
class PlayerName extends StatelessWidget {
  const PlayerName({
    Key? key,
    required this.playerName,
  }) : super(key: key);

  final String playerName;
  @override
  Widget build(BuildContext context) {
    return Text(
      playerName,
      style: const TextStyle(
        fontSize: 30,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}
